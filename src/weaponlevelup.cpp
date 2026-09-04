#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "weaponlevelup.hpp"

// Retail's own name for these two is a CodeWarrior back-reference our compiler
// cannot spell; config/object_fixups.json puts it back.
void SndSPSeLoadBG(int se_no, u_int *buffer, int *size);

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "clsmes.hpp"
#include "dataalloc2_1.hpp"
#include "dataread.hpp"
#include "dngstatusdata.hpp"
#include "itemdata.hpp"
#include "menu_draw.hpp"
#include "menu_inventory.hpp"
#include "menu_misc.hpp"
#include "savedata.hpp"
#include "shop_battlemenu.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "weapon_buildup.hpp"

void AttachMentValuePlus(ATTACH_LIST *total, ATTACH_LIST *attach, float scale) {
    WEAPON_DATA *data;
    int i;
    int value;

    data = GetWeaponData(total->unk_02);

    int limit[4] = {999, 99, 99, 999};
    if (data != NULL) {
        limit[0] = data->attack_max;
        limit[3] = data->magic_max;
    }
    for (i = 0; i < 4; i++) {
        value = (&total->attack)[i] + (s16) (int) ((float) (&attach->attack)[i] * scale);
        if (value >= limit[i]) {
            (&total->attack)[i] = limit[i];
        } else {
            (&total->attack)[i] = value;
        }
    }
    for (i = 0; i < 5; i++) {
        value = total->elem[i] + (int) ((float) attach->elem[i] * scale);
        if (value >= 99) {
            total->elem[i] = 99;
        } else {
            total->elem[i] = value;
        }
    }
    for (i = 0; i < 10; i++) {
        value = total->vs_monster[i] + (int) ((float) attach->vs_monster[i] * scale);
        if (value >= 99) {
            total->vs_monster[i] = 99;
        } else {
            total->vs_monster[i] = value;
        }
    }
}

void WeaponLevelUpValueCalc(WEAPON_HAVE *src, WEAPON_HAVE *dst, int levels, int unused) {
    ATTACH_LIST total;
    int i;
    int synth_count;
    int flags;
    WEAPON_DATA *data;
    ATTACH_LIST *att;
    int hole;
    int doubled;
    int value;
    float scale;

    if (src == NULL) {
        return;
    }
    memset(&total, 0, 0x20);
    memset(dst, 0, 0xF8);
    synth_count = 0;
    flags = 1;
    flags |= src->flags;
    data = GetWeaponData(src->item_no);
    for (i = 0; i < levels; i++) {
        for (i = 0; i < 6; i++) {
            if (data->hole[i] > 0) {
                att = &src->attach[i];
                if (att->item_no >= 0x51) {
                    scale = 1.0f;
                    if (src->attach_kind[i] == 3) {
                        scale = 2.0f;
                    }
                    AttachMentValuePlus(&total, att, scale);
                    if (att->item_no == 0x5A) {
                        synth_count++;
                        if (att->unk_04 != 0 && att->unk_04 != 1) {
                            flags |= att->unk_04;
                        }
                    }
                }
            }
        }
        memset(dst->attach, 0, 0xC0);
        memcpy(dst, src, 0xF8);
        dst->attack += total.attack + 1;
        if (dst->attack > data->attack_max) {
            dst->attack = data->attack_max;
        }
        dst->endurance += total.endurance + 1;
        if (dst->endurance >= 99) {
            dst->endurance = 99;
        }
        dst->speed += total.speed + 1;
        if (dst->speed >= 99) {
            dst->speed = 99;
        }
        dst->magic += total.magic + 1;
        if (dst->magic >= data->magic_max) {
            dst->magic = data->magic_max;
        }
        for (i = 0; i < 5; i++) {
            value = (s8) dst->elem[i] + total.elem[i];
            if (value >= 99) {
                dst->elem[i] = 99;
            } else {
                dst->elem[i] = value;
            }
        }
        for (i = 0; i < 10; i++) {
            value = dst->vs_monster[i] + total.vs_monster[i];
            if (value >= 99) {
                dst->vs_monster[i] = 99;
            } else {
                dst->vs_monster[i] = value;
            }
        }
        dst->durability = src->durability + 1 + rand() % 3;
        if (dst->durability > 99) {
            dst->durability = 99;
        }
        doubled = 0;
        for (hole = 0; hole < 6; hole++) {
            if (data->hole[hole] > 0 && data->hole[hole] != 2) {
                if (doubled != 0) {
                    dst->attach_kind[hole] = 0;
                } else if (rand() % 50 == 5) {
                    dst->attach_kind[hole] = 3;
                    doubled = 1;
                } else {
                    dst->attach_kind[hole] = 0;
                }
            }
        }
    }
    dst->flags |= flags;
    dst->unk_F0 += synth_count;
}

