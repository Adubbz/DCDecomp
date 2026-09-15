#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "water.hpp"

char WaterData[0x10];

void CWater::SetParam(float speed, float loss, float param_2, float param_3) {
    wave_speed = speed;
    damping = loss;
    unk_09C = param_2;
    unk_0A0 = param_3;
}

void CWater::SetColor(unsigned char red, unsigned char green, unsigned char blue, unsigned char alpha) {
    color[0] = red;
    color[1] = green;
    color[2] = blue;
    color[3] = alpha;
}
INCLUDE_ASM("asm/nonmatchings/water", CreateVUData__6CWaterFPUiP10RenderInfo);
INCLUDE_RODATA("asm/nonmatchings/water", @345__2);
INCLUDE_ASM("asm/nonmatchings/water", DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1);
INCLUDE_ASM("asm/nonmatchings/water", CheckClip__6CWaterFv);
INCLUDE_ASM("asm/nonmatchings/water", Hamon__6CWaterFv);

void CWater::SetVertex(float *v0, float *v1, float *v2, float *v3) {
    sceVu0CopyVector(vertex[0], v0);
    sceVu0CopyVector(vertex[1], v1);
    sceVu0CopyVector(vertex[2], v2);
    sceVu0CopyVector(vertex[3], v3);
}

INCLUDE_ASM("asm/nonmatchings/water", Shake__6CWaterFiif);
INCLUDE_ASM("asm/nonmatchings/water", SetSize__6CWaterFiiP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/water", __ct__6CWaterFv);
