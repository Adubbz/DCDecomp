#pragma once

#include "common.h"

/**
 * @file
 * Declares the attributes that a frame draws with.
 */

/**
 * Carries the attributes that one frame draws with.
 */
class CFrameAttr {
public:
    u8 unk_00[12];
    u8 unk_0C;
    u8 unk_0D[83];

    /**
     * @mangled Initialize__10CFrameAttrFv
     * @address 0x127CC0
     * @size 0x80
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled __ct__10CFrameAttrFv
     * @address 0x127D40
     * @size 0x30
     */
    CFrameAttr(void);
};

STATIC_ASSERT(sizeof(CFrameAttr) == 0x60);
