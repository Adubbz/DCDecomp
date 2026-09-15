#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "water.hpp"

#include "boxvu0.hpp"
#include "mglib.hpp"

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
#ifdef NON_MATCHING
int CWater::CheckClip(void) {
    sceVu0FVECTOR corner0;
    sceVu0FVECTOR corner1;
    sceVu0FVECTOR corner2;
    sceVu0FVECTOR corner3;
    sceVu0FVECTOR high;
    sceVu0FVECTOR low;

    frame.GetWorldPosition(corner0, vertex[0]);
    frame.GetWorldPosition(corner1, vertex[1]);
    frame.GetWorldPosition(corner2, vertex[2]);
    frame.GetWorldPosition(corner3, vertex[3]);
    VectorMaxMin(high, low, corner0, corner1, corner2, corner3);
    return MGClipBox((CBoxVu0 *) low);
}
#else
INCLUDE_ASM("asm/nonmatchings/water", CheckClip__6CWaterFv);
#endif
#ifdef NON_MATCHING
void CWater::Hamon(void) {
    float *source = height_a;
    float *target;

    // The two buffers hold this step and the last; the older one is written.
    if (height == source) {
        target = height_b;
    } else {
        target = source;
        source = height_b;
    }
    height = target;

    float speed = wave_speed * wave_speed;
    float centre = 2.0f * (1.0f - 2.0f * speed);

    for (int i = 1; i < rows - 1; i++) {
        for (int j = 1; j < columns - 1; j++) {
            float *cell = &source[j + i * columns];
            float *out = &target[j + i * columns];
            float around = cell[-1] + cell[1];

            around += cell[columns];
            around = cell[-columns] + around;
            *out = around * speed + (centre * *cell - *out) - damping * (*cell - *out);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/water", Hamon__6CWaterFv);
#endif

void CWater::SetVertex(float *v0, float *v1, float *v2, float *v3) {
    sceVu0CopyVector(vertex[0], v0);
    sceVu0CopyVector(vertex[1], v1);
    sceVu0CopyVector(vertex[2], v2);
    sceVu0CopyVector(vertex[3], v3);
}

#ifdef NON_MATCHING
void CWater::Shake(int row, int column, float height_change) {
    int i = row % rows;
    int j = column % columns;

    // The edge cells hold the surface still, so a ripple starts inside them.
    if (i <= 0) {
        i = 1;
    }
    if (j <= 0) {
        j = 1;
    }
    if (rows - 2 < i) {
        i = rows - 2;
    }
    if (columns - 2 < j) {
        j = columns - 2;
    }
    height[j + i * columns] += height_change;
}
#else
INCLUDE_ASM("asm/nonmatchings/water", Shake__6CWaterFiif);
#endif
INCLUDE_ASM("asm/nonmatchings/water", SetSize__6CWaterFiiP14CDataAlloc2_1_);
INCLUDE_ASM("asm/nonmatchings/water", __ct__6CWaterFv);
