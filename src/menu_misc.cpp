#include "menu_misc.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "battlemenu.hpp"
#include "character.hpp"
#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "editloop.hpp"
#include "frame.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "memcard.hpp"
#include "menu_draw.hpp"
#include "menu_inventory.hpp"
#include "menuitemstep.hpp"
#include "menu_manual.hpp"
#include "mglib.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"
#include "weapon_buildup.hpp"
#include "weaponeffect.hpp"

#ifdef NON_MATCHING // draft includes
#include <cstring>

#include "btactstatus.hpp"
#include "btmisc.hpp"
#include "dngstatusdata.hpp"
#include "menu_dungeon.hpp"
#include "mainselect.hpp"
#include "shot_effect.hpp"
#include "weaponlevelup.hpp"

extern s32 BtlMenuMode;
extern CTexture *WepIcon;
extern u_long128 *WeaponRead_Buf;
extern u_long128 *MenuWeaponModelBuildBuffer;
extern u_long128 *WepMenuEffectReadBuf;
extern int CharaFileBGReadNo;
extern u_long128 *CharaChangeBaseBuf;
extern s16 charachangeid;
extern u_long128 *menucharReadbuf;
extern u_long128 *menud0wepReadBuf;
extern u_long128 *menud1wepReadBuf;
extern u_long128 *menud2wepReadBuf;
extern char MenureadFile[64];
extern char MenuWepDir[];
extern int defWeapon__5[6];
extern u_long128 *MenuWepIconCharaChangePtr;
extern u_long128 *MenuVoiceLoadPtr;
extern s16 CharaNameDrawCase;
extern "C" CCharacter DefaultWeapon;
extern "C" CCharacter MainWeapon;
extern "C" CSHOT_EFFECT *NowMainEffect;
extern "C" CSHOT_EFFECT CharaMainEffectCrash;
extern s32 CharaMainHandViewFlag;
extern "C" CCharacter *NowWeapon;
#endif

/** The weapon test number GetNowTestNo reports, initialised to 1. */
extern int MenuWeaponTestCase;

/** The amount the last item use gave, a base value plus a random part. */
extern int MenuItemUseVolume;

/** The menu's weapon-effect read flag. */
extern s16 MenuCharaEffectReadFlag;

/** The weapon effect kind SetOldEffectKind records. */
extern s16 MenuCharaOldEffect;

/** The weapon effect the menu's character plays. */
extern BT_SHOT_EFFECT *WepEffectMenuPt;

/** The buffer the menu's weapon effect and model are read into. */
extern u_long128 *WepEffectMenuReadBuf;

/** The message window that shows a monster's name. */
extern ClsMes *CharaNameMes;

/** Whether the monster's name is drawn. */
extern s16 CharaNameDrawFlag;

/** The dungeon status data the battle menu is showing, or NULL outside the dungeon. */
extern CDngStatusData *BtlMenuStatusPt;

/** The ambient light saved before the item menu tinted it. */
extern float MenuCharaOldAmbient[4];

/** The dungeon escape prompt's second message window. */
extern ClsMes *DngMenuMes;

/** The picture drawn behind the dungeon escape prompt. */
extern CTexture *DngEscapeTex;

/** The texture block the dungeon escape prompt's picture is loaded into. */
extern s16 DngEscapeBlock;

/** Whether the dungeon escape prompt is closing and fades to black. */
extern s16 DngEscapeEndFlag;

/** The currently selected answer in the dungeon escape prompt. */
extern s16 DngEscapeSelect;

/** The darkness drawn over the dungeon escape prompt, from 0 (none) to 0x80 (black). */
extern s16 DngEscapeAlpha;

extern CDataAlloc2<1> MenuExCashBuffer;
extern CCharacter MenuCharaFrame;
extern CCharacter DngWeaponFrm[12];
extern "C" CWeaponEffect CWeaponFx;

/**
 * Provides the base path used to assemble character model file names.
 */
extern "C" const char readFilePath[0x40];

/**
 * Provides the model file name for each playable character.
 */
extern "C" const char *charaFile[6];

/**
 * Provides the file extension appended to character model file names.
 */
extern "C" const char CharaFileExtension[5];

/** Frame numbers of the menu's cached weapon models. */
extern int MenuWeaponModelData[42];

/** Each weapon model slot's frame number and read state. */
extern int MenuWeaponModelInfo[12][2];

/**
 * Sets the buffer the menu reads weapon effect files into.
 *
 * @mangled SetWepEffectMenuReadBuf__FP1
 * @address 0x20D0A0
 * @size 0xC
 */
static void SetWepEffectMenuReadBuf(u_long128 *);

/**
 * Returns one entry of the menu's weapon model table.
 *
 * @mangled GetMenuWeaponModelData__Fi
 * @address 0x20D3B0
 * @size 0x18
 */
static int *GetMenuWeaponModelData(int);

/**
 * Clears the menu's weapon model table.
 *
 * @mangled InitMenuWeaponModelData__Fv
 * @address 0x20D3D0
 * @size 0x30
 */
static void InitMenuWeaponModelData();

/**
 * Returns the two-value reference entry for one weapon model.
 *
 * @mangled GetMenuWeaponModelInfo__Fi
 * @address 0x20D400
 * @size 0x18
 */
static int *GetMenuWeaponModelInfo(int);

/**
 * Returns the motion step a character's status bits select.
 *
 * @mangled GetNowMotionStepCnt__Fi
 * @address 0x20DE80
 * @size 0x38
 */
static int GetNowMotionStepCnt(int status);

/**
 * Writes the file path of one character's model into a buffer.
 *
 * @mangled GetCharaChangeReadCharaFilePath__FPci
 * @address 0x20E530
 * @size 0x74
 */
static void GetCharaChangeReadCharaFilePath(char *, int);

/**
 * Randomly adjusts one value of a weapon being changed into another.
 *
 * @mangled LocalWeaponDataChange__FPciii
 * @address 0x20FBE0
 * @size 0xF8
 */
static void LocalWeaponDataChange(char *, int, int, int);

/**
 * Selects the battle-menu game flag for the current dungeon state.
 *
 * @mangled NowGetGameFlagForBtlMenu__Fi
 * @address 0x20BEC0
 * @size 0xB8
 */
int NowGetGameFlagForBtlMenu(int game_flag) {
    switch (game_flag) {
        case 0:
            break;
        case 5:
        case 1:
            if (EdInteriorFlag == 1) {
                game_flag = 2;
            } else if (BtlMenuStatusPt->special_flag_238 == 0) {
                if (SaveData->QuestDungeon(0, 0) == 0) {
                    game_flag = 11;
                } else if (BtlMenuStatusPt->special_flag_238 == 0) {
                    game_flag = 10;
                }
            }
            break;
    }
    return game_flag;
}

int GetMenuHebikiriFlag() {
    return SaveData->GetGameFlag(0x30);
}

/**
 * Selects the default weapon slot for one character.
 *
 * @mangled EquipDefaultWeapon__Fi
 * @address 0x20BFB0
 * @size 0xB4
 */
