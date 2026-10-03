#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "water.hpp"

#include <libpkt.h>

#include "boxvu0.hpp"
#include "dataalloc.hpp"
#include "mglib.hpp"
#include "texture.hpp"

int SetTEX0(u_int *packet, u_long tex0, u_long tex1);
#ifndef PORT
/**
 * Loads the matrix and translation used by cell transforms into VU0 registers.
 */
static void pretest(float matrix[4][4], float *translation) {
    register float *matrix_data = &matrix[0][0];
    register float *offset = translation;

    asm {
        lqc2 vf10, 0(matrix_data)
        lqc2 vf11, 16(matrix_data)
        lqc2 vf12, 32(matrix_data)
        lqc2 vf13, 48(matrix_data)
        lqc2 vf14, 0(offset)
    }
}

/**
 * Transforms one cell and advances its source position by the loaded translation.
 */
static void Trans_AddCell(float *output, float *position) {
    register float *destination = output;
    register float *source = position;

    asm {
        lqc2 vf16, 0(source)
        vmulax ACC, vf10, vf16
        vmadday ACC, vf11, vf16
        vmaddaz ACC, vf12, vf16
        vmaddw vf17, vf13, vf16
        vadd.xz vf16, vf16, vf14
        sqc2 vf17, 0(destination)
        sqc2 vf16, 0(source)
    }
}
#endif
void CWater::SetParam(float speed, float damping_rate, float scale, float shift) {
    wave_speed = speed;
    damping = damping_rate;
    height_scale = scale;
    distortion = shift;
}

void CWater::SetColor(unsigned char red, unsigned char green, unsigned char blue, unsigned char alpha) {
    color[0] = red;
    color[1] = green;
    color[2] = blue;
    color[3] = alpha;
}

