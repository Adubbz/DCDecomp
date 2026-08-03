#pragma once

#include "common.h"

class CFrame;

class CHitValue {
public:
    /**
     * @mangled EntryValue__9CHitValueFPfiiP6CFrame
     * @address 0x1B6370
     * @size 0x1F0
     * @unknownret
     */
    void EntryValue(float *, int, int, CFrame *);

    /**
     * @mangled Draw__9CHitValueFv
     * @address 0x1B6560
     * @size 0x2F0
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Step__9CHitValueFv
     * @address 0x1B6850
     * @size 0x1A0
     * @unknownret
     */
    void Step(void);
};
