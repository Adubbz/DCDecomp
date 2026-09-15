#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 612

#include "hitvalue.hpp"

#include <libvu0.h>

INCLUDE_ASM("asm/nonmatchings/hitvalue", BattleSubWeaponDmg__Ffi);
#ifdef NON_MATCHING
void HitValueEntry(CHitValue *values, float *world, int amount, int kind, CFrame *frame) {
    for (int i = 0; i < 32; i++) {
        if (values[i].active == 0) {
            values[i].EntryValue(world, amount, kind, frame);
            return;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/hitvalue", HitValueEntry__FP9CHitValuePfiiP6CFrame);
#endif
#ifdef NON_MATCHING
void CHitValue::EntryValue(float *world, int amount, int kind, CFrame *frame) {
    for (int i = 0; i < 5; i++) {
        digit[i] = -1;
        phase[i] = -3.141592f;
    }
    this->kind = kind;
    fade = 0.0f;
    rise = 3.0f;
    active = 1;
    this->frame = frame;
    sceVu0CopyVector(pos, world);
    pos[3] = 1.0f;

    // A kind of -1 is a mark rather than a number, so it has no digits.
    if (kind == -1) {
        digit[0] = -2;
        unk_44 = 1;
        return;
    }

    int place = 10000;
    int leading = 0;
    for (int i = 4; i >= 0; i--) {
        int value = amount / place;

        if (value > 0) {
            leading = 1;
        }
        // The units place is always drawn; the rest only past the first digit.
        if (i == 0 || leading != 0) {
            digit[i] = value;
            amount %= place;
            if (place < 9) {
                unk_44 = i;
            }
        }
        place /= 10;
    }

    switch (kind) {
        case 0:
            texel.x = 0;
            texel.y = 0x9E;
            texel.width = 0xC;
            texel.height = 0x12;
            break;
        case 1:
            texel.x = 0;
            texel.y = 0x8C;
            texel.width = 0xC;
            texel.height = 0x12;
            break;
        case 2:
            texel.x = 0;
            texel.y = 0x7C;
            texel.width = 0xC;
            texel.height = 0x12;
            break;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/hitvalue", EntryValue__9CHitValueFPfiiP6CFrame);
#endif
INCLUDE_ASM("asm/nonmatchings/hitvalue", Draw__9CHitValueFv);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @804);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @805);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @863);
INCLUDE_ASM("asm/nonmatchings/hitvalue", Step__9CHitValueFv);
