#pragma once

#include "common.h"

class CHealEffect {
public:
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
