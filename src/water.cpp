#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "water.hpp"

char WaterData[0x10];

INCLUDE_ASM("asm/nonmatchings/water", SetParam__6CWaterFffff);
INCLUDE_ASM("asm/nonmatchings/water", SetColor__6CWaterFUcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/water", CreateVUData__6CWaterFPUiP10RenderInfo);
INCLUDE_RODATA("asm/nonmatchings/water", LIT_345__2);
INCLUDE_ASM("asm/nonmatchings/water", DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1);
INCLUDE_ASM("asm/nonmatchings/water", CheckClip__6CWaterFv);
INCLUDE_ASM("asm/nonmatchings/water", Hamon__6CWaterFv);
INCLUDE_ASM("asm/nonmatchings/water", SetVertex__6CWaterFPfPfPfPf);
INCLUDE_ASM("asm/nonmatchings/water", Shake__6CWaterFiif);
INCLUDE_ASM("asm/nonmatchings/water", SetSize__6CWaterFiiP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/water", __ct__6CWaterFv);

