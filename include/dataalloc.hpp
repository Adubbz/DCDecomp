#pragma once

#include "common.h"

class CRunScript {
    public:
        CRunScript();
    private:
        char unk[0x48];
};

STATIC_ASSERT(sizeof(CRunScript) == 0x48);

template <int N, int M>
class CDataAlloc {
    public:
        CDataAlloc();
    private:
        char unk[1];
};

/* Retail (0x143850): zeroes a single word at offset 0x17700 (16 bytes
 * before the end of the 0x17710-byte object -- likely a trailing
 * count/flag field of some kind, not otherwise analyzed) and returns
 * `this`; confirmed byte-for-byte via disassembly. */
template <>
class CDataAlloc<1, 6000> {
    public:
        CDataAlloc();
    private:
        char unk[0x17700];
        s32 unk_17700;
        char pad[0xc];
};

STATIC_ASSERT(sizeof(CDataAlloc<1, 6000>) == 0x17710);

template <int N>
class CDataAlloc2 {
    public:
        CDataAlloc2();
    private:
        char unk[1];
};

/* The `int`-arg constructor (retail 0x127B40) is deliberately NOT declared:
 * ~125 already-reassembled .s files call it under the disassembler's
 * placeholder name `__ct__14CDataAlloc2_1_Fi`, so it must be reached via
 * that `extern "C"` name, never given a second C++ definition. */
template <>
class CDataAlloc2<1> {
    public:
        CDataAlloc2();
    private:
        s32 f0, f4, f8, fc;
};

STATIC_ASSERT(sizeof(CDataAlloc2<1>) == 0x10);

/* The int-arg constructor's already-linked retail definition, under the
 * disassembler's placeholder name. Returns `void *`, not `void`: its retail
 * body leaves `this` in v0 (`paddub $2,$4,$0`), which the no-arg ctor's tail
 * call relies on -- a `void` declaration makes MWCC spill/re-copy `this`. */
extern "C" void *__ct__14CDataAlloc2_1_Fi(void *self, int a1);
