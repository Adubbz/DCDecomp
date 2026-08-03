#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct sceVif1Packet;


class CDispCtrl {
public:
    /**
     * @mangled FadeOutStart__9CDispCtrlFf
     * @address 0x13E610
     * @size 0x20
     * @unknownret
     */
    void FadeOutStart(float);

    /**
     * @mangled FadeInStart__9CDispCtrlFf
     * @address 0x13E630
     * @size 0x20
     * @unknownret
     */
    void FadeInStart(float);

    /**
     * @mangled FadeInit__9CDispCtrlFf
     * @address 0x13E650
     * @size 0x20
     * @unknownret
     */
    void FadeInit(float);

    /**
     * @mangled GetRate__9CDispCtrlFv
     * @address 0x13E670
     * @size 0x10
     * @unknownret
     */
    void GetRate(void);

    /**
     * @mangled FadeOut__9CDispCtrlFP13sceVif1Packet
     * @address 0x13E680
     * @size 0x170
     * @unknownret
     */
    void FadeOut(sceVif1Packet *);

    /**
     * @mangled FadeIn__9CDispCtrlFP13sceVif1Packet
     * @address 0x13E7F0
     * @size 0x160
     * @unknownret
     */
    void FadeIn(sceVif1Packet *);
};
