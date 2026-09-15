#pragma once

#include "common.h"

/**
 * Returns how many of an item the party is carrying.
 *
 * @mangled GetNumHowManyItemsHave__Fi
 * @address 0x2101D0
 * @size 0x104
 */
int GetNumHowManyItemsHave(int);

/**
 * Loads the edit menu's data and textures and sets up its windows, pad and cursor.
 *
 * @mangled EditMenuInit__FPii
 * @address 0x210AB0
 * @size 0x2E4
 */
void EditMenuInit(int *, int);

/**
 * Runs one frame of the edit menu for its current state and returns the result.
 *
 * @mangled EditMenuLoop__Fv
 * @address 0x210EA0
 * @size 0x110
 */
int EditMenuLoop();

/**
 * Draws the edit menu for its current state.
 *
 * @mangled EditMenuDraw__Fv
 * @address 0x210FB0
 * @size 0x304
 */
void EditMenuDraw();
