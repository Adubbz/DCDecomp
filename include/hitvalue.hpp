#pragma once

#include "common.h"

#include <libvu0.h>

#include "rect.hpp"

class CFrame;

/**
 * Holds one damage number standing over whatever took the hit.
 */
class CHitValue {
public:
    sceVu0FVECTOR pos; /**< World position the number is drawn above. */
    CFrame *frame;     /**< Frame the number follows, or zero to stand still. */
    float phase[5];    /**< Bounce phase of each digit, one place each. */
    s32 digit[5];      /**< Decimal digits of the amount; -1 where a place is blank and -2 for a mark. */
    float fade;        /**< Frames the number has been standing, which retires it. */
    float rise;        /**< Speed the number floats upward at. */
    s32 unk_44;
    s32 kind;          /**< What took the hit, which picks the digit sheet. */
    RECT texel;        /**< Rectangle of the sheet one digit is cut from. */
    s32 active;        /**< Indicates that the slot is showing a number. */

    /**
     * Puts one damage number on the screen over what took the hit.
     *
     * @mangled EntryValue__9CHitValueFPfiiP6CFrame
     * @address 0x1B6370
     * @size 0x1E4
     */
    void EntryValue(float *world, int amount, int kind, CFrame *frame);

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
