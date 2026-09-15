#pragma once

#include "common.h"

class CRunEffect {
public:
    u8 unk_00[0xD0];

    /**
     * @mangled Lighting__10CRunEffectFi
     * @address 0x163470
     * @size 0xC
     * @unknownret
     */
    void Lighting(int);

    /**
     * @mangled Draw__10CRunEffectFv
     * @address 0x163480
     * @size 0x46C
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Set__10CRunEffectFPf
     * @address 0x1638F0
     * @size 0x8C
     * @unknownret
     */
    void Set(float *);

    /**
     * @mangled Step__10CRunEffectFv
     * @address 0x163980
     * @size 0x70
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled __ct__10CRunEffectFv
     * @address 0x1639F0
     * @size 0x3C
     */
    CRunEffect(void);
};

STATIC_ASSERT(sizeof(CRunEffect) == 0xD0);
