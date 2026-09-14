# 高速 USB 虚拟示波器（CH32V307）

基于 CH32V307（RISC-V）的 USB 2.0 **High-Speed** 虚拟示波器固件：双 ADC 交替采样 → DMA 循环双缓冲 → USB HS 批量端点上传，由上位机实时显示波形。

上位机仓库：[Host-computer-oscilloscope](https://github.com/sekior11/Host-computer-oscilloscope)

---

## 数据链路

```
PA1 模拟输入
  → ADC1 / ADC2 快速交替采样（Fast Interleaved，ADC2 由 ADC1 触发）
  → TIM2 1 MHz 硬件触发（不靠软件启动转换，转换间隔抖动更低）
  → DMA1_Channel1 循环模式，256 × 32 bit 缓冲，半满 / 全满中断
  → USB HS 端点 1（Bulk IN），每次搬运 512 B
  → 上位机 pyusb 读取 → pyqtgraph 绘制
```

---

## 采样参数

| 项目 | 配置 | 位置 |
|---|---|---|
| 触发源 | TIM2 CH2，1 MHz，50% 占空比，低电平有效 | `User/adc.c` |
| ADC 工作模式 | 快速交替（ADC1 由 TIM2 触发，ADC2 由 ADC1 触发） | `User/adc.c` |
| 组合采样率 | 1 MHz 触发 × 2 路 ADC = **2 MSa/s** | 由上述配置推导 |
| 采样时间 | 1.5 个 ADC 时钟周期 | `User/adc.c` |
| ADC 时钟 | PCLK2 / 6 | `User/adc.c` |
| 数据对齐 | 右对齐 | `User/adc.c` |
| DMA 搬运宽度 | 外设 / 内存均为 32 bit（Word） | `User/dma.c` |
| 缓冲区 | 256 × 32 bit = 1 KB，循环模式 + 半满/全满中断 | `User/dma.c` |
| 单次 USB 上传 | 512 B（128 个采样 × 4 B） | `User/main.c` |

> 说明：**2 MSa/s 是按 TIM2 触发频率与双 ADC 交替模式推导的理论组合采样率**，未做模拟带宽实测标定。

---

## USB 描述符

- USB 2.0 高速设备（`bcdUSB = 0x0200`，同时提供 Full-Speed 配置描述符）
- 单接口、6 个 Bulk 端点（EP1～EP6，IN / OUT 成对），设备类为厂商自定义（`0xFF`）
- VID / PID：`0x1A86` / `0x5537`
- 最大取电 100 mA
- 数据上传走 **EP1（`0x01` OUT / `0x81` IN）**，上位机按 VID/PID 匹配设备

---

## 板载自测信号

TIM3 在 **PA6** 输出 **10 kHz、25% 占空比** PWM。占空比特意取不对称值，波形上一眼可辨；把 PA6 短接到 PA1 即可做「信号源 → ADC → USB → 上位机」的闭环自测。

---

## 目录结构

| 路径 | 说明 |
|---|---|
| `User/main.c` | 主循环：DMA 半满/全满标志处理、USB 上传、状态心跳打印 |
| `User/adc.c` | 双 ADC 交替采样 + TIM2 触发 + 校准 |
| `User/dma.c` | DMA1_Channel1 循环双缓冲配置 |
| `User/ch32v30x_usbhs_device.c/.h` | USB HS 设备驱动（WCH 官方） |
| `User/usb_desc.c/.h` | USB 描述符（HS / FS 配置、端点、字符串） |
| `User/ch32v30x_it.c` | 中断向量 |
| `Altium_模拟前端处理电路.zip` | 模拟前端（ADC 输入调理）电路设计文件 |

---

## 构建与运行

1. 用 **MounRiver Studio** 打开工程 `CH372Device.wvproj`（`.mrs/` 为 IDE 工作区配置）；
2. 编译烧录后设备枚举为高速 USB 设备；
3. 串口 USART1 `115200` 输出调试信息（USB 枚举状态、DMA 触发计数、ADC 寄存器值、DMA 计数与中断标志），可用于确认采样链路是否在跑。

上位机运行前，Windows 下需用 [Zadig](https://zadig.akeo.ie/) 把该设备驱动切换为 **WinUSB**。

---

## 说明

- `ch32v30x_usbhs_device.*`、`usb_desc.*`、`system_ch32v30x.*` 等来自 WCH 官方 CH32V307 例程，版权归南京沁恒微电子股份有限公司（见各文件头部声明）。
- `obj/`、`.mrs/` 下为编译产物与 IDE 工作区缓存，非源码。