void CWeaponLevelUp::CMenuEffectDataLoad(CWeaponLevelUp *buffer, int kind) {
    int size;
    int index;
    int se;

    effect_buffer = (u_long128 *) buffer;
    effect_buffer = MenuCalcBufAlignment(effect_buffer);
    {
        char *dir[5] = {"wlevelup.pak", "s_break.pak", "buildup.chr", "menu_ex.chr", "w_recover.chr"};
        char name[0x40] = "commenu/effect/";
        char sel[14] = {0, 1, 2, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3};
        s16 snd[14] = {25, 26, 28, -1, -1, -1, -1, 20, 20, -1, 20, 20, 20, 20};

        index = sel[kind];
        se = snd[kind];
        if (kind == 2 && IsLastWeapon(buildup_weapon_no) != 0) {
            se = 21;
            printf("last weapon\n");
        }
        strcat(name, dir[index]);
        StartReadBG();
        LoadFileBG(name, effect_buffer, &size);
    }
    if (0 <= se) {
        effect_buffer += (size >> 4) + 1;
        effect_buffer = MenuCalcBufAlignment(effect_buffer);
        SndSPSeLoadBG(se, (u_int *) effect_buffer, &size);
        printf("effect snd size = %d\n", size);
        effect_buffer += (size >> 4) + 1;
    }
    ReadBG();
}

void CWeaponLevelUp::Initialize() {
    memset(this, -1, 0xF8);
    memset(&status_item_no, 0, 0x20);
    effect.frame = NULL;
    effect_buffer = NULL;
    weapon = NULL;
    unk_12d0 = 0;
    effect_active = 0;
    effect_timer = -1.0f;
    effect_state = 0;
    operation_kind = -1;
    texture_block = -1;
    buildup_weapon_no = -1;
    message_no = 0;
    message_value = 0;
    synthesis_count = 0;
    unk_12ea = 0;
    buildup_complete = 0;
    lost_default_weapon = 0;
}

