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
    s16 unk_00;
    u8 unk_02[2];
    float unk_04;
    s8 unk_08;
    s8 unk_09;
    s8 unk_0A;
    s8 unk_0B;
    s8 unk_0C;
    s8 unk_0D;
    u8 unk_0E[0x52];

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
