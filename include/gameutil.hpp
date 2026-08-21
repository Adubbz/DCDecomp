#pragma once

#include "common.h"

class CCPoly;

/**
 * @file
 * Declares the motion data that a character plays, and the calls that step it.
 */

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;
class CFrame;

/**
 * Describes one motion of a model: the range of frames it covers and how fast
 * it plays.
 */
struct MOTION_INFO {
    s32 start; /**< First frame of the motion. */
    s32 end;   /**< Frame after the last one of the motion. */
    float speed; /**< Frames that the motion plays each step. */
    s32 unk_0C;
};

STATIC_ASSERT(sizeof(MOTION_INFO) == 0x10);

/**
 * Records how far one model has played through the motion it holds.
 */
struct MOTION_STATE {
    float time; /**< Frame that the motion stands on. */
    float unk_04;
    float unk_08;
    s32 unk_0C;
    s32 unk_10;
    s32 motion_no;      /**< Motion that the character asks for. */
    s32 playing_no;     /**< Motion that plays now. */
    s32 unk_1C;
};

STATIC_ASSERT(sizeof(MOTION_STATE) == 0x20);

/**
 * Describes the frames of one model that a motion drives.
 */
struct tagFRAME_INF {
    u8 unk_00[4];
};

/**
 * Carries one set of motions, the state that plays them and the frames that
 * they drive.
 */
struct tagMOTION_TYPE {
    u8 unk_00[16];
    MOTION_STATE state; /**< How far the set has played. */
    CCamera *camera;    /**< Camera that the motion moves; zero where it moves none. */
    s32 unk_34;
    CFrame *unk_38;
    u8 unk_3C[4];
    sceVu0FVECTOR unk_40;
    s32 unk_50;
    u8 unk_54[12];
    tagFRAME_INF *frame_info; /**< Frames that the motions drive. */
    MOTION_INFO *motion_info; /**< One entry per motion of the set. */
    s32 unk_68;
    s32 unk_6C;
    s32 unk_70;
    s32 unk_74;
    s32 unk_78;
    s32 unk_7C;
} __attribute__((aligned(16)));

STATIC_ASSERT(sizeof(tagMOTION_TYPE) == 0x80);

/**
 * Puts a model on the frame that its motion state stands on.
 *
 * @mangled SetMotionEX__FP6CFrameP14tagMOTION_TYPEP11MOTION_INFOP12MOTION_STATEP12tagFRAME_INF
 * @address 0x148D00
 * @size 0x390
 * @unknownret
 */
void SetMotionEX(CFrame *frame, tagMOTION_TYPE *motion, MOTION_INFO *info, MOTION_STATE *state,
                 tagFRAME_INF *frame_info);

/**
 * Gets the frame that the motion state moves on to next.
 *
 * @mangled NextMotionTime_GET_EX__FP11MOTION_INFOP12MOTION_STATE
 * @address 0x1496C0
 * @size 0xD0
 * @unknownret
 */
int NextMotionTime_GET_EX(MOTION_INFO *info, MOTION_STATE *state);

/**
 * Finds where a line from one point to another crosses a set of polygons, and
 * gives back how many crossings it found.
 *
 * @mangled CheckHits__FP6CCPolyiPfPfiPiPA4_fii
 * @address 0x14A230
 * @size 0x444
 */
int CheckHits(CCPoly *poly, int count, float *from, float *to, int max, int *hit_poly,
              float (*hit_point)[4], int sort, int mode);

/**
 * Finds the polygon straight below a point, and gives back which one it is.
 *
 * @mangled CheckHitVertical__FP6CCPolyiPffPfi
 * @address 0x14A080
 * @size 0x1A4
 */
int CheckHitVertical(CCPoly *poly, int count, float *from, float depth, float *hit_point,
                     int mode);