void EquipDefaultWeapon(int chara_no) {
    CDngStatusData *status = SaveData->GetDngStatus();
    WEAPON_HAVE *weapons = status->chara_weapons[chara_no];
    int default_weapon_no = GetDefaultWeaponNo(chara_no);

    for (int slot = 0; slot < 10; slot++) {
        if (weapons[slot].item_no == default_weapon_no ||
            weapons[slot].item_no == default_weapon_no + 1) {
            status->equipped_weapon_slot[chara_no] = slot;
            break;
        }
    }
}
#ifdef NON_MATCHING
void DrawMenuNothing(int x, int y, int width, int height, char *name, int custom, int alpha) {
    int u;
    int v;
    CTexture *texture = TexManager.GetTexture(name, -1);
    int inner_w = width - 0x24;
    int inner_h = height - 0x24;

    if (custom == 0) {
        u = 0xD4;
        v = 0x159;
    }
    DrawMenu2DSprite(texture, CRect_i_(x, y, 0x12, 0x12), CRect_i_(u, v, 0x12, 0x12), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x + 0x12, y, inner_w, 0x12), CRect_i_(u + 0x10, v, 4, 0x12), alpha);
    int right = x + 0x12 + inner_w;
    DrawMenu2DSprite(texture, CRect_i_(right, y, 0x12, 0x12), CRect_i_(u + 0x12, v, 0x12, 0x12), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x, y + 0x12, 0x12, inner_h), CRect_i_(u, v + 0xE, 0x12, 4), alpha);
    DrawMenu2DSprite(texture, CRect_i_(right, y + 0x12, 0x12, inner_h), CRect_i_(u + 0x12, v + 0xE, 0x12, 4), alpha);
    int bottom = y + 0x12 + inner_h;
    DrawMenu2DSprite(texture, CRect_i_(x, bottom, 0x12, 0x12), CRect_i_(u, v + 0x12, 0x12, 0x12), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x + 0x12, bottom, inner_w, 0x12), CRect_i_(u + 0x10, v + 0x12, 4, 0x12), alpha);
    DrawMenu2DSprite(texture, CRect_i_(right, bottom, 0x12, 0x12), CRect_i_(u + 0x12, v + 0x12, 0x12, 0x12), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x - 0x33 + (inner_w >> 1), y - 1 + (inner_h >> 1), 0x86, 0x22),
                     CRect_i_(0xFA, 0x1D2, 0x86, 0x22), alpha);
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", DrawMenuNothing__FiiiiPcii);
#endif

int GetMenuItemUseVolume() {
    return MenuItemUseVolume;
}

#ifdef NON_MATCHING
int ItemUseFunc(CUserStatus *status, int item_no, int chara, int target, WEAPON_HAVE *weapon) {
    int used = 0;
    u8 level_up[0xF8];

    MenuItemUseVolume = 0;
    s16 *hp = &status->hp[chara];
    int now_hp = status->hp[chara];
    s16 *max_hp = &status->max_hp[chara];
    int max = status->max_hp[chara];
    float *water = &status->water_now[chara];
    int now_water = (int) status->water_now[chara];
    float *water_max = &status->water_max[chara];
    float max_water = status->water_max[chara];
    s32 *condition = &status->unk_42C8[chara];
    int old_condition = status->unk_42C8[chara];
    printf("trueNo = %d\n", item_no);
    int value_no = 0;
    ITEM_DATA *data = GetItemData(item_no);
    if (data == NULL) {
        return 0;
    }
    s16 *values = &data->vol;
    if ((data->kind_flags & 4) && target == 1) {
        if (item_no != 0xAA) {
            if ((data->use_flags & 0x40) && now_hp > 0 && now_hp < max) {
                value_no = 1;
                status->SetNextLife(chara, now_hp + data->vol, 5.0f);
                used = 1;
            }
            if ((data->use_flags & 0x80) && 2.0f + now_water < max_water) {
                int add = values[value_no];
                value_no++;
                float limit = *water_max;
                float next = *water + add;
                if (limit < next) {
                    next = limit;
                }
                *water = next;
                used = 1;
            }
        } else if (now_hp > 0 && now_hp < max) {
            value_no = 1;
            status->SetNextLife(chara, now_hp + 200, 5.0f);
            status->AddDrink(chara, -20, 1.0f);
            used = 1;
        }
    }
    if ((data->kind_flags & 0x20) && (data->use_flags & 0x20) && item_no >= 0x88 && item_no < 0x8E) {
        if (chara == item_no - 0x88) {
            s32 *stat = &status->unk_4348[chara];
            int old = *stat;
            int range = data->vol_range;
            if (range <= 0) {
                printf("value=0\n");
                range = 1;
            }
            int add = data->vol + rand() % range;
            MenuItemUseVolume = add;
            int next = old + add;
            if (next >= 99) {
                next = 99;
            }
            *stat = next;
            used = 1;
        } else {
            used = 0;
        }
    }
    if (data->kind_flags & 1) {
        if (target == 1) {
            if (data->use_flags & 0x20) {
                switch (item_no) {
                    case 0xB3: {
                        int num = status->item_pack.num;
                        if (num < 0x60) {
                            status->item_pack.num += values[value_no];
                            MenuItemUseVolume = status->item_pack.num;
                            if (status->item_pack.num > 100) {
                                status->item_pack.num = 100;
                            }
                            for (; num < status->item_pack.num; num++) {
                                s16 *slot = &status->item_pack.item[num];
                                if (*slot < 0x84) {
                                    *slot = -1;
                                }
                            }
                            used = 1;
                        }
                        break;
                    }
                    case 0xB4: {
                        s16 limit[6] = {0xAA, 0x8C, 0xAA, 0x8C, 0xB4, 0xA0};
                        int cap = limit[chara];
                        if ((old_condition & 2) || now_hp <= 0 || !((s16) max < cap)) {
                            used = 0;
                        } else {
                            *max_hp = max + values[value_no];
                            s16 next = *max_hp;
                            if (next >= cap) {
                                next = cap;
                                *max_hp = cap;
                            }
                            status->SetNextLife(chara, next, 0.0f);
                            used = 1;
                        }
                        break;
                    }
                    case 0xB6:
                        if (max_water <= 90.0f) {
                            float next = max_water + values[value_no];
                            *water_max = next;
                            *water = next;
                            used = 1;
                        }
                        break;
                }
            }
            printf("prev status = %d\n", old_condition);
            if ((old_condition & 2) || now_hp <= 0) {
                if (item_no == 0xB0) {
                    *condition = 0;
                    *hp = max >> 1;
                    used = 1;
                }
            } else {
                if ((data->use_flags & 0x4000) && (old_condition & 4)) {
                    *condition ^= 4;
                    used = 1;
                }
                if ((data->use_flags & 0x8000) && (old_condition & 0x10)) {
                    *condition ^= 0x10;
                    used = 1;
                }
                if ((data->use_flags & 0x10000) && (old_condition & 0x20)) {
                    *condition ^= 0x20;
                    used = 1;
                }
                if ((data->use_flags & 0x20000) && (old_condition & 0x40)) {
                    *condition ^= 0x40;
                    used = 1;
                }
                if (item_no == 0x9A && (old_condition & 0x74)) {
                    if (*condition & 8) {
                        *condition = 0;
                        *condition |= 8;
                    } else {
                        *condition = 0;
                    }
                    used = 1;
                }
                if (BtlMenuMode == 0 && (data->use_flags & 0x1000)) {
                    int now = *condition;
                    if (!(now & 4)) {
                        *condition = now | 8;
                        status->unk_42E0[chara] = 0x708;
                        used = 1;
                    }
                }
            }
        }
        if (target == 4 || target == 2) {
            if (weapon == NULL) {
                return used;
            }
            int default_no = GetDefaultWeaponNo(chara);
            if (item_no == 0xB1) {
                float durability = weapon->durability;
                if (weapon->durability_f < durability) {
                    weapon->durability_f = durability;
                    int weapon_no = weapon->item_no;
                    if (weapon_no == default_no) {
                        weapon->item_no = weapon_no + 1;
                        WepDataListToHaveCopy(weapon->item_no, weapon);
                    }
                    used = 2;
                }
            }
            if (item_no == 0xB2) {
                if (weapon->item_no == 0x10C && GetMenuHebikiriFlag() == 0) {
                    return 0;
                }
                if (weapon->unk_02 >= 99) {
                    return 0;
                }
                if (weapon->item_no != default_no) {
                    int exp = weapon->unk_14;
                    if (exp < GetWeaponMaxExp(weapon)) {
                        WeaponLevelUpValueCalc(weapon, (WEAPON_HAVE *) level_up, 1, 0);
                        memcpy(weapon, level_up, sizeof(WEAPON_HAVE));
                        weapon->unk_02++;
                        memset(weapon->attach, 0, sizeof(weapon->attach));
                        used = 1;
                    }
                }
            }
        }
    }
    if (BtlMenuMode == 0 && !(old_condition & 2) && now_hp > 0 && (data->kind_flags & 2) && target == 1) {
        int before = *condition;
        if (data->use_flags & 0x100) {
            if (old_condition & 4) {
                *condition = before ^ 4;
            } else {
                *condition = before | 4;
                *condition &= ~0x58;
                status->unk_42E0[chara] = 300;
            }
            ComMenuSePlay(0x6B);
        }
        if (data->use_flags & 0x200) {
            int now = *condition;
            if (!(now & 0xC)) {
                *condition = now | 0x10;
                *condition &= ~0x40;
                ComMenuSePlay(0x6B);
            }
        }
        if (data->use_flags & 0x400) {
            *condition |= 0x20;
            ComMenuSePlay(0x6B);
        }
        if (data->use_flags & 0x800) {
            int now = *condition;
            if (!(now & 0x1C)) {
                *condition = now | 0x40;
                ComMenuSePlay(0x6B);
            }
        }
        if (before != *condition) {
            used = 1;
        }
    }
    return used;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", ItemUseFunc__FP11CUserStatusiiiP11WEAPON_HAVE);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @869);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @870__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @871__2);

/**
 * Returns a higher damage rate for a fragile Chronicle sword.
 *
 * @mangled GetNowWeaponRate__FP11WEAPON_HAVE
 * @address 0x20CDD0
 * @size 0x5C
 */
float GetNowWeaponRate(WEAPON_HAVE *weapon) {
    float rate = 1.0f;
    if (weapon != NULL && weapon->item_no == 0x110 &&
        weapon->durability_f <= 0.2f * weapon->durability) {
        rate = 1.5f;
    }
    return rate;
}

int WeaponStatusBreakEnable(WEAPON_HAVE *weapon) {
    int enable;

    if (weapon == NULL) {
        return 0;
    }
    enable = 0;
    if (weapon->unk_02 >= 5) {
        enable = 1;
    }
    return enable;
}

/**
 * Counts the available and enabled build-up choices for a weapon.
 *
 * @mangled WeaponStatusBuildUp__FP11WEAPON_HAVERi
 * @address 0x20CE70
 * @size 0xC0
 */
int WeaponStatusBuildUp(WEAPON_HAVE *weapon, int &enabled_count) {
    if (weapon == NULL) {
        return 0;
    }

    WEP_BUILDUP_INFO build_info[8];
    EnableBuildUpModel(build_info, weapon);

    int total = 0;
    while (build_info[total].weapon_no != -1 && total < 5) {
        total++;
    }
    for (int i = 0; i < total; i++) {
        if (build_info[i].enabled == 1) {
            enabled_count++;
        }
    }
    return total;
}
#ifdef NON_MATCHING
void MenuWeaponSpSet(CCharacter *chara, WEAPON_HAVE *weapon) {
    if (chara == NULL || weapon == NULL) {
        return;
    }
    if (weapon->item_no != 0x110) {
        return;
    }
    CFrame *whole = chara->frame->SearchFrame("w15a");
    CFrame *broken = chara->frame->SearchFrame("w15b");
    if (whole == NULL || broken == NULL) {
        return;
    }
    int show_broken;
    int show_whole;
    if (weapon->durability_f <= 0.2 * weapon->durability) {
        show_broken = 1;
        show_whole = 2;
    } else {
        show_broken = 2;
        show_whole = 1;
    }
    whole->attr.draw_on = show_whole;
    broken->attr.draw_on = show_broken;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @914__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @915__2);

void SetMenuCharaEffectReadFlag(int flag) {
    MenuCharaEffectReadFlag = flag;
}

int GetMenuCharaEffectReadFlag() {
    return MenuCharaEffectReadFlag;
}

BT_SHOT_EFFECT *GetDngWepEffectPointer() {
    return WepEffectMenuPt;
}

u_long128 *GetWepEffectMenuReadBuf() {
    return WepEffectMenuReadBuf;
}

void SetOldEffectKind(int kind) {
    MenuCharaOldEffect = kind;
}

static void SetWepEffectMenuReadBuf(u_long128 *buf) {
    WepEffectMenuReadBuf = buf;
}

#ifdef NON_MATCHING
BT_SHOT_EFFECT *DngWepEffectReadStart() {
    char path[64];
    int size;
    CUserStatus *status = (CUserStatus *) BtlMenuStatusPt;
    int chara = status->cur_chara;
    int slot = status->equipped_weapon_slot[chara];
    WEAPON_HAVE *weapons = status->chara_weapons[chara];
    WEAPON_HAVE *equipped = &weapons[slot];

    WepEffectMenuPt = Get_Main_EffectPtr(chara, equipped->best_elem);
    sprintf(path, "dun/mainchara/wep_eff/%s.chr", WepEffectMenuPt);
    WepEffectMenuReadBuf = GetWepEffectMenuReadBuf();
    WepEffectMenuReadBuf = MenuCalcBufAlignment(WepEffectMenuReadBuf);
    LoadFileBG(path, (u_long128 *) WepEffectMenuReadBuf, &size);
    SetMenuCharaEffectReadFlag(1);
    return GetDngWepEffectPointer();
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngWepEffectReadStart__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @936__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @947__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @948);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @949);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @950);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @951);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @952);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @956);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @957);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @958__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @959__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @960__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @961);

