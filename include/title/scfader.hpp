#pragma once

#include "common.h"

class CScFader {
public:
    /**
     * @mangled In__8CScFaderFv
     * @address 0x1DD5100
     * @size 0x50
     * @unknownret
     */
    void In(void);

    /**
     * @mangled In2__8CScFaderFv
     * @address 0x1DD5150
     * @size 0x50
     * @unknownret
     */
    void In2(void);

    /**
     * @mangled Out__8CScFaderFv
     * @address 0x1DD51A0
     * @size 0x50
     * @unknownret
     */
    void Out(void);

    /**
     * @mangled Get__8CScFaderFi
     * @address 0x1DD51F0
     * @size 0x40
     * @unknownret
     */
    void Get(int);

    /**
     * @mangled Skip__8CScFaderFv
     * @address 0x1DD5230
     * @size 0x10
     * @unknownret
     */
    void Skip(void);
};
