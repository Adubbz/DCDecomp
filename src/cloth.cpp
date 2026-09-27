#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 285

#include "cloth.hpp"

#include "frame.hpp"
#include "framevu1.hpp"
#include "mglib.hpp"
#include <cstring>
#include "bound.hpp"
#include "wind.hpp"
#include "texture.hpp"

/**
 * Draws the simulated cloth through a temporary world-space frame.
 */
void CCloth::Draw() {
    CFrameVu1 draw_frame;
    int i;

    draw_frame.SetVisual(this);
    draw_frame.max[0] = 10000.0f;
    draw_frame.max[1] = 10000.0f;
    draw_frame.max[2] = 10000.0f;
    draw_frame.min[0] = -10000.0f;
    draw_frame.min[1] = -10000.0f;
    draw_frame.min[2] = -10000.0f;
    for (i = 0; i < 8; i++) {
        float *corner[2];

        corner[0] = draw_frame.min;
        corner[1] = draw_frame.max;
        draw_frame.corner[i][3] = 1.0f;
        draw_frame.corner[i][0] = corner[(i & 1) != 0][0];
        draw_frame.corner[i][1] = corner[(i & 2) != 0][1];
        draw_frame.corner[i][2] = corner[(i & 4) != 0][2];
    }

    CFrameAttr attr;

    attr.fog_enable = 0;
    attr.unk_0B = 0;
    attr.unk_08 = 0;
    float origin = 0.0f;

    draw_frame.SetAttr(attr, 1, 0);
    draw_frame.SetPosition(origin, origin, origin);
    MGDraw(&draw_frame);
}

/**
 * Puts every cloth vertex back where its frame says it rests.
 *
 * @mangled Clear__6CClothFv
 * @address 0x13B7A0
 * @size 0x100
 */
void CCloth::Clear() {
    sceVu0FMATRIX matrix;
    int i;
    int j;

    if (frame != NULL) {
        frame->GetLWMatrix(matrix);
    }
    sceVu0ApplyMatrix(last_position, matrix, position);
    for (j = 0; j < num_j; j++) {
        for (i = 0; i < num_i; i++) {
            float *velocity = speed[i][j];
            float *vertex = point[i][j];
            velocity[0] = 0.0f;
            velocity[1] = 0.0f;
            velocity[2] = 0.0f;
            if (frame != NULL) {
                sceVu0ApplyMatrix(point[i][j], matrix, home[i][j]);
                sceVu0CopyVector(last[i][j], point[i][j]);
            }
        }
    }
}

/**
 * Blends two bone transforms for a stretched vertex, on the vector unit. The
 * calls in this file link to chararead's copy.
 */
static void StretchBind2(float *first, float *second, float *parameters) {
    asm {
        lqc2 $vf10, 0x0($4)
        lqc2 $vf11, 0x0($5)
        lqc2 $vf12, 0x0($6)
        vmulx.xyzw $vf1, $vf0, $vf0x
        vsub.xyz $vf13, $vf10, $vf11
        vnop
        vnop
        vnop
        vaddy.x $vf5, $vf1, $vf13y
        vaddz.x $vf6, $vf1, $vf13z
        vmula.x $ACC, $vf13, $vf13
        vmadday.x $ACC, $vf5, $vf13y
        vmaddz.x $vf7, $vf6, $vf13z
        vrsqrt $Q, $vf12x, $vf7x
        vaddax.xyzw $ACC, $vf13, $vf0x
        vwaitq
        vmsubq.xyzw $vf25, $vf13, $Q
        vaddax.xyzw $ACC, $vf10, $vf0x
        vmsuby.xyz $vf10, $vf25, $vf12y
        vaddax.xyzw $ACC, $vf11, $vf0x
        vmaddz.xyz $vf11, $vf25, $vf12z
        sqc2 $vf10, 0x0($4)
        sqc2 $vf11, 0x0($5)
    }
}

/**
 * Gives the length of a three-component vector, on the vector unit. The calls
 * in this file link to chararead's copy.
 */
static float vuabs(float *vector) {
    asm {
        lqc2 $vf4, 0x0($4)
        vmul.xyz $vf4, $vf4, $vf4
        vmr32.xy $vf5, $vf4
        vmr32.x $vf6, $vf5
        vadd.x $vf7, $vf4, $vf5
        vadd.x $vf5, $vf6, $vf7
        vsqrt $Q, $vf5x
        vwaitq
        cfc2.ni $2, $vi22
        mtc1 $2, $f0
    }
}

