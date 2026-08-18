#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;
struct sceVif1Packet;

/**
 * Carries what the renderer draws one frame with. Only the matrix that
 * `MGDraw` and its callers reach is named; the rest is not established.
 */
struct RenderInfo {
    u8 unk_000[16];
    float world_to_eye[4][4]; /**< Matrix that puts the world in front of the eye. */
    u8 unk_050[768];
};

STATIC_ASSERT(sizeof(RenderInfo) == 0x350);

/**
 * What the renderer draws the current frame with.
 *
 * @address 0x1C75520
 * @size 0x350
 */
extern "C" RenderInfo mgRenderInfo;

/**
 * @file
 * Declares the graphics library that the game draws every model through.
 */

extern s32 DmaCH8;
extern sceVif1Packet *Vif1Packet;
/* Retail has two distinct `VSyncField` symbols (0x2A23C8 GLOBAL -- this one
 * -- and 0x2A25DC LOCAL, in a still-raw TU); the `__2` suffix is the
 * disassembly dump's disambiguation, kept here to avoid a link collision. */
extern s32 VSyncField__2;
extern s32 mgTEX1Env[2];
extern s32 mgClearBackFlag;

/**
 * Reads the colour that lights every face of a model.
 *
 * @mangled MGGetAmbient__FPf
 * @address 0x12DD30
 * @size 0x30
 * @unknownret
 */
void MGGetAmbient(float *ambient);

/**
 * Sets the colour that lights every face of a model.
 *
 * @mangled MGSetAmbient__FPf
 * @address 0x12DD00
 * @size 0x30
 * @unknownret
 */
void MGSetAmbient(float *ambient);

/**
 * Sets the direction and the colour of each of the four point lights.
 *
 * @mangled MGSetPLight__FPA4_fPA4_f
 * @address 0x12DC20
 * @size 0x90
 * @unknownret
 */
void MGSetPLight(float (*direction)[4], float (*colour)[4]);

/**
 * Reads the direction and the colour of each of the four point lights.
 *
 * @mangled MGGetPLight__FPA4_fPA4_f
 * @address 0x12DCB0
 * @size 0x48
 * @unknownret
 */
void MGGetPLight(float (*direction)[4], float (*colour)[4]);

/**
 * Turns one world position into a screen position.
 *
 * @mangled MGRotTransPers__FPiPfi
 * @address 0x12E290
 * @size 0x250
 */
int MGRotTransPers(int *screen, float *world, int mode);

/**
 * Turns one world position into the two screen corners of a sprite that faces
 * the eye, and gives back 1 while the sprite is on the screen.
 *
 * @mangled MGRotTransPers3DSprite__FPiPiPfffi
 * @address 0x12E740
 * @size 0x250
 */
int MGRotTransPers3DSprite(int *top_left, int *bottom_right, float *world, float width,
                           float height, int mode);

/**
 * Draws one model.
 *
 * @mangled MGDraw__FP6CFrame
 * @address 0x12ED80
 * @size 0x70
 * @unknownret
 */
void MGDraw(CFrame *frame);

/**
 * Drops the shadow of one model onto the ground, with fewer faces than
 * `MGDrawShadow` uses.
 *
 * @mangled MGDrawShadowFast__FP6CFramePfPf
 * @address 0x1303B0
 * @size 0x120
 * @unknownret
 */
void MGDrawShadowFast(CFrame *frame, float *position, float *light);

/**
 * Drops the shadow of one model onto the ground, with fewer faces than
 * `MGDrawShadow` uses.
 *
 * @mangled MGDrawShadowFast2__FP6CFramePfPf
 * @address 0x1304D0
 * @size 0x120
 * @unknownret
 */
void MGDrawShadowFast2(CFrame *frame, float *position, float *light);

/**
 * Drops the shadow of one model onto the ground.
 *
 * @mangled MGDrawShadow__FP6CFramePfPf
 * @address 0x1305F0
 * @size 0x170
 * @unknownret
 */
void MGDrawShadow(CFrame *frame, float *position, float *light);

/**
 * Draws the shade that lies on one model.
 *
 * @mangled MGDrawShade__FP6CFrame
 * @address 0x130760
 * @size 0x138
 * @unknownret
 */
void MGDrawShade(CFrame *frame);
