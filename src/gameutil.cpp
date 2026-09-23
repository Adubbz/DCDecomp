#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 25

#include "gameutil.hpp"

#include <eekernel.h>
#include <libgraph.h>
#include <libpkt.h>
#include <libvu0.h>
#include <sifdma.h>
#include <sifrpc.h>

#include <cmath>
#include <cstdio>
#include <cstring>

#include "camera.hpp"
#include "character.hpp"
#include "dataalloc.hpp"
#include "frame.hpp"
#include "framevu1.hpp"
#include "mathutil.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "texture.hpp"

/* Shared helpers: the IOP midi bridge, motion interpolation, collision and
 * ground queries, and 2D sprite setup. */

static s32 midi_buffer[16];          // RPC argument and response storage shared by MIDI calls.
static sceSifClientData midi_client; // Client state bound to the EZMIDI IOP server.
static sceSifDmaData iop_transfer;   // Descriptor reused for synchronous EE-to-IOP transfers.

int ezMidiInit(void) {
    s32 wait;

    sceSifInitRpc(0);
    while (1) {
        if (sceSifBindRpc(&midi_client, 0x12346, 0) < 0) {
            printf("error: sceSifBindRpc \n");
            for (;;) {
            }
        }
        wait = 10000;
        while (wait--) {
        }
        if (midi_client.server != 0) {
            break;
        }
    }
    return 1;
}

int ezMidi(int command, int argument) {
    s32 wait;
    s32 receive_size;

    receive_size = 0;
    for (wait = 0; wait < 2000; wait++) {
    }
    if ((command & 0x8000) != 0) {
        receive_size = 64;
    }
    if ((command & 0x1000) != 0) {
        sceSifCallRpc(&midi_client, command, 0, (void *) argument, 64, (void *) midi_buffer,
                      receive_size, 0, 0);
    } else {
        midi_buffer[0] = argument;
        sceSifCallRpc(&midi_client, command, 0, (void *) midi_buffer, 16, (void *) midi_buffer,
                      receive_size, 0, 0);
    }
    return midi_buffer[0];
}

int ezTransToIOP(void *iop_address, void *ee_address, int size) {
    s32 id;

    iop_transfer.data = ee_address;
    iop_transfer.addr = iop_address;
    iop_transfer.size = size;
    iop_transfer.mode = 0;

    FlushCache(0);
    id = sceSifSetDma(&iop_transfer, 1);
    if (id == 0) {
        return -1;
    }
    while (sceSifDmaStat(id) >= 0) {
    }
    return 0;
}

INCLUDE_RODATA("asm/nonmatchings/gameutil", @414__4);

/**
 * Interpolates between two quaternions along the shorter arc.
 *
 * @mangled QuatSlerp__FPfPffPf
 * @address 0x147B70
 * @size 0x1B0
 */
static void QuatSlerp(float *from, float *to, float t, float *out) {
    float to_x;
    float to_y;
    float to_z;
    float to_w;
    float cosine;
    float angle;
    float inv_sine;
    float scale_from;
    float scale_to;

    from[0] = -from[0];
    to[0] = -to[0];
    cosine = from[1] * to[1] + from[2] * to[2] + from[3] * to[3] + from[0] * to[0];
    if (cosine < 0.0f) {
        cosine = -cosine;
        to_x = -to[1];
        to_y = -to[2];
        to_z = -to[3];
        to_w = -to[0];
    } else {
        to_x = to[1];
        to_y = to[2];
        to_z = to[3];
        to_w = to[0];
    }
    if (1.0f - cosine > 0.001f) {
        angle = acosf(cosine);
        inv_sine = 1.0f / sinf(angle);
        scale_from = inv_sine * sinf((1.0f - t) * angle);
        scale_to = inv_sine * sinf(t * angle);
    } else {
        scale_from = 1.0f - t;
        scale_to = t;
    }
    out[1] = scale_from * from[1] + scale_to * to_x;
    out[2] = scale_from * from[2] + scale_to * to_y;
    out[3] = scale_from * from[3] + scale_to * to_z;
    out[0] = scale_from * from[0] + scale_to * to_w;
}
#ifdef NON_MATCHING
Mot_List *MotionProc(CFrame *frame, MOTION_STATE *state, Mot_List *list) {
    u32 next_key = 0;
    u32 previous_key;
    u32 target_key;
    float amount;
    float value[4];
    float from_quaternion[4];
    float to_quaternion[4];
    float *from;
    float *to;
    CFrame *target;

    while (next_key < list->key_count &&
           *(u32 *) ((u8 *) list->keys + next_key * 0x20) <= state->frame) {
        next_key++;
    }
    if (next_key == 0 || next_key >= list->key_count) {
        return list->next;
    }
    previous_key = next_key - 1;
    target_key = next_key;
    from = (float *) ((u8 *) list->keys + previous_key * 0x20 + 0x10);
    to = (float *) ((u8 *) list->keys + target_key * 0x20 + 0x10);
    if (state->next_frame == state->frame + 1) {
        u32 from_frame = *(u32 *) ((u8 *) list->keys + previous_key * 0x20);
        u32 to_frame = *(u32 *) ((u8 *) list->keys + target_key * 0x20);
        amount = to_frame == from_frame + 1
                     ? state->blend
                     : (state->time - from_frame) / (float) (to_frame - from_frame);
    } else {
        amount = state->blend;
    }
    if (amount < 0.0f || amount > 1.0f) {
        return list->next;
    }
    target = frame + list->frame;
    if (list->type == 0) {
        sceVu0CopyVector(from_quaternion, from);
        sceVu0CopyVector(to_quaternion, to);
        QuatSlerp(from_quaternion, to_quaternion, amount, value);
        target->SetTransMatrix(value);
    } else {
        sceVu0InterVectorXYZ(value, to, from, amount);
        if (list->type == 1) {
            target->SetScale(value);
        } else if (list->type == 2) {
            target->SetPosition(value);
        } else if (list->type == 0x1E && state->camera != NULL) {
            frame->GetWorldPosition(value, value);
            state->camera->SetPos(value);
        } else if (list->type == 0x1F && state->camera != NULL) {
            frame->GetWorldPosition(value, value);
            state->camera->SetRef(value);
        }
    }
    return list->next;
}

