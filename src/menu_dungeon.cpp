#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 638

#include "menu_dungeon.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "camera.hpp"
#include "clsmes.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "editatra.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "mainitemmodel.hpp"
#include "memcard.hpp"
#include "memorycardaccess.hpp"
#include "menu_inventory.hpp"
#include "menuitemstep.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

DUN_ENTER_MENU DEnterMenu;
CDngStatusData *DEnterStatusPt;
int MenuEtcErrCnt;

/** Number of floors available in each dungeon. */
static int maxFloorTbl__4[7] = {15, 17, 18, 18, 15, 25, 100};

/** Texture of the dungeon entrance board. */
extern CTexture *DunLogBoard;

/**
 * Adds one attachment's values into another, scaled by a factor.
 *
 * @mangled PlusAttachmentVolume__FP11ATTACH_LISTP11ATTACH_LISTf
 * @address 0x225810
 * @size 0x158
 */
static void PlusAttachmentVolume(ATTACH_LIST *, ATTACH_LIST *, float);

/**
 * Restores the pad and textures when the dungeon entrance menu closes.
 *
 * @mangled ExitDunEnterMenu__Fv
 * @address 0x226520
 * @size 0x70
 */
static void ExitDunEnterMenu(void);

/**
 * Handles key input on the dungeon entrance menu.
 *
 * @mangled DunEnterMenuKey__Fv
 * @address 0x226620
 * @size 0x6EC
 */
static int DunEnterMenuKey(void);

/**
 * Draws the dungeon entrance menu.
 *
 * @mangled DunEnterDraw__Fv
 * @address 0x226D10
 * @size 0x538
 */
static void DunEnterDraw(void);

/**
 * Draws the frame of the dungeon entrance board.
 *
 * @mangled DunEnterBoardWaku__Fiii
 * @address 0x227250
 * @size 0x4AC
 */
static void DunEnterBoardWaku(int, int, int);

/**
 * Draws the dungeon entry board.
 *
 * @mangled DunEnterBoard__Fiii
 * @address 0x227700
 * @size 0x7C0
 */
static void DunEnterBoard(int, int, int);

/**
 * Draws a number right to left, one digit at a time, clipped to the board.
 *
 * @mangled DrawEnemyNum__Fiiiiii
 * @address 0x227EC0
 * @size 0x154
 */
static void DrawEnemyNum(int, int, int, int, int, int);

/**
 * Draws the collected Atla count on the dungeon entrance board.
 *
 * @mangled DrawGetAtoraNumBoard__Fiiiiii
 * @address 0x228020
 * @size 0x248
 */
static void DrawGetAtoraNumBoard(int, int, int, int, int, int);

/**
 * Draws one digit of the dungeon board's numbers, clipped to the board.
 *
 * @mangled DrawDunNumberClip__Fiiiiii
 * @address 0x228270
 * @size 0xDC
 */
static void DrawDunNumberClip(int, int, int, int, int, int);

/**
 * Draws the dungeon entry screen's background and its darkening box.
 *
 * @mangled DrawDunEnterBack__Fi
 * @address 0x228350
 * @size 0x9C
 */
static void DrawDunEnterBack(int);

/**
 * Draws the floor's name and number on the dungeon entry board.
 *
 * @mangled DrawDunEnterFloorName__Fiiiiii
 * @address 0x2283F0
 * @size 0x290
 */
static void DrawDunEnterFloorName(int, int, int, int, int, int);

/**
 * Sets up the item preview's model and textures once they have been read.
 *
 * @mangled EnterItemPolygonView__Fv
 * @address 0x22AD20
 * @size 0x21C
 */
static int EnterItemPolygonView(void);

/**
 * Turns and scales the item model under pad control, then draws it.
 *
 * @mangled LocalDrawItemPolygonView__Fv
 * @address 0x22AF40
 * @size 0x26C
 */
static void LocalDrawItemPolygonView(void);

/**
 * Maps a debug item selection to its spreadsheet item number.
 *
 * @mangled ConvDebugSelectToExcelListNo__Fi
 * @address 0x22B1F0
 * @size 0x4C
 */
static int ConvDebugSelectToExcelListNo(int selection);

/**
 * Draws the debug overlay listing an item's data.
 *
 * @mangled DrawItemDataView__Fi
 * @address 0x22B7C0
 * @size 0x230
 */
static void DrawItemDataView(int);

static void PlusAttachmentVolume(ATTACH_LIST *base, ATTACH_LIST *add, float scale) {
    int i;

    for (i = 0; i < 4; i++) {
        base->status[i] += add->status[i] * scale;
    }
    for (i = 0; i < 5; i++) {
        base->elem[i] += add->elem[i] * scale;
    }
    for (i = 0; i < 10; i++) {
        base->vs_monster[i] += add->vs_monster[i] * scale;
    }
}
int GetWeaponAttachStatusUp(WEAPON_HAVE *weapon, int stat) {
    int total;
    int i;

    if (GetWeaponData(weapon->item_no) == NULL || weapon->item_no < 0x101) {
        return 0;
    }

    total = 0;
    for (i = 0; i < 6; i++) {
        if (weapon->attach[i].item_no - 0x51 < 0) {
            continue;
        }

        int multiplier = 1;
        if (weapon->attach_kind[i] == 3) {
            multiplier = 2;
        }

        ATTACH_LIST *attach = &weapon->attach[i];
        if (stat < 5) {
            total += attach->status[stat - 1] * multiplier;
        } else if (stat >= 8 && stat < 0xD) {
            total += attach->elem[stat - 8] * multiplier;
        } else {
            total += attach->vs_monster[stat - 14] * multiplier;
        }
    }
    return total;
}
void SetWeaponAttachStatus(WEAPON_HAVE *attach_source) {
    if (attach_source == NULL) {
        return;
    }

    CDngStatusData *dng_status = SaveData->GetDngStatus();
    if (dng_status == NULL) {
        printf("cdng is NULL!!!!\n");
        return;
    }

    int chara = dng_status->unk_04;
    int slot = dng_status->equipped_weapon_slot[chara];
    WEAPON_HAVE *weapons = dng_status->chara_weapons[chara];
    WEAPON_HAVE *equipped = &weapons[slot];
    if (equipped == NULL) {
        printf("actwep is NULL\n", chara);
        return;
    }

    WeaponAllValueSet(equipped, attach_source, 0);
}
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", SetAttachMentValue__FiisP11ATTACH_LIST);

