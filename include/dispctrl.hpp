#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct sceVif1Packet;


class CDispCtrl {
public:
    /* ?ret */ void FadeOutStart(float); // @ 0x13E610 (0x20 bytes) -- mangled: FadeOutStart__9CDispCtrlFf
    /* ?ret */ void FadeInStart(float); // @ 0x13E630 (0x20 bytes) -- mangled: FadeInStart__9CDispCtrlFf
    /* ?ret */ void FadeInit(float); // @ 0x13E650 (0x20 bytes) -- mangled: FadeInit__9CDispCtrlFf
    /* ?ret */ void GetRate(void); // @ 0x13E670 (0x10 bytes) -- mangled: GetRate__9CDispCtrlFv
    /* ?ret */ void FadeOut(sceVif1Packet *); // @ 0x13E680 (0x170 bytes) -- mangled: FadeOut__9CDispCtrlFP13sceVif1Packet
    /* ?ret */ void FadeIn(sceVif1Packet *); // @ 0x13E7F0 (0x160 bytes) -- mangled: FadeIn__9CDispCtrlFP13sceVif1Packet
};
