#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;
struct sceVif1Packet;

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
 * Turns one world position into a screen position.
 *
 * @mangled MGRotTransPers__FPiPfi
 * @address 0x12E290
 * @size 0x250
 */
int MGRotTransPers(int *screen, float *world, int mode);

/**
 * Draws one model.
 *
 * @mangled MGDraw__FP6CFrame
 * @address 0x12ED80
 * @size 0x70
 * @unknownret
 */
void MGDraw(CFrame *frame);