Mot_List *MotionProc2(CFrame *frame, tagMOTION_TYPE *motion, tagFRAME_INF *frame_info,
                      Mot_List *list) {
    u32 key;
    CFrame *target;

    if (list->type == 200) {
        return list->next;
    }
    target = frame + list->frame;
    if (list->target != frame_info[list->frame].parent_frame) {
        sceVu0CopyMatrix(frame_info[list->target].matrix, target->local);
    }
    for (key = 0; key < list->key_count; key++) {
        u32 vertex = *(u32 *) ((u8 *) list->keys + key * 0x20);
        float *offset = (float *) ((u8 *) list->keys + key * 0x20 + 0x10);
        if (frame_info[list->frame].base_vertices != NULL &&
            vertex < frame_info[list->frame].vertex_count) {
            sceVu0FVECTOR *base = frame_info[list->frame].base_vertices;
            base[vertex][0] += offset[0];
            base[vertex][1] += offset[1];
            base[vertex][2] += offset[2];
        }
    }
    return list->next;
}
#else
INCLUDE_ASM("asm/nonmatchings/gameutil", MotionProc__FP6CFrameP12MOTION_STATEP8Mot_List);
INCLUDE_ASM("asm/nonmatchings/gameutil", MotionProc2__FP6CFrameP14tagMOTION_TYPEP12tagFRAME_INFP8Mot_List);
#endif

void SetMotionEX(CFrame *frame, tagMOTION_TYPE *motion, MOTION_INFO *info, MOTION_STATE *state,
                 tagFRAME_INF *frame_info) {
    Mot_List *list;
    Mot_List *list2;

    if (state->playing_no != state->motion_no || state->blending != 0) {
        if (state->blending == 0) {
            state->blend = 0.0f;
        }
        state->blending = 1;
        state->frame = state->time;
        state->blend += state->blend_step;
        state->playing_no = state->motion_no;
        if (!(state->blend < 1.0f)) {
            state->time = state->next_frame;
            state->frame = state->next_frame;
            state->blend = 0.0f;
            state->blending = 0;
        }
        for (list = motion->proc_list; list != NULL;) {
            list = MotionProc(frame, state, list);
        }
        if (state->look_at != 0) {
            if (state->look_target != NULL) {
                LookAt(state->look_frame, state->look_target, state->look_constraint);
            } else {
                LookAt(state->look_frame, state->look_position, state->look_constraint);
            }
        }
        for (list = motion->proc_list2; list != NULL;) {
            list = MotionProc2(frame, motion, frame_info, list);
        }
        return;
    }
    state->playing_no = state->motion_no;
    state->frame = state->time;
    state->next_frame = state->frame + 1;
    state->blend = state->time - state->frame;
    for (list2 = motion->proc_list; list2 != NULL;) {
        list2 = MotionProc(frame, state, list2);
    }
    if (state->look_at != 0) {
        if (state->look_target != NULL) {
            LookAt(state->look_frame, state->look_target, state->look_constraint);
        } else {
            LookAt(state->look_frame, state->look_position, state->look_constraint);
        }
    }
    for (list2 = motion->proc_list2; list2 != NULL;) {
        list2 = MotionProc2(frame, motion, frame_info, list2);
    }
    state->time += info[state->motion_no].speed;
    if ((unsigned int) state->time >= info[state->motion_no].end) {
        state->time -= (float) info[state->motion_no].end - (float) info[state->motion_no].start;
        state->frame = info[state->motion_no].start;
        state->next_frame = state->frame + 1;
        state->blend = state->time - state->frame;
    }
}

/**
 * Takes a motion's animation data out of an arena and fills it from a file.
 *
 * @mangled CreateAnimeDataEX__FP14tagMOTION_TYPEP14CDataAlloc2_1_P16MOTION_FILE_INFO
 * @address 0x149090
 * @size 0x264
 */
int CreateAnimeDataEX(tagMOTION_TYPE *motion, CDataAlloc2<1> *arena, MOTION_FILE_INFO *files) {
    if (files[0].name != NULL) {
        motion->base_matrices = (sceVu0FMATRIX *) arena->Alloc((files[0].size >> 4) + 1);
        memcpy(motion->base_matrices, files[0].data, files[0].size);
    }
    if (files[1].name != NULL) {
        Mot_List *list;
        Mot_File_List *record;
        u_char *data;
        Mot_List *reversed;
        Mot_List *previous;
        Mot_List *node;
        u_char *keys;

        data = (u_char *) files[1].data;
        motion->proc_list = NULL;
        do {
            record = (Mot_File_List *) data;
            list = (Mot_List *) arena->Alloc(sizeof(Mot_List) / 16 + 1);
            list->frame = record->frame;
            list->target = record->target;
            list->key_count = record->key_count;
            list->type = record->type;
            list->keys = (Mot_Key *) arena->Alloc(list->key_count * sizeof(Mot_Key) / 16 + 1);
            data += sizeof(Mot_File_List);
            keys = data;
            data += list->key_count * sizeof(Mot_Key);
            memcpy(list->keys, keys, list->key_count * sizeof(Mot_Key));
            if (motion->proc_list == NULL) {
                list->next = NULL;
            } else {
                list->next = motion->proc_list;
            }
            motion->proc_list = list;
        } while (record->more != 0L);
        reversed = NULL;
        while ((node = motion->proc_list) != NULL) {
            previous = reversed;
            reversed = node;
            motion->proc_list = node->next;
            node->next = previous;
        }
        motion->proc_list = reversed;
    }
    if (files[2].name != NULL) {
        Mot_List *list;
        Mot_File_List *record;
        u_char *data;
        Mot_List *reversed;
        Mot_List *previous;
        Mot_List *node;
        u_char *keys;

        data = (u_char *) files[2].data;
        motion->proc_list2 = NULL;
        do {
            record = (Mot_File_List *) data;
            list = (Mot_List *) arena->Alloc(sizeof(Mot_List) / 16 + 1);
            list->frame = record->frame;
            list->target = record->target;
            list->key_count = record->key_count;
            list->type = record->type;
            list->keys = (Mot_Key *) arena->Alloc(list->key_count * sizeof(Mot_Key) / 16 + 1);
            data += sizeof(Mot_File_List);
            keys = data;
            data += list->key_count * sizeof(Mot_Key);
            memcpy(list->keys, keys, list->key_count * sizeof(Mot_Key));
            if (motion->proc_list2 == NULL) {
                list->next = NULL;
            } else {
                list->next = motion->proc_list2;
            }
            motion->proc_list2 = list;
        } while (record->more != 0L);
        reversed = NULL;
        while ((node = motion->proc_list2) != NULL) {
            previous = reversed;
            reversed = node;
            motion->proc_list2 = node->next;
            node->next = previous;
        }
        motion->proc_list2 = reversed;
    }
    return 1;
}
/**
 * Builds the per-frame animation table a model's motion needs.
 *
 * @mangled AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_PP12tagFRAME_INF
 * @address 0x149300
 * @size 0x98
 */
