#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 612

#include "hitvalue.hpp"

#include <libvu0.h>

#include <cmath>

#include "dngmessageman.hpp"
#include "dun/gameloop.hpp"
#include "frame.hpp"
#include "itemdata.hpp"
#include "menu_dungeon.hpp"
#include "menu_inventory.hpp"
#include "mglib.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

extern "C" s32 defWeapon__6[];

#ifdef NON_MATCHING
int BattleSubWeaponDmg(float amount, int kind) {
    int chara_no = UserStatus->cur_chara;
    int equipped_slot = UserStatus->equipped_weapon_slot[chara_no];
    WEAPON_HAVE *weapon = &UserStatus->chara_weapons[chara_no][equipped_slot];

    if (weapon->item_no == 0x10C && SaveData->GetGameFlag(0x30) == 0) {
        return 0;
    }

    if (weapon->flags & 0x200) {
        amount *= 0.5f;
    }
    if (weapon->flags & 0x100) {
        amount *= 2.0f;
    }

    int default_weapon = defWeapon__6[chara_no];
    if (default_weapon == weapon->item_no) {
        return 0;
    }

    float old_durability = weapon->durability_f;
    weapon->durability_f -= (1.5f - 0.01f * (float) NowWeaponHave->endurance) * amount + 0.1f * (float) kind;

    if (weapon->durability_f <= 0.0f) {
        int powder_slot = ((CDngStatusData *) UserStatus)->CheckActItemSlot(0xB7);
        if (powder_slot != -1) {
            DelActiveItem(powder_slot + 1);
            weapon->durability_f = (float) weapon->durability;
            DngMessMan.message = 0xBC;
            DngMessMan.timer = 0xF0;
            DngMessMan.unk_1C = 0;
            SndSePlay(0x18, -1, 0);
        }
    }

    if (weapon->durability_f <= 0.0f) {
        weapon->durability_f = 0.0f;
        SndSePlay(0xE0, -1, 0);

        if (default_weapon + 1 == weapon->item_no) {
            DngMessMan.unk_0C = GetCommonItemDataSystemMsg(weapon->item_no);
            DngMessMan.unk_14 = weapon->unk_02;
            DngMessMan.message = 0xA1;
            DngMessMan.timer = 0x1E0;
            DngMessMan.unk_1C = 0;
            WepDataListToHaveCopy(default_weapon, weapon);
            SetWeaponAttachStatus(NowWeaponHave);
            NowWeaponHave->durability_f = 0.0f;
            weapon->durability_f = 0.0f;
            return 1;
        }

        for (int slot = 0; slot < 10; slot++) {
            WEAPON_HAVE *replacement = &UserStatus->chara_weapons[chara_no][slot];
            int result;

            if (replacement->item_no == default_weapon) {
                result = 1;
            } else if (replacement->item_no == default_weapon + 1) {
                result = 2;
            } else {
                continue;
            }

            UserStatus->equipped_weapon_slot[chara_no] = slot;
            SetWeaponAttachStatus(NowWeaponHave);
            DngMessMan.unk_0C = GetCommonItemDataSystemMsg(weapon->item_no);
            DngMessMan.unk_14 = weapon->unk_02;
            DngMessMan.unk_10 = GetCommonItemDataSystemMsg(replacement->item_no);
            DngMessMan.unk_18 = replacement->unk_02;
            DngMessMan.message = 0xA0;
            DngMessMan.timer = 0x1E0;
            DngMessMan.unk_1C = 0;
            if (result == 2 && chara_no == 3) {
                replacement->attach_kind[0] = 0;
            }
            weapon->item_no = -1;
            return result;
        }
    }

    float low_threshold = 0.1f * (float) weapon->durability;
    if (low_threshold <= old_durability && weapon->durability_f < low_threshold) {
        DngMessMan.unk_0C = GetCommonItemDataSystemMsg(weapon->item_no);
        DngMessMan.unk_14 = weapon->unk_02;
        DngMessMan.message = 0x97;
        DngMessMan.timer = 0xF0;
        DngMessMan.unk_1C = 0;
    }

    float critical_threshold = 0.05f * (float) weapon->durability;
    if (critical_threshold <= old_durability && weapon->durability_f < critical_threshold) {
        DngMessMan.unk_0C = GetCommonItemDataSystemMsg(weapon->item_no);
        DngMessMan.unk_14 = weapon->unk_02;
        DngMessMan.message = 0x98;
        DngMessMan.timer = 0xF0;
        DngMessMan.unk_1C = 0;
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/hitvalue", BattleSubWeaponDmg__Ffi);
#endif
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
        last_digit = 1;
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
                last_digit = i;
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
#ifdef NON_MATCHING
void CHitValue::Draw(void) {
    if (active == 0) {
        return;
    }

    s32 *config = (s32 *) SaveData->GetConfigData();
    if (kind == 2 && config[9] == 1) {
        return;
    }
    if ((kind == 0 || kind == -1) && config[10] == 1) {
        return;
    }

    CTexture *digit_texture = TexManager.GetTexture((char *) "stayframe", -1);
    CTexture *mark_texture = TexManager.GetTexture((char *) "itempack", -1);
    sceVu0FVECTOR world;
    if (frame != NULL) {
        sceVu0CopyVector(world, frame->position);
        world[0] += pos[0];
        world[1] += pos[1];
        world[2] += pos[2];
        world[3] = 1.0f;
    } else {
        sceVu0CopyVector(world, pos);
    }

    int screen[4];
    if (MGRotTransPers2D(screen, world, 0) == 0) {
        return;
    }

    if (digit[0] == -2) {
        int bounce = (int) (48.0f * sinf(phase[0]));
        CRect_i_ destination(screen[0], screen[1] - bounce - 48, 72, 24);
        CRect_i_ source(0, 128, 72, 24);
        set2DSprite(Vif1Packet, mark_texture, destination, source, (u8) fade);
        return;
    }

    for (int place = 0; place < 5; place++) {
        if (digit[place] == -1) {
            continue;
        }

        int bounce = (int) (48.0f * sinf(phase[place]));
        CRect_i_ destination(screen[0] - place * texel.width, screen[1] - bounce - 48,
                             texel.width, texel.height);
        CRect_i_ source(texel.x + digit[place] * texel.width, texel.y, texel.width, texel.height);
        set2DSprite(Vif1Packet, digit_texture, destination, source, (u8) fade);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/hitvalue", Draw__9CHitValueFv);
#endif
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @804);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @805);
INCLUDE_RODATA("asm/nonmatchings/hitvalue", @863);
#ifdef NON_MATCHING
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
#else
INCLUDE_ASM("asm/nonmatchings/hitvalue", Step__9CHitValueFv);
#endif
