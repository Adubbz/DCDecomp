#pragma once

#include "common.h"

class CFrame;

class CHitValue {
public:
    u8 unk_00[0x10];
    s32 unk_10;
    float digit_angle[5]; /**< Hop angle of each place, rising to pi. */
    s32 digits[5];        /**< Value of each place; -1 skips its hop, and -2 in the first place gives the whole number one hop. */
    float alpha;          /**< Opacity of the number, from 0 to 128. */
    float alpha_speed;    /**< Amount the opacity changes by each step; scaled by -1.2 when a hop ends. */
    s32 last_digit;       /**< Place of the digit whose finished hop starts the fade, or -1 once it has. */
    u8 unk_48[0x14];
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
