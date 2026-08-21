#pragma once

#include "common.h"

class CDataAlloc2_1_ {
public:
    u8 *buffer; /**< Specifies the start of the allocation buffer. */
    u32 backing; /**< Provides inline storage when the allocator owns its buffer. */
    s32 used; /**< Specifies the allocated 16-byte block count. */
    s32 size; /**< Specifies the available 16-byte block count. */

    /**
     * @mangled Alloc__14CDataAlloc2_1_Fi
     * @address 0x1278A0
     * @size 0x60
     */
    void *Alloc(int blocks);

    /**
     * @mangled Alloc64__14CDataAlloc2_1_Fi
     * @address 0x127900
     * @size 0x80
     * @unknownret
     */
    void Alloc64(int);

    /**
     * @mangled Align64__14CDataAlloc2_1_Fv
     * @address 0x127980
     * @size 0x80
     * @unknownret
     */
    void Align64(void);

    /**
     * @mangled __ct__14CDataAlloc2_1_Fi
     * @address 0x127B40
     * @size 0x40
     */
    CDataAlloc2_1_(int);
};
