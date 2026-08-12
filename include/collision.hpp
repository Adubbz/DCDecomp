#pragma once

#include "common.h"

/**
 * @file
 * Declares the shapes that collision works in.
 */

/**
 * One polygon that something can collide with.
 */
class CCPoly {
public:
    u8 unk_00[80];
};

/**
 * A box, held in the form that the VU0 routines take.
 */
class CBoxVu0 {
public:
    float unk_00[4];
    float unk_10[4];
} __attribute__((aligned(16)));

STATIC_ASSERT(sizeof(CCPoly) == 0x50);
STATIC_ASSERT(sizeof(CBoxVu0) == 0x20);
