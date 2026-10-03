#include <libvu0.h>

#include <cstdio>
#include <cstring>

#include "framevu1.hpp"
#include "gameutil.hpp"
#include "mathutil.hpp"
#include "mdt.hpp"
#include "visualvu1.hpp"
#include "vu0_ops.hpp"

namespace {

// Retail's def_vrtx is file-static in gameutil.cpp, which only MotionProc2 touches.
sceVu0FVECTOR g_deformed[3000];

// base carries the inverted bind rotation with the uninverted bind translation in row 3, which is
// why the translation is subtracted before the transform and again after it.
void SkinVertex(float *out, float *deformed, const float *source, const float base[4][4], const float bone[4][4],
                const float inverse[4][4], float weight) {
    float local[4];
    for (int i = 0; i < 3; i++) {
        local[i] = source[i] - base[3][i];
    }
    local[3] = 1.0f;

    float accumulated[4];
    vu0::Apply(accumulated, base, local);
    for (int i = 0; i < 3; i++) {
        local[i] = accumulated[i] - base[3][i];
    }

    vu0::Apply(accumulated, bone, local);
    float moved[3];
    for (int i = 0; i < 3; i++) {
        moved[i] = accumulated[i] - source[i];
    }

    for (int i = 0; i < 3; i++) {
        deformed[i] = deformed[i] + moved[i] * weight;
    }

    float result[4];
    vu0::Apply(result, inverse, deformed);
    vu0::Copy(out, result);
}

} // namespace

Mot_List *MotionProc2(CFrame *frame, tagMOTION_TYPE *motion, tagFRAME_INF *frame_info, Mot_List *list) {
    static sceVu0FMATRIX  Bone_Matrix;
    static sceVu0FMATRIX  Bone_Matrix_inv;
    static sceVu0FMATRIX  Bone_Matrix_Base;
    static sceVu0FVECTOR *vert;
    CFrameVu1            *target;

    if (list->type == MOTION_KEY_SKIP) {
        return list->next;
    }

    target = &((CFrameVu1 *) frame)[list->target];

    if (list->target == (u32) frame_info[list->frame].parent_frame) {
        CFrameVu1  *owner = &((CFrameVu1 *) frame)[list->frame];
        MDT_HEADER *model = (MDT_HEADER *) owner->GetVisual()->GetMDTDataAddress();

        vert = (sceVu0FVECTOR *) ((u_char *) model + model->vertex_ofs);

        if (frame_info[list->frame].vertex_count > 3000) {
            printf("###### MAX_VERTX OVER %d/%d######\n", frame_info[list->frame].vertex_count, 3000);
        }

        std::memcpy(g_deformed, frame_info[list->frame].base_vertices,
                    frame_info[list->frame].vertex_count * sizeof(sceVu0FVECTOR));
        sceVu0UnitMatrix(Bone_Matrix);
        sceVu0UnitMatrix(Bone_Matrix_Base);
        sceVu0InversMatrix(Bone_Matrix_inv, frame_info[list->frame].matrix);
        owner->attr.remake_pending = 1;
        sceVu0UnitMatrix(frame_info[list->target].bone_base_matrix);
        sceVu0UnitMatrix(frame_info[list->target].bone_matrix);
    } else {
        sceVu0FMATRIX local;
        sceVu0FVECTOR translation;

        sceVu0CopyMatrix(local, target->local);
        MulMatrix(Bone_Matrix, frame_info[frame_info[list->target].parent_frame].bone_matrix, local);
        MulMatrix(Bone_Matrix_Base, frame_info[frame_info[list->target].parent_frame].bone_base_matrix,
                  motion->base_matrices[list->target]);
        sceVu0CopyMatrix(frame_info[list->target].bone_base_matrix, Bone_Matrix_Base);
        sceVu0CopyMatrix(frame_info[list->target].bone_matrix, Bone_Matrix);
        sceVu0CopyVector(translation, Bone_Matrix_Base[3]);
        sceVu0InversMatrix(Bone_Matrix_Base, Bone_Matrix_Base);
        sceVu0CopyVector(Bone_Matrix_Base[3], translation);
    }

    for (u_int i = 0; i < list->key_count; i++) {
        u32 vertex = list->keys[i].frame;
        SkinVertex(vert[vertex], g_deformed[vertex], frame_info[list->frame].base_vertices[vertex], Bone_Matrix_Base,
                   Bone_Matrix, Bone_Matrix_inv, 0.01f * list->keys[i].value[0]);
    }

    return list->next;
}