/**
 * Advances the cloth simulation, pushing its vertices out of the exclusion boxes.
 *
 * @mangled Step__6CClothFi
 * @address 0x13B8A0
 * @size 0xBCC
 */

void CCloth::Step(int step) {
    float *velocity;
    int i;
    float *hit;
    int j;
    int pass;
    float *scratchpad;
    int reset;
    sceVu0FVECTOR(*work)[16];
    float ground;
    float *position;

    sceVu0FVECTOR root;
    sceVu0FVECTOR delta;
    sceVu0FMATRIX matrix;
    sceVu0FVECTOR scratch;
    sceVu0FVECTOR *params;

    if (step < 0) {
        Clear();
        return;
    }
    reset = 0;
    ground = floor_y;
    scratchpad = (float *) 0x70000000;
    work = (sceVu0FVECTOR(*)[16]) scratchpad;
    for (i = 0; i < num_i; i++) {
        for (j = 0; j < num_j; j++) {
            *(u_long128 *) work[i][j] = *(u_long128 *) point[i][j];
        }
    }
    scratchpad += sizeof(point) / sizeof(float);
    if (frame != NULL) {
        frame->GetLWMatrix(matrix);
        sceVu0ApplyMatrix(root, matrix, this->position);
        sceVu0SubVector(delta, root, last_position);
        if (vuabs(delta) > 10.0f || stop != 0) {
            reset = 1;
        } else {
            delta[0] *= follow[0];
            delta[1] *= follow[1];
            delta[2] *= follow[2];
        }
        last_position[0] = root[0];
        last_position[1] = root[1];
        last_position[2] = root[2];
    }
    {
        register float *k;
        register float *m;

        m = &matrix[0][0];
        k = stiffness;

        asm {
            lqc2 $vf1, 0x0(m)
            lqc2 $vf2, 0x10(m)
            lqc2 $vf3, 0x20(m)
            lqc2 $vf4, 0x30(m)
            lqc2 $vf5, 0x0(k)
        }
    }

    for (j = 0; j < num_j; j++) {
        for (i = 0; i < num_i; i++) {
            position = work[i][j];
            velocity = speed[i][j];
            if (reset != 0) {
                position[0] += delta[0];
                position[1] += delta[1];
                position[2] += delta[2];
            } else if (frame != NULL) {
                register float *offset;
                register float *source;
                register float *target;
                register float *vel;
                register float *pos;

                pos = position;
                vel = velocity;
                target = world_home[i][j];
                source = home[i][j];
                offset = delta;

                asm {
                    lqc2 $vf13, 0x0(source)
                    lqc2 $vf10, 0x0(pos)
                    lqc2 $vf11, 0x0(vel)
                    lqc2 $vf12, 0x0(offset)
                    vmulax.xyzw $ACC, $vf1, $vf13x
                    vmadday.xyzw $ACC, $vf2, $vf13y
                    vmaddaz.xyzw $ACC, $vf3, $vf13z
                    vmaddw.xyzw $vf23, $vf4, $vf13w
                    vaddx.w $vf10, $vf0, $vf0x
                    vaddx.w $vf11, $vf0, $vf0x
                    sqc2 $vf23, 0x0(target)
                    vsub.xyzw $vf20, $vf23, $vf10
                    vmulaw.xyzw $ACC, $vf12, $vf0w
                    vmadd.xyzw $vf26, $vf20, $vf5
                    vmulaw.xyzw $ACC, $vf10, $vf0w
                    vmaddaw.xyzw $ACC, $vf11, $vf0w
                    vmaddw.xyz $vf10, $vf26, $vf0w
                    vmulax.xyzw $ACC, $vf0, $vf0x
                    vmsubw.xyz $vf11, $vf26, $vf0w
                    sqc2 $vf10, 0x0(pos)
                    sqc2 $vf11, 0x0(vel)
                }
            } else {
                position[0] += velocity[0];
                position[1] += velocity[1];
                position[2] += velocity[2];
            }
        }
    }

    sceVu0FVECTOR origin = {0.0f, 0.0f, 0.0f, 1.0f};
    params = (sceVu0FVECTOR *) scratchpad;
    scratchpad += num_j * sizeof(sceVu0FVECTOR) / sizeof(float);
    hit = scratchpad;
    scratch[1] = 0.5f;
    scratch[2] = 0.5f;
    for (j = 0; j < num_j - 1; j++) {
        params[j][1] = 0.3f + 0.2f * ((float) j / (float) num_j);
        params[j][2] = 1.0f - params[j][1];
    }
    for (pass = 0; pass < 4 && reset == 0; pass++) {
        for (j = 0; j < num_j - 1; j++) {
            for (i = 0; i < num_i; i++) {
                if (i > 1) {
                    scratch[0] = 2.0f * rest[i][j][0];
                    StretchBind2(work[i][j], work[i - 2][j], scratch);
                } else {
                    scratch[0] = 0.0f;
                }
                params[j][0] = rest[i][j][1];
                StretchBind2(work[i][j], work[i][j + 1], params[j]);
            }
        }
        for (j = 0; j < num_i; j++) {
            if (frame == NULL) {
                sceVu0CopyVector(work[j][0], home[j][0]);
            } else {
                *(u_long128 *) work[j][0] = *(u_long128 *) world_home[j][0];
            }
        }
    }

    if (bound != NULL) {
        bound->UpDate();
    }
    for (j = 1; j < num_j; j++) {
        for (i = 0; i < num_i; i++) {
            CBound *box = bound;
            int touched = 0;
            float hits = 0.0f;
            sceVu0FVECTOR hit_sum;
            hit_sum[2] = 0.0f;
            hit_sum[1] = 0.0f;
            hit_sum[0] = 0.0f;
            float friction = 0.0f;
            for (; box != NULL; box = box->next) {
                if ((mask[i][j] & (1 << box->mask_bit)) && box->InCheck(work[i][j], hit) != 0) {
                    hits += 1.0f;
                    sceVu0AddVector(hit_sum, hit_sum, hit);
                    friction += box->friction;
                    touched = 1;
                }
            }
            if (touched) {
                work[i][j][0] = hit_sum[0] / hits;
                work[i][j][1] = hit_sum[1] / hits;
                work[i][j][2] = hit_sum[2] / hits;
                rest[i][j][3] = friction / hits;
            } else {
                rest[i][j][3] = -1.0f;
            }
        }
    }

    sceVu0FVECTOR wind_force = {0.0f, 0.0f, 0.0f, 0.0f};
    for (i = 0; i < num_i; i++) {
        if (wind != NULL) {
            ((CWind *) wind)->GetWindNoise(wind_force);
            sceVu0ScaleVector(wind_force, wind_force, wind_effect);
        }
        for (j = 0; j < num_j; j++) {
            speed[i][j][0] += gravity[0] + (work[i][j][0] - last[i][j][0]);
            speed[i][j][1] += gravity[1] + (work[i][j][1] - last[i][j][1]);
            speed[i][j][2] += gravity[2] + (work[i][j][2] - last[i][j][2]);
            sceVu0CopyVector(last[i][j], work[i][j]);
            sceVu0Normalize(scratch, speed[i][j]);
            float facing = sceVu0InnerProduct(scratch, normal_grid[i][j]);
            if (facing < 0.0f) {
                facing *= -1.0f;
            }
            float damping = 0.6f + (1.0f - facing);
            if (damping > 1.0f) {
                damping = 1.0f;
            }
            speed[i][j][0] += facing * wind_force[0];
            speed[i][j][1] += facing * wind_force[1];
            speed[i][j][2] += facing * wind_force[2];
            speed[i][j][0] *= damping;
            speed[i][j][1] *= damping;
            speed[i][j][2] *= damping;
            if (reset != 0) {
                speed[i][j][0] = 0.0f;
                speed[i][j][1] = 0.0f;
                speed[i][j][2] = 0.0f;
            } else {
                if (rest[i][j][3] > 0.0f) {
                    speed[i][j][0] *= rest[i][j][3];
                    speed[i][j][1] *= rest[i][j][3];
                    speed[i][j][2] *= rest[i][j][3];
                }
                if (work[i][j][1] <= ground && floor_on != 0) {
                    work[i][j][1] = ground;
                    speed[i][j][0] *= 0.4f;
                    speed[i][j][2] *= 0.4f;
                }
            }
        }
    }

    sceVu0FVECTOR edge[4];
    sceVu0FVECTOR normal;
    sceVu0FVECTOR cross[4];
    normal[3] = 0.0f;
    normal[2] = 0.0f;
    normal[1] = 0.0f;
    normal[0] = 0.0f;
    for (j = 0; j < num_j; j++) {
        for (i = 0; i < num_i; i++) {
            int next_i;
            int prev_j;
            int next_j;
            int prev_i;

            next_i = i + 1;
            prev_i = i - 1;
            prev_j = j - 1;
            next_j = j + 1;
            if (prev_i < 0) {
                prev_i = 0;
            }
            if (prev_j < 0) {
                prev_j = 0;
            }
            if (next_i >= num_i) {
                next_i = num_i - 1;
            }
            if (next_j >= num_j) {
                next_j = num_j - 1;
            }
            sceVu0SubVector(edge[0], work[next_i][j], work[i][j]);
            sceVu0SubVector(edge[1], work[prev_i][j], work[i][j]);
            sceVu0SubVector(edge[2], work[i][prev_j], work[i][j]);
            sceVu0SubVector(edge[3], work[i][next_j], work[i][j]);
            sceVu0OuterProduct(cross[0], edge[3], edge[0]);
            sceVu0OuterProduct(cross[1], edge[1], edge[3]);
            sceVu0OuterProduct(cross[2], edge[2], edge[1]);
            sceVu0OuterProduct(cross[3], edge[0], edge[2]);
            sceVu0AddVector(normal, cross[0], cross[1]);
            sceVu0AddVector(normal, normal, cross[2]);
            sceVu0AddVector(normal, normal, cross[3]);
            sceVu0ScaleVector(normal, normal, normal_scale);
            sceVu0Normalize(normal_grid[i][j], normal);
        }
    }
    for (i = 0; i < num_i; i++) {
        for (j = 0; j < num_j; j++) {
            *(u_long128 *) point[i][j] = *(u_long128 *) work[i][j];
        }
    }
}
/**
 * Draws the cloth through the vector unit.
 *
 * @mangled DrawVu1__6CClothFPUiPA4_fP10RenderInfo11VU1_PROGRAMP1ii
 * @address 0x13C470
 * @size 0xC0
 */