void CWeaponLevelUp::SetLevelUpValue(WEAPON_HAVE *have, CCharacter *character, CWeaponLevelUp *effect, int no) {
    ATTACH_LIST total;
    int i;
    WEAPON_DATA *data;
    int flags;
    ATTACH_LIST *att;
    int j;
    int n;
    int k;
    int value;
    int doubled;
    int m;
    int option;
    float scale;

    if (have == NULL) {
        printf("src is NULL\n");
        return;
    }
    texture_block = no;
    operation_kind = 0;
    effect_motion = 0;
    CMenuEffectDataLoad(effect, 0);
    synthesis_count = 0;
    chara = character;
    weapon = have;
    memcpy(&preview, weapon, 0xF8);
    data = GetWeaponData(preview.item_no);
    memset(&total, 0, 0x20);
    flags = 1;
    flags |= preview.flags;
    for (i = 0; i < 6; i++) {
        if (data->hole[i] > 0) {
            att = &preview.attach[i];
            if (preview.attach[i].item_no >= 0x51) {
                scale = 1.0f;
                if (preview.attach_kind[i] == 3) {
                    scale = 2.0f;
                }
                AttachMentValuePlus(&total, att, scale);
                if (att->item_no == 0x5A) {
                    synthesis_count++;
                    if (att->unk_04 != 0 && att->unk_04 != 1) {
                        flags |= att->unk_04;
                    }
                }
            }
        }
    }
    flags = CheckWeaponOptionStatus(flags);
    preview.flags |= flags;
    preview.attack += total.attack;
    if (preview.attack > data->attack_max) {
        preview.attack = data->attack_max;
    }
    preview.endurance += total.endurance;
    if (preview.endurance > 99) {
        preview.endurance = 99;
    }
    preview.speed += total.speed;
    if (preview.speed > 99) {
        preview.speed = 99;
    }
    preview.magic += total.magic;
    if (preview.magic > data->magic_max) {
        preview.magic = data->magic_max;
    }
    for (j = 0; j < 5; j++) {
        value = preview.elem[j] + total.elem[j];
        if (value >= 99) {
            preview.elem[j] = 99;
        } else {
            preview.elem[j] = value;
        }
    }
    for (j = 0; j < 10; j++) {
        value = preview.vs_monster[j] + total.vs_monster[j];
        if (value >= 99) {
            preview.vs_monster[j] = 99;
        } else {
            preview.vs_monster[j] = value;
        }
    }
    if (preview.durability >= 99) {
        preview.durability = 99;
    }
    memset(attachment_icons, 0, 0xA);
    memset(attachment_values, 0, 0xA);
    n = 0;
    for (k = 0; k < 5; k++) {
        if (preview.attach[k].item_no >= 0x51) {
            attachment_icons[n] = preview.attach[k].item_no;
            attachment_values[n] = 0;
            if (attachment_icons[n] >= 0x5B && attachment_icons[n] < 0x5F) {
                attachment_values[n] = (&preview.attach[k].attack)[preview.attach[k].item_no - 0x5B];
            }
            if (attachment_icons[n] == 0x5A) {
                attachment_values[n] = preview.attach[k].unk_02;
            }
            n++;
        }
    }
    memset(weapon->attach, 0, 0xC0);
    memset(preview.attach, 0, 0xC0);
    for (j = 0; j < 6; j++) {
        weapon->attach[j].item_no = -1;
    }
    doubled = 0;
    for (m = 0; m < 5; m++) {
        if (data->hole[m] > 0 && data->hole[m] != 2) {
            if (doubled != 0) {
                preview.attach_kind[m] = 0;
            } else if (rand() % 50 == 5) {
                preview.attach_kind[m] = 3;
                doubled = 1;
            } else {
                preview.attach_kind[m] = 0;
            }
        }
    }
    memcpy(weapon, &preview, 0xF8);
    effect_state = 1;
}

void CWeaponLevelUp::SetLevelUpWeaponData() {
    WEAPON_DATA *data = GetWeaponData(weapon->item_no);

    weapon->attack = weapon->attack + 1;
    if (weapon->attack > data->attack_max) {
        weapon->attack = data->attack_max;
    }
    weapon->endurance = weapon->endurance + 1;
    if (weapon->endurance > 99) {
        weapon->endurance = 99;
    }
    weapon->speed = weapon->speed + 1;
    if (weapon->speed > 99) {
        weapon->speed = 99;
    }
    weapon->magic = weapon->magic + 1;
    if (weapon->magic > data->magic_max) {
        weapon->magic = data->magic_max;
    }
    weapon->durability = weapon->durability + 1 + rand() % 3;
    if (weapon->durability > 99) {
        weapon->durability = 99;
    }
    weapon->unk_14 = 0;
}

FUZZY_MATCH("asm/nonmatchings/weaponlevelup",
            SetStatusBreak__14CWeaponLevelUpFP11WEAPON_HAVEP10CCharacterP1i);

