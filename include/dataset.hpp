#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;

/**
 * @file
 * Declares the calls that build a model out of the data that was read.
 */

/**
 * Gives every data buffer back, so the next area starts from an empty one.
 *
 * @mangled BufferAllClear__Fv
 * @address 0x125BC0
 * @size 0x254
 * @unknownret
 */
void BufferAllClear(void);

/**
 * Gives a frame the attributes that it draws with.
 *
 * @mangled SetFrameAttr__FP6CFramei
 * @address 0x125EF0
 * @size 0x3C0
 * @unknownret
 */
void SetFrameAttr(CFrame *frame, int attr);
