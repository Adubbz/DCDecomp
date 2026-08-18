.include "macro.inc"

.include "macro.inc"

.section .rdata, "a"
glabel __vt__14CVisualPolyVu1
    /* 1A1760 002A1660 00000000 */ .word 0x00000000
    /* 1A1764 002A1664 00000000 */ .word 0x00000000
    /* 1A1768 002A1668 C04E1300 */ .word Initialize__10CVisualVu1Fv
    /* 1A176C 002A166C 807E1300 */ .word SetMDTDataAddress__10CVisualVu1FPUi
    /* 1A1770 002A1670 907E1300 */ .word GetMDTDataAddress__10CVisualVu1Fv
    /* 1A1774 002A1674 B04B1300 */ .word RemakeData__10CVisualVu1FPUi
    /* 1A1778 002A1678 00501300 */ .word DrawVu1__10CVisualVu1FPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
    /* 1A177C 002A167C C04B1300 */ .word DrawVu1__10CVisualVu1FP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii

