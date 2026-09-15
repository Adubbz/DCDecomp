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
#include "frame.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "memcard.hpp"
#include "menu_draw.hpp"
#include "menu_manual.hpp"
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

extern CDataAlloc2<1> MenuExCashBuffer;
extern CCharacter MenuCharaFrame;
extern CCharacter DngWeaponFrm[12];
extern "C" CWeaponEffect CWeaponFx;

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

INCLUDE_ASM("asm/nonmatchings/menu_misc", NowGetGameFlagForBtlMenu__Fi);

int GetMenuHebikiriFlag() {
    return SaveData->GetGameFlag(0x30);
}

INCLUDE_ASM("asm/nonmatchings/menu_misc", EquipDefaultWeapon__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", DrawMenuNothing__FiiiiPcii);

int GetMenuItemUseVolume() {
    return MenuItemUseVolume;
}

INCLUDE_ASM("asm/nonmatchings/menu_misc", ItemUseFunc__FP11CUserStatusiiiP11WEAPON_HAVE);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @869);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @870__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @871__2);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetNowWeaponRate__FP11WEAPON_HAVE);

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

INCLUDE_ASM("asm/nonmatchings/menu_misc", WeaponStatusBuildUp__FP11WEAPON_HAVERi);
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
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuWeaponEffectSet__Fi);

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
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuWeaponModelData__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", InitMenuWeaponModelData__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuWeaponModelInfo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", InitMenuWeaponModelReference__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetMenuWeaponModelReference__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetMenuWeaponModelFrameNo__Fi);
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

INCLUDE_ASM("asm/nonmatchings/menu_misc", GetNowActiveCharaStatus__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetNowCharaMotionNo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetItemMenuColor__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_misc", SetItemMenuOldAmbient__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_misc", StartLoadCharaMDS__FP1ii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1176);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1177);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1178);
INCLUDE_ASM("asm/nonmatchings/menu_misc", MenuCharaMDSBuild2__Fii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1199__2);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1200);
INCLUDE_ASM("asm/nonmatchings/menu_misc", GetCharaChangeReadCharaFilePath__FPci);
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
INCLUDE_ASM("asm/nonmatchings/menu_misc", EastKingCheckComplete__Fv);

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
INCLUDE_ASM("asm/nonmatchings/menu_misc", DngEscapeMsgDraw__Fv);
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

INCLUDE_ASM("asm/nonmatchings/menu_misc", IsWeaponOptionGoodOrBad__Fi);

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
INCLUDE_ASM("asm/nonmatchings/menu_misc", LocalWeaponDataChange__FPciii);
INCLUDE_RODATA("asm/nonmatchings/menu_misc", @1549__2);
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