int CCloth::DrawVu1(u_int *packet, float (*matrix)[4], RenderInfo *info, VU1_PROGRAM program,
                    u_long128 *draw_state, int arg1, int arg2) {
    CreateVUData(vu_block[DBuffID]);
    visual_vu_data = vu_block[DBuffID];
    return CVisualVu1::DrawVu1(packet, matrix, info, program, draw_state, arg2, 0);
}
/**
 * Draws the cloth into a VIF packet.
 *
 * @mangled DrawVu1__6CClothFP13sceVif1PacketPA4_fP10RenderInfo11VU1_PROGRAMP1ii
 * @address 0x13C530
 * @size 0xC0
 */
int CCloth::DrawVu1(sceVif1Packet *packet, float (*matrix)[4], RenderInfo *info,
                    VU1_PROGRAM program, u_long128 *draw_state, int arg1, int arg2) {
    CreateVUData(vu_block[DBuffID]);
    visual_vu_data = vu_block[DBuffID];
    return CVisualVu1::DrawVu1(packet, matrix, info, program, draw_state, arg2, 0);
}
/**
 * Builds the packet that draws the cloth and gives back its size.
 *
 * @mangled CreateVUData__6CClothFPUi
 * @address 0x13C5F0
 * @size 0x3B8
 */
