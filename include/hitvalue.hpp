#pragma once

#include "common.h"

class CFrame;

class CHitValue {
public:
    u8 unk_00[0x10];
    s32 unk_10;
    u8 unk_14[0x48];
    s32 active; /**< Indicates that the slot is showing a number. */

    /**
     * Puts one damage number on the screen over what took the hit.
     *
     * @mangled EntryValue__9CHitValueFPfiiP6CFrame
     * @address 0x1B6370
     * @size 0x1E4
     */
    void EntryValue(float *, int, int, CFrame *);

    /**
     * Draws the damage numbers standing on the screen.
     *
     * @mangled Draw__9CHitValueFv
     * @address 0x1B6560
     * @size 0x2F0
     */
    void Draw(void);

    /**
     * Advances the damage numbers' rise and fade.
     *
     * @mangled Step__9CHitValueFv
     * @address 0x1B6850
     * @size 0x198
     */
    void Step(void);
};

/**
 * Puts one damage number on the screen over what took the hit.
 *
 * @mangled HitValueEntry__FP9CHitValuePfiiP6CFrame
 * @address 0x1B6300
 * @size 0x64
 * @unknownret
 */
void HitValueEntry(CHitValue *values, float *position, int amount, int kind, CFrame *frame);

STATIC_ASSERT(sizeof(CHitValue) == 0x60);