void AnimeDataInit(CFrame *frame, tagMOTION_TYPE *motion, CDataAlloc2<1> *arena, tagFRAME_INF **frame_info) {
    *frame_info = (tagFRAME_INF *) arena->Alloc64((frame->GetFrameNum() + 10) * sizeof(tagFRAME_INF) / 16 + 1);
    AnimeDataInit(frame, motion, arena, *frame_info);
}
/**
 * Builds the per-frame animation table into storage already set aside.
 *
 * @mangled AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_P12tagFRAME_INF
 * @address 0x1493A0
 * @size 0x318
 */
#ifdef NON_MATCHING
int AnimeDataInit(CFrame *frame, tagMOTION_TYPE *motion, CDataAlloc2<1> *arena,
                  tagFRAME_INF *frame_info) {
    int frame_count = frame->GetFrameNum();
    int index;

    for (index = 0; index < frame_count; index++) {
        CFrame *current = frame + index;
        frame_info[index].parent_frame = current->parent == NULL ? -1 : current->parent - frame;
        frame_info[index].vertex_count = 0;
        frame_info[index].base_vertices = NULL;
        sceVu0CopyMatrix(frame_info[index].matrix, current->local);
    }
    for (Mot_List *list = motion->proc_list2; list != NULL; list = list->next) {
        if (list->type != 200 && list->frame >= 0 && list->frame < frame_count &&
            frame_info[list->frame].base_vertices == NULL) {
            u32 count = list->key_count;
            frame_info[list->frame].vertex_count = count;
            frame_info[list->frame].base_vertices = (sceVu0FVECTOR *) arena->Alloc(count + 1);
            memset(frame_info[list->frame].base_vertices, 0, count * sizeof(sceVu0FVECTOR));
        }
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/gameutil", AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_P12tagFRAME_INF);
#endif

int NextMotionTime_GET_EX(MOTION_INFO *info, MOTION_STATE *state) {
    int playing_start = info[state->playing_no].start;
    float progress = (state->time - playing_start) / (info[state->playing_no].end - playing_start);
    int start = info[state->motion_no].start;
    int end = info[state->motion_no].end;
    int time = start + progress * (end - start);

    if (end < time) {
        time = end;
    }
    if (time < start) {
        time = start;
    }
    return time;
}

/**
 * Builds a matrix that rotates by an angle around an arbitrary direction.
 */
static void SetRotationMatrixFromDir(sceVu0FMATRIX matrix, float *direction, float angle) {
    float cosine = cosf(angle);
    float sine = sinf(angle);
    float inverse_cosine = 1.0f - cosine;
    sceVu0FVECTOR axis;

    sceVu0UnitMatrix(matrix);
    sceVu0Normalize(axis, direction);
    matrix[0][0] = cosine + inverse_cosine * (axis[0] * axis[0]);
    matrix[0][1] = inverse_cosine * (axis[0] * axis[1]) - axis[2] * sine;
    matrix[0][2] = inverse_cosine * (axis[0] * axis[2]) + axis[1] * sine;
    matrix[1][0] = inverse_cosine * (axis[1] * axis[0]) + axis[2] * sine;
    matrix[1][1] = cosine + inverse_cosine * (axis[1] * axis[1]);
    matrix[1][2] = inverse_cosine * (axis[1] * axis[2]) - axis[0] * sine;
    matrix[2][0] = inverse_cosine * (axis[2] * axis[0]) - axis[1] * sine;
    matrix[2][1] = inverse_cosine * (axis[2] * axis[1]) + axis[0] * sine;
    matrix[2][2] = cosine + inverse_cosine * (axis[2] * axis[2]);
}

int LookAt(CFrameVu1 *frame, float *target, _FRAMECONSTRAINT constraint) {
    sceVu0FVECTOR up;
    sceVu0FVECTOR local;
    sceVu0FVECTOR axis;
    sceVu0FVECTOR direction;
    sceVu0FVECTOR cross;
    sceVu0FVECTOR side;
    sceVu0FVECTOR plane;
    sceVu0FVECTOR delta;
    sceVu0FMATRIX parent;
    sceVu0FMATRIX matrix;
    sceVu0FMATRIX rotation;
    float angle;

    sceVu0UnitMatrix(parent);
    frame->parent->GetLWMatrix(parent);
    sceVu0UnitMatrix(matrix);
    sceVu0CopyMatrix(matrix, frame->local);
    if (constraint == FRAME_CONSTRAINT_X)
        sceVu0Normalize(up, matrix[0]);
    if (constraint == FRAME_CONSTRAINT_Y)
        sceVu0Normalize(up, matrix[1]);
    if (constraint == FRAME_CONSTRAINT_Z)
        sceVu0Normalize(up, matrix[2]);
    up[3] = 1.0f;
    delta[3] = 1.0f;
    sceVu0SubVector(delta, target, parent[3]);
    local[0] = sceVu0InnerProduct(delta, parent[0]);
    local[1] = sceVu0InnerProduct(delta, parent[1]);
    local[2] = sceVu0InnerProduct(delta, parent[2]);
    local[3] = 1.0f;
    if (DistVector(local) > 0.0000001f) {
        sceVu0Normalize(direction, local);
        direction[3] = 1.0f;
        sceVu0Normalize(axis, up);
        axis[3] = 1.0f;
        sceVu0OuterProduct(cross, axis, direction);
        sceVu0Normalize(side, cross);
        side[3] = 1.0f;
        sceVu0OuterProduct(cross, side, axis);
        sceVu0Normalize(plane, cross);
        plane[3] = 1.0f;
        angle = sceVu0InnerProduct(direction, plane);
        if (angle < 0.99999f) {
            sceVu0UnitMatrix(rotation);
            angle = acosf(angle);
            if (angle > 0.7853982f)
                angle = 0.7853982f;
            if (acosf(sceVu0InnerProduct(axis, direction)) > 1.5707964f)
                SetRotationMatrixFromDir(rotation, side, -angle);
            else
                SetRotationMatrixFromDir(rotation, side, angle);
            MulMatrix(matrix, rotation, matrix);
            frame->SetTransMatrix(matrix);
        }
    }
    return 0;
}

int LookAt(CFrameVu1 *frame, CFrameVu1 *target, _FRAMECONSTRAINT constraint) {
    sceVu0FMATRIX matrix;

    target->GetLWMatrix(matrix);
    return LookAt(frame, matrix[3], constraint);
}

/* Loads a box's corners into VU0 registers vf10 and vf11 for the box tests that follow. */
static inline void vu_hold_box(float *max, float *min) {
    register float *p0 = max;
    register float *p1 = min;

    asm {
        lqc2    vf10, 0(p0)
        lqc2    vf11, 0(p1)
    }
}

/* Whether a triangle's bound misses the box held in VU0: the sign flags of the two subtractions,
   cleared before them and read back after. */
static inline int vu_box_missed(float *max, float *min) {
    register float *p0 = max;
    register float *p1 = min;
    register int status;

    asm {
        lqc2    vf12, 0(p0)
        lqc2    vf13, 0(p1)
        vnop
        vnop
        vnop
        ctc2    $0, $vi16
        vsub.xyz vf25, vf10, vf13
        vsub.xyz vf25, vf12, vf11
        vnop
        vnop
        vnop
        vnop
        vnop
        cfc2    status, $vi16
    }

    return status & 0xc0;
}

/**
 * Collects the polygons of a set that meet a box.
 *
 * @mangled PickUpNearPoly__FP6CCPoly7CBoxVu0P6CCPolyi
 * @address 0x149C30
 * @size 0x118
 */
int PickUpNearPoly(CCPoly *out, CBoxVu0 box, CCPoly *poly, int count) {
    sceVu0FVECTOR poly_max;
    sceVu0FVECTOR poly_min;
    int picked = 0;
    int i;
    CCPoly *src;
    CCPoly *dst;

    vu_hold_box(box.max, box.min);
    src = poly;
    dst = out;
    for (i = 0; i < count; i++, src++) {
        VectorMaxMin(poly_max, poly_min, src->vertex[0], src->vertex[1], src->vertex[2]);
        if (vu_box_missed(poly_max, poly_min)) {
            continue;
        }
        memcpy(dst, src, sizeof(CCPoly));
        dst++;
        picked++;
    }
    return picked;
}

int CheckHit(CCPoly *poly, int count, float *from, float *to, float *hit_point, int nearest,
             int mode) {
    sceVu0FVECTOR point;
    sceVu0FVECTOR diff;
    sceVu0FVECTOR poly_min;
    sceVu0FVECTOR poly_max;
    CBoxVu0 line;
    sceVu0FVECTOR offset;
    int i;
    int hit = -1;
    int found = 0;
    float best;
    float from_side;
    float to_side;
    float dist;

    VectorMaxMin(line.max, line.min, from, to);
    vu_hold_box(line.max, line.min);
    for (i = 0; i < count; i++, poly++) {
        if (poly->attr.ignore_mask & mode) {
            continue;
        }
        VectorMaxMin(poly_max, poly_min, poly->vertex[0], poly->vertex[1], poly->vertex[2]);
        if (line.max[0] < poly_min[0] || line.max[1] < poly_min[1] || line.max[2] < poly_min[2]) {
            continue;
        }
        if (line.min[0] > poly_max[0] || line.min[1] > poly_max[1] || line.min[2] > poly_max[2]) {
            continue;
        }
        sceVu0SubVector(offset, from, poly->vertex[0]);
        from_side = sceVu0InnerProduct(poly->normal, offset);
        sceVu0SubVector(offset, to, poly->vertex[0]);
        to_side = sceVu0InnerProduct(poly->normal, offset);
        if (from_side > 0.0f && to_side > 0.0f) {
            continue;
        }
        if (from_side < 0.0f && to_side < 0.0f) {
            continue;
        }
        if (IntersectionPoint_line_poly3(from, to, poly->vertex[0], poly->vertex[1],
                                         poly->vertex[2], poly->normal, point) == 0) {
            continue;
        }
        if (nearest == 0) {
            hit = i;
            sceVu0CopyVector(hit_point, point);
            break;
        }
        diff[0] = from[0] - point[0];
        diff[1] = from[1] - point[1];
        diff[2] = from[2] - point[2];
        dist = diff[0] * diff[0] + diff[1] * diff[1] + diff[2] * diff[2];
        if (found == 0) {
            hit = i;
            best = dist;
            sceVu0CopyVector(hit_point, point);
        } else if (best > dist) {
            hit = i;
            best = dist;
            sceVu0CopyVector(hit_point, point);
        }
        found = 1;
    }
    return hit;
}

int CheckHitVertical(CCPoly *poly, int count, float *from, float depth, float *hit_point,
                     int mode) {
    sceVu0FVECTOR to;
    float best_y;
    int i;
    int best = -1;

    to[0] = from[0];
    to[1] = from[1] + depth;
    to[2] = from[2];
    for (i = 0; i < count; i++, poly++) {
        if (poly->attr.ignore_mask & mode) {
            continue;
        }
        if (!IntersectionPoint_line_poly3(from, to, poly->vertex[0], poly->vertex[1], poly->vertex[2],
                                          poly->normal, hit_point)) {
            continue;
        }
        if (depth <= 0.0f) {
            if (from[1] > hit_point[1] && (best < 0 || (best >= 0 && best_y <= hit_point[1]))) {
                best_y = hit_point[1];
                best = i;
            }
        } else {
            if (from[1] < hit_point[1] && (best < 0 || (best >= 0 && !(best_y < hit_point[1])))) {
                best_y = hit_point[1];
                best = i;
            }
        }
    }
    if (best >= 0) {
        hit_point[1] = best_y;
    }
    return best;
}

int CheckHits(CCPoly *poly, int count, float *from, float *to, int max, int *hit_poly,
              float (*hit_point)[4], int sort, int mode) {
    sceVu0FVECTOR point;
    sceVu0FVECTOR poly_min;
    sceVu0FVECTOR poly_max;
    CBoxVu0 line;
    sceVu0FVECTOR offset;
    sceVu0FVECTOR swap;
    int i;
    int j;
    int hits;
    float from_side;
    float to_side;

    hits = 0;
    VectorMaxMin(line.max, line.min, from, to);
    vu_hold_box(line.max, line.min);
    for (i = 0; i < count; i++, poly++) {
        if (poly->attr.ignore_mask & mode) {
            continue;
        }
        VectorMaxMin(poly_max, poly_min, poly->vertex[0], poly->vertex[1], poly->vertex[2]);
        if (line.max[0] < poly_min[0] || line.max[1] < poly_min[1] || line.max[2] < poly_min[2]) {
            continue;
        }
        if (line.min[0] > poly_max[0] || line.min[1] > poly_max[1] || line.min[2] > poly_max[2]) {
            continue;
        }
        sceVu0SubVector(offset, from, poly->vertex[0]);
        from_side = sceVu0InnerProduct(poly->normal, offset);
        sceVu0SubVector(offset, to, poly->vertex[0]);
        to_side = sceVu0InnerProduct(poly->normal, offset);
        if (from_side > 0.0f && to_side > 0.0f) {
            continue;
        }
        if (from_side < 0.0f && to_side < 0.0f) {
            continue;
        }
        if (IntersectionPoint_line_poly3(from, to, poly->vertex[0], poly->vertex[1],
                                         poly->vertex[2], poly->normal, point) == 0) {
            continue;
        }
        if (hits >= max) {
            break;
        }
        hit_poly[hits] = i;
        sceVu0CopyVector(hit_point[hits], point);
        hit_point[hits][3] = DistVector(from, point);
        hits++;
    }
    if (sort == 0) {
        return hits;
    }
    if (sort > 0) {
        for (i = 0; i < hits - 1; i++) {
            for (j = i + 1; j < hits; j++) {
                if (hit_point[i][3] > hit_point[j][3]) {
                    int index = hit_poly[i];
                    hit_poly[i] = hit_poly[j];
                    hit_poly[j] = index;
                    sceVu0CopyVector(swap, hit_point[i]);
                    sceVu0CopyVector(hit_point[i], hit_point[j]);
                    sceVu0CopyVector(hit_point[j], swap);
                }
            }
        }
    }
    if (sort < 0) {
        for (i = 0; i < hits - 1; i++) {
            for (j = i + 1; j < hits; j++) {
                if (hit_point[i][3] > hit_point[j][3]) {
                    int index = hit_poly[i];
                    hit_poly[i] = hit_poly[j];
                    hit_poly[j] = index;
                    sceVu0CopyVector(swap, hit_point[i]);
                    sceVu0CopyVector(hit_point[i], hit_point[j]);
                    sceVu0CopyVector(hit_point[j], swap);
                }
            }
        }
    }
    return hits;
}

#ifdef NON_MATCHING
int MoveCheck(float *position, float *velocity, float *out_position, MoveCheckInfo *out_info,
              CCPoly *polys, int poly_num, int mode) {
    sceVu0FVECTOR from;
    sceVu0FVECTOR to;
    sceVu0FVECTOR hit;
    sceVu0FVECTOR ground_probe;
    CCPoly ground;
    int wall;

    memset(out_info, 0, sizeof(MoveCheckInfo));
    sceVu0CopyVector(from, position);
    from[1] += 4.0f;
    sceVu0AddVector(to, from, velocity);
    wall = CheckHit(polys, poly_num, from, to, hit, 0, mode);
    if (wall >= 0) {
        sceVu0FVECTOR normal;
        float into_wall;

        sceVu0Normalize(normal, polys[wall].normal);
        into_wall = sceVu0InnerProduct(velocity, normal);
        to[0] -= normal[0] * into_wall;
        to[2] -= normal[2] * into_wall;
    }
    sceVu0CopyVector(ground_probe, to);
    ground_probe[1] -= 4.0f;
    if (GetFootPoly(ground_probe, 15.0f, &ground, hit, polys, poly_num, mode)) {
        out_info->unk_60 = 1;
        out_info->poly = ground;
        out_info->ground_height = hit[1];
        if (to[1] - 6.0f < hit[1]) {
            out_info->unk_00 = 1;
            sceVu0CopyVector(to, hit);
        }
    }
    if (!out_info->unk_00) {
        to[1] -= 4.0f;
    }
    if (CheckWidth(polys, poly_num, to, 5.0f, out_position, mode) == 0) {
        sceVu0CopyVector(out_position, to);
    }
    return wall >= 0;
}

#else
INCLUDE_ASM("asm/nonmatchings/gameutil", MoveCheck__FPfPfPfP13MoveCheckInfoP6CCPolyii);
#endif

/**
 * Describes the surface of a collision triangle, in the shape that CCPoly
 * carries alongside its plane.
 */
struct CCPolyAttr {
    s16 ground_kind; /**< What the surface is made of. */
    s16 foot_sound;  /**< Sound the character's feet play on it. */
    s16 unk_44;      /**< Light or ambience the surface puts the character in. */
    s16 ignore_mask; /**< Collision query modes that pass through the surface. */
    u8 unk_48[8];
};

/**
 * Finds the polygon under a position, within a drop of the given height, and
 * gives back the surface it is made of.
 *
 * @mangled GetFootPoly__FPffP6CCPolyPfP6CCPolyii
 * @address 0x14ABB0
 * @size 0x1DC
 */
int GetFootPoly(float *position, float height, CCPoly *found, float *ground, CCPoly *polys,
                int count, int mode) {
    int hits;
    int i;
    int hit_no[32];
    sceVu0FVECTOR from;
    sceVu0FVECTOR to;
    sceVu0FVECTOR hit_point[64];
    CCPolyAttr attr;
    CCPolyAttr saved;

    sceVu0CopyVector(from, position);
    sceVu0CopyVector(to, position);
    to[1] -= height;
    hits = CheckHits(polys, count, from, to, 32, hit_no, hit_point, 1, mode);
    attr.ground_kind = 0;
    attr.foot_sound = 0;
    attr.unk_44 = 0;
    saved = attr;
    if (hits > 0) {
        *found = polys[hit_no[0]];
        sceVu0CopyVector(ground, hit_point[0]);
    }
    for (i = 0; i < hits; i++) {
        CCPolyAttr *hit_attr = (CCPolyAttr *) &polys[hit_no[i]].attr;

        if (attr.ground_kind == 0) {
            attr.ground_kind = hit_attr->ground_kind;
        }
        if (attr.foot_sound == 0) {
            attr.foot_sound = hit_attr->foot_sound;
        }
        if (attr.unk_44 == 0) {
            attr.unk_44 = hit_attr->unk_44;
        }
    }
    found->info = *(CCPolyInfo *) &attr;
    return hits > 0;
}

int GetEventPoly(float *position, float *velocity, CCPoly *found, int *found_no, float *hit,
                 CCPoly *polys, int count, int mode) {
    int hits;
    int i;
    int hit_no[32];
    sceVu0FVECTOR from;
    sceVu0FVECTOR to;
    sceVu0FVECTOR hit_point[32];
    CCPolyAttr attr;

    sceVu0CopyVector(from, position);
    sceVu0AddVector(to, position, velocity);
    hits = CheckHits(polys, count, from, to, 32, hit_no, hit_point, 1, mode);
    attr.ground_kind = 0;
    attr.foot_sound = 0;
    attr.unk_44 = 0;
    *found_no = -1;
    if (hits > 0) {
        *found = polys[hit_no[0]];
        *found_no = hit_no[0];
        sceVu0CopyVector(hit, hit_point[0]);
    }
    for (i = 0; i < hits; i++) {
        CCPolyAttr *hit_attr = (CCPolyAttr *) &polys[hit_no[i]].attr;

        if (attr.ground_kind == 0) {
            attr.ground_kind = hit_attr->ground_kind;
        }
        if (attr.foot_sound == 0) {
            attr.foot_sound = hit_attr->foot_sound;
        }
        if (attr.unk_44 == 0) {
            attr.unk_44 = hit_attr->unk_44;
        }
    }
    found->info = *(CCPolyInfo *) &attr;
    return attr.ground_kind;
}

int CheckWidth(CCPoly *polys, int count, float *position, float radius, float *out, int flags) {
    int hit;
    int hit_plus;
    int hit_minus;
    int poly_no;
    float step;
    sceVu0FVECTOR to;
    sceVu0FVECTOR hit_a;
    sceVu0FVECTOR hit_b;
    sceVu0FVECTOR pos;
    sceVu0FVECTOR normal;

    hit = 0;
    step = radius / 1.4142135f;
    sceVu0CopyVector(pos, position);
    sceVu0CopyVector(out, position);
    hit_minus = 0;
    hit_plus = 0;
    to[0] = pos[0] + step;
    to[1] = pos[1];
    to[2] = pos[2] + step;
    poly_no = CheckHit(polys, count, pos, to, hit_a, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f)) {
            hit_plus = 1;
            hit = 1;
        }
    }
    to[0] = pos[0] - step;
    to[1] = pos[1];
    to[2] = pos[2] - step;
    poly_no = CheckHit(polys, count, pos, to, hit_b, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f)) {
            hit = 1;
            hit_minus = 1;
        }
    }
    if (hit_plus != 0 && hit_minus != 0) {
        out[0] = 0.5f * (hit_a[0] + hit_b[0]);
        out[2] = 0.5f * (hit_a[2] + hit_b[2]);
    } else {
        if (hit_plus != 0) {
            out[0] = hit_a[0] - step;
            out[2] = hit_a[2] - step;
        }
        if (hit_minus != 0) {
            out[0] = hit_b[0] + step;
            out[2] = hit_b[2] + step;
        }
    }
    sceVu0CopyVector(pos, out);
    hit_minus = 0;
    hit_plus = 0;
    to[0] = pos[0] + step;
    to[1] = pos[1];
    to[2] = pos[2] - step;
    poly_no = CheckHit(polys, count, pos, to, hit_a, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f)) {
            hit_plus = 1;
            hit = 1;
        }
    }
    to[0] = pos[0] - step;
    to[1] = pos[1];
    to[2] = pos[2] + step;
    poly_no = CheckHit(polys, count, pos, to, hit_b, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f)) {
            hit = 1;
            hit_minus = 1;
        }
    }
    if (hit_plus != 0 && hit_minus != 0) {
        out[0] = 0.5f * (hit_a[0] + hit_b[0]);
        out[2] = 0.5f * (hit_a[2] + hit_b[2]);
    } else {
        if (hit_plus != 0) {
            out[0] = hit_a[0] - step;
            out[2] = hit_a[2] + step;
        }
        if (hit_minus != 0) {
            out[0] = hit_b[0] + step;
            out[2] = hit_b[2] - step;
        }
    }
    sceVu0CopyVector(pos, out);
    hit_minus = 0;
    hit_plus = 0;
    to[0] = pos[0] + radius;
    to[1] = pos[1];
    to[2] = pos[2];
    poly_no = CheckHit(polys, count, pos, to, hit_a, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f)) {
            hit_plus = 1;
            hit = 1;
        }
    }
    to[0] = pos[0] - radius;
    to[1] = pos[1];
    to[2] = pos[2];
    poly_no = CheckHit(polys, count, pos, to, hit_b, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f)) {
            hit = 1;
            hit_minus = 1;
        }
    }
    if (hit_plus != 0 && hit_minus != 0) {
        out[0] = 0.5f * (hit_a[0] + hit_b[0]);
    } else {
        if (hit_plus != 0) {
            out[0] = hit_a[0] - radius;
        }
        if (hit_minus != 0) {
            out[0] = hit_b[0] + radius;
        }
    }
    sceVu0CopyVector(pos, out);
    hit_minus = 0;
    hit_plus = 0;
    to[0] = pos[0];
    to[1] = pos[1];
    to[2] = pos[2] + radius;
    poly_no = CheckHit(polys, count, pos, to, hit_a, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f)) {
            hit = 1;
            hit_plus = 1;
        }
    }
    to[0] = pos[0];
    to[1] = pos[1];
    to[2] = pos[2] - radius;
    poly_no = CheckHit(polys, count, pos, to, hit_b, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f)) {
            hit = 1;
            hit_minus = 1;
        }
    }
    if (hit_plus != 0 && hit_minus != 0) {
        out[2] = 0.5f * (hit_a[2] + hit_b[2]);
    } else {
        if (hit_plus != 0) {
            out[2] = hit_a[2] - radius;
        }
        if (hit_minus != 0) {
            out[2] = hit_b[2] + radius;
        }
    }
    return hit;
}

