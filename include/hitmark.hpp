#pragma once

#include "common.h"

class CHitMark {
public:
    /**
     * @mangled Set__8CHitMarkFPfPfiffffif
     * @address 0x1B2E90
     * @size 0x310
     * @unknownret
     */
    void Set(float *, float *, int, float, float, float, float, int, float);

    /**
     * @mangled Draw__8CHitMarkFv
     * @address 0x1B31A0
     * @size 0x2F0
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Step__8CHitMarkFv
     * @address 0x1B3490
     * @size 0x140
     * @unknownret
     */
    void Step(void);

    /**
     * @mangled Initialize__8CHitMarkFv
     * @address 0x1B35D0
     * @size 0x40
     * @unknownret
     */
    void Initialize(void);
};

class CHitPointMark {
public:
    /**
     * @mangled Draw__13CHitPointMarkFv
     * @address 0x1B3610
     * @size 0x100
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled Step__13CHitPointMarkFv
     * @address 0x1B3710
     * @size 0x70
     * @unknownret
     */
    void Step(void);
};