#ifdef NON_MATCHING
int SetMaterial(u_int *packet, MDT_MATERIAL *material);
int SetTEX0(u_int *packet, u_long tex0, u_long tex1);

int CCloth::CreateVUData(u_int *packet) {
    u_int end_tag[4] = {0, 0, 0, 0x60000000};
    u_int first_kick[4] = {0, 0, 0, 0x14000000};
    u_int kick[4] = {0, 0, 0, 0x14000001};
    u_int unpack[4] = {0, 0, 0, 0x6C008000};
    u_int zero[4] = {0, 0, 0, 0};
    MDT_MATERIAL cloth_material;
    int kicked = 0;
    int word;

    *(u_long128 *) cloth_material.unk_00 = *(u_long128 *) zero;
    cloth_material.unk_10[0] = 0.3f;
    cloth_material.unk_10[1] = 0.3f;
    cloth_material.unk_10[2] = 0.3f;
    cloth_material.unk_10[3] = 0.0f;
    *(u_long128 *) cloth_material.unk_20 = *(u_long128 *) zero;
    word = SetMaterial(packet, &cloth_material);
    CTexture *texture = TexManager.GetTexture(material.texture, -1);
    if (texture != NULL) {
        word += SetTEX0(&packet[word], texture->tex0, texture->tex1);
    } else {
        word += SetTEX0(&packet[word], 0, 0);
    }
    for (int i = 0; i < num_i - 1; i++) {
        int columns = num_j;
        int count = columns * 2;
        int header = word;
        *(u_long128 *) &packet[word] = *(u_long128 *) unpack;
        packet[word + 4] = count | 0x8000;
        packet[word + 5] = 0x302E4000;
        packet[word + 6] = 0x412;
        packet[word + 7] = 0;
        packet[word + 8] = count;
        packet[word + 9] = 4;
        packet[word + 10] = 0;
        packet[word + 11] = 0;
        word += 12;
        u_long128 *vertex = (u_long128 *) &packet[word];
        u_long128 *normal = vertex + count;
        u_long128 *uv = normal + count;
        // A divided row is drawn from the far side, so the strip winds the other way.
        int near_row = polygon_divide[i] != 0 ? i + 1 : i;
        int far_row = polygon_divide[i] != 0 ? i : i + 1;
        for (int j = 0; j < count >> 1; j++) {
            *vertex++ = *(u_long128 *) point[near_row][j];
            *normal++ = *(u_long128 *) normal_grid[near_row][j];
            *uv++ = *(u_long128 *) texture_coord[near_row][j];
            *vertex++ = *(u_long128 *) point[far_row][j];
            *normal++ = *(u_long128 *) normal_grid[far_row][j];
            *uv++ = *(u_long128 *) texture_coord[far_row][j];
        }
        word += columns * 6 * 4;
        packet[header + 3] |= (columns * 6 + 2) << 16;
        if (kicked == 0) {
            *(u_long128 *) &packet[word] = *(u_long128 *) first_kick;
            kicked = 1;
        } else {
            *(u_long128 *) &packet[word] = *(u_long128 *) kick;
        }
        word += 4;
    }
    *(u_long128 *) &packet[word] = *(u_long128 *) end_tag;
    return (word + 4) / 4 + ((word + 4) % 4 != 0);
}
#else
INCLUDE_ASM("asm/nonmatchings/cloth", CreateVUData__6CClothFPUi);
#endif
/**
 * Gives the cloth its default grid size, stiffness and gravity.
 *
 * @mangled InitParam__6CClothFv
 * @address 0x13C9B0
 * @size 0x1C0
 */
