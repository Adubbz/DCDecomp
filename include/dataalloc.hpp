#pragma once

#include "common.h"

#include <cstdio>

/**
 * Constructs an object inside allocator-owned quadword storage.
 */
void *operator new(u_int size, u_long128 *block);
/**
 * Constructs an array inside allocator-owned quadword storage.
 */
void *operator new[](u_int size, u_long128 *block);

/**
 * Allocates sixteen-byte units from an externally supplied buffer.
 */
template <int Kind>
class CDataAlloc2 {
public:
    CDataAlloc2(int limit = -1);

    u_char *Alloc(int quads);
    u_char *Alloc64(int quads);
    void Align64();

    /** Hands the whole arena back, without touching what is in it. */
    void Reset() { used = 0; }

    u_char *base;   /**< Start of the allocator-owned storage. */
    u_char *buffer; /**< Current allocation cursor. */
    int used;       /**< Number of occupied quadwords. */
    int limit;      /**< Maximum number of available quadwords. */
};

/**
 * Allocates sixteen-byte units from storage embedded in the allocator.
 */
template <int Kind, int Size>
class CDataAlloc {
public:
    CDataAlloc() { used = 0; }

    u_char *Alloc(int quads);
    u_char *Alloc64(int quads);
    void Align64();

    u_long128 block[Size]; /**< Embedded allocation storage. */
    int used;              /**< Number of occupied quadwords. */
};

template <>
class CDataAlloc2<1> {
public:
    CDataAlloc2();
    CDataAlloc2(int limit);

    u_char *Alloc(int quads);
    u_char *Alloc64(int quads);
    void Align64();

    /** Hands the whole arena back, without touching what is in it. */
    void Reset() { used = 0; }

    u_char *base;   /**< Start of the allocator-owned storage. */
    u_char *buffer; /**< Current allocation cursor. */
    int used;       /**< Number of occupied quadwords. */
    int limit;      /**< Maximum number of available quadwords. */
};

extern "C" void *__ct__14CDataAlloc2_1_Fi(void *self, int limit);

template <>
class CDataAlloc<1, 6000> {
public:
    CDataAlloc();

    u_char *Alloc(int quads);
    u_char *Alloc64(int quads);
    void Align64();

    u_long128 block[6000]; /**< Embedded allocation storage. */
    int used; /**< Number of occupied quadwords in the embedded arena. */
};

template <>
class CDataAlloc<1, 1690000> {
public:
    CDataAlloc() { used = 0; }

    u_char *Alloc(int quads);
    u_char *Alloc64(int quads);
    void Align64();

    u_long128 block[1690000]; /**< Embedded allocation storage. */
    int used;                   /**< Number of occupied quadwords. */
};

template <int Kind, int Size>
u_char *CDataAlloc<Kind, Size>::Alloc(int quads) {
    u_char *block;

    if (used + quads > Size) {
        printf("Alocation Error! %d/%d\n", used, Size);
        while (1)
            ;
    }
    block = (u_char *) block + used * 16;
    used += quads;
    return block;
}

template <int Kind, int Size>
u_char *CDataAlloc<Kind, Size>::Alloc64(int quads) {
    Align64();

    u_char *block = (u_char *) block + used * 16;
    used += quads;
    if (used >= Size) {
        printf("Alocation Error! %d/%d\n", used, Size);
        while (1)
            ;
    }
    return block;
}

template <int Kind, int Size>
void CDataAlloc<Kind, Size>::Align64() {
    /* Falls through as it stands; flipping the branch turns the whole alignment step off. */
    asm {
        bne $0, $0, done
    }

    u_int slack = (u_int) ((u_char *) block + used * 16) & 63;

    if (slack) {
        used += (64 - slack) >> 4;
    }
    if (used >= Size) {
        printf("Alocation Error! %d/%d\n", used, Size);
        while (1)
            ;
    }
done:;
}

/**
 * Supplies the main texture-loading allocation arena.
 */
extern CDataAlloc2<1> TextureData;
/**
 * Supplies the main visual-model allocation arena.
 */
extern CDataAlloc2<1> VisualData;
