#pragma once

#include "common.h"

/**
 * @file
 * Declares the language-selection screen the game shows before the title.
 */

/**
 * Builds the arenas, textures and pad settings the language screen runs on.
 *
 * @mangled LangsetInit__Fv
 * @address 0x244B30
 * @size 0x140
 */
void LangsetInit(void);

/**
 * Runs one frame of the language screen and reports that a language has been
 * chosen and faded out.
 *
 * @mangled LangsetLoop__Fv
 * @address 0x244C70
 * @size 0xE4
 */
int LangsetLoop(void);

/**
 * Moves the language cursor with the pad and reports that the choice was
 * confirmed.
 *
 * @mangled LangsetProc__Fv
 * @address 0x244D60
 * @size 0xD8
 */
int LangsetProc(void);

/**
 * Draws the language plate and its five entries, brightening the selected one.
 *
 * @mangled LangsetDraw__Fv
 * @address 0x244E40
 * @size 0x3A8
 */
void LangsetDraw(void);