int CheckCameraWidth(CCPoly *polys, int count, float *position, float radius, float *out, int flags) {
    int hit;
    int hit_plus;
    int hit_minus;
    int poly_no;
    float step;
    sceVu0FVECTOR to;
    sceVu0FVECTOR hit_a;
    sceVu0FVECTOR hit_b;
    sceVu0FVECTOR pos;
    sceVu0FVECTOR normal;

    hit = 0;
    step = radius / 1.4142135f;
    sceVu0CopyVector(pos, position);
    sceVu0CopyVector(out, position);
    hit_minus = 0;
    hit_plus = 0;
    to[0] = pos[0] + step;
    to[1] = pos[1];
    to[2] = pos[2] + step;
    poly_no = CheckHit(polys, count, pos, to, hit_a, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f) && normal[0] * step + normal[2] * step < 0.0f) {
            hit_plus = 1;
            hit = 1;
        }
    }
    to[0] = pos[0] - step;
    to[1] = pos[1];
    to[2] = pos[2] - step;
    poly_no = CheckHit(polys, count, pos, to, hit_b, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f) && normal[0] * -step + normal[2] * -step < 0.0f) {
            hit = 1;
            hit_minus = 1;
        }
    }
    if (hit_plus != 0 && hit_minus != 0) {
        out[0] = 0.5f * (hit_a[0] + hit_b[0]);
        out[2] = 0.5f * (hit_a[2] + hit_b[2]);
    } else {
        if (hit_plus != 0) {
            out[0] = hit_a[0] - step;
            out[2] = hit_a[2] - step;
        }
        if (hit_minus != 0) {
            out[0] = hit_b[0] + step;
            out[2] = hit_b[2] + step;
        }
    }
    sceVu0CopyVector(pos, out);
    hit_minus = 0;
    hit_plus = 0;
    to[0] = pos[0] + step;
    to[1] = pos[1];
    to[2] = pos[2] - step;
    poly_no = CheckHit(polys, count, pos, to, hit_a, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f) && normal[0] * step + normal[2] * -step < 0.0f) {
            hit_plus = 1;
            hit = 1;
        }
    }
    to[0] = pos[0] - step;
    to[1] = pos[1];
    to[2] = pos[2] + step;
    poly_no = CheckHit(polys, count, pos, to, hit_b, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f) && normal[0] * -step + normal[2] * step < 0.0f) {
            hit = 1;
            hit_minus = 1;
        }
    }
    if (hit_plus != 0 && hit_minus != 0) {
        out[0] = 0.5f * (hit_a[0] + hit_b[0]);
        out[2] = 0.5f * (hit_a[2] + hit_b[2]);
    } else {
        if (hit_plus != 0) {
            out[0] = hit_a[0] - step;
            out[2] = hit_a[2] + step;
        }
        if (hit_minus != 0) {
            out[0] = hit_b[0] + step;
            out[2] = hit_b[2] - step;
        }
    }
    sceVu0CopyVector(pos, out);
    hit_minus = 0;
    hit_plus = 0;
    to[0] = pos[0] + radius;
    to[1] = pos[1];
    to[2] = pos[2];
    poly_no = CheckHit(polys, count, pos, to, hit_a, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f) && normal[0] * radius < 0.0f) {
            hit_plus = 1;
            hit = 1;
        }
    }
    to[0] = pos[0] - radius;
    to[1] = pos[1];
    to[2] = pos[2];
    poly_no = CheckHit(polys, count, pos, to, hit_b, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f) && normal[0] * -radius < 0.0f) {
            hit = 1;
            hit_minus = 1;
        }
    }
    if (hit_plus != 0 && hit_minus != 0) {
        out[0] = 0.5f * (hit_a[0] + hit_b[0]);
    } else {
        if (hit_plus != 0) {
            out[0] = hit_a[0] - radius;
        }
        if (hit_minus != 0) {
            out[0] = hit_b[0] + radius;
        }
    }
    sceVu0CopyVector(pos, out);
    hit_minus = 0;
    hit_plus = 0;
    to[0] = pos[0];
    to[1] = pos[1];
    to[2] = pos[2] + radius;
    poly_no = CheckHit(polys, count, pos, to, hit_a, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f) && normal[2] * radius < 0.0f) {
            hit = 1;
            hit_plus = 1;
        }
    }
    to[0] = pos[0];
    to[1] = pos[1];
    to[2] = pos[2] - radius;
    poly_no = CheckHit(polys, count, pos, to, hit_b, 0, flags);
    if (poly_no != -1) {
        sceVu0Normalize(normal, polys[poly_no].normal);
        if (normal[1] < 0.5f && !(normal[1] <= -0.5f) && normal[2] * -radius < 0.0f) {
            hit = 1;
            hit_minus = 1;
        }
    }
    if (hit_plus != 0 && hit_minus != 0) {
        out[2] = 0.5f * (hit_a[2] + hit_b[2]);
    } else {
        if (hit_plus != 0) {
            out[2] = hit_a[2] - radius;
        }
        if (hit_minus != 0) {
            out[2] = hit_b[2] + radius;
        }
    }
    return hit;
}
static s32 linear_filter;          // Nonzero selects linear filtering for sprite batches.
static u_long128 *sprite_data_top; // First quadword of the open sprite batch.
static u_long128 *sprite_data;     // Current write cursor of the open sprite batch.
static u_int *sprite_dma_count;    // DMA and VIF tag words patched when the batch closes.

