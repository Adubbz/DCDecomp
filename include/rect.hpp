#pragma once

#include "common.h"

/**
 * @file
 * Declares the rectangle that the sprite calls take.
 */

/**
 * Names a rectangle by the corner it starts at and how far it reaches.
 *
 * `CRect_i_` is the disassembler's filesystem-safe spelling of the retail
 * name; it is what every mangled symbol in this project carries.
 */
class CRect_i_ {
public:
    s32 x;      /**< Distance of the left edge from the left of the texture. */
    s32 y;      /**< Distance of the top edge from the top of the texture. */
    s32 width;  /**< Distance from the left edge to the right edge. */
    s32 height; /**< Distance from the top edge to the bottom edge. */
};

STATIC_ASSERT(sizeof(CRect_i_) == 0x10);
