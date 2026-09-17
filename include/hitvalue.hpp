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
    union {
        float digit_angle[5]; /**< Hop angle of each place, rising to pi. */
        float phase[5];       /**< Alternate retail-facing name used by the entry routine. */
    };
    union {
        s32 digits[5]; /**< Value of each place; -1 skips its hop and -2 draws the special mark. */
        s32 digit[5];  /**< Alternate retail-facing name used by the entry routine. */
    };
    union {
        float alpha; /**< Opacity of the number, from zero to 128. */
        float fade;  /**< Alternate name used while initializing the opacity. */
    };
    union {
        float alpha_speed; /**< Amount the opacity changes by each step. */
        float rise;        /**< Alternate name used by the entry routine. */
    };
    union {
        s32 last_digit; /**< Place whose finished hop starts the fade. */
        s32 unk_44;
    };
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