void MenuWeaponEffectSet(int effect_no) {
    SetMenuCharaEffectReadFlag(0);
    MainChara_Effect((BT_SHOT_EFFECT *) WepEffectMenuPt, (unsigned int *) WepEffectMenuReadBuf,
                     effect_no);
}

int GetNowTestNo() {
    return MenuWeaponTestCase;
}

#ifdef NON_MATCHING
int StartReadWepMDS(u_long128 *buffer, int chara) {
    char path[64] = "commenu/c";
    char *numbers[6] = {"01", "04", "06", "05", "10", "18"};
    char image[64];
    int size;

    if (ReadBGSync() == 1) {
        BreakReadBG();
    }
    strcat(path, numbers[chara]);
    strcat(path, "wtes.chr");
    WeaponRead_Buf = MenuCalcBufAlignment(buffer);
    StartReadBG();
    if (LoadFileBG(path, buffer, &size) == 0) {
        return 0;
    }
    u_long128 *next = MenuCalcBufAlignment(buffer + (size >> 4) + 1);
    GetPathReadDifferntLang(image);
    char *shadows[6] = {"kgetoan", "kgesyao", "kgegoro", "kgeruby", "kgeunga", "kgeozu"};
    strcat(image, shadows[chara]);
    strcat(image, "2.img");
    if (LoadFileBG(image, next, &size) == 0) {
        return 0;
    }
    if (BtlMenuMode == 0) {
        SetWepEffectMenuReadBuf(next + (size >> 4) + 1);
        DngWepEffectReadStart();
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", StartReadWepMDS__FP1i);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @969__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @970__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @985__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @986__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @987);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @988);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @989);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @990__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @992__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @993__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @994);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @995);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @996__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @997);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1002);
static int *GetMenuWeaponModelData(int index) {
    return &MenuWeaponModelData[index];
}
static void InitMenuWeaponModelData() {
    memset(MenuWeaponModelData, 0, sizeof(MenuWeaponModelData));
}
static int *GetMenuWeaponModelInfo(int index) {
    return MenuWeaponModelInfo[index];
}
void InitMenuWeaponModelReference() {
    for (int i = 0; i < 12; i++) {
        int *entry = GetMenuWeaponModelInfo(i);
        entry[0] = -1;
        entry[1] = -1;
    }
}
void SetMenuWeaponModelReference(int index, int frame_no, int value) {
    int *entry = GetMenuWeaponModelInfo(index);
    entry[0] = frame_no;
    entry[1] = value;
}
int GetMenuWeaponModelFrameNo(int index) {
    return MenuWeaponModelInfo[index][0];
}
#ifdef NON_MATCHING
int EnterWeaponModel(int chara, int texture_block, int) {
    char *shadows[6] = {"kagetoan", "kagesyao", "kagegoro", "kageruby", "kageunga", "kageozu"};
    char *names[6] = {"c01", "c04", "c06", "c05", "c10", "c18"};
    char order[16];
    char model[32];
    char image[32];
    char chr[32];
    BG_READ_INFO *pack = GetReadBGFile(0);
    BG_READ_INFO *shadow = GetReadBGFile(1);
    BG_READ_INFO *effect = GetReadBGFile(2);
    s16 max = MenuCharaWeaponMax[chara];

    switch (GetNowTestNo()) {
        case 0:
            break;
        case 1: {
            LOADTEXTURE_INFO2 texture = {0};
            texture.block_no = MenuShadowReadBlock;
            texture.name = (char *) shadow->buffer;
            TexManager.DeleteTextureBlock(MenuShadowReadBlock);
            TexManager.CleanUpTextureList();
            TexManager.LoadTextureBlockEX(-1, &texture);
            WepIcon = TexManager.GetTexture("wepicon", MenuShadowReadBlock);
            for (int i = 0; i < max; i++) {
                order[i] = i;
            }
            InitMenuWeaponModelData();
            for (int i = 0; i < max; i++) {
                char *name = names[chara];
                strcpy(model, name);
                strcpy(image, name);
                strcpy(chr, name);
                int no = order[i];
                if (no >= 0 && no < 10) {
                    strcat(chr, "w0%d");
                    sprintf(chr, chr, no);
                    strcat(model, "w0%d");
                    sprintf(model, model, no);
                    strcat(image, "w0%d");
                    sprintf(image, image, no);
                } else if (no >= 10) {
                    strcat(chr, "w%d");
                    sprintf(chr, chr, no);
                    strcat(model, "w%d");
                    sprintf(model, model, no);
                    strcat(image, "w%d");
                    sprintf(image, image, no);
                } else {
                    strcat(chr, "w01");
                    strcat(model, "w01");
                    strcat(image, "w01d");
                }
                strcat(chr, ".chr");
                strcat(model, ".img");
                strcat(image, ".mds");
                u_int *file = GetPackFile((u_int *) pack->buffer, chr, NULL);
                if (file != NULL) {
                    *(u_int **) GetMenuWeaponModelData(i) = file;
                }
            }
            u_long128 *build;
            if (effect != NULL) {
                SetWepEffectMenuReadBuf(effect->buffer);
                build = effect->buffer + 0x2D01;
            } else {
                build = shadow->buffer + (shadow->size >> 4) + 1;
            }
            MenuWeaponModelBuildBuffer = build;
            WeaponModelBuildFunc(chara, texture_block);
            break;
        }
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", EnterWeaponModel__Fiii);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1032);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1033);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1034__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1035__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1036__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1037__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1038__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1039__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1040__2);
#ifdef NON_MATCHING
void WeaponModelBuildFunc(int chara, int texture_block) {
    printf("weapon model build func start\n");
    InitMenuWeaponModelReference();
    LOADTEXTURE_INFO2 textures[] = {
        {(char *) "#frame_menuwep#640#448#4", texture_block, 0},
        {NULL, 0, 0},
    };
    char name[32];
    char cfg[32];
    TexManager.DeleteTextureBlock(texture_block);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, textures);
    printf("modelbuildbuffer = %p\n", MenuWeaponModelBuildBuffer);
    MenuExCashBuffer.base = (u_char *) MenuWeaponModelBuildBuffer;
    MenuExCashBuffer.limit = 0xEC00;
    MenuExCashBuffer.used = 0;
    int default_no;
    WEAPON_HAVE *weapons = ((CUserStatus *) BtlMenuStatusPt)->chara_weapons[chara];
    default_no = GetDefaultWeaponNo(chara);
    int next = 2;
    u_int **data = (u_int **) GetMenuWeaponModelData(0);
    BtGetWeaponNamePath2(name, cfg, chara, 0);
    DngWeaponFrm[0].LoadPackData3(*data, cfg, &MenuExCashBuffer, texture_block, &MenuExCashBuffer, 1, 0);
    data = (u_int **) GetMenuWeaponModelData(1);
    BtGetWeaponNamePath2(name, cfg, chara, 1);
    DngWeaponFrm[1].LoadPackData3(*data, cfg, &MenuExCashBuffer, texture_block, &MenuExCashBuffer, 1, 0);
    for (int i = 0; i < 10; i++) {
        WEAPON_HAVE *weapon = &weapons[i];
        if (weapon == NULL) {
            SetMenuWeaponModelReference(i, -2, -1);
            continue;
        }
        int item_no = weapon->item_no;
        if (item_no < 0x101) {
            SetMenuWeaponModelReference(i, -2, -1);
            continue;
        }
        unsigned int kind = item_no - default_no;
        if (kind < 2U) {
            SetMenuWeaponModelReference(i, kind, kind);
            continue;
        }
        int found = 0;
        for (int j = 0; j < 10; j++) {
            int *info = GetMenuWeaponModelInfo(j);
            if (info[1] == kind) {
                found = 1;
                SetMenuWeaponModelReference(i, info[0], info[1]);
                break;
            }
        }
        if (found == 0) {
            u_int **pack = (u_int **) GetMenuWeaponModelData(kind);
            if (*pack == NULL) {
                printf("%d pack data is NULL\n", kind);
            } else {
                BtGetWeaponNamePath2(name, cfg, chara, kind);
                DngWeaponFrm[next].LoadPackData3(*pack, cfg, &MenuExCashBuffer, texture_block, &MenuExCashBuffer, 1, 0);
                SetMenuWeaponModelReference(i, next, kind);
                next++;
            }
        }
    }
    WepMenuEffectReadBuf = MenuWeaponModelBuildBuffer + 0xEC01;
    WepMenuEffectReadBuf = MenuCalcBufAlignment(WepMenuEffectReadBuf);
    printf("read buffer           = %p\n", read_buffer);
    printf("model build buffer    = %p\n", MenuWeaponModelBuildBuffer);
    printf("WeaponBuffer Size     = %d\n", (int) MenuExCashBuffer.limit);
    printf("WeaponBuffer address  = %p\n", MenuExCashBuffer.base + MenuExCashBuffer.used * 16);
    printf("WepMenuEffectReadBuf = %p\n", WepMenuEffectReadBuf);
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponModelBuildFunc__Fii);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1104);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1105);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1106);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1107);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1108);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1109);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1110);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1111);
int DngWeaponEquipModelBuild(int chara, int texture_block, u_long128 *) {
    TexManager.DeleteTextureBlock(texture_block);
    u_int **first = (u_int **) GetMenuWeaponModelData(0);
    u_int **second = (u_int **) GetMenuWeaponModelData(1);
    int kind = 0;
    if (UserStatus != NULL) {
        kind = UserStatus->chara_weapons[chara][UserStatus->equipped_weapon_slot[chara]].item_no;
        kind -= GetDefaultWeaponNo(chara);
    }
    u_int **equipped = (u_int **) GetMenuWeaponModelData(kind);
    if (equipped == NULL) {
        equipped = second;
    } else if (*equipped == NULL) {
        *equipped = *second;
    }
    LoadWeapon2(*first, *second, *equipped, chara, 1);
    MenuWeaponEffectSet(1);
    return 1;
}