void set2DSprite_Start(sceVif1Packet *packet, CTexture *texture) {
    u_int *p;
    u_long *ad;
    sceGsTest test;
    sceGsZbuf zbuf;

    if (texture == 0)
        return;
    sceVif1PkTerminate(packet);
    sprite_data_top = (u_long128 *) packet->pCurrent;
    sprite_data = sprite_data_top;
    sprite_dma_count = p = (u_int *) sprite_data;
    p[0] = 0x10000000 | 5;
    p[1] = 0;
    p[2] = 0;
    p[3] = 0x50000000 | 5;
    p[4] = 0x8004;
    p[5] = 0x10000000;
    p[6] = 14;
    p[7] = 0;
    ad = (u_long *) (p + 8);
    ad[0] = 0;
    ad[1] = SCE_GS_TEXFLUSH;
    ad[2] = ((u_long) linear_filter << 5) | 0x41;
    ad[3] = SCE_GS_TEX1_1;
    ad[4] = texture->tex0;
    ad[5] = SCE_GS_TEX0_1;
    ad[6] = SCE_GS_SET_PRIM(SCE_GS_PRIM_SPRITE, 0, 1, 0, 1, 1, 1, 0, 0);
    ad[7] = SCE_GS_PRIM;
    test = mgPixelTest;
    test.bits.ate = 0;
    test.bits.aref = 0;
    test.bits.atst = SCE_GS_ALWAYS;
    test.bits.zte = 1;
    test.bits.ztst = SCE_GS_ALWAYS;
    ad[8] = *(u_long *) &test;
    ad[9] = SCE_GS_TEST_1;
    zbuf = mgZBuffer;
    zbuf.bits.zmsk = 1;
    ad[10] = *(u_long *) &zbuf;
    ad[11] = SCE_GS_ZBUF_1;
    sprite_data = (u_long128 *) (ad + 12);
}

