#pragma once

#include "common.h"

/**
 * Checks a moving point against the dungeon collision geometry.
 *
 * @mangled checkCollision__FPfPfPfif
 * @address 0x1AB740
 * @size 0x3B4
 */
s32 checkCollision(float *result, float *position, float *movement, s32 mode,
                   float radius);

/**
 * Draws one cell of a model as a camera-facing sprite.
 *
 * @mangled set3DCellModel__FPfPcfiiiiUc
 * @address 0x1ABB00
 * @size 0x134
 */
void set3DCellModel(float *position, char *name, float scale, s32 cell,
                    s32 alpha, s32 width, s32 height, u8 blend);
