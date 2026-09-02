#pragma once

#include "common.h"

/**
 *          Tracks the title screen's signed scene-fade value.
 */
class CScFader {
public:
    CScFader() { value = 0; }

    /**
     *          Advances the primary fade-in transition.
     *
     * @mangled In__8CScFaderFv
     * @address 0x1DD5100
     * @size 0x50
     * @unknownret
     */
    int In(void);

    /**
     *          Advances the alternate fade-in transition.
     *
     * @mangled In2__8CScFaderFv
     * @address 0x1DD5150
     * @size 0x50
     * @unknownret
     */
    int In2(void);

    /**
     *          Advances the fade-out transition.
     *
     * @mangled Out__8CScFaderFv
     * @address 0x1DD51A0
     * @size 0x50
     * @unknownret
     */
    int Out(void);

    /**
     *          Converts the stored fade for the requested use.
     *
     * @mangled Get__8CScFaderFi
     * @address 0x1DD51F0
     * @size 0x40
     * @unknownret
     */
    int Get(int);

    /**
     *          Forces the fade to its skipped terminal state.
     *
     * @mangled Skip__8CScFaderFv
     * @address 0x1DD5230
     * @size 0x10
     * @unknownret
     */
    void Skip(void);

    int value; /**< The fade itself, between -4 and 128. */
};