int GetAttachVolumeForMsg(ATTACH_LIST *attach) {
    int volume;

    if (attach == NULL) {
        return 0;
    }
    volume = 0;
    if (attach->item_no >= 0x5B && attach->item_no < 0x5F) {
        volume = attach->status[attach->item_no - 0x5B];
    }
    if (attach->item_no == 0x5A) {
        volume = attach->stat_00;
    }
    return volume;
}

INCLUDE_ASM("asm/nonmatchings/menu_dungeon", InitDunEnterMenu__Fiii);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @762__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @763__3);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @764__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @765__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @776__3);

static void ExitDunEnterMenu() {
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
    MenuTextureReload(DEnterMenu.texture_block);
    DngActiveItemTextureCopy();
    DngActiveWeaponTextureCopy();
    TexManager.DeleteTextureBlock(DEnterMenu.texture_block);
}

int DunEnterMenuLoop() {
    rand();
    ReadBG();
    int result = DunEnterMenuKey();
    DunEnterDraw();
    ItemVolumeStep.LoopStep(60);
    if (0 <= result) {
        ExitDunEnterMenu();
        ItemVolumeStep.CheckItemVolume();
        result = DEnterMenu.result;
    }
    return result;
}
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DunEnterMenuKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @843__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @844);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @845);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @846);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @847);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DunEnterDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DunEnterBoardWaku__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DunEnterBoard__Fiii);

static void DrawEnemyNum(int x, int y, int top, int bottom, int number, int alpha) {
    int digits;
    int position;
    int source;
    int length;
    int u;
    int digit;

    for (digits = GetNumberKeta(number); 0 < digits; digits--) {
        position = y;
        digit = number % 10;
        x -= 11;
        u = digit * 12 + 0x20;
        source = 0x48;
        length = 12;
        MenuTextureClip(position, source, length, top, bottom);
        DrawMenu2DSprite(DunLogBoard, CRect_i_(x, position, 12, length - 1), CRect_i_(u, source, 12, length), alpha);
        number /= 10;
    }
}

INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawGetAtoraNumBoard__Fiiiiii);

static void DrawDunNumberClip(int x, int y, int top, int bottom, int digit, int alpha) {
    int position;
    int source;
    int length;
    int u;

    position = y;
    u = digit * 12 + 0x20;
    source = 0x48;
    length = 12;
    MenuTextureClip(position, source, length, top, bottom);
    if (position < bottom) {
        DrawMenu2DSprite(DunLogBoard, CRect_i_(x, position, 12, length), CRect_i_(u, source, 12, length), alpha);
    }
}

INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawDunEnterBack__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1255__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1301);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawDunEnterFloorName__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", StartQuickChange__FP1iPii);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1348__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1349);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1350__3);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", CharaChangeLoop__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1373);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1374);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1375);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", CharaChangeKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", CharaChangeDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DngActItemModelReadStart__FP1);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1663);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1664__2);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DngActItemModelBuild__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DngActiveItemTextureCopy__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1728__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1841);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2044);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2045);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2046);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2047);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2048);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2049);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2050);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2051);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DngActiveWeaponTextureCopy__Fv);

s32 GetWeaponMsgNo(WEAPON_HAVE *weapon) {
    s16 item_no;

    if (weapon == NULL) {
        return 0;
    }
    item_no = weapon->item_no;
    if (item_no < 0x101) {
        return 0x3E7;
    }
    return GetCommonItemInfo((s32) item_no)->msg + 0x64;
}

s16 GetWeaponMsgNo2(s32 item_no) {
    COM_ITEM_INFO *info;

    info = GetCommonItemInfo(item_no);
    if (info != NULL) {
        return info->msg;
    }
    return 0;
}
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawWepAttach__FiiP11WEAPON_HAVEii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", GetAtraTipNowHave__Fii);

int GetDispVolumeForFloat(float volume) {
    int whole;
    int shown;

    whole = (int) volume;
    shown = whole;
    if (volume - (float) whole > 0.0) {
        shown += 1;
    }
    return shown;
}
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", InitItemPolygonView__FiP1);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", EnterItemPolygonView__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", LocalDrawItemPolygonView__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawItemPolygonView__Fv);

static int ConvDebugSelectToExcelListNo(int selection) {
    int item_no;

    item_no = selection + 0x81;
    if ((item_no > 0x160) && (item_no < 0x138)) {
        return -1;
    }
    if ((selection >= 0xF8) && (selection < 0x120)) {
        item_no = selection - 0xA7;
    }
    return item_no;
}
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DebugItemGetKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DebugItemGetDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawItemDataView__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2140__2);
