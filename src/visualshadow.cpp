#include "visualshadow.hpp"

#include <libvu0.h>

#include "character.hpp"
#include "dataalloc.hpp"
#include "mathutil.hpp"
#include "mdt.hpp"
#include "mglib.hpp"
#include "renderinfo.hpp"

extern CDataAlloc2<1> *ActiveData;

int CVisualShadow::DrawVu1(u_int *packet, float (*matrix)[4], RenderInfo *info,
                           VU1_PROGRAM program, u_long128 *draw_state, int unknown1, int unknown2) {
    int result;
    u_int *saved_primary;
    u_int *saved_secondary;
    u_int saved_size;

    result = 0;
    if (info->unk_320 == 2) {
        saved_primary = vu_data_buffer[0];
        saved_secondary = vu_data_buffer[1];
        saved_size = vu_size;
        ActiveData->Align64();
        ActiveData->Alloc(CreateVUdataShadowCLIP(
            (u_int *) (ActiveData->base + ActiveData->used * 16), data, info, matrix));
        vu_data_buffer[0] = vu_data;
        vu_data_buffer[1] = vu_data;
        result +=
            CVisualMDTVu1::DrawVu1(packet, matrix, info, program, draw_state, unknown1, unknown2);
        vu_data_buffer[0] = saved_primary;
        vu_data_buffer[1] = saved_secondary;
        vu_size = saved_size;
        return result;
    }
    result += CVisualMDTVu1::DrawVu1(packet, matrix, info, program, draw_state, unknown1, unknown2);
    return result;
}

int CVisualShadow::DrawVu1(sceVif1Packet *packet, float (*matrix)[4], RenderInfo *info,
                           VU1_PROGRAM program, u_long128 *draw_state, int unknown1, int unknown2) {
    int result;
    u_int *saved_primary;
    u_int *saved_secondary;
    u_int saved_size;

    result = 0;
    if (info->unk_320 == 2) {
        saved_primary = vu_data_buffer[0];
        saved_secondary = vu_data_buffer[1];
        saved_size = vu_size;
        ActiveData->Align64();
        ActiveData->Alloc(CreateVUdataShadowCLIP(
            (u_int *) (ActiveData->base + ActiveData->used * 16), data, info, matrix));
        vu_data_buffer[0] = vu_data;
        vu_data_buffer[1] = vu_data;
        result +=
            CVisualMDTVu1::DrawVu1(packet, matrix, info, program, draw_state, unknown1, unknown2);
        vu_data_buffer[0] = saved_primary;
        vu_data_buffer[1] = saved_secondary;
        vu_size = saved_size;
        return result;
    }
    return CVisualMDTVu1::DrawVu1(packet, matrix, info, program, draw_state, unknown1, unknown2);
}

int CVisualShadow::CreateVUdataShadow(u_int *block, u_int *model_data) {
    int first;
    MDT_HEADER *model;
    MDT_SHADOW *shadow;
    int shape_index;
    int word;
    int unpack;
    int qwc;
    sceVu0FVECTOR *vertices;
    int shape_num;
    MDT_SVERTEX *corner;
    int index_num;
    int continued;
    int emitted;
    int triangle;
    int tag;
    MDT_SVERTEX *source;
    u_long128 *out;

    first = 1;
    word = 0;
    u_int end[4] = {0x11000000, 0, 0, 0};
    vu_data = block;
    model = (MDT_HEADER *) model_data;
    shadow = (MDT_SHADOW *) ((u_char *) model + model->mesh_ofs);
    vertices = (sceVu0FVECTOR *) ((u_char *) model + model->vertex_ofs);
    corner = (MDT_SVERTEX *) shadow->shape;
    shape_num = shadow->shape_num;
    for (shape_index = 0; shape_index < shape_num; shape_index++) {
        index_num = ((MDT_SSHAPE *) corner)->index_num;
        corner = ((MDT_SSHAPE *) corner)->vertex;
        continued = 0;
        emitted = 0;
        sceVu0FVECTOR one = {1.0f, 1.0f, 1.0f, 1.0f};
        while (emitted < index_num) {
            qwc = 0;
            block[word] = 0;
            block[(u_int) (word + 1)] = 0;
            block[(u_int) (word + 2)] = 0;
            unpack = word + 3;
            block[unpack] = 0x6C008000;
            tag = word + 4;
            block[tag] = 0x8000;
            block[(u_int) (word + 5)] = 0x2022C000;
            block[(u_int) (word + 6)] = 0x41;
            block[(u_int) (word + 7)] = 0;
            word += 8;
            qwc += 1;
            source = corner;
            out = (u_long128 *) &block[word];
            for (triangle = 0; triangle < 10 && emitted < index_num; triangle++, emitted += 3) {
                out[0] = *(u_long128 *) one;
                out[1] = *(u_long128 *) one;
                out[2] = *(u_long128 *) one;
                out[3] = *(u_long128 *) vertices[source[0].index];
                out[4] = *(u_long128 *) vertices[source[1].index];
                out[5] = *(u_long128 *) vertices[source[2].index];
                out += 6;
                source += 3;
            }
            word += triangle * 24;
            qwc += triangle * 6;
            corner += triangle * 3;
            block[(u_int) tag] |= triangle;
            block[(u_int) unpack] |= qwc << 16;
            block[word] = 0;
            block[(u_int) (word + 1)] = 0;
            block[(u_int) (word + 2)] = 0;
            if (!continued) {
                if (first) {
                    block[(u_int) (word + 3)] = 0x14000000;
                    word += 4;
                    first = 0;
                } else {
                    block[(u_int) (word + 3)] = 0x14000001;
                    word += 4;
                }
                continued = 1;
            } else {
                block[(u_int) (word + 3)] = 0x17000000;
                word += 4;
            }
        }
        *(u_long128 *) &block[word] = *(u_long128 *) end;
        word += 4;
    }
    vu_size = word >> 2;
    return vu_size;
}

