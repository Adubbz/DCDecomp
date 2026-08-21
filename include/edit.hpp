#pragma once

#include "common.h"

/**
 * @file
 * Declares what the dungeon needs from the Georama editor: the fade the
 * editor is part way through, which the dungeon carries on with.
 */

/**
 * Reads the colour the screen is faded to.
 *
 * @mangled EdGetFadeColor__FPf
 * @address 0x189820
 * @size 0x40
 * @unknownret
 */
void EdGetFadeColor(float *colour);
