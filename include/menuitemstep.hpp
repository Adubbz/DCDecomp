#pragma once

#include "common.h"

class CMenuItemStep {
private:
    u8 data[0x2C];

public:
    /**
     * @mangled Initialize__13CMenuItemStepFv
     * @address 0x235650
     * @size 0x80
     * @unknownret
     */
    void Initialize(void);

    /**
     * @mangled LoopStep__13CMenuItemStepFi
     * @address 0x2356D0
     * @size 0x50
     * @unknownret
     */
    void LoopStep(int);

    /**
     * @mangled CheckItemVolume__13CMenuItemStepFv
     * @address 0x235720
     * @size 0x2F0
     * @unknownret
     */
    void CheckItemVolume(void);
};

STATIC_ASSERT(sizeof(CMenuItemStep) == 0x2C);