int CVisualShadow::RemakeData(u_int *block) {
    if (data == NULL) {
        return 0;
    }
    return CreateVUdataShadow(vu_data_buffer[DBuffID], data);
}

int CVisualShadow::CreateVUdataShadowCLIP(u_int *block, u_int *model_data, RenderInfo *info,
                                          float (*matrix)[4]) {
    int word;
    int qwc;
    int a;
    MDT_HEADER *model;
    int first;
    int shape_index;
    int unpack;
    float nx;
    MDT_SHADOW *shadow;
    int pass;
    sceVu0FVECTOR *eye;
    sceVu0FVECTOR *vertices;
    float scale;
    int shape_num;
    float ny;
    MDT_SVERTEX *corner;
    float t;
    float nz;
    sceVu0FVECTOR *projected;
    int index_num;
    u_long128 *out;
    int continued;
    int emitted;
    int triangle;
    int count;
    int tag;
    int clip_num;
    int c;
    int offset_a;
    int offset_b;
    int b;
    u_int i;
    int offset_c;
    sceVu0FMATRIX clip;
    sceVu0FMATRIX near_shadow;
    sceVu0FVECTOR local_light;
    sceVu0FVECTOR light;
    sceVu0FVECTOR eye_light;
    sceVu0FMATRIX shadow_matrix;
    sceVu0FMATRIX local_to_clip;
    sceVu0FMATRIX transpose;
    sceVu0FMATRIX local_to_eye;
    sceVu0FMATRIX shadow_to_eye;
    sceVu0FVECTOR point;
    sceVu0FVECTOR normal;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR near_light;

    if (model_data == NULL) {
        return 0;
    }
    light[0] = info->light_direction[0][0];
    light[1] = info->light_direction[1][0];
    light[2] = info->light_direction[2][0];
    light[3] = 0.0f;
    sceVu0TransposeMatrix(transpose, matrix);
    sceVu0ApplyMatrix(local_light, transpose, light);
    MulMatrix(local_to_eye, info->view_scaled, matrix);
    sceVu0ApplyMatrix(eye_light, info->view_scaled, light);
    MulMatrix(local_to_clip, info->perspective, local_to_eye);
    sceVu0Normalize(eye_light, eye_light);
    sceVu0CopyVector(point, info->shadow_point);
    sceVu0CopyVector(normal, info->shadow_normal);
    direction[0] = info->light_direction[0][0];
    direction[1] = info->light_direction[1][0];
    direction[2] = info->light_direction[2][0];
    direction[3] = 0.0f;
    t = sceVu0InnerProduct(normal, point);
    if (t == 0.0f) {
        point[0] -= 0.1f * normal[0];
        point[1] -= 0.1f * normal[1];
        point[2] -= 0.1f * normal[2];
        t = 1.0f;
    }
    t = 1.0f / t;
    nx = normal[0] * t;
    ny = normal[1] * t;
    nz = normal[2] * t;
    sceVu0Normalize(direction, direction);
    sceVu0DropShadowMatrix(shadow_matrix, direction, nx, ny, nz, 0);
    MulMatrix(shadow_matrix, shadow_matrix, matrix);
    MulMatrix(shadow_to_eye, info->view_scaled, shadow_matrix);
    MulMatrix(shadow_matrix, info->perspective, shadow_to_eye);
    MulMatrix(clip, info->view_scaled, matrix);
    sceVu0FVECTOR near_normal = {0.0f, 0.0f, 1.0f, 0.0f};
    sceVu0FVECTOR near_point = {0.0f, 0.0f, 0.0f, 0.0f};
    near_point[2] = info->near[2];
    scale = 1.0f / sceVu0InnerProduct(near_normal, near_point);
    nx = near_normal[0] * scale;
    ny = near_normal[1] * scale;
    nz = near_normal[2] * scale;
    sceVu0Normalize(near_light, eye_light);
    sceVu0DropShadowMatrix(near_shadow, near_light, nx, ny, nz, 0);
    sceVu0CopyMatrix(clip, info->perspective);
    first = 1;
    word = 0;
    u_int end[4] = {0, 0, 0, 0x11000000};
    vu_data = block;
    model = (MDT_HEADER *) model_data;
    shadow = (MDT_SHADOW *) ((u_char *) model + model->mesh_ofs);
    vertices = (sceVu0FVECTOR *) ((u_char *) model + model->vertex_ofs);
    shape_num = shadow->shape_num;
    eye = (sceVu0FVECTOR *) 0x70000000;
    projected = &eye[model->vertex_num];
    for (i = 0; i < model->vertex_num; i++) {
        sceVu0ApplyMatrix((float *) eye[i], local_to_eye, vertices[i]);
        sceVu0ApplyMatrix(projected[i], shadow_to_eye, vertices[i]);
    }
    for (pass = 0; pass < 2; pass++) {
        block[word] = 0;
        block[(u_int) (word + 1)] = 0;
        block[(u_int) (word + 2)] = 0;
        block[(u_int) (word + 3)] = 0x50000002;
        block[(u_int) (word + 4)] = 0x8001;
        block[(u_int) (word + 5)] = 0x102E8000;
        block[(u_int) (word + 6)] = 0xE;
        block[(u_int) (word + 7)] = 0;
        if (pass == 0) {
            block[(u_int) (word + 8)] = 0x68;
            block[(u_int) (word + 9)] = 0x80;
            block[(u_int) (word + 10)] = 0x42;
            block[(u_int) (word + 11)] = 0;
            word += 12;
        } else {
            block[(u_int) (word + 8)] = 0x62;
            block[(u_int) (word + 9)] = 0x80;
            block[(u_int) (word + 10)] = 0x42;
            block[(u_int) (word + 11)] = 0;
            word += 12;
        }
        corner = (MDT_SVERTEX *) shadow->shape;
        for (shape_index = 0; shape_index < shape_num; shape_index++) {
            index_num = ((MDT_SSHAPE *) corner)->index_num;
            corner = ((MDT_SSHAPE *) corner)->vertex;
            continued = 0;
            emitted = 0;
            u_int edges[4] = {0, 0, 0, 0};
            while (emitted < index_num) {
                qwc = 0;
                block[word] = 0;
                block[(u_int) (word + 1)] = 0;
                block[(u_int) (word + 2)] = 0;
                unpack = word + 3;
                block[unpack] = 0x6C008000;
                tag = word + 4;
                block[tag] = 0x8000;
                block[(u_int) (word + 5)] = 0x2022C000;
                block[(u_int) (word + 6)] = 0x41;
                block[(u_int) (word + 7)] = 0;
                block[(u_int) (word + 8)] = pass != 0;
                block[(u_int) (word + 9)] = 0;
                block[(u_int) (word + 10)] = 0;
                block[(u_int) (word + 11)] = 0;
                word += 12;
                qwc += 2;
                out = (u_long128 *) &block[word];
                triangle = 0;
                for (count = 0; count < 12 && emitted < index_num; count++, emitted += 3, corner += 3) {
                    sceVu0FVECTOR face;
                    sceVu0FVECTOR edge0;
                    sceVu0FVECTOR edge1;
                    sceVu0FVECTOR near_side[4];
                    sceVu0FVECTOR clipped[5];
                    sceVu0FVECTOR far_side[4];
                    sceVu0FVECTOR side0;
                    sceVu0FVECTOR side1;

                    a = corner[0].index;
                    b = corner[1].index;
                    c = corner[2].index;
                    edges[0] = corner[0].edge;
                    edges[1] = corner[1].edge;
                    edges[2] = corner[2].edge;
                    // Retail keeps each corner's byte offset in a variable and reuses it for the
                    // vertex, eye and projected arrays; indexing the arrays compiles differently.
                    offset_a = a * sizeof(sceVu0FVECTOR);
                    out[1] = *(u_long128 *) ((u_char *) vertices + offset_a);
                    offset_b = b * sizeof(sceVu0FVECTOR);
                    out[2] = *(u_long128 *) ((u_char *) vertices + offset_b);
                    offset_c = c * sizeof(sceVu0FVECTOR);
                    out[3] = *(u_long128 *) ((u_char *) vertices + offset_c);
                    sceVu0SubVector(edge0, (float *) &out[2], (float *) &out[1]);
                    sceVu0SubVector(edge1, (float *) &out[3], (float *) &out[1]);
                    sceVu0OuterProduct(face, edge0, edge1);
                    if (sceVu0InnerProduct(face, local_light) <= 0.0f) {
                        out[4] = *(u_long128 *) vertices[c];
                        triangle++;
                        out[0] = *(u_long128 *) edges;
                        *(u_long128 *) near_side[0] = *(u_long128 *) ((u_char *) eye + offset_a);
                        *(u_long128 *) near_side[1] = *(u_long128 *) ((u_char *) eye + offset_b);
                        *(u_long128 *) near_side[2] = *(u_long128 *) ((u_char *) eye + offset_c);
                        *(u_long128 *) near_side[3] = *(u_long128 *) ((u_char *) eye + offset_a);
                        *(u_long128 *) far_side[0] = *(u_long128 *) ((u_char *) projected + offset_a);
                        *(u_long128 *) far_side[1] = *(u_long128 *) ((u_char *) projected + offset_b);
                        *(u_long128 *) far_side[2] = *(u_long128 *) ((u_char *) projected + offset_c);
                        *(u_long128 *) far_side[3] = *(u_long128 *) ((u_char *) projected + offset_a);
                        clip_num = scissior(clipped, near_side, far_side, info->near[2]);
                        sceVu0SubVector(side0, clipped[1], clipped[0]);
                        sceVu0SubVector(side1, clipped[2], clipped[0]);
                        sceVu0ApplyMatrix(near_side[0], clip, (float *) clipped[0]);
                        sceVu0ApplyMatrix(near_side[1], clip, clipped[1]);
                        sceVu0ApplyMatrix(near_side[2], clip, clipped[2]);
                        sceVu0ApplyMatrix(near_side[3], clip, (float *) clipped[3]);
                        sceVu0ApplyMatrix(clipped[0], clip, (float *) clipped[4]);
                        int counts[4] = {0, 0, 0, 1};
                        counts[0] = clip_num;
                        if (clip_num > 4) {
                            counts[0] = 4;
                            counts[1] = 3;
                        }
                        if (pass != 0) {
                            counts[0] = 0;
                            counts[1] = 0;
                        }
                        out[5] = *(u_long128 *) counts;
                        if (pass == 0) {
                            out[6] = *(u_long128 *) clipped[0];
                            out[7] = *(u_long128 *) near_side[3];
                            out[8] = *(u_long128 *) near_side[2];
                            out[9] = *(u_long128 *) near_side[1];
                            out[10] = *(u_long128 *) near_side[0];
                            out += 11;
                        } else {
                            out[6] = *(u_long128 *) near_side[0];
                            out[7] = *(u_long128 *) near_side[0];
                            out[8] = *(u_long128 *) near_side[0];
                            out[9] = *(u_long128 *) near_side[0];
                            out[10] = *(u_long128 *) near_side[0];
                            out += 11;
                        }
                    }
                }
                if (triangle > 0) {
                    word += triangle * 44;
                    qwc += triangle * 11;
                    block[(u_int) tag] |= triangle;
                    block[(u_int) unpack] |= qwc << 16;
                    block[word] = 0;
                    block[(u_int) (word + 1)] = 0;
                    block[(u_int) (word + 2)] = 0;
                    if (!continued) {
                        if (first) {
                            block[(u_int) (word + 3)] = 0x14000000;
                            word += 4;
                            first = 0;
                        } else {
                            block[(u_int) (word + 3)] = 0x14000001;
                            word += 4;
                        }
                        continued = 1;
                    } else {
                        block[(u_int) (word + 3)] = 0x17000000;
                        word += 4;
                    }
                } else {
                    word -= 12;
                }
            }
            *(u_long128 *) &block[word] = *(u_long128 *) end;
            word += 4;
        }
    }
    vu_size = word >> 2;
    return vu_size;
}