int CWater::CreateVUData(unsigned int *output, RenderInfo *info) {
    float         *above;
    int            word;
    int            i;
    int            k;
    float          row_f;
    float         *here;
    sceVu0FVECTOR *out;
    sceVu0FVECTOR *uv;
    CTexture      *texture;
    int            j;
    float         *below;
    float         *cell_above;
    float         *cell;
    int            count;
    u_long128     *top;
    int            first;
    u_long128     *bottom;
    u_long128     *uv_top;
    u_long128     *uv_bottom;
    int            vertex_count;
    int            qwc;
    int            unpack_word;
    u_int          nloop;
    u_int         *tag;
    u_long128     *xyz;
    u_long128     *rgbaq;
    u_long128     *st;
    word = 0;
    sceGsTex0 tex0;
    float     rgba[4];

    rgba[0] = color[0];
    rgba[1] = color[1];
    rgba[2] = color[2];
    rgba[3] = color[3];
    u_int         end[4] = {0x11000000, 0, 0, 0};
    float         uv_base[4] = {320.0f, SCREEN_QUARTER_HEIGHT_F, 0.0f, 0.0f};
    u_int         first_kick[4] = {0, 0, 0, 0x14000000};
    u_int         kick[4] = {0, 0, 0, 0x17000000};
    u_int         unpack[4] = {0, 0, 0, 0x6C008000};
    sceVu0FVECTOR row_step;
    sceVu0FVECTOR column_step;
    sceVu0FMATRIX local_to_world;
    sceVu0FMATRIX local_to_screen;
    sceVu0FVECTOR vertices[64][64];
    sceVu0FVECTOR uvs[64][64];
    sceVu0FVECTOR position;

    visual.vu_data = output;
    frame.GetLWMatrix(local_to_world);
    sceVu0MulMatrix(local_to_screen, info->view_screen, local_to_world);

    for (i = 0; i < 3; i++) {
        row_step[i] = (vertex[1][i] - vertex[0][i]) / (float) (rows - 1);
        column_step[i] = (vertex[2][i] - vertex[0][i]) / (float) (columns - 1);
    }

    row_step[3] = column_step[3] = 0.0f;
    row_step[1] = column_step[1] = 0.0f;
    pretest(local_to_screen, column_step);

    first = 0;
    position[3] = 1.0f;

    for (i = 0, row_f = 0.0f; i < rows; i++, row_f += 1.0f) {
        position[0] = vertex[0][0] + row_f * row_step[0];
        position[1] = vertex[0][1] + row_f * row_step[1];
        position[2] = vertex[0][2] + row_f * row_step[2];
        here = &height[i * columns];
        above = here - columns;
        below = here + columns; // Unused here, but part of the retail source.

        if (i == 0) {
            above = here;
        }

        out = vertices[i];
        uv = uvs[i];

        for (j = 0; j < columns; j++) {
            Trans_AddCell(*out++, position);
            position[1] = *here * height_scale;
            (*uv)[0] = uv_base[0] + distortion * (*above - *here);
            (*uv)[1] = uv_base[1] + distortion * (here[0] - here[1]);
            uv++;
            here++;
            above++;
        }
    }

    texture = TexManager.GetTexture(TexManager.GetTextureHandle("work", -1));
    tex0 = *(sceGsTex0 *) &texture->tex0;
    tex0.bits.tcc = 0;

    if (tags_built != 0) {
        word += 16;
    } else {
        word += SetTEX0(output, *(u_long *) &tex0, 0);
    }

    // Each row pair becomes triangle strips of at most 27 columns; j counts the
    // columns still to be emitted.
    for (i = 0, row_f = 0.0f; i < rows - 1; i++, row_f += 1.0f) {
        j = columns;
        cell = &height[i * columns];
        below = cell + columns;
        cell_above = cell - columns;

        if (i == 0) {
            cell_above = cell;
        }

        top = (u_long128 *) vertices[i];
        bottom = (u_long128 *) vertices[i + 1];
        uv_top = (u_long128 *) uvs[i];
        uv_bottom = (u_long128 *) uvs[i + 1];

        while (j > 0) {
            count = 27;

            if (j < 27) {
                count = j;
            }

            vertex_count = count * 2;
            qwc = 0;

            if (tags_built == 0) {
                *(u_long128 *) &output[word] = *(u_long128 *) unpack;
            }

            unpack_word = word + 3;

            if (tags_built != 0) {
                word += 8;
                qwc++;
            } else {
                nloop = vertex_count | 0x8000;
                tag = &output[word + 4];
                tag[0] = nloop;
                tag[1] = 0x309E4000;
                tag[2] = 0x413;
                tag[3] = 0;
                word += 8;
                qwc++;
            }

            if (tags_built == 0) {
                output[word] = vertex_count;
            }

            word += 4;
            qwc++;
            xyz = (u_long128 *) &output[word];
            rgbaq = xyz + vertex_count;
            st = rgbaq + vertex_count;

            for (k = 0; k < count; k++) {
                *xyz++ = *top++;
                *xyz++ = *bottom++;
                *rgbaq++ = *(u_long128 *) rgba;
                *rgbaq++ = *(u_long128 *) rgba;
                *st++ = *uv_top++;
                *st++ = *uv_bottom++;
            }

            // Consecutive chunks share a column so the strip stays joined.
            cell--;
            below--;
            cell_above--;
            top--;
            bottom--;
            uv_top--;
            uv_bottom--;
            word += count * 24;
            qwc += count * 6;

            if (tags_built != 0) {
                word += 4;
            } else {
                output[unpack_word] |= qwc << 16;

                if (first == 0) {
                    *(u_long128 *) &output[word] = *(u_long128 *) first_kick;
                    first = 1;
                } else {
                    *(u_long128 *) &output[word] = *(u_long128 *) kick;
                }

                word += 4;
            }

            j -= 27;
        }

        if (tags_built != 0) {
            word += 4;
        } else {
            *(u_long128 *) &output[word] = *(u_long128 *) end;
            word += 4;
        }
    }

    visual.vu_size = word >> 2;
    return visual.vu_size;
}