static int GetNowMotionStepCnt(int status) {
    int step = 0;
    if (status & 0x40) {
        step = 1;
    }
    if ((status & 4) || (status & 2)) {
        step = 2;
    }
    return step;
}

/**
 * Returns the active battle-menu status for one character.
 *
 * @mangled GetNowActiveCharaStatus__Fi
 * @address 0x20DEC0
 * @size 0x30
 */
int GetNowActiveCharaStatus(int chara_no) {
    if (BtlMenuStatusPt == NULL) {
        return 0;
    }
    return BtlMenuStatusPt->GetActiveCharaStatus(chara_no);
}
#ifdef NON_MATCHING
void SetNowCharaMotionNo(int chara) {
    int status = GetNowActiveCharaStatus(chara);
    CUserStatus *st = (CUserStatus *) BtlMenuStatusPt;
    float max_hp = st->max_hp[chara];
    float hp = st->hp[chara];
    int motion = MenuCharaFrame.motion_no;
    float speed[3] = {0.1f, 0.05f, 0.0f};
    int next = motion;

    if (!(hp < 0.3f * max_hp)) {
        next = 0;
    }
    if ((status & 0x10) || (status & 2) || hp < 0.3f * max_hp) {
        next = 1;
    }
    if (next != motion) {
        MenuCharaFrame.SetMotion(next, 0);
        motion = next;
    }
    MOTION_INFO *info = MenuCharaFrame.GetMotionInfo(motion);
    info->speed = speed[GetNowMotionStepCnt(status)];
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetNowCharaMotionNo__Fi);
#endif