void CWeaponLevelUp::SetStatusBreak(WEAPON_HAVE *have, CCharacter *character, CWeaponLevelUp *effect, int no) {
    ATTACH_LIST total;
    int space;
    int i;
    int n;
    ATTACH_LIST *board;
    s16 flags;
    ATTACH_LIST *slot;
    float scale;
    CDngStatusData *status;

    if (have == NULL) {
        printf("src is NULL\n");
        return;
    }
    texture_block = no;
    operation_kind = 1;
    effect_state = 4;
    effect_motion = 0;
    CMenuEffectDataLoad(effect, 1);
    chara = character;
    weapon = have;
    memset(&status_item_no, 0, 0x20);
    status_item_no = 0x5A;
    status_weapon_no = weapon->item_no;
    status_weapon_kind = weapon->unk_02;

    s16 stat[4] = {0, 0, 0, 0};
    stat[0] = weapon->attack;
    stat[1] = weapon->endurance;
    stat[2] = weapon->speed;
    stat[3] = weapon->magic;
    for (i = 0; i < 4; i++) {
        status_stats[i] = 0.6f * (float) stat[i];
    }
    for (i = 0; i < 5; i++) {
        status_elements[i] = weapon->elem[i] * 0.6f;
    }
    for (i = 0; i < 10; i++) {
        status_monster[i] = weapon->vs_monster[i] * 0.6f;
    }
    flags = 0;
    flags |= weapon->flags;
    memset(&total, 0, 0x20);
    total.unk_02 = status_weapon_no;
    for (i = 0; i < 6; i++) {
        if (weapon->attach[i].item_no >= 0x51) {
            scale = 1.0f;
            if (weapon->attach_kind[i] == 3) {
                scale = 2.0f;
            }
            AttachMentValuePlus(&total, &have->attach[i], scale);
            if (weapon->attach[i].item_no == 0x5A) {
                if (weapon->attach[i].unk_04 != 0 && weapon->attach[i].unk_04 != 1) {
                    flags |= weapon->attach[i].unk_04;
                }
            }
        }
    }
    AttachMentValuePlus((ATTACH_LIST *) &status_item_no, &total, 0.6f);
    flags = CheckWeaponOptionStatus(flags);
    status = SaveData->GetDngStatus();
    n = GetBoardSpace(0x5A, &space);
    board = (ATTACH_LIST *) status->consumable_items;
    slot = &board[n];
    memcpy(slot, &status_item_no, 0x20);
    slot->item_no = 0x5A;
    board[n].stat_00 = weapon->unk_02;
    board[n].unk_02 = weapon->item_no;
    board[n].unk_04 = flags;
}

void CWeaponLevelUp::SetBuildUp(WEAPON_HAVE *have, CCharacter *character, CWeaponLevelUp *effect, int no) {
    if (have == NULL) {
        return;
    }
    texture_block = no;
    operation_kind = 2;
    effect_state = 7;
    effect_motion = 0;
    CMenuEffectDataLoad(effect, operation_kind);
    chara = character;
    weapon = have;
    memcpy(&preview, weapon, 0xF8);
    SetWeaponBuildValue(&preview, buildup_weapon_no);
    if (have->item_no == 0x116 || have->item_no == 0x117) {
        ClearFishMardanGarayanNum();
        printf("mardan num clear!!\n");
    }
}

void CWeaponLevelUp::WepRecover(WEAPON_HAVE *have, CCharacter *character, CWeaponLevelUp *effect, int no) {
    if (have == NULL || character == NULL || effect == NULL) {
        return;
    }
    texture_block = no;
    operation_kind = 3;
    effect_state = 10;
    effect_motion = 0;
    CMenuEffectDataLoad(effect, operation_kind);
    chara = character;
    weapon = have;
}

void CWeaponLevelUp::CureEffect(int x, int y, CWeaponLevelUp *effect, int no, int kind) {
    CMenuEffectDataLoad(effect, kind);
    texture_block = no;
    operation_kind = kind;
    effect_state = (operation_kind - 4) * 2 + 12;
    effect_motion = operation_kind - 4;
    if (kind == 13) {
        effect_motion = 2;
    } else {
        if (operation_kind >= 7) {
            effect_motion = effect_motion - 1;
        }
        if (operation_kind >= 10) {
            effect_motion = effect_motion - 1;
        }
    }
    effect_x = (float) x;
    effect_y = (float) y;
}

void CWeaponLevelUp::InitSnd() {
    snd_from = -1;
    snd_volume = 0;
    snd_to = 0;
    snd_step = 0;
}

void CWeaponLevelUp::SetSnd(int from, int to, int step) {
    snd_from = from;
    snd_volume = snd_from;
    snd_to = to;
    if (to < from) {
        snd_step = -step;
    }
    if (from < to) {
        snd_step = step;
    }
}

void CWeaponLevelUp::StepSnd() {
    if (snd_step != 0) {
        snd_volume = snd_volume + snd_step;
        SndSetBgmVol(snd_volume);
        if (snd_step > 0) {
            if (snd_to <= snd_volume) {
                snd_volume = snd_to;
                snd_step = 0;
            }
        }
        if (snd_step < 0) {
            if (snd_to >= snd_volume) {
                snd_volume = snd_to;
                snd_step = 0;
            }
        }
    }
}

void CWeaponLevelUp::CheckSnd() {
    int volume;

    printf("snd check\n");
    if (snd_from > 0 || snd_step != 0) {
        volume = SndGetBgmVol();
        if (volume != snd_volume) {
            SndSetBgmVol(volume);
        }
    }
    InitSnd();
}

