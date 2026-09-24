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
#include "menu_manual.hpp"
#include "mglib.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "weapon_buildup.hpp"
#include "weaponeffect.hpp"

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
INCLUDE_ASM("asm/nonmatchings/menu_misc", DrawMenuNothing__FiiiiPcii);

int GetMenuItemUseVolume() {
    return MenuItemUseVolume;
}

INCLUDE_ASM("asm/nonmatchings/menu_misc", ItemUseFunc__FP11CUserStatusiiiP11WEAPON_HAVE);
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
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuWeaponSpSet__FP10CCharacterP11WEAPON_HAVE);
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

INCLUDE_ASM("asm/nonmatchings/menu_misc", DngWepEffectReadStart__Fv);
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

INCLUDE_ASM("asm/nonmatchings/menu_misc", StartReadWepMDS__FP1i);
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
INCLUDE_ASM("asm/nonmatchings/menu_misc", EnterWeaponModel__Fiii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1032);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1033);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1034__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1035__3);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1036__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1037__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1038__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1039__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1040__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponModelBuildFunc__Fii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1104);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1105);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1106);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1107);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1108);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1109);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1110);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1111);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngWeaponEquipModelBuild__FiiP1);

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
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetNowCharaMotionNo__Fi);

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
INCLUDE_ASM("asm/nonmatchings/menu_misc", StartLoadCharaMDS__FP1ii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1176);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1177);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1178);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuCharaMDSBuild2__Fii);
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
INCLUDE_ASM("asm/nonmatchings/menu_misc", CharaChangeInitToGL__FP1i);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", MenuWepDir);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1205);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1206);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1207__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1208);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1209);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1210);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1236);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CharaChangeInitToGL2__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1242);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1243);
INCLUDE_ASM("asm/nonmatchings/menu_misc", BtMenuLoadChara__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1250);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1251);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1254);
INCLUDE_ASM("asm/nonmatchings/menu_misc", BtMenuLoad2__Fi);

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

INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNameInit__FP6ClsMesPsPUc);
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

INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNamePosSet__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MonsterNameDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngEscapeMsgInit__FP6ClsMesP6ClsMesi);
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

INCLUDE_ASM("asm/nonmatchings/menu_misc", DngEscapeMsgLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", CheckItemThrow__FPiPi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetWeaponElementStatus__FP11WEAPON_HAVE);

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

INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponOptionStatusDraw__FP11WEAPON_HAVEiii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1507);
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponStarDraw__FiiP11WEAPON_HAVEi);
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
INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponDataChangeByRGate__FP11WEAPON_HAVEi);