void set2DSprite_Core(sceVif1Packet *packet, CTexture *texture, const CRect_i_ &position,
                      const CRect_i_ &uv, u8 red, u8 green, u8 blue, u8 alpha) {
    u_long *ad;

    if (texture == 0)
        return;
    ad = (u_long *) sprite_data;
    ad[0] = SCE_GS_SET_RGBAQ(red, green, blue, alpha, 0);
    ad[1] = SCE_GS_RGBAQ;
    ad[2] = SCE_GS_SET_UV(uv.x << 4, uv.y << 4);
    ad[3] = SCE_GS_UV;
    ad[4] = SCE_GS_SET_XYZF2((position.x << 4) + 27648, (position.y << 3) + 30976, 0, 0);
    ad[5] = SCE_GS_XYZF2;
    ad[6] = SCE_GS_SET_UV((uv.x + uv.width) << 4, (uv.y + uv.height) << 4);
    ad[7] = SCE_GS_UV;
    ad[8] = SCE_GS_SET_XYZF2(((position.x + position.width) << 4) + 27647,
                             ((position.y + position.height) << 3) + 30976, 0, 0);
    ad[9] = SCE_GS_XYZF2;
    sprite_data = (u_long128 *) (ad + 10);
}

void set2DSprite_End(sceVif1Packet *packet, CTexture *texture) {
    u_long *ad;
    u_int *dma_count;
    s32 qwc;

    ad = (u_long *) sprite_data;
    ad[0] = *(u_long *) &mgPixelTest;
    ad[1] = SCE_GS_TEST_1;
    ad[2] = *(u_long *) &mgZBuffer;
    ad[3] = SCE_GS_ZBUF_1;
    sprite_data = (u_long128 *) (ad + 4);
    dma_count = sprite_dma_count;
    qwc = sprite_data - sprite_data_top - 1;
    dma_count[0] = 0x10000000 | qwc;
    dma_count[3] = 0x50000000 | qwc;
    dma_count[4] = (qwc - 1) | 0x8000;
    sceVif1PkReserve(packet, (sprite_data - sprite_data_top) * 4);
}

