#include "visualshadow.hpp"

#include <libvu0.h>

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

#ifdef NON_MATCHING
int CVisualShadow::CreateVUdataShadowCLIP(u_int *block, u_int *model_data, RenderInfo *info,
                                          float (*matrix)[4]) {
    MDT_HEADER *model;
    MDT_SHADOW *shadow;
    MDT_SSHAPE *shape;
    sceVu0FVECTOR *vertices;
    sceVu0FMATRIX transpose;
    sceVu0FMATRIX local_to_eye;
    sceVu0FMATRIX shadow_matrix;
    sceVu0FMATRIX shadow_to_world;
    sceVu0FMATRIX shadow_to_eye;
    sceVu0FVECTOR local_light;
    sceVu0FVECTOR plane_point;
    sceVu0FVECTOR plane_normal;
    sceVu0FVECTOR light;
    float plane_distance;
    int word;
    int pass;
    int shape_index;

    vu_data = block;
    if (!model_data) {
        vu_size = 0;
        return 0;
    }

    // Convert the scene light and receiver plane into the model's local coordinate system.
    sceVu0TransposeMatrix(transpose, matrix);
    light[0] = info->light_direction[0][0];
    light[1] = info->light_direction[1][0];
    light[2] = info->light_direction[2][0];
    light[3] = 0.0f;
    sceVu0ApplyMatrix(local_light, transpose, light);
    sceVu0Normalize(local_light, local_light);
    sceVu0CopyVector(plane_point, info->shadow_point);
    sceVu0CopyVector(plane_normal, info->shadow_normal);
    plane_distance = sceVu0InnerProduct(plane_normal, plane_point);
    if (plane_distance == 0.0f) {
        plane_distance = 1.0f;
    }
    sceVu0Normalize(light, light);
    sceVu0DropShadowMatrix(shadow_matrix, light, plane_normal[0] / plane_distance,
                           plane_normal[1] / plane_distance, plane_normal[2] / plane_distance, 0);
    MulMatrix(shadow_to_world, shadow_matrix, matrix);
    MulMatrix(local_to_eye, info->view_scaled, matrix);
    MulMatrix(shadow_to_eye, info->view_scaled, shadow_to_world);

    model = (MDT_HEADER *) model_data;
    vertices = (sceVu0FVECTOR *) ((u_char *) model + model->vertex_ofs);
    shadow = (MDT_SHADOW *) ((u_char *) model + model->mesh_ofs);
    word = 0;

    // The first pass emits receiver polygons; the second emits the retained silhouette edges.
    for (pass = 0; pass < 2; pass++) {
        shape = shadow->shape;
        for (shape_index = 0; shape_index < shadow->shape_num; shape_index++) {
            MDT_SVERTEX *corner = shape->vertex;
            int triangle_count = shape->index_num / 3;
            int triangle;

            for (triangle = 0; triangle < triangle_count; triangle++, corner += 3) {
                sceVu0FVECTOR edge0;
                sceVu0FVECTOR edge1;
                sceVu0FVECTOR face;
                sceVu0FVECTOR eye[3];
                sceVu0FVECTOR projected[3];
                int visible;
                int vertex;
                int header;

                sceVu0SubVector(edge0, vertices[corner[1].index], vertices[corner[0].index]);
                sceVu0SubVector(edge1, vertices[corner[2].index], vertices[corner[0].index]);
                sceVu0OuterProduct(face, edge0, edge1);
                if (sceVu0InnerProduct(face, local_light) > 0.0f) {
                    continue;
                }
                if (pass && corner[0].edge && corner[1].edge && corner[2].edge) {
                    continue;
                }

                visible = 0;
                for (vertex = 0; vertex < 3; vertex++) {
                    sceVu0ApplyMatrix(eye[vertex], local_to_eye, vertices[corner[vertex].index]);
                    sceVu0ApplyMatrix(projected[vertex], shadow_to_eye,
                                      vertices[corner[vertex].index]);
                    if (eye[vertex][2] > info->near[2] || projected[vertex][2] > info->near[2]) {
                        visible = 1;
                    }
                }
                if (!visible) {
                    continue;
                }

                header = word;
                block[word++] = 0;
                block[word++] = 0;
                block[word++] = 0;
                block[word++] = 0x6c008000;
                block[word++] = 0x8001;
                block[word++] = 0x2022c000;
                block[word++] = 0x41;
                block[word++] = 0;
                block[word++] = pass;
                block[word++] = 0;
                block[word++] = 0;
                block[word++] = 0;

                for (vertex = 0; vertex < 3; vertex++) {
                    u_int *source = (u_int *) vertices[corner[vertex].index];
                    u_int *shadow_vertex = (u_int *) projected[vertex];
                    block[word++] = source[0];
                    block[word++] = source[1];
                    block[word++] = source[2];
                    block[word++] = source[3];
                    block[word++] = shadow_vertex[0];
                    block[word++] = shadow_vertex[1];
                    block[word++] = shadow_vertex[2];
                    block[word++] = shadow_vertex[3];
                }
                block[header + 4] |= 1;
                block[header + 3] |= 7 << 16;
                block[word++] = 0;
                block[word++] = 0;
                block[word++] = 0;
                block[word++] = 0x17000000;
            }
            shape = (MDT_SSHAPE *) corner;
        }
    }

    vu_size = word >> 2;
    return vu_size;
}
#else
INCLUDE_ASM("asm/nonmatchings/visualshadow", CreateVUdataShadowCLIP__13CVisualShadowFPUiPUiP10RenderInfoPA4_f);
#endif
