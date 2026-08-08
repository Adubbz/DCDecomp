#include "water.hpp"

char WaterData[0x10];

INCLUDE_ASM("main", SetParam__6CWaterFffff);
INCLUDE_ASM("main", SetColor__6CWaterFUcUcUcUc);
INCLUDE_ASM("main", CreateVUData__6CWaterFPUiP10RenderInfo);
INCLUDE_ASM("main", DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1);
INCLUDE_ASM("main", CheckClip__6CWaterFv);
INCLUDE_ASM("main", Hamon__6CWaterFv);
INCLUDE_ASM("main", SetVertex__6CWaterFPfPfPfPf);
INCLUDE_ASM("main", Shake__6CWaterFiif);
INCLUDE_ASM("main", SetSize__6CWaterFiiP14CDataAlloc2_1_);
INCLUDE_ASM("main", __ct__6CWaterFv);
