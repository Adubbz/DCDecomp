#pragma once

#include "common.h"

#include "collision.hpp"
#include "frame.hpp"
#include "texture.hpp"

class CCharacter;

class CCPoly;
class CBoxVu0;

/**
 * @file
 * Declares the motion data that a character plays, and the calls that step it.
 */

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CCamera;
class CFrame;
class CRect_i_;
class CTexture;
struct RECT;
struct sceVif1Packet;
struct i;

/**
 * Connects the EE client to the EZMIDI RPC server.
 *
 * @mangled ezMidiInit__Fv
 * @address 0x147970
 * @size 0x88
 */
int ezMidiInit(void);

/**
 * Sends one command to the EZMIDI RPC server and returns its response word.
 *
 * @mangled ezMidi__Fii
 * @address 0x147A00
 * @size 0xD4
 */
int ezMidi(int command, int argument);

/**
 * Transfers a buffer from EE memory into IOP memory and waits for completion.
 *
 * @mangled ezTransToIOP__FPvPvi
 * @address 0x147AE0
 * @size 0x90
 */
int ezTransToIOP(void *iop_address, void *ee_address, int size);

/**
 * Turns a model frame gradually towards a world-space target position.
 *
 * @mangled LookAt__FP9CFrameVu1Pf16_FRAMECONSTRAINT
 * @address 0x149910
 * @size 0x2BC
 */
int LookAt(CFrameVu1 *frame, float *target, _FRAMECONSTRAINT constraint);

/**
 * Turns a model frame gradually towards another frame's world position.
 *
 * @mangled LookAt__FP9CFrameVu1P9CFrameVu116_FRAMECONSTRAINT
 * @address 0x149BD0
 * @size 0x54
 */
int LookAt(CFrameVu1 *frame, CFrameVu1 *target, _FRAMECONSTRAINT constraint);

/**
 * Opens a batch of textured two-dimensional sprites in a VIF1 packet.
 *
 * @mangled set2DSprite_Start__FP13sceVif1PacketP8CTexture
 * @address 0x14C220
 * @size 0x19C
 */
void set2DSprite_Start(sceVif1Packet *packet, CTexture *texture);

/**
 * Closes the current two-dimensional sprite batch and fixes its tag lengths.
 *
 * @mangled set2DSprite_End__FP13sceVif1PacketP8CTexture
 * @address 0x14C4F0
 * @size 0xA4
 */
void set2DSprite_End(sceVif1Packet *packet, CTexture *texture);

/**
 * Uploads a texture's 16-by-16 colour lookup table through a VIF1 packet.
 *
 * @mangled SetClut__FP13sceVif1PacketP8CTextureP1i
 * @address 0x14C5A0
 * @size 0x60
 */
void SetClut(sceVif1Packet *packet, CTexture *texture, i *clut);

/**
 * Describes one motion of a model: the range of frames it covers and how fast
 * it plays.
 */
struct MOTION_INFO {
    s32 start;   /**< First frame of the motion. */
    s32 end;     /**< Frame after the last one of the motion. */
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
    s32 motion_no;  /**< Motion that the character asks for. */
    s32 playing_no; /**< Motion that plays now. */
    s32 unk_1C;
};

STATIC_ASSERT(sizeof(MOTION_STATE) == 0x20);

/**
 * Describes the frames of one model that a motion drives.
 */
struct tagFRAME_INF {
    s32 frame;            /**< Frame of the model this entry drives. */
    u8 unk_04[12];
    sceVu0FMATRIX matrix; /**< Transform the driver interpolates into the frame. */
    u8 unk_50[128];
};

STATIC_ASSERT(sizeof(tagFRAME_INF) == 0xD0);

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

/**
 * Works out where a character stands on screen, in pixels.
 *
 * @mangled GetScrPosFromChar__FP10CCharacterPi
 * @address 0x14C980
 * @size 0x88
 * @unknownret
 */
void GetScrPosFromChar(CCharacter *chara, int *out_pos);

/**
 * Maps one character of a registered name from its Japanese code to the
 * external-character code the English font draws it with.
 *
 * @mangled NameRegistCodeJtoE__Fi
 * @address 0x14CA60
 * @size 0xD0
 */
int NameRegistCodeJtoE(int code);

/**
 * Enters one colour into the font palette and gives back the entry it took.
 *
 * @mangled Color2Clut__FUi
 * @address 0x14CA10
 * @size 0x50
 */
unsigned int Color2Clut(unsigned int colour);

/**
 * Turns one point about another by an angle, and writes where it lands.
 *
 * @mangled RollPos__FPfPffPf
 * @address 0x14C690
 * @size 0x1F0
 */
void RollPos(float *centre, float *point, float angle, float *out);

/**
 * Draws one part of a texture into a rectangle of the screen, at one colour.
 *
 * @mangled set2DSprite_Core__FP13sceVif1PacketP8CTextureRC8CRect_i_RC8CRect_i_UcUcUcUc
 * @address 0x14C3C0
 * @size 0x128
 */
void set2DSprite_Core(sceVif1Packet *packet, CTexture *texture, const CRect_i_ &screen,
                      const CRect_i_ &texel, unsigned char r, unsigned char g,
                      unsigned char b, unsigned char a);

/**
 * Tells whether a point lies inside a rectangle.
 *
 * @mangled CheckPosInOutForRect__FP4RECTii
 * @address 0x14C880
 * @size 0x7C
 */
int CheckPosInOutForRect(RECT *rect, int x, int y);

/**
 * Gives back how far a point lies from a rectangle.
 *
 * @mangled GetDisPosToRect__FP4RECTii
 * @address 0x14C900
 * @size 0x80
 */
float GetDisPosToRect(RECT *rect, int x, int y);

/**
 * Gives back the point that lies a fraction of the way from one to another.
 *
 * @mangled LinerInterpolation__Ffff
 * @address 0x14C600
 * @size 0x14
 */
float LinerInterpolation(float from, float to, float at);

/**
 * Widens a rectangle so that it also covers a point.
 *
 * @mangled AreaAddPos__FPiPiPi
 * @address 0x14C620
 * @size 0x70
 * @unknownret
 */
void AreaAddPos(int *area, int *pos, int *out);

/**
 * Records what a step of a character ran into.
 */
struct MoveCheckInfo {
    s32 unk_00; /**< 1 where the step landed on a polygon. */
    u8 unk_04[0x5C];
    s32 unk_60; /**< 1 where the step found ground below it. */
    u8 unk_64[0xC];
    CCPoly poly; /**< Polygon that the step landed on. */
    u8 unk_c0[0x4];
    float ground_height; /**< Height of the ground below the step. */
    u8 unk_c8[0x8];
};

STATIC_ASSERT(sizeof(MoveCheckInfo) == 0xD0);

/**
 * Slides a position along a velocity, against a list of collision polygons.
 *
 * @mangled MoveCheck__FPfPfPfP13MoveCheckInfoP6CCPolyii
 * @address 0x14A680
 * @size 0x530
 * @unknownret
 */
void MoveCheck(float *pos, float *velocity, float *out_pos, MoveCheckInfo *out_info, CCPoly *polys,
               int poly_num, int mode);