extern "C" int DrawVu1__6CWaterFP10RenderInfoP13sceVif1PacketP1(CWater *water, RenderInfo *info, sceVif1Packet *draw_packet, void *parent_info) {
    if (water->CheckClip() != 0) {
        return 0;
    }

    sceVif1PkCnt(draw_packet, 0);
    sceVif1PkOpenDirectCode(draw_packet, 0);
    sceVif1PkOpenGifTag(draw_packet, *(u_long128 *) &GiftagAD);
    sceGsTest test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.date = 0;
    sceVif1PkAddGsAD(draw_packet, SCE_GS_TEST_1, *(u_long *) &test);
    sceVif1PkCloseGifTag(draw_packet);
    sceVif1PkCloseDirectCode(draw_packet);

    sceVu0FMATRIX local_to_world;
    water->frame.GetLWMatrix(local_to_world);
    u_int *vu_packet = water->packet[!DBuffID + 1];
    water->CreateVUData(vu_packet, &mgRenderInfo);
    info->fog_enabled = false;
    int size = water->visual.DrawVu1(draw_packet, local_to_world, info, (VU1_PROGRAM) 15, NULL, 0, 0);

    sceVif1PkCnt(draw_packet, 0);
    sceVif1PkOpenDirectCode(draw_packet, 0);
    sceVif1PkOpenGifTag(draw_packet, *(u_long128 *) &GiftagAD);
    sceVif1PkAddGsAD(draw_packet, SCE_GS_TEST_1, *(u_long *) &mgPixelTest);
    sceVif1PkCloseGifTag(draw_packet);
    sceVif1PkCloseDirectCode(draw_packet);
    return size;
}

int CWater::CheckClip() {
    sceVu0FVECTOR box[2];
    sceVu0FVECTOR corner[4];

    frame.GetWorldPosition(corner[0], vertex[0]);
    frame.GetWorldPosition(corner[1], vertex[1]);
    frame.GetWorldPosition(corner[2], vertex[2]);
    frame.GetWorldPosition(corner[3], vertex[3]);
    VectorMaxMin(box[0], box[1], corner[0], corner[1], corner[2], corner[3]);
    return MGClipBox((CBoxVu0 *) box);
}

void CWater::Hamon() {
    int    i;
    int    j;
    float *source;
    float *target;

    // The two buffers hold this step and the last; the older one is written.
    if (height == height_a) {
        source = height_a;
        target = height_b;
    } else {
        target = height_a;
        source = height_b;
    }

    height = target;

    float speed = wave_speed * wave_speed;
    float centre = 2.0f * (1.0f - 2.0f * speed);
    float loss = damping;

    for (i = 1; i < rows - 1; i++) {
        for (j = 1; j < columns - 1; j++) {
            float *cell = &source[j + i * columns];
            float *out = &target[j + i * columns];
            float  around = *(cell - columns) + (cell[-1] + cell[1] + *(cell + columns));
            around *= speed;
            float centre_term = centre * *cell;
            float previous = *out;
            *out = around + (centre_term - previous) - loss * (*cell - previous);
        }
    }
}

void CWater::SetVertex(float *corner0, float *corner1, float *corner2, float *corner3) {
    sceVu0CopyVector(vertex[0], corner0);
    sceVu0CopyVector(vertex[1], corner1);
    sceVu0CopyVector(vertex[2], corner2);
    sceVu0CopyVector(vertex[3], corner3);
}

void CWater::Shake(int row, int column, float height_change) {
    row %= rows;
    column %= columns;

    // The edge cells hold the surface still, so a ripple starts inside them.
    if (row <= 0) {
        row = 1;
    }

    if (column <= 0) {
        column = 1;
    }

    if (row > rows - 2) {
        row = rows - 2;
    }

    if (column > columns - 2) {
        column = columns - 2;
    }

    float *cell = &height[column];
    cell[row * columns] += height_change;
}

void CWater::SetSize(int row_count, int column_count, CDataAlloc2<1> *arena) {
    if (arena == NULL) {
        arena = &WaterData;
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
    tags_built = 0;
    arena->Align64();
    packet[1] = (u_int *) (arena->base + arena->used * 16);
    int packet_quads = CreateVUData(packet[1], &info);
    arena->Alloc(packet_quads);
    packet[2] = (u_int *) arena->Alloc64(packet_quads);
    CreateVUData(packet[2], &info);
    tags_built = 1;
}

CWater::CWater() {
    rows = 0;
    columns = 0;
    packet[2] = NULL;
    packet[1] = NULL;
    packet[0] = NULL;
    color[0] = 0x80;
    color[1] = 0x80;
    color[2] = 0x80;
    color[3] = 0x80;
    wave_speed = 0.1f;
    damping = 0.015f;
    height_scale = 0.0f;
    distortion = 0.0f;
}