void SetClut(sceVif1Packet *packet, CTexture *texture, i *clut) {
    sceGsTex0 tex0 = *(sceGsTex0 *) &texture->tex0;
    sceVif1PkRefLoadImage(packet, tex0.bits.cbp, SCE_GS_PSMCT32, 1,
                          (u_long128 *) clut, 64, 0, 0, 16, 16);
}

float LinerInterpolation(float from, float to, float at) {
    return from + (at * (to - from));
}
void AreaAddPos(int *area, int *pos, int *out) {
    int left = area[0];
    int top = area[1];
    int right = area[2];
    int bottom = area[3];
    int x = pos[0];
    int y = pos[1];

    if (x < left) {
        left = x;
    }
    if (right < x) {
        right = x;
    }
    if (y < top) {
        top = y;
    }
    if (bottom < y) {
        bottom = y;
    }
    out[0] = left;
    out[1] = top;
    out[2] = right;
    out[3] = bottom;
}

void RollPos(float *centre, float *point, float angle, float *out) {
    float centre_x = centre[0];
    float centre_y = centre[1];
    float point_x = point[0];
    float point_y = point[1];

    out[0] = centre_x + ((point_x - centre_x) * cos(angle) - (point_y - centre_y) * sin(angle));
    out[1] = centre_y - ((point_x - centre_x) * sin(angle) + (point_y - centre_y) * cos(angle));
}