void CWeaponLevelUp::Step() {
    int size;
    int state;
    int ready;
    int se;
    int volume;
    int index;
    BG_READ_INFO *read;
    u_int *buffer;
    u_long128 *aligned;
    int lost;
    int option;
    float now;

    if (operation_kind == -1) {
        return;
    }
    state = 0;
    if (effect.frame != NULL) {
        state = effect.motion_state;
    }
    switch (effect_state) {
        default:
            break;
        case 0:
            return;
        case 1:
        case 4:
        case 7:
        case 10:
        case 12:
        case 14:
        case 16:
        case 18:
        case 20:
        case 22:
        case 24:
        case 26:
        case 28:
        case 30:
            ReadBG();
            ready = 0;
            if (ReadBGSync() == 0) {
                ready++;
            }
            if (SndSPSeSyncBG() == 0) {
                ready++;
                if (operation_kind != 6 && operation_kind != 3 && operation_kind != 9 && operation_kind != 4 &&
                    operation_kind != 5) {
                    volume = BtlMenuBGMvol;
                    SetSnd(volume, volume >> 2, 7);
                }
            }
            if (ready >= 2) {
                LOADTEXTURE_INFO2 tex[3] = {{"#frame_menu_level#640#448#4", 0, 0}, {NULL, 0, 0}, {NULL, 0, 0}};
                tex[0].block_no = texture_block;
                tex[1].block_no = texture_block;
                char sel[14] = {0, 1, 2, 4, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3};
                char *dir[5] = {"wlevelup", "s_break", "buildup", "menu_ex", "w_recover"};
                char *file[14] = {"wlevelup", "info", "buildup", "info", "w_recover",
                                  NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
                char pack[0x20];
                char name[0x20];

                index = sel[operation_kind];
                strcpy(pack, file[index]);
                strcpy(name, dir[index]);
                strcat(name, ".img");
                strcat(pack, ".cfg");
                read = GetReadBGFile(0);
                tex[1].name = (char *) GetPackFile((u_int *) read->buffer, name, &size);
                TexManager.DeleteTextureBlock(texture_block);
                TexManager.CleanUpTextureList();
                TexManager.LoadTextureBlockEX(-1, tex);
                buffer = (u_int *) read->buffer;
                aligned = read->buffer + (read->size >> 4) + 1;
                aligned = MenuCalcBufAlignment(aligned);
                effect.Initialize();
                MenuEffectCashBuffer.buffer = (u8 *) aligned;
                MenuEffectCashBuffer.size = 0x9100;
                MenuEffectCashBuffer.used = 0;
                effect.LoadPackData(buffer, pack, &MenuEffectCashBuffer, &MenuEffectCashBuffer);
                effect_buffer = (u_long128 *) ((MenuEffectCashBuffer.used << 4) +
                                               MenuEffectCashBuffer.buffer);
                effect_state++;
                effect_timer = 0.0f;
                effect_active = 1;

                float position[4] = {0.0f, 0.0f, 1.0f, 1.0f};
                switch (operation_kind) {
                    case 4:
                    case 5:
                    case 6:
                    case 8:
                    case 9:
                    case 10:
                    case 11:
                    case 12:
                    case 13:
                        position[0] = effect_x;
                        position[1] = effect_y;
                        break;
                }
                effect.SetPosition(position);

                float scale[3] = {1.0f, 1.0f, 1.0f};
                switch (operation_kind) {
                    case 1:
                        int i;
                        for (i = 0; i < 3; i++) {
                            scale[i] = 1.38f;
                        }
                        break;
                    case 2:
                        int j;
                        for (j = 0; j < 3; j++) {
                            scale[j] = 2.0f;
                        }
                        break;
                }
                effect.SetScale(scale);
                effect.motion_no = effect_motion;
                effect.flags = 6;
                effect.motion_speed = -1.0f;
                effect.Step();
                se = -1;
                switch (operation_kind) {
                    case 1:
                        se = 0x1A;
                        break;
                    case 0:
                        se = 0x19;
                        break;
                    case 2:
                        se = 0x1C;
                        if (IsLastWeapon(buildup_weapon_no) != 0) {
                            se = 0x15;
                        }
                        break;
                    case 11:
                    case 12:
                    case 13:
                    case 8:
                    case 7:
                    case 10:
                        se = 0x14;
                        break;
                }
                if (se >= 0) {
                    SndSPSePlay(se, -1);
                }
                for (int i = 0; i < 4; i++) {
                    CommonMenuMes1.mes_no[i] = -1;
                    if (i >= 0 && i < 10) {
                        CommonMenuMes1.line_pos[i].x = -1;
                        CommonMenuMes1.line_pos[i].y = -1;
                    }
                }
                return;
            }
            break;
        case 2:
            effect_timer += 1.0f;
            if (!(effect_timer < 140.0f)) {
                effect_state = 3;
                return;
            }
            break;
        case 3:
            effect_timer += 1.0f;
            if (state == 3) {
                effect_timer = 200.0f;
                effect_active = 0;
                return;
            }
            break;
        case 5:
            effect_timer += 1.0f;
            if (state == 3) {
                effect_motion++;
                effect.motion_no = effect_motion;
                effect.flags = 6;
                effect.motion_speed = -1.0f;
                effect_state++;
                effect_timer = 0.0f;
                lost = 1;
                if (IsDefaultWeapon(weapon->item_no) >= 0) {
                    lost = 0;
                    weapon->unk_02 = 0;
                    lost_default_weapon = 1;
                }
                if (lost != 0) {
                    memset(weapon, 0, 0xF8);
                    weapon->item_no = -1;
                    return;
                }
                WepDataListToHaveCopy(weapon->item_no, weapon);
                return;
            }
            break;
        case 6:
            effect_timer += 1.0f;
            if (state == 3) {
                effect_timer = 12.0f;
                effect_active = 0;
                return;
            }
            break;
        case 8:
            if (state == 3) {
                effect_motion++;
                SetWeaponBuildValue(weapon, buildup_weapon_no);
                weapon->item_no = buildup_weapon_no;
                weapon->unk_02 = 0;
                weapon->unk_14 = 0;
                option = DefaultWeaponOptionSet(buildup_weapon_no);
                if (option != 1) {
                    option = CheckWeaponOptionStatus(option);
                    weapon->flags = weapon->flags | option;
                }
                MenuExTextureReadFlag = 0;
                buildup_complete = 1;
                effect.motion_no = effect_motion;
                effect.flags = 6;
                effect.motion_speed = -1.0f;
                printf("effect setmotion tuuka \n");
                effect_state++;
                return;
            }
            break;
        case 9:
            if (state == 3) {
                effect_active = 0;
                return;
            }
            break;
        case 11:
            if (state == 3) {
                effect_active = 0;
                return;
            }
            break;
        case 15:
            now = effect.motion_type.state.time;
            if (now > 52.0 && now < 52.3) {
                ComMenuSePlay(0x13);
            }
            /* fallthrough */
        case 13:
        case 17:
        case 19:
        case 23:
            if (state == 3) {
                if (message_no >= 0x190) {
                    effect_active = 0;
                    return;
                }
                effect_active = 1;
                Initialize();
                return;
            }
            break;
        case 21:
        case 25:
        case 27:
        case 29:
        case 31:
            if (state == 3) {
                effect_active = 0;
            }
            break;
    }
}

void CWeaponLevelUp::Draw() {
    s16 icon[5];
    s16 value[5];
    int i;
    int alpha;
    int count;
    float step;
    float orbit_radius;
    float angular_rate;
    float angle;
    float x;
    float y;

    if (effect_state == 0) {
        return;
    }
    if (effect_timer < 0.0f) {
        return;
    }
    alpha = 128;
    switch (effect_state) {
        case 6:
            if (!(effect.GetNowTime() < 134.0f)) {
                MenuTextureReload(MenuShadowReadBlock);
                DrawIconParts(0x5A, 0x132, 0xD0, 0, 0x280, alpha, status_weapon_no);
            }
            break;
    }
    if (effect.frame != NULL) {
        MenuTextureReload(texture_block);
        effect.Step();
        effect.Draw();
    }
    MenuTextureReload(BtlMenuReadBlock);
    switch (effect_state) {
        case 0:
        case 1:
        case 4:
        case 7:
            return;
        case 2:
            count = 0;
            for (i = 0; i < 5; i++) {
                if (attachment_icons[i] < 0x51) {
                    break;
                }
                icon[i] = attachment_icons[i];
                value[i] = attachment_values[i];
                count++;
            }
            if (count <= 0) {
                return;
            }
            step = 6.2831855f / (float) count;
            angular_rate = step / 140.0f;
            orbit_radius = 128.0f - 128.0f * (effect_timer / 140.0f);
            if (!(effect_timer < 100.0f)) {
                alpha = 128 - (int) (effect_timer - 100.0f) * 4;
                if (alpha < 0) {
                    alpha = 0;
                }
            }
            MenuTextureReload(MenuShadowReadBlock);
            for (i = 0; i < count; i++) {
                angle = angular_rate * effect_timer + step * (float) i;
                x = orbit_radius * cosf(angle);
                y = orbit_radius * sinf(angle);
                x = 320.0f + x - 12.0f;
                (int) x;
                y = 224.0f + y - 12.0f;
                (int) y;
                DrawIconParts(icon[i], (int) x, (int) y, 0, 0x280, alpha, value[i]);
            }
            break;
        case 3:
        case 5:
        case 6:
        case 8:
        case 9:
            break;
    }
    DrawMes();
}

void CWeaponLevelUp::DrawMes() {
    int x;
    int y;

    if (effect_active == 0 && operation_kind != -1) {
        switch (effect_state) {
            case 0:
            case 1:
            case 2:
            case 4:
            case 5:
            case 7:
                return;
        }

        int mes = 0;
        int mes_no[2] = {-1, -1};
        int values[2] = {-1, -1};

        switch (effect_state) {
            case 3:
                mes = 0x190;
                mes_no[0] = GetCommonItemInfo(preview.item_no)->msg + 100;
                values[0] = preview.unk_02 + 1;
                break;
            case 6:
                mes = 0x191;
                mes_no[0] = GetCommonItemInfo(status_weapon_no)->msg + 100;
                values[0] = status_weapon_kind;
                break;
            case 9:
                mes = 0x192;
                mes_no[0] = GetCommonItemInfo(weapon->item_no)->msg + 100;
                values[0] = 0;
                break;
            case 11:
                mes = 0x193;
                mes_no[0] = GetCommonItemInfo(weapon->item_no)->msg + 100;
                values[0] = weapon->unk_02;
                break;
            case 21:
                mes = 0x194;
                mes_no[0] = message_no + 50;
                values[0] = message_value;
                break;
            case 23:
                mes = message_no;
                break;
            case 29:
                mes = 0x195;
                mes_no[0] = message_no + 50;
                break;
            case 27:
                mes = 0x196;
                mes_no[0] = message_no + 50;
                break;
            case 31:
                mes = 0x197;
                values[0] = message_value;
                break;
            case 25:
                mes = 0x198;
                mes_no[0] = message_no + 50;
                break;
        }
        if (CommonMenuMes1.mes_made != mes || CommonMenuMes1.mes_no[0] != mes_no[0] ||
            CommonMenuMes1.values[0] != values[0]) {
            CommonMenuMes1.value_signed = 1;
            CommonMenuMes1.value_show = 0;
            CommonMenuMes1.value_narrow = 0;
            CommonMenuMes1.auto_pos = 0;
            if (effect_state == 29 || effect_state == 27 || effect_state == 31 || effect_state == 21 ||
                effect_state == 23) {
                CommonMenuMes1.value_signed = 0;
                CommonMenuMes1.value_show = 1;
                CommonMenuMes1.auto_pos = 5;
            }
            CommonMenuMes1.mes_no[0] = mes_no[0];
            CommonMenuMes1.values[0] = values[0];
            CommonMenuMes1.mes_made = -1;
            CommonMenuMes1.MakeMesWin(mes);
        }
        CommonMenuMes1.stay_frame = 1;
        MenuTextureReload(CommonMenuMes1.tex_block);
        x = 0x164;
        y = 0x96;
        if (effect_state == 29 || effect_state == 27 || effect_state == 31 || effect_state == 23 ||
            effect_state == 21) {
            x = 0x100;
            y = 0x96;
        }
        if (operation_kind == 3) {
            CommonMenuMes1.value_signed = 1;
            CommonMenuMes1.value_show = 0;
            CommonMenuMes1.value_narrow = 0;
            x = 0x100;
            y = 0x96;
            CommonMenuMes1.auto_pos = 5;
        }
        DrawMenuClsMes(&CommonMenuMes1, x, y);
    }
}
