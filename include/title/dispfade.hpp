#pragma once

#include "common.h"

class CDispFade {
public:
    /* ?ret */ void FadeOutStart(float, int); // @ 0x1DAD1E0 (0x20 bytes) -- mangled: FadeOutStart__9CDispFadeFfi
    /* ?ret */ void FadeInStart(float, int); // @ 0x1DAD200 (0x20 bytes) -- mangled: FadeInStart__9CDispFadeFfi
    /* ?ret */ void FadeInit(float); // @ 0x1DAD220 (0x20 bytes) -- mangled: FadeInit__9CDispFadeFf
    /* ?ret */ void GetRate(void); // @ 0x1DAD240 (0x10 bytes) -- mangled: GetRate__9CDispFadeFv
    /* ?ret */ void FadeOut(sceVif1Packet *); // @ 0x1DAD250 (0x1E0 bytes) -- mangled: FadeOut__9CDispFadeFP13sceVif1Packet
    /* ?ret */ void FadeIn(sceVif1Packet *); // @ 0x1DAD430 (0x1E0 bytes) -- mangled: FadeIn__9CDispFadeFP13sceVif1Packet
};