void CCloth::InitParam() {
    float side_follow = 0.9f;
    num_i = 16;
    num_j = 16;
    pitch = 1.0f;
    unk_20 = 0;
    vu_block[1] = NULL;
    vu_block[0] = NULL;
    frame = NULL;
    unk_30 = 0;
    unk_00 = 0;
    wind = NULL;
    wind_effect = 1.0f;
    floor_y = 0.0f;
    last_position[0] = 0.0f;
    last_position[1] = 0.0f;
    last_position[2] = 0.0f;
    stiffness[0] = 0.1f;
    stiffness[1] = 0.1f;
    stiffness[2] = 0.1f;
    follow[0] = side_follow;
    follow[1] = 0.4f;
    follow[2] = side_follow;
    gravity[0] = 0.0f;
    gravity[1] = -0.1f;
    gravity[2] = 0.0f;
    normal_scale = 1.0f;
    stop = 0;
    floor_on = 1;
    sceVu0FVECTOR zero = {0.0f, 0.0f, 0.0f, 0.0f};
    for (int i = 0; i < num_i; i++) {
        for (int j = 0; j < num_j; j++) {
            mask[i][j] = 0xFFFF;
            sceVu0CopyVector(home[i][j], zero);
            sceVu0CopyVector(point[i][j], zero);
            sceVu0CopyVector(last[i][j], zero);
            sceVu0CopyVector(rest[i][j], zero);
            sceVu0CopyVector(speed[i][j], zero);
            sceVu0CopyVector(normal_grid[i][j], zero);
            sceVu0CopyVector(texture_coord[i][j], zero);
        }
    }
    bound = NULL;
    material.texture[0] = 0;
}

/**
 * Constructs a cloth grid with the requested dimensions and spacing.
 */
CCloth::CCloth(int grid_i, int grid_j, float grid_pitch) {
    InitParam();
    num_i = grid_i;
    num_j = grid_j;
    pitch = grid_pitch;
}

/**
 * Takes the cloth's vertex storage out of an arena.
 *
 * @mangled Initialize__6CClothFP14CDataAlloc2_1_
 * @address 0x13CBF0
 * @size 0x458
 */
