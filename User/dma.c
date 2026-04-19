#include "debug.h"

#define BUFFER_SIZE 128                // 缓冲区大小

u32 ADC_TX_BUFFER1[2*BUFFER_SIZE];    // 双缓冲数组，用于存储ADC采样数据

/**
 * @brief  初始化DMA通道1，用于ADC数据传输
 * @param  无
 * @return 无
 * @note   配置DMA1通道1为循环模式，从ADC1读取数据到内存缓冲区
 */
void MY_DMA_Init(void)
{
    // 定义DMA初始化结构体
    DMA_InitTypeDef DMA_InitStructure={0};

    // 启用DMA1时钟
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);
    // 复位DMA1通道1
    DMA_DeInit(DMA1_Channel1);
 
    // 初始化DMA结构体
    DMA_StructInit(&DMA_InitStructure);
    // 外设数据宽度为字(32位)
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Word;
    // 外设基地址为ADC1的数据寄存器
    DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)&ADC1->RDATAR;
    
    // 禁用外设地址增量
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable; 
    
    // 内存数据宽度为字(32位)
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Word;
    // 内存基地址为ADC_TX_BUFFER1数组
    DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)ADC_TX_BUFFER1;
    
    // 启用内存地址增量
    DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable; 
    
    // 缓冲区大小为2*BUFFER_SIZE
    DMA_InitStructure.DMA_BufferSize = 2 * BUFFER_SIZE; 
    // 数据传输方向为从外设到内存
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;
    
    // 禁用内存到内存传输
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable; 
    
    // 启用循环模式
    DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
    // 设置DMA优先级为极高
    DMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;
    // 初始化DMA1通道1
    DMA_Init(DMA1_Channel1, &DMA_InitStructure);

    // 启用DMA1通道1的半传输中断
    DMA_ITConfig(DMA1_Channel1, DMA_IT_HT, ENABLE);
    // 启用DMA1通道1的全传输中断
    DMA_ITConfig(DMA1_Channel1, DMA_IT_TC, ENABLE);

    // 启用DMA1通道1的NVIC中断
    NVIC_EnableIRQ(DMA1_Channel1_IRQn);
    // 启用DMA1通道1
    DMA_Cmd(DMA1_Channel1, ENABLE);
}