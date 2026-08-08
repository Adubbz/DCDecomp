#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct sceVif1Packet;

class CDispFade {
public:
    /**
     * @mangled FadeOutStart__9CDispFadeFfi
     * @address 0x1DAD1E0
     * @size 0x20
     * @unknownret
     */
    void FadeOutStart(float, int);

    /**
     * @mangled FadeInStart__9CDispFadeFfi
     * @address 0x1DAD200
     * @size 0x20
     * @unknownret
     */
    void FadeInStart(float, int);

    /**
     * @mangled FadeInit__9CDispFadeFf
     * @address 0x1DAD220
     * @size 0x20
     * @unknownret
     */
    void FadeInit(float);

    /**
     * @mangled GetRate__9CDispFadeFv
     * @address 0x1DAD240
     * @size 0x10
     * @unknownret
     */
    void GetRate(void);

    /**
     * @mangled FadeOut__9CDispFadeFP13sceVif1Packet
     * @address 0x1DAD250
     * @size 0x1E0
     * @unknownret
     */
    void FadeOut(sceVif1Packet *);

    /**
     * @mangled FadeIn__9CDispFadeFP13sceVif1Packet
     * @address 0x1DAD430
     * @size 0x1E0
     * @unknownret
     */
    void FadeIn(sceVif1Packet *);
};