int CheckPosInOutForRect(RECT *rect, int x, int y) {
    s32 top;
    s32 left;

    left = rect->x;
    if (x < left) {
        return 0;
    }
    if ((left + rect->width) < x) {
        return 0;
    }
    top = rect->y;
    if (y < top) {
        return 0;
    }
    return ((top + rect->height) < y) ? 0 : 1;
}

float GetDisPosToRect(RECT *rect, int x, int y) {
    float dx = rect->x + (rect->width >> 1) - x;
    float dy = rect->y + (rect->height >> 1) - y;

    return sqrt(dx * dx + dy * dy);
}

void GetScrPosFromChar(CCharacter *chara, int *out_pos) {
    float position[4];
    int screen[4];

    chara->GetPosition(position);
    position[1] += 0.85f * chara->body_height;
    position[3] = 1.0f;
    MGRotTransPers2D(screen, position, 0);
    out_pos[0] = screen[0];
    out_pos[1] = screen[1];
}
/** The sixteen colours the font palette can hold. */
extern "C" u32 FontColorTbl[16];

unsigned int Color2Clut(unsigned int colour) {
    for (int i = 0; i < 16; i++) {
        if (colour == FontColorTbl[i]) {
            return i;
        }
    }
    return 0;
}

int NameRegistCodeJtoE(int code) {
    int table[82] = {
        -683, -682, -681, -680, -679, -678, -677, -676, -675, -674,
        -673, -672, -679, -671, -670, -669, -254, -668, -667, -666,
        -665, -664, -679, -679, -679, -679, -679, -679, -657, -656,
        -655, -654, -653, -652, -651, -650, -649, -648, -679, -679,
        -679, -661, -660, -659, -658, -679, -647, -646, -645, -644,
        -643, -642, -641, -640, -639, -638, -637, -636, -635, -634,
        -633, -632, -631, -630, -629, -628, -627, -626, -625, -624,
        -623, -622, -621, -620, -619, -618, -617, -616, -615, -614,
        -613, -612};

    if (code >= 0xD5 && code < 0x102) {
        return table[code - 0xD5];
    }
    if (code >= 0xA1 && code < 0xBB) {
        return code - 0x380;
    }
    if (code >= 0xBB && code < 0xD5) {
        return code - 0x380;
    }
    return -0x2A7;
}
