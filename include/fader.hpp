#pragma once

#include "common.h"

class Fader {
public:
    /**
     * @mangled In__5FaderFv
     * @address 0x2451F0
     * @size 0x50
     * @unknownret
     */
    void In(void);

    /**
     * @mangled Out__5FaderFv
     * @address 0x245240
     * @size 0x30
     * @unknownret
     */
    void Out(void);

    /**
     * @mangled Get__5FaderFi
     * @address 0x245270
     * @size 0x0
     * @unknownret
     */
    void Get(int);
};
