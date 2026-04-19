#include "ch32v30x_usbhs_device.h"
#include "debug.h"
#include "adc.h"
#include "dma.h"

#define BUFFER_SIZE 128                // 缓冲区大小
extern u32 ADC_TX_BUFFER1[2*BUFFER_SIZE]; // 双缓冲数组
uint32_t dma_fire_count = 0;           // DMA触发计数

volatile uint8_t flag_send_half = 0;   // 半传输标志
volatile uint8_t flag_send_full = 0;   // 全传输标志

/**
 * @brief  主程序
 * @param  无
 * @return 无
 * @note   初始化系统，配置USB、ADC和DMA，处理数据传输
 */
int main(void)
{
    // 更新系统时钟
    SystemCoreClockUpdate( );
    // 初始化延迟函数
    Delay_Init( );
    // 初始化USART，用于printf输出
    USART_Printf_Init( 115200 );
    
    /* USB20设备初始化 */
    USBHS_RCC_Init( );
    USBHS_Device_Init( ENABLE );

    // 启用USBHS中断
    NVIC_EnableIRQ( USBHS_IRQn );
    // 初始化DMA
    MY_DMA_Init();
    // 初始化ADC
    MY_ADC_Init();
    // 初始化测试信号发生器
    Test_Signal_Generator_Init();
    
    /* 强制配置DMA参数 */
    // 1. 禁用DMA通道1
    DMA1_Channel1->CFGR &= ~(1<<0); 
    
    // 2. 设置DMA缓冲区大小为256
    DMA1_Channel1->CNTR = 256;      
    
    // 3. 设置DMA外设和内存地址
    DMA1_Channel1->PADDR = (uint32_t)&ADC1->RDATAR; // ADC1数据寄存器地址
    DMA1_Channel1->MADDR = (uint32_t)ADC_TX_BUFFER1; // 内存缓冲区地址
    
    // 4. 启用DMA通道1
    DMA1_Channel1->CFGR |= (1<<0);  
    
    // 5. 打印DMA配置信息
    printf("\r\n[Force Inject] CFGR: 0x%08X, CNTR: %d\r\n", DMA1_Channel1->CFGR, DMA1_Channel1->CNTR);

    // 系统初始化完成
    printf("System initialized. Checking ADC and DMA...\r\n");
    
    // 主循环
    while(1)
    {
        // 非阻塞打印：通过计数来降低打印频率
        static uint32_t print_delay = 0;
        if(print_delay++ > 500000) // 可根据需要调整打印频率
        {
            print_delay = 0;
            // 打印系统状态信息
            printf("USB Enum: %d, DMA Count: %d, Flag Half: %d, Flag Full: %d\r\n", 
                   USBHS_DevEnumStatus, dma_fire_count, flag_send_half, flag_send_full);
            // 打印ADC1数据寄存器值
            printf("ADC1 RDATAR: 0x%08X\r\n", ADC1->RDATAR);
            // 打印DMA通道1计数器和中断标志
            printf("CNTR: %d, INTFR: 0x%08X\r\n", DMA1_Channel1->CNTR, DMA1->INTFR);
        }
        
        // 如果USB枚举成功
        if(USBHS_DevEnumStatus)
        {
            // 如果收到半传输标志
            if(flag_send_half == 1) 
            {
                dma_fire_count++;
                // 每1000次触发打印一次心跳信息
                if(dma_fire_count % 1000 == 0) 
                {
                    printf("DMA Heartbeat: %d \r\n", dma_fire_count);
                }

                // 向上位机发送前半部分数据
                USBHS_Endp_DataUp(DEF_UEP1, (u8 *)&ADC_TX_BUFFER1[0], BUFFER_SIZE*4, DEF_UEP_DMA_LOAD);
                // 清除半传输标志
                flag_send_half = 0;
            }

            // 如果收到全传输标志
            if(flag_send_full == 1) 
            {
                dma_fire_count++;
                // 向上位机发送后半部分数据
                USBHS_Endp_DataUp(DEF_UEP1, (u8 *)&ADC_TX_BUFFER1[BUFFER_SIZE], BUFFER_SIZE*4, DEF_UEP_DMA_LOAD);
                // 清除全传输标志
                flag_send_full = 0;
            }
        }
    }

}

/**
 * @brief  DMA1通道1中断处理函数
 * @param  无
 * @return 无
 * @note   处理DMA半传输和全传输中断
 */
void DMA1_Channel1_IRQHandler(void) __attribute__((interrupt("WCH-Interrupt-fast")));
void DMA1_Channel1_IRQHandler(void)
{
    // 处理半传输中断
    if(DMA_GetITStatus(DMA1_IT_HT1) != RESET)
    {
        flag_send_half = 1; // 设置半传输标志
        DMA_ClearITPendingBit(DMA1_IT_HT1); // 清除中断标志
    }

    // 处理全传输中断
    if(DMA_GetITStatus(DMA1_IT_TC1) != RESET) 
    {
        flag_send_full = 1; // 设置全传输标志
        DMA_ClearITPendingBit(DMA1_IT_TC1); // 清除中断标志
    }
}

/**
 * @brief  初始化测试信号发生器
 * @param  无
 * @return 无
 * @note   配置TIM3产生10kHz的PWM信号，用于测试ADC采样
 */
void Test_Signal_Generator_Init(void)
{
    // 1. 开启TIM3和GPIOA的时钟
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);

    // 2. 配置PA6(TIM3的通道1)为复用推挽输出
    GPIO_InitTypeDef GPIO_InitStructure = {0};
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP; // 复用推挽输出模式
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    // 3. 配置TIM3的基础频率为10kHz
    TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStruct = {0};
    // 将时钟分频到1MHz
    TIM_TimeBaseInitStruct.TIM_Prescaler = (SystemCoreClock / 1000000) - 1; 
    // 1MHz计数100次，得到10kHz的周期
    TIM_TimeBaseInitStruct.TIM_Period = 100 - 1; 
    TIM_TimeBaseInitStruct.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseInit(TIM3, &TIM_TimeBaseInitStruct);

    // 4. 配置PWM占空比(25%，使波形不对称，更易识别)
    TIM_OCInitTypeDef TIM_OCInitStruct = {0};
    TIM_OCInitStruct.TIM_OCMode = TIM_OCMode_PWM1;
    TIM_OCInitStruct.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStruct.TIM_Pulse = 25; // 25/100 = 25%的高电平时间
    TIM_OCInitStruct.TIM_OCPolarity = TIM_OCPolarity_High;
    TIM_OC1Init(TIM3, &TIM_OCInitStruct);

    // 5. 启动TIM3
    TIM_Cmd(TIM3, ENABLE);
}