void CCloth::Initialize(CDataAlloc2<1> *alloc) {
    int i;
    int j;

    if (alloc == NULL) {
        alloc = &VisualData;
    }
    alloc->Align64();
    vu_block[0] = (u_int *) (alloc->base + alloc->used * 16);
    visual_vu_size = CreateVUData(vu_block[0]);
    alloc->Alloc(visual_vu_size);
    vu_block[1] = (u_int *) alloc->Alloc64(visual_vu_size);
    visual_vu_size = CreateVUData(vu_block[1]);
    for (i = 0; i < num_i; i++) {
        polygon_divide[i] = 0;
        for (j = 0; j < num_j; j++) {
            sceVu0FVECTOR zero = {0.0f, 0.0f, 0.0f, 0.0f};
            sceVu0CopyVector(last[j][i], zero);
            sceVu0CopyVector(speed[j][i], zero);
            sceVu0CopyVector(normal_grid[j][i], zero);
            sceVu0CopyVector(rest[j][i], zero);
            point[j][i][3] = 1.0f;
            last[j][i][3] = 1.0f;
        }
    }
    for (i = 0; i < num_j; i++) {
        for (j = 0; j < num_i; j++) {
            sceVu0CopyVector(last[j][i], point[j][i]);
            sceVu0CopyVector(home[j][i], point[j][i]);
        }
    }
    sceVu0FVECTOR centre = {0.0f, 0.0f, 0.0f, 0.0f};
    for (i = 0; i < num_i; i++) {
        sceVu0AddVector(centre, centre, home[0][i]);
    }
    position[0] = centre[0] / (float) num_i;
    position[1] = centre[1] / (float) num_i;
    position[2] = centre[2] / (float) num_i;
    position[3] = 1.0f;

    // Record each vertex's rest distance to its neighbours down and across the grid.
    sceVu0FVECTOR edge;
    for (i = 0; i < num_j; i++) {
        for (j = 0; j < num_i; j++) {
            int next_j = j + 1;
            int prev_j = j - 1;
            int prev_i = i - 1;
            int next_i = i + 1;
            if (prev_j > 0) {
                sceVu0SubVector(edge, point[j][i], point[prev_j][i]);
            } else if (next_j >= num_i) {
                sceVu0SubVector(edge, point[j][i], point[prev_j][i]);
            } else {
                sceVu0SubVector(edge, point[j][i], point[next_j][i]);
            }
            rest[j][i][0] = vuabs(edge);
            if (next_i >= num_j) {
                sceVu0SubVector(edge, point[j][i], point[j][prev_i]);
            } else if (prev_i < 0) {
                sceVu0SubVector(edge, point[j][i], point[j][next_i]);
            } else {
                sceVu0SubVector(edge, point[j][i], point[j][next_i]);
            }
            rest[j][i][1] = vuabs(edge);
        }
    }
}
/**
 * Builds the cloth's grid from a model's mesh and takes its storage out of an arena.
 *
 * @mangled Initialize__6CClothFP10MDT_HEADERP14CDataAlloc2_1_
 * @address 0x13D050
 * @size 0x200
 */
void CCloth::Initialize(MDT_HEADER *header, CDataAlloc2<1> *alloc) {
    int *strip;

    if (header == NULL) {
        return;
    }
    sceVu0FVECTOR *vertices = (sceVu0FVECTOR *) ((u_char *) header + header->vertex_ofs);
    sceVu0FVECTOR *uvs = (sceVu0FVECTOR *) ((u_char *) header + header->unk_2c[1]);
    MDT_MATERIAL *materials = (MDT_MATERIAL *) ((u_char *) header + header->info_ofs);
    int *mesh = (int *) ((u_char *) header + header->mesh_ofs);
    strip = mesh + 4;
    int *strips = strip;
    int strip_count = mesh[2];
    int found = 0;

    for (int i = 0; i < num_i; i++) {
        for (int j = 0; j < num_j; j++) {
            int vertex_no = j + i * num_j;
            sceVu0CopyVector(point[i][j], vertices[vertex_no]);
            strip = strips;
            for (int s = 0; s < strip_count; s++) {
                int count = strip[1];
                memcpy(&material, &materials[strip[2]], sizeof(MDT_MATERIAL));
                strip += 3;
                int *index = strip;
                for (int k = 0; k < count; k++) {
                    if (index[0] == vertex_no) {
                        found++;
                        sceVu0CopyVector(texture_coord[i][j], uvs[index[2]]);
                    }
                    index += 3;
                }
                strip += count * 3;
            }
        }
    }
    Initialize(alloc);
}
