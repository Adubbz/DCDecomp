#pragma once

#include "common.h"

/**
 * Returns the image number for the current manual page and part.
 *
 * @mangled GetNowManualPartTgaNum__Fv
 * @address 0x00233520
 * @size 0x38
 */
s8 GetNowManualPartTgaNum();

/**
 * Returns the game flag associated with the current manual page.
 *
 * @mangled GetGameFlagForManualMenu__Fv
 * @address 0x00233560
 * @size 0x64
 */
int GetGameFlagForManualMenu();

/**
 * Begins loading the image resources for the current manual page.
 *
 * @mangled ManualImgLoad__Fv
 * @address 0x002335D0
 * @size 0x1A8
 */
s16 ManualImgLoad();

/**
 * Installs a completed manual image load into the menu texture state.
 *
 * @mangled ManualImgEnter__Fv
 * @address 0x00233780
 * @size 0x308
 */
s16 ManualImgEnter();

/**
 * Draws the previous-page and next-page cursors for the manual.
 *
 * @mangled DrawPrevNextCursor__Fv
 * @address 0x00233A90
 * @size 0x14C
 */
void DrawPrevNextCursor();

/**
 * Draws the explanatory message for the current manual page.
 *
 * @mangled DrawManualMsg__Fv
 * @address 0x00233BE0
 * @size 0x1EC
 */
void DrawManualMsg();

/**
 * Initializes the manual menu from its placement data and load buffer.
 *
 * @mangled InitMenuManual__FPiP1
 * @address 0x00233DD0
 * @size 0x130
 */
void InitMenuManual(int *result, void *load_buffer);

/**
 * Builds the message buffer for the current manual entry.
 *
 * @mangled SetManualMsgBuffer__Fv
 * @address 0x00233F00
 * @size 0x588
 */
s16 SetManualMsgBuffer();

/**
 * Releases manual-menu state and restores the surrounding menu.
 *
 * @mangled ExitManualMenu__Fv
 * @address 0x00234490
 * @size 0x88
 */
void ExitManualMenu();

/**
 * Returns the manual menu's current mode.
 *
 * @mangled GetNowManualMenuMode__Fv
 * @address 0x00234520
 * @size 0x10
 */
s16 GetNowManualMenuMode();

/**
 * Processes manual-menu input and page transitions.
 *
 * @mangled MenuManualKey__Fv
 * @address 0x00234530
 * @size 0x798
 * @unknownret
 */
void MenuManualKey();

/**
 * Draws the current manual page and its controls.
 *
 * @mangled MenuManualDraw__Fv
 * @address 0x00234CD0
 * @size 0x304
 */
void MenuManualDraw();
