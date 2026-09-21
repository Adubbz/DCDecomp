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

/** Screen rectangle the menus draw full-screen pictures into. */
extern CRect_i_ MenuDispRc;

/** Texture block the battle menu's extra textures load into. */
extern int BtlMenuExReadBlock;

/** Texture of the dungeon entrance board. */
extern CTexture *DunLogBoard;

/** Dungeon progress the battle menus show. */
extern CDngStatusData *BtlMenuStatusPt;

/** Model the item preview shows. */
extern CFrame *ItemPolyView;

/** Set while the debug item preview is shown. */
extern int MDebugItemPolyViewFlag;

/** Set once the item preview's files have been read. */
extern int polyreadflag;

/** Position the debug item preview draws its model at. */
extern float menudebugpos[4];

/** Rotation the debug item preview turns its model to. */
extern float menudebugrot[3];

/** Scale the debug item preview draws its model at. */
extern float menudebugrscale[3];

/**
 * Resolves the model and texture paths for a battle item.
 *
 * @mangled BtGetItemNamePath__FPcPci
 * @address 0x1B7120
 * @size 0x124
 */
void BtGetItemNamePath(char *model_path, char *texture_path, int item_no);

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

int InitDunEnterMenu(int texture_block, int dungeon, int requested_floor) {
    char path[76];
    int size;
    u_long128 *buffer;
    int first_open;
    int floor;
    s8 lines;

    SaveData->QuestDungeon(dungeon, 1);
    DEnterStatusPt = (CDngStatusData *) UserStatus;
    StartReadBG();
    buffer = (u_long128 *) read_buffer;
    buffer = MenuCalcBufAlignment(buffer);
    DEnterMenu.dungeon = dungeon;
    GetPathReadDifferntLang(path);
    strcat(path, "dunenter/dunenter%d.pak");
    sprintf(path, path, DEnterMenu.dungeon);
    LoadFileBG(path, buffer, &size);
    ReadBG();
    MenuEtcErrCnt = 0;
    DEnterMenu.texture_block = texture_block;
    DEnterMenu.unk_00C = 0;
    DEnterMenu.unk_00E = 1;
    DEnterMenu.counter = 0;
    DEnterMenu.state = 1;
    DEnterMenu.requested_floor = requested_floor;
    if (requested_floor >= 0) {
        DEnterMenu.state = 3;
        return 1;
    }
    first_open = -1;
    floor = DEnterStatusPt->floor_reached[dungeon];
    if (dungeon == 5) {
        if (floor >= maxFloorTbl__4[dungeon]) {
            floor = maxFloorTbl__4[dungeon] - 1;
        }
        printf("maxfloor = %d\n", floor);
    }
    if (floor >= 0) {
        DEnterMenu.floor_count = floor + 1;
    } else {
        DEnterMenu.floor_count = 1;
    }
    for (floor = 0; floor < maxFloorTbl__4[dungeon]; floor++) {
        DEnterMenu.max_atra[floor] = DEnterStatusPt->GetMaxAtraNum(dungeon, floor);
        DEnterMenu.collected_atra[floor] = DEnterStatusPt->GetAtraNum(dungeon, floor);
        DEnterMenu.kills[floor] = DEnterStatusPt->ChkKills(dungeon, floor);
        if (DEnterMenu.kills[floor] > 999) {
            DEnterMenu.kills[floor] = 999;
        }
        if (first_open == -1 && (u8) DEnterMenu.max_atra[floor] != (u8) DEnterMenu.collected_atra[floor]) {
            first_open = floor;
        }
    }
    DEnterMenu.selected_floor = DEnterMenu.floor_count - 1;
    DEnterMenu.scroll_top = DEnterMenu.selected_floor;
    if (first_open > -1) {
        DEnterMenu.selected_floor = first_open;
        DEnterMenu.scroll_top = DEnterMenu.selected_floor;
    }
    if (DEnterMenu.scroll_top > DEnterMenu.floor_count - 5) {
        DEnterMenu.scroll_top = DEnterMenu.floor_count - 5;
        if (DEnterMenu.scroll_top < 0) {
            DEnterMenu.scroll_top = 0;
        }
    }
    printf("DEnterMenu.select = %d\n", DEnterMenu.selected_floor);
    printf("DEnterMenu.topline = %d\n", DEnterMenu.scroll_top);
    DEnterMenu.unk_004 = 118.0f - 40.0f * DEnterMenu.scroll_top;
    lines = DEnterMenu.floor_count;
    if (lines < 5) {
        lines = 5;
    }
    DEnterMenu.unk_008 = 122.0f + 108.0f * DEnterMenu.scroll_top / lines;
    GamePad.SetAutoRepeat(0xF00F, 30, 5);
    GamePad.MenuModeOn(0x78);
    return 1;
}

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

