#pragma once

#include "common.h"

/**
 * @file
 * Declares the vector that the game passes by value.
 */

/**
 * Names a point or a direction in the world by three parts. A fourth part
 * follows them, so that the vector copies as one quadword.
 *
 * `CVector3_f_` is the disassembler's filesystem-safe spelling of the retail
 * name; it is what every mangled symbol in this project carries.
 */
class CVector3_f_ {
public:
    CVector3_f_() {}

    CVector3_f_(float x_, float y_, float z_) : x(x_), y(y_), z(z_) {}

    float x; /**< Part of the vector along the first axis. */
    float y; /**< Part of the vector along the second axis. */
    float z; /**< Part of the vector along the third axis. */
    float w;
} __attribute__((aligned(16)));

STATIC_ASSERT(sizeof(CVector3_f_) == 0x10);
