#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "water.hpp"

#include <libpkt.h>

#include "boxvu0.hpp"
#include "dataalloc.hpp"
#include "mglib.hpp"
#include "sysmes.hpp"
#include "texture.hpp"

extern int DBuffID;
int SetTEX0(u_int *packet, u_long tex0, u_long tex1);

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
#ifdef NON_MATCHING
int CWater::CreateVUData(unsigned int *output, RenderInfo *info) {
    sceVu0FMATRIX local_to_world;
    sceVu0FMATRIX local_to_screen;
    sceVu0FVECTOR row_step;
    sceVu0FVECTOR column_step;
    sceVu0FVECTOR position;
    sceVu0FVECTOR transformed;
    sceVu0FVECTOR normal;
    CTexture *texture;
    int word = 0;

    union {
        u_int *pointer;
        float value;
    } packet_address;

    packet_address.pointer = output;
    visual.unk_010[2] = packet_address.value;

    frame.GetLWMatrix(local_to_world);
    sceVu0MulMatrix(local_to_screen, info->view_screen, local_to_world);
    for (int axis = 0; axis < 3; axis++) {
        row_step[axis] = (vertex[1][axis] - vertex[0][axis]) / (float) (rows - 1);
        column_step[axis] = (vertex[2][axis] - vertex[0][axis]) / (float) (columns - 1);
    }
    row_step[3] = 0.0f;
    column_step[3] = 0.0f;
    pretest(local_to_screen, column_step);

    texture = TexManager.GetTexture("work", -1);
    if (unk_0A4 == 0) {
        word = SetTEX0(output, texture->tex0 & ~(4ULL << 32), 0);
    } else {
        word = 16;
    }

    // Each grid cell contributes the two vertices of a triangle strip row.
    for (int row = 0; row < rows - 1; row++) {
        for (int column = 0; column < columns; column++) {
            for (int side = 0; side < 2; side++) {
                int source_row = row + side;
                int index = column + source_row * columns;
                for (int axis = 0; axis < 3; axis++) {
                    position[axis] = vertex[0][axis] + (float) source_row * row_step[axis] +
                                     (float) column * column_step[axis];
                }
                position[1] += height[index] * unk_09C;
                position[3] = 1.0f;
                Trans_AddCell(transformed, position);

                int left = column > 0 ? index - 1 : index;
                int right = column + 1 < columns ? index + 1 : index;
                int above = source_row > 0 ? index - columns : index;
                int below = source_row + 1 < rows ? index + columns : index;
                normal[0] = (height[left] - height[right]) * unk_0A0;
                normal[1] = 1.0f;
                normal[2] = (height[above] - height[below]) * unk_0A0;
                normal[3] = 0.0f;
                sceVu0Normalize(normal, normal);

                float *vertex_data = (float *) &output[word];
                sceVu0CopyVector(vertex_data, transformed);
                vertex_data += 4;
                vertex_data[0] = (float) color[0];
                vertex_data[1] = (float) color[1];
                vertex_data[2] = (float) color[2];
                vertex_data[3] = (float) color[3];
                sceVu0CopyVector(vertex_data + 4, normal);
                word += 12;
            }
        }
    }
    visual.unk_0C = word >> 2;
    return visual.unk_0C;
}
#else
INCLUDE_ASM("asm/nonmatchings/water", CreateVUData__6CWaterFPUiP10RenderInfo);
#endif
INCLUDE_RODATA("asm/nonmatchings/water", @345__2);
#ifdef NON_MATCHING
extern "C" void DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1(
    CWater *water, RenderInfo *info, sceVif1Packet *draw_packet, void *parent_info) {
    if (water->CheckClip() != 0) {
        return;
    }

    sceGsTest test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.date = 0;
    sceVif1PkCnt(draw_packet, 0);
    sceVif1PkOpenDirectCode(draw_packet, 0);
    sceVif1PkOpenGifTag(draw_packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(draw_packet, SCE_GS_TEST_1, *(u_long *) &test);
    sceVif1PkCloseGifTag(draw_packet);
    sceVif1PkCloseDirectCode(draw_packet);

    sceVu0FMATRIX local_to_world;
    water->frame.GetLWMatrix(local_to_world);
    water->CreateVUData(water->packet[DBuffID == 0], &mgRenderInfo);
    info->unk_324 = 0;
    water->visual.DrawVu1(draw_packet, local_to_world, info, (VU1_PROGRAM) 15, NULL, 0, 0);

    sceVif1PkCnt(draw_packet, 0);
    sceVif1PkOpenDirectCode(draw_packet, 0);
    sceVif1PkOpenGifTag(draw_packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(draw_packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkCloseGifTag(draw_packet);
    sceVif1PkCloseDirectCode(draw_packet);
}
#else
INCLUDE_ASM("asm/nonmatchings/water", DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1);
#endif
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
void CWater::SetSize(int row_count, int column_count, CDataAlloc2<1> *arena) {
    if (arena == NULL) {
        arena = (CDataAlloc2<1> *) WaterData;
    }

    int quads = ((row_count * column_count) >> 2) + 1;
    height_a = (float *) arena->Alloc(quads);
    height_b = (float *) arena->Alloc(quads);
    rows = row_count;
    columns = column_count;
    for (int i = 0; i < rows * columns; i++) {
        height_b[i] = 0.0f;
        height_a[i] = 0.0f;
    }
    height = height_a;

    RenderInfo info;
    unk_0A4 = 0;
    arena->Align64();
    packet[1] = (u_int *) (arena->base + arena->used * 16);
    int packet_quads = CreateVUData(packet[1], &info);
    arena->Alloc(packet_quads);
    packet[2] = (u_int *) arena->Alloc64(packet_quads);
    CreateVUData(packet[2], &info);
    unk_0A4 = 1;
}
#ifdef NON_MATCHING
CWater::CWater(void) {
    rows = 0;
    columns = 0;
    packet[0] = NULL;
    packet[1] = NULL;
    packet[2] = NULL;
    color[0] = 0x80;
    color[1] = 0x80;
    color[2] = 0x80;
    color[3] = 0x80;
    wave_speed = 0.96f;
    damping = 0.01f;
    unk_09C = 0.0f;
    unk_0A0 = 0.0f;
}
#else
INCLUDE_ASM("asm/nonmatchings/water", __ct__6CWaterFv);
#endif
