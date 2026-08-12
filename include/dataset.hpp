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
 * Gives a frame the attributes that it draws with.
 *
 * @mangled SetFrameAttr__FP6CFramei
 * @address 0x125EF0
 * @size 0x3C0
 * @unknownret
 */
void SetFrameAttr(CFrame *frame, int attr);