static void DrawDunEnterBack(int alpha) {
    DrawMenu2DSprite(TexManager.GetTexture("frame", -1), MenuDispRc, MenuDispRc, 0x80);
    MGFillBox(CRect_i_(0, 0, 0x2800, 0x1C00), 10, 10, 10, (alpha * 4) >> 7);
}

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

int DngActItemModelReadStart(u_long128 *buffer) {
    char model_path[64];
    char texture_path[76];
    int size;
    u_long128 *model_buffer;
    u_long128 *texture_buffer;
    int i;
    ITEM_PACK *pack;

    size = 0;
    pack = &BtlMenuStatusPt->item_pack;
    if (pack == NULL) {
        return 1;
    }
    model_buffer = MenuCalcBufAlignment(buffer);
    texture_buffer = model_buffer + 0xFA1;
    texture_buffer = MenuCalcBufAlignment(texture_buffer);
    StartReadBG();
    for (i = 0; i < 3; i++) {
        if (pack->quick_item_slot[i] >= 0x84) {
            printf("mds = %p\n", model_buffer);
            printf("img = %p\n", texture_buffer);
            BtGetItemNamePath(model_path, texture_path, pack->quick_item_slot[i]);
            LoadFileBG(model_path, model_buffer, &size);
            model_buffer += (((size >> 6) + 1) << 6) >> 4;
            LoadFileBG(texture_path, texture_buffer, &size);
            texture_buffer += (((size >> 6) + 1) << 6) >> 4;
        }
        if (pack->quick_item_slot[i] < 0x84) {
            pack->quick_item_slot[i] = -1;
        }
    }
    return 0;
}

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

void DrawWepAttach(int x, int y, WEAPON_HAVE *weapon, int, int alpha) {
    int holes;
    int item_no;
    int i;
    float size;
    CTexture *texture;
    int u;
    int v;
    int volume;

    holes = GetWeaponHoleNum(weapon->item_no);
    if (holes <= 0) {
        return;
    }
    for (i = 0; i < holes; i++) {
        item_no = weapon->attach[i].item_no;
        if (item_no >= 0x51) {
            size = 32.0f;
            texture = RetCTex(item_no, u, v);
            CRect_i_ src(u, v, 32, 32);
            CRect_i_ dest(x, y, size, size);
            DrawMenu2DSprite(texture, dest, src, alpha);
            volume = GetAttachVolumeForMsg(&weapon->attach[i]);
            if (item_no == 0x5A) {
                volume = weapon->attach[i].unk_02;
            }
            DrawAttachNumberOrWeapon(x, y, 0, 0x280, item_no, volume, alpha, 0);
        }
        x += 42.0f;
    }
}

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

static void LocalDrawItemPolygonView(void) {
    float turn;
    float tilt;
    int i;

    if (MDebugItemPolyViewFlag != 0 && ItemPolyView != NULL && polyreadflag != 0) {
        turn = GamePad.GetRXf();
        tilt = GamePad.GetRYf();
        menudebugrot[0] += tilt / 32.0f;
        menudebugrot[1] += turn / 32.0f;
        for (i = 0; i < 3; i++) {
            if (menudebugrot[i] < -3.1415927f) {
                menudebugrot[i] += 6.2831855f;
            }
            if (menudebugrot[i] > 3.1415927f) {
                menudebugrot[i] -= 6.2831855f;
            }
        }
        if (GamePad.Down2(0x20)) {
            MDebugItemPolyViewFlag = 0;
        }
        if (GamePad.On2(0x10)) {
            for (i = 0; i < 3; i++) {
                if (menudebugrscale[i] <= 5.0f) {
                    menudebugrscale[i] += 0.1f;
                }
            }
        }
        if (GamePad.On2(0x80)) {
            for (i = 0; i < 3; i++) {
                if (0.1f < menudebugrscale[i]) {
                    menudebugrscale[i] -= 0.1f;
                }
            }
        }
        ItemPolyView->SetRotation(menudebugrot[0], menudebugrot[1], menudebugrot[2]);
        ItemPolyView->SetScale(menudebugrscale);
        ItemPolyView->SetPosition(menudebugpos);
        MGDraw(ItemPolyView);
    }
}

void DrawItemPolygonView(void) {
    MenuTextureReload(BtlMenuExReadBlock);
    MenuPolygonDraw(0x80, LocalDrawItemPolygonView);
}

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
