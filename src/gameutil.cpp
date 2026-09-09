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

INCLUDE_ASM("asm/nonmatchings/gameutil", QuatSlerp__FPfPffPf);
INCLUDE_ASM("asm/nonmatchings/gameutil", MotionProc__FP6CFrameP12MOTION_STATEP8Mot_List);
INCLUDE_ASM("asm/nonmatchings/gameutil", MotionProc2__FP6CFrameP14tagMOTION_TYPEP12tagFRAME_INFP8Mot_List);
INCLUDE_ASM("asm/nonmatchings/gameutil", SetMotionEX__FP6CFrameP14tagMOTION_TYPEP11MOTION_INFOP12MOTION_STATEP12tagFRAME_INF);
INCLUDE_ASM("asm/nonmatchings/gameutil", CreateAnimeDataEX__FP14tagMOTION_TYPEP14CDataAlloc2_1_P16MOTION_FILE_INFO);
INCLUDE_ASM("asm/nonmatchings/gameutil", AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_PP12tagFRAME_INF);
INCLUDE_ASM("asm/nonmatchings/gameutil", AnimeDataInit__FP6CFrameP14tagMOTION_TYPEP14CDataAlloc2_1_P12tagFRAME_INF);
INCLUDE_ASM("asm/nonmatchings/gameutil", NextMotionTime_GET_EX__FP11MOTION_INFOP12MOTION_STATE);

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

INCLUDE_ASM("asm/nonmatchings/gameutil", PickUpNearPoly__FP6CCPoly7CBoxVu0P6CCPolyi);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckHit__FP6CCPolyiPfPfPfii);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckHitVertical__FP6CCPolyiPffPfi);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckHits__FP6CCPolyiPfPfiPiPA4_fii);
INCLUDE_ASM("asm/nonmatchings/gameutil", MoveCheck__FPfPfPfP13MoveCheckInfoP6CCPolyii);
INCLUDE_ASM("asm/nonmatchings/gameutil", GetFootPoly__FPffP6CCPolyPfP6CCPolyii);
INCLUDE_ASM("asm/nonmatchings/gameutil", GetEventPoly__FPfPfP6CCPolyPiPfP6CCPolyii);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckWidth__FP6CCPolyiPffPfi);
INCLUDE_ASM("asm/nonmatchings/gameutil", CheckCameraWidth__FP6CCPolyiPffPfi);
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
INCLUDE_ASM("asm/nonmatchings/gameutil", AreaAddPos__FPiPiPi);
INCLUDE_ASM("asm/nonmatchings/gameutil", RollPos__FPfPffPf);

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
INCLUDE_ASM("asm/nonmatchings/gameutil", GetDisPosToRect__FP4RECTii);
INCLUDE_ASM("asm/nonmatchings/gameutil", GetScrPosFromChar__FP10CCharacterPi);
INCLUDE_ASM("asm/nonmatchings/gameutil", Color2Clut__FUi);
INCLUDE_ASM("asm/nonmatchings/gameutil", NameRegistCodeJtoE__Fi);
