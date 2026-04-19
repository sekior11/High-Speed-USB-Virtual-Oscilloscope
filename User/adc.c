#include "debug.h"

s16 Calibrattion_Val = 0;

/**
 * @brief  初始化ADC和TIM2，配置双ADC交替采样模式
 * @param  无
 * @return 无
 * @note   配置ADC1和ADC2为快速交替采样模式，使用TIM2产生100kHz的触发信号
 */
void MY_ADC_Init(void)
{
    // 复位ADC1、ADC2和TIM2
    ADC_DeInit(ADC1);
    ADC_DeInit(ADC2);
    TIM_DeInit(TIM2);

    // 定义初始化结构体
    ADC_InitTypeDef ADC_InitStructure = {0};
    GPIO_InitTypeDef GPIO_InitStructure = {0};
    TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStruct = {0};
    TIM_OCInitTypeDef TIM_OCInitStruct = {0};

    /* 1. 配置时钟 */
    // 启用GPIOA时钟
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
    // 启用ADC1时钟
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);
    // 启用ADC2时钟
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC2, ENABLE); 
    // 启用TIM2时钟
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM2, ENABLE);
    // 配置ADC时钟为PCLK2的1/8
    RCC_ADCCLKConfig(RCC_PCLK2_Div6);

    /* 2. 配置PA1为模拟输入 */
    GPIO_StructInit(&GPIO_InitStructure);
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AIN;      // 模拟输入模式
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  // 50MHz速度
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;          // PA1引脚
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    /* 3. 配置ADC1 */
    ADC_StructInit(&ADC_InitStructure);
    ADC_InitStructure.ADC_Mode = ADC_Mode_FastInterl;  // 快速交替采样模式
    ADC_InitStructure.ADC_ScanConvMode = DISABLE;      // 禁用扫描模式
    ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;  // 禁用连续转换模式
    ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_T2_CC2;  // TIM2触发
    ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;  // 数据右对齐
    ADC_InitStructure.ADC_NbrOfChannel = 1;            // 1个通道
    ADC_Init(ADC1, &ADC_InitStructure);

    /* 4. 配置ADC2 */
    // ADC2无外部触发,由ADC2触发
    ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_None;
    ADC_Init(ADC2, &ADC_InitStructure);

    /* 5. 配置通道映射 */
    // 配置ADC1通道1，采样时间1.5个周期
    ADC_RegularChannelConfig(ADC1, ADC_Channel_1, 1, ADC_SampleTime_1Cycles5);
    // 配置ADC2通道1，采样时间1.5个周期
    ADC_RegularChannelConfig(ADC2, ADC_Channel_1, 1, ADC_SampleTime_1Cycles5);

    /* 6. 配置TIM2 (精准100kHz触发) */
    TIM_TimeBaseStructInit(&TIM_TimeBaseInitStruct);
    TIM_TimeBaseInitStruct.TIM_ClockDivision = TIM_CKD_DIV1;  // 时钟分频系数1
    TIM_TimeBaseInitStruct.TIM_CounterMode = TIM_CounterMode_Up;  // 向上计数模式
    TIM_TimeBaseInitStruct.TIM_RepetitionCounter = 0x0000;  // 重复计数器
    
    // 改为 (1MHz 触发频率)：
    TIM_TimeBaseInitStruct.TIM_Prescaler = 0;            // 0 分频，定时器时钟直接吃满 96MHz
    TIM_TimeBaseInitStruct.TIM_Period = 96 - 1;          // 计 96 个数溢出，得到精确 1MHz
    TIM_TimeBaseInit(TIM2, &TIM_TimeBaseInitStruct);

    // 配置TIM2的OC2通道为PWM模式
    TIM_OCStructInit(&TIM_OCInitStruct);
    TIM_OCInitStruct.TIM_OCMode = TIM_OCMode_PWM1;            // PWM模式1
    TIM_OCInitStruct.TIM_OutputState = TIM_OutputState_Enable; // 启用输出
    TIM_OCInitStruct.TIM_Pulse = 48;  // 50%占空比                           
    TIM_OCInitStruct.TIM_OCPolarity = TIM_OCPolarity_Low;     // 低电平有效
    TIM_OC2Init(TIM2, &TIM_OCInitStruct);

    /* 7. 启用各通道 */
    // 启用ADC1
    ADC_Cmd(ADC1, ENABLE);
    // 启用ADC2
    ADC_Cmd(ADC2, ENABLE);

    Delay_Us(500);

    // 启用ADC1的外部触发转换
    ADC_ExternalTrigConvCmd(ADC1, ENABLE);
    // ADC2的外部触发转换（在交替采样模式下，ADC2由ADC1触发）
    ADC_ExternalTrigConvCmd(ADC2, ENABLE);

    // 启用ADC1的DMA请求
    ADC_DMACmd(ADC1, ENABLE);
    // 禁用ADC1,ADC2的缓冲区模式
    ADC_BufferCmd(ADC1, DISABLE);
    ADC_BufferCmd(ADC1, DISABLE);
    /* 8. ADC校准 */
    // 重置ADC1校准
    ADC_ResetCalibration(ADC1);
    while(ADC_GetResetCalibrationStatus(ADC1));
    // 开始ADC1校准
    ADC_StartCalibration(ADC1);
    while(ADC_GetCalibrationStatus(ADC1));
    // 获取ADC1校准值
    Calibrattion_Val = Get_CalibrationValue(ADC1);

    // 同样校准ADC2，确保双通道采样精度一致
    /*ADC_ResetCalibration(ADC2);
    while(ADC_GetResetCalibrationStatus(ADC2));
    ADC_StartCalibration(ADC2);
    while(ADC_GetCalibrationStatus(ADC2));*/

    /* 9. 启动TIM2和ADC1 */
    // 启动TIM2，开始产生触发信号
    TIM_Cmd(TIM2, ENABLE);

}