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
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

/**
 * Each character's default weapon.
 */
int defWeapon__2[6] = {0x101, 0x12B, 0x13A, 0x14B, 0x15B, 0x16B};

int element_tbl[6] = {1, 2, 4, 8, 0x10, 0};
#ifdef PAL
char *LanguageStr[7] = {"dun/img/jp/", "dun/img/us/", "dun/img/us_e/", "dun/img/fr/", "dun/img/gr/", "dun/img/it/", "dun/img/sp/"};
#endif

int BattleSubWeaponDmg(float amount, int kind) {
    int defWeapon[6] = {0x101, 0x12B, 0x13A, 0x14B, 0x15B, 0x16B};
    int chara_no = UserStatus->cur_chara;
    int default_weapon;
    WEAPON_HAVE *weapon =
        &UserStatus->chara_weapons[chara_no][UserStatus->equipped_weapon_slot[chara_no]];

    if (weapon->item_no == 0x10C && SaveData->GetGameFlag(0x30) == 0) {
        return 0;
    }

    if (weapon->flags & 0x200) {
        amount *= 0.5f;
    }
    if (weapon->flags & 0x100) {
        amount *= 2.0f;
    }

    default_weapon = defWeapon[chara_no];
    if (default_weapon ==
        UserStatus->chara_weapons[chara_no][UserStatus->equipped_weapon_slot[chara_no]].item_no) {
        return 0;
    }

    float wear = 1.5f - 0.01f * NowWeaponHave->endurance;
    float old_durability = weapon->durability_f;
    wear *= amount;
    wear += 0.1f * kind;
    weapon->durability_f = old_durability - wear;

    if (weapon->durability_f <= 0.0f) {
        int powder_slot = ((CDngStatusData *) UserStatus)->CheckActItemSlot(0xB7);
        if (powder_slot != -1) {
            DelActiveItem(powder_slot + 1);
            weapon->durability_f = weapon->durability;
            DngMessMan.message = 0xBC;
            DngMessMan.timer = 0xF0;
            DngMessMan.unk_1C = 0;
            SndSePlay(0x18, -1, 0);
        }
    }

    if (weapon->durability_f <= 0.0f) {
        weapon->durability_f = 0.0f;
        SndSePlay(0xE0, -1, 0);

        int now_item =
            UserStatus->chara_weapons[chara_no][UserStatus->equipped_weapon_slot[chara_no]].item_no;
        if (default_weapon + 1 == now_item) {
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

        if (default_weapon + 1 != (s16) now_item) {
            WEAPON_HAVE *replacement = UserStatus->chara_weapons[chara_no];
            for (int slot = 0; slot < 10; replacement++, slot++) {
                if (replacement->item_no == default_weapon) {
                    UserStatus->equipped_weapon_slot[chara_no] = slot;
                    SetWeaponAttachStatus(NowWeaponHave);
                    DngMessMan.unk_0C = GetCommonItemDataSystemMsg(weapon->item_no);
                    DngMessMan.unk_14 = weapon->unk_02;
                    DngMessMan.unk_10 = GetCommonItemDataSystemMsg(replacement->item_no);
                    DngMessMan.unk_18 = replacement->unk_02;
                    DngMessMan.message = 0xA0;
                    DngMessMan.timer = 0x1E0;
                    DngMessMan.unk_1C = 0;
                    weapon->item_no = -1;
                    return 1;
                }
                if (replacement->item_no == default_weapon + 1) {
                    UserStatus->equipped_weapon_slot[chara_no] = slot;
                    SetWeaponAttachStatus(NowWeaponHave);
                    DngMessMan.unk_0C = GetCommonItemDataSystemMsg(weapon->item_no);
                    DngMessMan.unk_14 = weapon->unk_02;
                    DngMessMan.unk_10 = GetCommonItemDataSystemMsg(replacement->item_no);
                    DngMessMan.unk_18 = replacement->unk_02;
                    DngMessMan.message = 0xA0;
                    DngMessMan.timer = 0x1E0;
                    DngMessMan.unk_1C = 0;
                    if (chara_no == 3) {
                        replacement->best_elem = 0;
                    }
                    weapon->item_no = -1;
                    return 2;
                }
            }
        }
    }

    if (0.1f * weapon->durability <= old_durability &&
        0.1f * weapon->durability > weapon->durability_f) {
        DngMessMan.unk_0C = GetCommonItemDataSystemMsg(weapon->item_no);
        DngMessMan.unk_14 = weapon->unk_02;
        DngMessMan.message = 0x97;
        DngMessMan.timer = 0xF0;
        DngMessMan.unk_1C = 0;
    }
    if (0.05f * weapon->durability <= old_durability &&
        0.05f * weapon->durability > weapon->durability_f) {
        DngMessMan.unk_0C = GetCommonItemDataSystemMsg(weapon->item_no);
        DngMessMan.unk_14 = weapon->unk_02;
        DngMessMan.message = 0x98;
        DngMessMan.timer = 0xF0;
        DngMessMan.unk_1C = 0;
    }
    return 0;
}

void HitValueEntry(CHitValue *values, float *world, int amount, int kind, CFrame *frame) {
    for (int i = 0; i < 32; i++) {
        if (values[i].active == 0) {
            values[i].EntryValue(world, amount, kind, frame);
            return;
        }
    }
}

void CHitValue::EntryValue(float *world, int amount, int kind, CFrame *frame) {
    int place = 10000;

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

    int value;
    int leading = 0;
    for (int i = 4; i >= 0; i--) {
        value = amount / place;

        if (value > 0) {
            leading = 1;
        }
        // The units place is always drawn; the rest only past the first digit.
        if (i == 0 || leading != 0) {
            digit[i] = value;
            amount -= value * place;
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

void CHitValue::Draw(void) {
    if (active == 0) {
        return;
    }
    if (kind == 2 && ((s32 *) SaveData->GetConfigData())[9] == 1) {
        return;
    }
    if ((kind == 0 || kind == -1) && ((s32 *) SaveData->GetConfigData())[10] == 1) {
        return;
    }

    CTexture *digit_texture = TexManager.GetTexture("stayframe", -1);
    CTexture *mark_texture = TexManager.GetTexture("itempack", -1);
    int screen[4];
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

    if (MGRotTransPers2D(screen, world, 0) == 0) {
        return;
    }

    if (digit[0] == -2) {
        int bounce = (int) (48.0f * sinf(phase[0]));
        set2DSprite(Vif1Packet, mark_texture, CRect_i_(screen[0], screen[1] - bounce - 48, 72, 24),
                    CRect_i_(0, 128, 72, 24), (u8) fade);
        return;
    }

    for (int place = 0; place < 5; place++) {
        if (digit[place] == -1) {
            continue;
        }

        int bounce = (int) (48.0f * sinf(phase[place]));
        set2DSprite(Vif1Packet, digit_texture,
                    CRect_i_(screen[0] - place * texel.width, screen[1] - bounce - 48, texel.width,
                             texel.height),
                    CRect_i_(texel.x + digit[place] * texel.width, texel.y, texel.width,
                             texel.height),
                    (u8) fade);
    }
}

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
