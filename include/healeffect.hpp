#pragma once

#include "common.h"

class CHealEffect {
public:
    u8 unk_000[0x510];
    s32 unk_510;
    u8 unk_514[0xC];

    /**
     * @mangled Set__11CHealEffectFPf
     * @address 0x1B2900
     * @size 0x200
     * @unknownret
     */
    void Set(float *);

    /**
     * @mangled Step__11CHealEffectFv
     * @address 0x1B2B00
     * @size 0x250
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Draw__11CHealEffectFv
     * @address 0x1B2D50
     * @size 0x140
     * @unknownret
     */
    void Draw(void);
};

STATIC_ASSERT(sizeof(CHealEffect) == 0x520);
