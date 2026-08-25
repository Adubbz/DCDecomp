#pragma once

#include "common.h"

/**
 * Provides the assembly-facing field names for a `CDataAlloc2<1>` object.
 *
 * Older reconstructed units use this assembler-safe class spelling; its layout is identical to
 * the canonical template specialization declared in `dataalloc.hpp`.
 */
class CDataAlloc2_1_ {
public:
    u8 *buffer;  /**< Points to the start of the external allocation buffer. */
    u32 backing; /**< Preserves the allocator's second pointer word. */
    s32 used;    /**< Counts allocated sixteen-byte units. */
    s32 size;    /**< Gives the available sixteen-byte units. */

    void *Alloc(int blocks);
    void *Alloc64(int blocks);
    void Align64(void);
    CDataAlloc2_1_(int blocks);
};
