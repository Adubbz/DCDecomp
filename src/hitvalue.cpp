#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 612

#include "hitvalue.hpp"

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
INCLUDE_ASM("asm/nonmatchings/hitvalue", EntryValue__9CHitValueFPfiiP6CFrame);
INCLUDE_ASM("asm/nonmatchings/hitvalue", Draw__9CHitValueFv);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @804);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @805);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @863);

void CHitValue::Step(void) {
    if (active != 0) {
        if (digits[0] == -2) {
            digit_angle[0] += 3.141592f / 20.0f;
            if (digit_angle[0] >= 3.141592f) {
                digit_angle[0] = 3.141592f;
                alpha_speed *= -1.2f;
            }
        } else {
            // Each place further along hops more slowly.
            for (int i = 0; i < 5; i++) {
                if (digits[i] != -1) {
                    digit_angle[i] += 3.141592f / (20.0f + 5.0f * i);
                    if (digit_angle[i] >= 3.141592f) {
                        digit_angle[i] = 3.141592f;
                        if (i == last_digit) {
                            alpha_speed *= -1.2f;
                            last_digit = -1;
                        }
                    }
                }
            }
        }

        if (alpha_speed > 0.0f) {
            alpha += alpha_speed;
            if (alpha >= 128.0f) {
                alpha = 128.0f;
            }
        }
        if (alpha_speed < 0.0f) {
            alpha += alpha_speed;
            if (alpha <= 0.0f) {
                alpha = 0.0f;
                active = 0;
            }
        }
    }
}