/**
 * Sets the menu ambient colour for one character's status effects.
 *
 * @mangled SetItemMenuColor__Fi
 * @address 0x20E020
 * @size 0x150
 */
void SetItemMenuColor(int chara) {
    float red;
    float green;
    float blue;
    int status;
    int should_tint;

    MGGetAmbient(MenuCharaOldAmbient);
    status = GetNowActiveCharaStatus(chara);
    should_tint = 0;
    if (status & 4) {
        red = 83.0f;
        green = 104.0f;
        blue = 95.0f;
        should_tint = 1;
    }
    if (status & 0x40) {
        red = 36.0f;
        green = 148.0f;
        blue = 195.0f;
        should_tint = 1;
    }
    if (status & 0x10) {
        red = 156.0f;
        green = 122.0f;
        blue = 182.0f;
        should_tint = 1;
    }
    if (status & 0x20) {
        red = 171.0f;
        green = 40.0f;
        blue = 125.0f;
        should_tint = 1;
    }
    if (status & 8) {
        red = 230.0f;
        green = 168.0f;
        blue = 92.0f;
        should_tint = 1;
    }
    if (should_tint == 1) {
        float ambient[4];
        ambient[0] = red;
        ambient[1] = green;
        ambient[2] = blue;
        ambient[3] = 128.0f;
        MGSetAmbient(ambient);
    }
}
void SetItemMenuOldAmbient() {
    MGSetAmbient(MenuCharaOldAmbient);
}
#ifdef NON_MATCHING
int StartLoadCharaMDS(u_long128 *buffer, int chara, int read_no) {
    char path[64];
    char name[32];
    int size;

    strcpy(path, GetMenuTextureDir());
    strcat(path, "dungeon/");
    sprintf(name, "c0%dmodel.pak", chara + 1);
    strcat(path, name);
    buffer = MenuCalcBufAlignment(buffer);
    CharaFileBGReadNo = read_no;
    if (read_no == 0) {
        StartReadBG();
    }
    if (LoadFileBG(path, buffer, &size) == 0) {
        return 1;
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", StartLoadCharaMDS__FP1ii);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1176);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1177);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1178);
#ifdef NON_MATCHING
void MenuCharaMDSBuild2(int chara, int texture_block) {
    char name[32];
    int size;

    sprintf(name, "c0%ddmenu.img", chara + 1);
    LOADTEXTURE_INFO2 texture = {0};
    texture.block_no = texture_block;
    BG_READ_INFO *file = GetReadBGFile(CharaFileBGReadNo);
    texture.name = (char *) GetPackFile((u_int *) file->buffer, name, &size);
    TexManager.DeleteTextureBlock(texture_block);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, &texture);
    u_int *pack = (u_int *) file->buffer;
    u_char *model = (u_char *) pack + ((file->size >> 4) + 1) * 16;
    sprintf(name, "c0%ddmenu.cfg", chara + 1);
    MenuCharaFrame.Initialize();
    MenuExCashBuffer.base = model;
    MenuExCashBuffer.limit = 0xDC00;
    MenuExCashBuffer.used = 0;
    MenuCharaFrame.LoadPackData(pack, name, &MenuExCashBuffer, &MenuExCashBuffer, NULL);
    CFrameAttr attr;
    attr.fog_enable = 1;
    attr.unk_08 = 0;
    attr.unk_0B = 0;
    if (MenuCharaFrame.frame != NULL) {
        MenuCharaFrame.frame->SetAttr(attr, 1, 4);
    }
    sceVu0FVECTOR position[6] = {{-4.8f, -13.0f, 0.0f, 1.0f}, {-5.2f, -12.8f, 0.0f, 1.0f},
                                 {-5.0f, -11.4f, 0.0f, 1.0f}, {-5.0f, -15.0f, 0.0f, 1.0f},
                                 {-5.0f, -16.0f, 0.0f, 1.0f}, {-5.0f, -15.0f, 0.0f, 1.0f}};
    float scale[6][3] = {{1.0f, 1.0f, 1.0f}, {1.0f, 1.0f, 1.0f}, {1.0f, 1.0f, 1.0f},
                         {1.0f, 1.0f, 1.0f}, {0.9f, 0.9f, 0.9f}, {0.9f, 0.9f, 0.9f}};
    MenuCharaFrame.SetPosition(position[chara]);
    SetNowCharaMotionNo(chara);
    MenuCharaFrame.SetScale(scale[chara]);
    MenuCharaFrame.Step();
    if (chara == 0) {
        MenuCharaFrame.ClothStep(-1);
        MenuCharaFrame.ClothStep(0);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuCharaMDSBuild2__Fii);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1199__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1200);

/**
 * Writes the file path of one character's model into a buffer.
 *
 * @mangled GetCharaChangeReadCharaFilePath__FPci
 * @address 0x20E530
 * @size 0x74
 */
static void GetCharaChangeReadCharaFilePath(char *path, int chara_no) {
    strcpy(path, readFilePath);
    strcat(path, charaFile[chara_no]);
    strcat(path, CharaFileExtension);
}
#ifdef NON_MATCHING
int CharaChangeInitToGL(u_long128 *buffer, int chara) {
    char path[64];
    char name[64];
    char cfg[16];
    char effect[32];
    int size;

    CharaChangeBaseBuf = buffer;
    charachangeid = chara;
    GetCharaChangeReadCharaFilePath(MenureadFile, chara);
    CharaChangeBaseBuf = MenuCalcBufAlignment(CharaChangeBaseBuf);
    menucharReadbuf = CharaChangeBaseBuf;
    StartReadBG();
    LoadFileBG(MenureadFile, menucharReadbuf, &size);
    menud0wepReadBuf = menucharReadbuf + (size >> 4) + 1;
    menud0wepReadBuf = MenuCalcBufAlignment(menud0wepReadBuf);
    BtGetWeaponNamePath2(name, cfg, chara, 0);
    strcpy(path, MenuWepDir);
    strcat(path, name);
    LoadFileBG(path, menud0wepReadBuf, &size);
    menud1wepReadBuf = menud0wepReadBuf + (size >> 4) + 1;
    menud1wepReadBuf = MenuCalcBufAlignment(menud1wepReadBuf);
    BtGetWeaponNamePath2(name, cfg, chara, 1);
    strcpy(path, MenuWepDir);
    strcat(path, name);
    LoadFileBG(path, menud1wepReadBuf, &size);
    menud2wepReadBuf = menud1wepReadBuf + (size >> 4) + 1;
    menud2wepReadBuf = MenuCalcBufAlignment(menud2wepReadBuf);
    int kind = ((WEAPON_HAVE *) UserStatus->chara_weapons[chara])[UserStatus->equipped_weapon_slot[chara]].item_no - defWeapon__5[chara];
    if (kind < 0) {
        kind = 0;
    }
    BtGetWeaponNamePath2(name, cfg, chara, kind);
    strcpy(path, MenuWepDir);
    strcat(path, name);
    LoadFileBG(path, menud2wepReadBuf, &size);
    WepEffectMenuReadBuf = menud2wepReadBuf + (size >> 4) + 1;
    WepEffectMenuReadBuf = MenuCalcBufAlignment(WepEffectMenuReadBuf);
    if (UserStatus == NULL) {
        printf("USerStatus is NULL\n", UserStatus);
        return -1;
    }
    WepEffectMenuPt = Get_Main_EffectPtr(
        charachangeid,
        UserStatus->chara_weapons[charachangeid][(int) UserStatus->equipped_weapon_slot[charachangeid]].best_elem);
    sprintf(effect, "dun/mainchara/wep_eff/%s.chr", WepEffectMenuPt);
    LoadFileBG(effect, WepEffectMenuReadBuf, &size);
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", CharaChangeInitToGL__FP1i);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", MenuWepDir);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1205);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1206);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1207__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1208);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1209);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1210);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1236);
#ifdef NON_MATCHING
void CharaChangeInitToGL2(int load_icon) {
    int size;

    MenuWepIconCharaChangePtr = CharaChangeBaseBuf;
    if (load_icon != 0) {
        MenuWepIconCharaChangePtr = MenuCalcBufAlignment(MenuWepIconCharaChangePtr);
        size = LoadFileBGMenuData("wepicon.img", (u_long128 *) MenuWepIconCharaChangePtr);
        MenuWepIconCharaChangePtr = MenuWepIconCharaChangePtr + (size >> 4) + 1;
    }
    MenuVoiceLoadPtr = MenuWepIconCharaChangePtr;
    MenuVoiceLoadPtr = MenuCalcBufAlignment(MenuVoiceLoadPtr);
    if (SndVoiceLoadBG(charachangeid, (u_int *) MenuVoiceLoadPtr, &size) == 0) {
        printf("*** voice read err \n");
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", CharaChangeInitToGL2__Fi);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1242);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1243);
#ifdef NON_MATCHING
void BtMenuLoadChara() {
    s8 chara = charachangeid;
    CUserStatus *status = UserStatus;
    status->cur_chara = chara;
    LoadChara2((s16) charachangeid, 0, (u_int *) menucharReadbuf, (u_int *) menud0wepReadBuf,
               (u_int *) menud1wepReadBuf, (u_int *) menud2wepReadBuf);
    SetWeaponAttachStatus(NowWeaponHave);
    CWeaponFx.InitSet(NowWeapon->frame, "dcol0", "dcol1");
    SetWeaponColor();
    MainChara_Effect(WepEffectMenuPt, (u_int *) WepEffectMenuReadBuf, 0);
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", BtMenuLoadChara__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1250);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1251);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1254);
#ifdef NON_MATCHING
void BtMenuLoad2(int load_texture) {
    if (load_texture != 0) {
        BG_READ_INFO *file = GetReadBGFile(0);
        LOADTEXTURE_INFO2 textures[] = {
            {(char *) "#frame_image#640#448#4", MenuShadowReadBlock, 0},
            {(char *) file->buffer, MenuShadowReadBlock, 0},
            {NULL, 0, 0},
        };
        TexManager.DeleteTextureBlock(MenuShadowReadBlock);
        TexManager.LoadTextureBlockEX(-1, textures);
        MenuTextureReload(MenuShadowReadBlock);
        DngActiveWeaponTextureCopy();
    }
    SndVoiceSyncBG();
    BtActStatus.unk_000 = 1;
    BtActStatus.unk_00C = 0;
    BtActStatus.action_on = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", BtMenuLoad2__Fi);
#endif

/**
 * Checks whether all East King event flags are set.
 *
 * @mangled EastKingCheckComplete__Fv
 * @address 0x20EAE0
 * @size 0x80
 */
int EastKingCheckComplete() {
    if (SaveData == NULL) {
        return 0;
    }

    int complete = 1;
    for (int i = 0; i < 12; i++) {
        if (SaveData->GetGameFlag(i + 0xE6) == 0) {
            complete = 0;
        }
    }
    return complete;
}

void SetMonsterNameDrawFlag(int flag) {
    CharaNameDrawFlag = flag;
}

int GetMonsterNameDrawFlag() {
    return CharaNameDrawFlag;
}

#ifdef NON_MATCHING
void MonsterNameInit(ClsMes *mes, short *buff, unsigned char *texture_buffer) {
    CharaNameMes = NULL;
    if (mes == NULL) {
        printf("cls init failed\n");
        return;
    }
    CharaNameMes = mes;
    mes->text_columns = 0x46;
    mes->text_rows = 10;
    mes->text_len = 0;
    mes->text_width = 0;
    mes->text_height = 0;
    mes->fade = 0.0f;
    mes->fade_in = 1;
    mes->text_rate = mes->text_rate_set;
    mes->waiting = 0;
    mes->text_at = 0.0f;
    mes->text_no = 0;
    mes->text_from = 0;
    mes->page_from = 0;
    mes->InitMesWinTbl();
    mes->clut_now = mes->clut_default;
    mes->wait = 0;
    mes->blink = 0;
    mes->auto_page_wait = 0;
    mes->mes_made = -1;
    mes->edge_alpha = 0x80;
    for (int i = 0; i < 10; i++) {
        mes->mes_no[i] = -1;
    }
    for (int i = 0; i < 8; i++) {
        mes->values[i] = 0;
    }
    mes->value = 0;
    mes->value_signed = 0;
    mes->value_show = 1;
    mes->value_narrow = 0;
    mes->space_width = -1;
    mes->space_area = -1;
    mes->cursor_row = -1;
    mes->cursor_y = 0;
    mes->cursor_lit = 0;
    for (int i = 0; i < 10; i++) {
        mes->line_pos[i].x = -1;
        mes->line_pos[i].y = -1;
    }
    CharaNameMes->Preset(4);
    CharaNameMes->tex_block = 0x1A;
    CharaNameMes->unk_17B0 = texture_buffer;
    CharaNameMes->rows = 1;
    CharaNameMes->SetBuff(buff);
    CharaNameMes->SetBuff_system(SystemMes);
    CharaNameDrawFlag = 1;
    int *config = (int *) SaveData->GetConfigData();
    if (config != NULL) {
        CharaNameDrawFlag = !config[8];
    }
    CharaNameDrawCase = 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNameInit__FP6ClsMesPsPUc);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1287__2);

void MonsterNameMake(int mes_no) {
    if (CharaNameMes != NULL) {
        int mes = mes_no + 3000;
        if (CharaNameMes->mes_made != mes) {
            CharaNameMes->MakeMesWin(mes);
            if (mes == 3000) {
                CharaNameMes->stay_frame = 0;
            } else {
                CharaNameMes->stay_frame = 1;
            }
        }
    }
}

void MonsterNamePosSet(int x, int y) {
    if (CharaNameMes != NULL) {
        int columns = CharaNameMes->text_columns;
        CharaNameMes->text_x = x - columns * 14 / 2;
        if (y % 2 != 0) {
            y++;
        }
        CharaNameMes->text_y = y;
    }
}
void MonsterNameDraw() {
    if (CharaNameMes == NULL || GetMonsterNameDrawFlag() == 0) {
        return;
    }
    if (((int *) SaveData->GetConfigData())[8] == 0) {
        ClsMes *mes = CharaNameMes;
        if (mes->mes_made >= 0) {
            int width = mes->text_columns;
            width = mes->char_width * width + 0x20;
            if (mes->text_x < 0x22 || mes->text_x >= 0x26D || mes->text_y < 0x1E || mes->text_y >= 0x199 ||
                width >= 0xFB || width < 10) {
                SetMonsterNameDrawFlag(0);
                return;
            }
            mes->cursor_row = -1;
            MenuTextureReload(CharaNameMes->tex_block);
            setbilinear(0);
            CharaNameMes->Step();
            CharaNameMes->DrawMesWin();
        }
    }
}
#ifdef NON_MATCHING
void DngEscapeMsgInit(ClsMes *title, ClsMes *choice, int dungeon) {
    char path[64];
    char name[8] = "d0%do";
    int size[4];

    if (title == NULL || choice == NULL) {
        return;
    }
    if (UserStatus == NULL) {
        return;
    }
    int no = UserStatus->cur_georama + 1;
    strcpy(path, GetMenuTextureDir());
    strcat(path, "d0%do.img");
    sprintf(path, path, no);
    LoadFile(path, read_buffer, &size[0]);
    LOADTEXTURE_INFO2 texture = {0};
    texture.block_no = 0x17;
    texture.name = (char *) read_buffer;
    TexManager.DeleteTextureBlock(0x17);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, &texture);
    GamePad.MenuModeOn(0x78);
    GamePad.SetAutoRepeat(0xF000, 0x1E, 5);
    sprintf(name, name, no);
    DngEscapeTex = TexManager.GetTexture(name, -1);
    CharaNameMes = title;
    DngMenuMes = choice;
    int lang = GetMenuLangFlag();
    u8 title_x[7] = {0xB4, 0xA0, 0xA0, 0xA0, 0xA0, 0xA0, 0xA0};
    CharaNameMes->text_x = title_x[lang];
    CharaNameMes->text_y = 0x8C;
    CharaNameMes->mes_made = -1;
    CharaNameMes->MakeMesWin(dungeon + 0x14);
    s16 choice_x[7] = {0x154, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0, 0xF0};
    DngMenuMes->mes_made = -1;
    DngMenuMes->MakeMesWin(12);
    DngMenuMes->NeedMesWinWH(DngMenuMes->mes_made, size);
    DngMenuMes->text_x = 0x280 - size[2] - 0x26;
    DngMenuMes->text_y = 0x140;
    DngEscapeSelect = 1;
    DngEscapeEndFlag = 0;
    DngEscapeAlpha = 0x80;
    DngEscapeBlock = 0x17;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngEscapeMsgInit__FP6ClsMesP6ClsMesi);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1341);

void DngEscapeMsgDraw() {
    AllFadeForMenu(0x80);
    if (CharaNameMes == NULL || DngMenuMes == NULL) {
        return;
    }

    MenuTextureReload(DngEscapeBlock);
    DrawFullSizePicture(DngEscapeTex, 0, 0, 0x80);
    MenuTextureReload(CharaNameMes->tex_block);
    setbilinear(0);
    CharaNameMes->stay_frame = 1;
    CharaNameMes->Step();
    DngMenuMes->Step();
    CharaNameMes->DrawMesWin();
    DngMenuMes->DrawMesWin();

    if (DngEscapeEndFlag != 0) {
        DngEscapeAlpha += 3;
        if (DngEscapeAlpha > 0x80) {
            DngEscapeAlpha = 0x80;
        }
    } else {
        DngEscapeAlpha -= 3;
        if (DngEscapeAlpha < 0) {
            DngEscapeAlpha = 0;
        }
    }
    AllFadeForMenu(DngEscapeAlpha);
}

int DngEscapeMsgLoop() {
    int result = 0;

    if (DngEscapeEndFlag == 0) {
        if (GamePad.Down(0x5000) != 0) {
            if (DngEscapeSelect == 2) {
                DngEscapeSelect = 1;
            } else if (DngEscapeSelect == 1) {
                DngEscapeSelect = 2;
            }
            ComMenuSePlay(0);
        }
        int row = DngEscapeSelect - 1;
        ClsMes *mes = CharaNameMes;
        mes->cursor_row = row;
        if (GamePad.Down(0x40) != 0) {
            DngEscapeEndFlag = 1;
            ComMenuSePlay(1);
        }
        if (GamePad.Down(0x20) != 0) {
            ComMenuSePlay(2);
        }
    } else if (DngEscapeAlpha >= 0x80) {
        result = DngEscapeSelect;
        GamePad.AutoRepeatOff();
        GamePad.MenuModeOff();
        ItemVolumeStep.CheckItemVolume();
        ClsMes *mes = CharaNameMes;
        mes->cursor_row = -1;
    }
    ItemVolumeStep.LoopStep(0x3C);
    DngEscapeMsgDraw();
    return result;
}
#ifdef NON_MATCHING
int CheckItemThrow(int *items, int *values) {
    int found = 0;
    ITEM_PACK *pack = &((CUserStatus *) BtlMenuStatusPt)->item_pack;

    for (int i = 0; i < 3; i++) {
        int item_no = pack->item[pack->num + i];
        if (item_no >= 0x84) {
            found++;
            if (items != NULL) {
                items[i] = item_no;
            }
            if (values != NULL) {
                values[i] = 0;
            }
        }
    }
    for (int i = 0; i < 6; i++) {
        WEAPON_HAVE *weapon = &((CUserStatus *) BtlMenuStatusPt)->chara_weapons[i][10];
        int item_no = weapon->item_no;
        if (item_no >= 0x101) {
            found++;
            if (items != NULL) {
                items[3] = item_no;
            }
            if (values != NULL) {
                values[3] = weapon->unk_02;
            }
            break;
        }
    }
    DNG_CONSUMABLE *extra = &((CUserStatus *) BtlMenuStatusPt)->consumable_items[40];
    for (int i = 0; i < 3; i++) {
        ATTACH_LIST *list = (ATTACH_LIST *) &extra[i];
        int item_no = list->item_no;
        if (item_no >= 0x51) {
            found++;
            if (items != NULL) {
                items[i + 4] = item_no;
            }
            if (values != NULL && item_no >= 0x5B && item_no < 0x5F) {
                values[i + 4] = ((s16 *) list)[item_no - 0x5A];
            }
            if (values != NULL && item_no == 0x5A) {
                values[i + 4] = list->unk_02;
            }
        }
    }
    int any = 0;
    if (found > 0) {
        any = 1;
    }
    return any;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", CheckItemThrow__FPiPi);
#endif
void SetWeaponElementStatus(WEAPON_HAVE *weapon) {
    if (weapon->best_elem >= 5) {
        weapon = (WEAPON_HAVE *) weapon;
    }
    int best = 0;

    for (int i = 1; i < 5; i++) {
        if (weapon->elem[i] > weapon->elem[best]) {
            best = i;
        }
    }
    weapon->best_elem = best;
}

int CheckWeaponOptionStatus(int options) {
    // Each pair of opposed options cancels out when both are set.
    if ((options & 2) && (options & 4)) {
        options &= ~6;
    }
    if ((options & 8) && (options & 0x10)) {
        options &= ~0x18;
    }
    if ((options & 0x100) && (options & 0x200)) {
        options &= ~0x300;
    }
    if ((options & 0x400) && (options & 0x800)) {
        options &= ~0xC00;
    }
    return options;
}

int IsWeaponOptionGoodOrBad(int option) {
    // Whether each of the fourteen weapon options is a benefit (1) or a drawback (0).
    s16 good_or_bad[14] = { 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1 };
    return good_or_bad[option];
}

int DefaultWeaponOptionSet(int weapon_no) {
    WEAPON_DATA *data = GetWeaponData(weapon_no);
    if (data == NULL) {
        return 1;
    }
    return data->flags;
}

#ifdef NON_MATCHING
void WeaponOptionStatusDraw(WEAPON_HAVE *weapon, int x, int y, int alpha) {
    int draw_x = x;
    int draw_y = y;
    int flags = weapon->flags;

    for (int i = 0; i < 6; i++) {
        int option = ((ATTACH_LIST *) &weapon->attach[i])->unk_04;
        if (option != 0 && option != 1) {
            flags |= option;
        }
    }
    int status = CheckWeaponOptionStatus(flags);
    CTexture *texture = TexManager.GetTexture("charaface", -1);
    if (texture == NULL) {
        return;
    }
    int count = 0;
    CRect_i_ source(0xEC, 0x50, 0x14, 0x14);
    for (int bit = 1; bit < 14; bit++) {
        if (bit == 8) {
            source.x -= source.width;
        }
        if (status & (1 << bit)) {
            int row = bit;
            if (bit >= 8) {
                row = bit - 7;
            }
            if (bit == 8 && row == 1) {
                row++;
            }
            if (bit == 9 && row == 2) {
                row--;
            }
            source.y = source.height * (row - 1) + 0x50;
            DrawMenu2DSprite(texture, CRect_i_(draw_x, draw_y, 0x14, 0x15), source, alpha);
            draw_x += source.width;
            count++;
            if (count == 5) {
                draw_x = x;
                draw_y += source.height;
            }
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponOptionStatusDraw__FP11WEAPON_HAVEiii);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1507);
#ifdef NON_MATCHING
void WeaponStarDraw(int x, int y, WEAPON_HAVE *weapon, int alpha) {
    if (weapon == NULL) {
        return;
    }
    CTexture *texture = TexManager.GetTexture("wepstatus", -1);
    int stars = weapon->unk_F0;
    if (stars > 49) {
        stars = 49;
    }
    int draw_x = x + 0x4C;
    CRect_i_ big(0x108, 0x176, 0x18, 0x18);
    for (int i = 0; i < stars / 10; i++, draw_x += big.width) {
        DrawMenu2DSprite(texture, CRect_i_(draw_x, y, big.width, big.height), big, alpha);
    }
    x -= 6;
    for (int i = 0; i < stars % 10; i++, x += 0x14) {
        DrawMenu2DSprite(texture, CRect_i_(x, y + 0x16, 0x14, 0x14), CRect_i_(0x10A, 0x162, 0x14, 0x14), alpha);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponStarDraw__FiiP11WEAPON_HAVEi);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1536);

/**
 * Randomly reduces one value in a weapon's status array.
 *
 * @mangled LocalWeaponDataChange__FPciii
 * @address 0x20FBE0
 * @size 0xF8
 */
static void LocalWeaponDataChange(char *values, int count, int base, int range) {
    if (values == NULL) {
        printf("target is NULL\n");
        return;
    }

    int selected = rand() % count;
    int reduction = base + rand() % range;
    char *value = values;
    int i = 0;
    while (i < count) {
        if (i == selected) {
            *value -= reduction;
            if (*value < 0) {
                *value = 0;
            }
            break;
        }
        i++;
        value++;
    }
}
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1616__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1617__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1618__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1619__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1620__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1621__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1622__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1623__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1624__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1625__2);
#ifdef NON_MATCHING
int WeaponDataChangeByRGate(WEAPON_HAVE *weapon, int kind) {
    if (weapon == NULL) {
        return -1;
    }
    int is_default = 0;
    int i;
    for (i = 0; i < 6; i++) {
        if (weapon->item_no == defWeapon__5[i]) {
            is_default = 1;
        }
    }
    switch (kind) {
        case 0:
            printf("abs full\n", i);
            if (is_default == 1) {
                printf("this weapon default\n");
            } else {
                weapon->unk_14 = GetWeaponMaxExp(weapon);
            }
            break;
        case 1:
            if (IsDefaultWeapon(weapon->item_no) >= 0) {
                printf("default Weapon\n");
            } else {
                int stat = rand() % 4;
                int loss = rand() % 3 + 2;
                switch (stat) {
                    case 0:
                        weapon->attack -= loss;
                        if (weapon->attack <= 0) {
                            weapon->attack = 1;
                        }
                        break;
                    case 1:
                        weapon->endurance -= loss;
                        if (weapon->endurance < 0) {
                            weapon->endurance = 0;
                        }
                        break;
                    case 2:
                        weapon->speed -= loss;
                        if (weapon->speed < 0) {
                            weapon->speed = 0;
                        }
                        break;
                    case 3:
                        weapon->magic -= loss;
                        if (weapon->magic < 0) {
                            weapon->magic = 0;
                        }
                        break;
                }
                LocalWeaponDataChange(weapon->elem, 5, 2, 3);
                LocalWeaponDataChange(weapon->vs_monster, 3, 2, 2);
                LocalWeaponDataChange(&weapon->vs_monster[3], 3, 2, 2);
                LocalWeaponDataChange(&weapon->vs_monster[6], 4, 2, 2);
            }
            break;
        case 2:
            if (IsDefaultWeapon(weapon->item_no) >= 0) {
                printf("this weapon No.%d is default\n", weapon->item_no);
            } else {
                int add = rand() % 3 + 3;
                weapon->durability += add;
                if (weapon->durability >= 100) {
                    weapon->durability = 99;
                }
                printf("WHp up is %d\n", add);
                printf("now MaxWHp is %d\n", weapon->durability);
            }
            break;
        case 3:
            if (IsDefaultWeapon(weapon->item_no) < 0) {
                int loss = rand() % 3 + 3;
                weapon->durability -= loss;
                float durability = weapon->durability;
                if (durability < weapon->durability_f) {
                    weapon->durability_f = durability;
                }
                if (weapon->durability <= 0) {
                    weapon->durability = 1;
                }
                printf("WHp down is %d\n", loss);
                printf("now MaxWHp is %d\n", weapon->durability);
            }
            break;
        case 4:
            printf("whp cure\n", i);
            if (is_default == 1) {
                if (UserStatus != NULL) {
                    int chara = UserStatus->cur_chara;
                    EquipWeaponFrame(&DefaultWeapon, chara, CharaMainHandViewFlag);
                    if (chara == 5) {
                        NowMainEffect = &CharaMainEffectCrash;
                        BtActStatus.unk_0A0 = 0;
                    }
                    MenuWeaponSpSet(&MainWeapon, &UserStatus->chara_weapons[chara][UserStatus->equipped_weapon_slot[chara]]);
                    printf("equip default Weapon\n");
                }
            } else {
                weapon->durability_f = weapon->durability;
            }
            break;
        case 5: {
            float durability = weapon->durability_f / 4.0f;
            weapon->durability_f = durability;
            if (durability < 1.0f) {
                weapon->durability_f = 1.0f;
            }
            break;
        }
        default:
            printf("now %d  ??? \n", i);
            break;
    }
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponDataChangeByRGate__FP11WEAPON_HAVEi);
#endif
