#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 638

#include "menu_dungeon.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "btmisc.hpp"
#include "battlemenu.hpp"
#include "camera.hpp"
#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "editatra.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "mainitemmodel.hpp"
#include "mds.hpp"
#include "memcard.hpp"
#include "memorycardaccess.hpp"
#include "menu_inventory.hpp"
#include "menu_misc.hpp"
#include "menuitemstep.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "shot_freefuncs.hpp"
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

/** Texture of the floor list on the dungeon entrance board. */
extern CTexture *DunLogBoard2;

/** Dungeon progress the battle menus show. */
extern CDngStatusData *BtlMenuStatusPt;

/** Buffer the battle menus read their files into. */
extern u_long128 *BtlMenuReadBuf;

/** State of the debug item menu. */
extern ITEM_AUTO_GET ItemAutoGet;

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

void WeaponAllValueSet(WEAPON_HAVE *weapon, WEAPON_HAVE *result, int full) {
    int i;
    WEAPON_DATA *data;
    int flags;
    ATTACH_LIST *attaches;
    ATTACH_LIST total;
    float rate;
    float scale;
    int value;

    data = GetWeaponData(weapon->item_no);
    if (data == NULL) {
        return;
    }
    attaches = weapon->attach;
    memset(&total, 0, sizeof(ATTACH_LIST));
    rate = GetNowWeaponRate(weapon);
    if (full) {
        rate = 1.0f;
    }
    flags = 0;
    flags |= weapon->flags;
    memcpy(result, weapon, sizeof(WEAPON_HAVE));
    for (i = 0; i < GetWeaponHoleNum(weapon->item_no); i++) {
        if (data->hole[i] <= 0) {
            break;
        }
        scale = 1.0f;
        if (weapon->attach_kind[i] == 3) {
            scale = 2.0f;
        }
        PlusAttachmentVolume(&total, &attaches[i], scale);
        if (attaches[i].item_no == 0x5A && attaches[i].unk_04 != 0 && attaches[i].unk_04 != 1) {
            flags |= attaches[i].unk_04;
        }
    }
    result->flags = CheckWeaponOptionStatus(flags);
    int limit[4] = {data->attack_max, 99, 99, data->magic_max};
    limit[0] *= rate;
    limit[3] *= rate;
    value = result->attack + total.status[0];
    value *= rate;
    if (limit[0] < value) {
        result->attack = limit[0];
    } else {
        result->attack = value;
    }
    value = result->endurance + total.status[1];
    value *= rate;
    if (limit[1] < value) {
        result->endurance = limit[1];
    } else {
        result->endurance = value;
    }
    value = result->speed + total.status[2];
    value *= rate;
    if (value >= limit[2]) {
        result->speed = limit[2];
    } else {
        result->speed = value;
    }
    value = result->magic + total.status[3];
    value *= rate;
    if (limit[3] < value) {
        result->magic = limit[3];
    } else {
        result->magic = value;
    }
    for (i = 0; i < 5; i++) {
        value = result->elem[i] + total.elem[i];
        value *= rate;
        if (value >= 99) {
            result->elem[i] = 99;
        } else {
            result->elem[i] = value;
        }
    }
    for (i = 0; i < 10; i++) {
        value = result->vs_monster[i] + total.vs_monster[i];
        value *= rate;
        if (value >= 99) {
            result->vs_monster[i] = 99;
        } else {
            result->vs_monster[i] = value;
        }
    }
}

int SetAttachMentValue(int item_no, int, short level, ATTACH_LIST *attachment) {
    ATTACH_DATA *data;

    if (item_no < ITEM_ATTACH_START || item_no >= ITEM_DUNGEON_START || attachment == NULL) {
        return -1;
    }
    data = GetAttachData(item_no);
    if (data == NULL) {
        return -1;
    }
    memcpy(attachment, data, sizeof(ATTACH_LIST));
    attachment->item_no = item_no;
    if (level < 1) {
        level = 1;
    } else if (level > 3) {
        level = 3;
    }
    if (item_no >= ITEM_ATTACH_ATTACK && item_no <= ITEM_ATTACH_MAGICAL_POWER) {
        attachment->status[item_no - ITEM_ATTACH_ATTACK] += level;
    }
    return 0;
}

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

static int DunEnterMenuKey(void) {
    int result;
    int selected;
    int scroll_top;
    int count;
    BG_READ_INFO *archive;

    result = -1;
    switch (DEnterMenu.state) {
        case 1:
        case 3:
            if (DEnterMenu.unk_00C == 0 && ReadBGSync() == 0) {
                LOADTEXTURE_INFO2 textures[] = {
                    {(char *) "#frame_menu_enter#640#448#4", DEnterMenu.texture_block, 0},
                    {NULL, DEnterMenu.texture_block, 0},
                    {NULL, 0, 0},
                };
                archive = GetReadBGFile(0);
                textures[1].name = (char *) GetPackFile((u_int *) archive->buffer, (char *) "dunenter.img", NULL);
                TexManager.DeleteTextureBlock(DEnterMenu.texture_block);
                TexManager.CleanUpTextureList();
                TexManager.LoadTextureBlockEX(-1, textures);
                DunLogBoard = TexManager.GetTexture("dunenter", DEnterMenu.texture_block);
                DunLogBoard2 = TexManager.GetTexture("kaisou", DEnterMenu.texture_block);
                InitMenuMesSet(7, (short *) GetPackFile((u_int *) archive->buffer, (char *) "dunlog.bin", NULL));
                CommonMenuMes2.mes_made = -1;
                CommonMenuMes2.MakeMesWin(10);
                DEnterMenu.unk_00C = 1;
                DEnterMenu.unk_00E = 0;
                printf("tex enter end \n");
            } else {
                MenuEtcErrCnt++;
            }
            if (DEnterMenu.unk_00C != 0) {
                DEnterMenu.counter++;
            }
            if (DEnterMenu.unk_00C != 0 && DEnterMenu.counter > 30) {
                DEnterMenu.state = 0;
                DEnterMenu.counter = 0;
                if (DEnterMenu.requested_floor >= 0) {
                    DEnterMenu.state = 2;
                    DEnterMenu.result = DEnterMenu.requested_floor;
                    result = 1;
                }
            }
            break;
        case 2:
            DEnterMenu.counter++;
            if (DEnterMenu.counter > 46) {
                result = 1;
            }
            break;
        case 0:
            selected = DEnterMenu.selected_floor;
            scroll_top = DEnterMenu.scroll_top;
            if (GamePad.Down(0x1000)) {
                DEnterMenu.selected_floor--;
                if (DEnterMenu.selected_floor < DEnterMenu.scroll_top) {
                    DEnterMenu.scroll_top--;
                }
            } else if (GamePad.Down(0x4000)) {
                DEnterMenu.selected_floor++;
                if (DEnterMenu.scroll_top + 4 < DEnterMenu.selected_floor) {
                    DEnterMenu.scroll_top++;
                }
            } else if (GamePad.Down(0x200A)) {
                DEnterMenu.scroll_top += 5;
                DEnterMenu.selected_floor += 5;
            } else if (GamePad.Down(0x8005)) {
                DEnterMenu.scroll_top -= 5;
                DEnterMenu.selected_floor -= 5;
            }
            if (DEnterMenu.scroll_top < 0 || DEnterMenu.selected_floor < 0) {
                DEnterMenu.selected_floor = 0;
                DEnterMenu.scroll_top = 0;
            }
            if (DEnterMenu.floor_count - 1 < DEnterMenu.selected_floor) {
                DEnterMenu.selected_floor = DEnterMenu.floor_count - 1;
                DEnterMenu.scroll_top = DEnterMenu.selected_floor - 4;
                if (DEnterMenu.scroll_top < 0) {
                    DEnterMenu.scroll_top = 0;
                }
            }
            if (DEnterMenu.selected_floor > DEnterMenu.floor_count - 1) {
                DEnterMenu.selected_floor = DEnterMenu.floor_count - 1;
            }
            count = DEnterMenu.floor_count;
            if (count > 5) {
                if (DEnterMenu.scroll_top > count - 5) {
                    DEnterMenu.scroll_top = count - 5;
                    if (DEnterMenu.scroll_top < 0) {
                        DEnterMenu.scroll_top = 0;
                        DEnterMenu.selected_floor = 0;
                    }
                }
            } else if (DEnterMenu.selected_floor > count - 1 || DEnterMenu.scroll_top > count - 1) {
                DEnterMenu.selected_floor = count - 1;
                DEnterMenu.scroll_top = 0;
            }
            if (DEnterMenu.scroll_top < 0 || DEnterMenu.selected_floor < 0) {
                DEnterMenu.scroll_top = 0;
                DEnterMenu.selected_floor = 0;
            }
            if (abs(DEnterMenu.scroll_top - scroll_top) > 4) {
                DEnterMenu.unk_004 = 118.0f - 40.0f * DEnterMenu.scroll_top;
                DEnterMenu.unk_008 = 122.0f + 108.0f * DEnterMenu.scroll_top / DEnterMenu.floor_count;
            }
            if (selected != DEnterMenu.selected_floor || scroll_top != DEnterMenu.scroll_top) {
                ComMenuSePlay(0);
            }
            if (GamePad.Down(0x40)) {
                DEnterMenu.result = DEnterMenu.selected_floor;
                DEnterMenu.state = 2;
                ComMenuSePlay(1);
            }
            if (GamePad.Down(0x20)) {
                ComMenuSePlay(2);
            }
            break;
    }
    return result;
}

static void DunEnterDraw(void) {
    int fade;
    int alpha;
    int cover;
    int half_width;
    int cursor_y;
    int left;
    int top;
    int right;
    int bottom;
    float wave;

    setbilinear(0);
    CRect_i_ screen(0, 0, 0x2800, 0x1C00);
    alpha = 0x80;
    fade = alpha;
    switch (DEnterMenu.state) {
        case 1:
            if (DEnterMenu.unk_00C != 0) {
                fade = DEnterMenu.counter * 6;
                alpha = fade;
            }
            break;
    }
    if (alpha < 0) {
        alpha = 0;
    }
    if (fade > 0x80) {
        fade = 0x80;
    }
    if (alpha > 0x80) {
        alpha = 0x80;
    }
    if (DEnterMenu.unk_00C != 0 && DEnterMenu.state != 3) {
        MenuTextureReload(DEnterMenu.texture_block);
        DrawDunEnterBack(alpha);
        DunEnterBoard(0x46, 0x5A, alpha);
        CursorVibeCnt++;
        if (CursorVibeCnt > 0x107AC0) {
            CursorVibeCnt = 0;
        }
        if (DEnterMenu.state == 0) {
            cursor_y = (DEnterMenu.selected_floor - DEnterMenu.scroll_top) * 40 + 0x74;
            static int DunWakuCnt;
            static s8 init;
            if (init == 0) {
                DunWakuCnt = 0;
                init = 1;
            }
            wave = 0.2f * DunWakuCnt;
            left = 94.0f + wave;
            top = cursor_y + wave;
            right = 204.0f - wave;
            bottom = (cursor_y + 0x18) - wave;
            RECT corner = {0x40, 0x60, 0x10, 0x10};
            DrawMenu2DSprite(DunLogBoard, CRect_i_(left, top, corner.width, corner.height),
                             CRect_i_(corner.x, corner.y, corner.width, corner.height), alpha);
            DrawMenu2DSprite(DunLogBoard, CRect_i_(right, top, corner.width, corner.height),
                             CRect_i_(corner.x + corner.width, corner.y, corner.width, corner.height), alpha);
            DrawMenu2DSprite(DunLogBoard, CRect_i_(left, bottom, corner.width, corner.height),
                             CRect_i_(corner.x, corner.y + corner.height, corner.width, corner.height), alpha);
            DrawMenu2DSprite(DunLogBoard, CRect_i_(right, bottom, corner.width, corner.height),
                             CRect_i_(corner.x + corner.width, corner.y + corner.height, corner.width, corner.height),
                             alpha);
            DunWakuCnt++;
            if (DunWakuCnt < 0 || DunWakuCnt >= 30) {
                DunWakuCnt = 0;
            }
            CRect_i_ cursor(0x20, 0x60, 0x20, 0x20);
            DrawObjectVibe(0x49, cursor_y + 2, DunLogBoard, cursor, 0, alpha);
            DrawObjectVibe(0x46, cursor_y, DunLogBoard, cursor, 0x80, alpha);
        }
        MenuTextureReload(CommonMenuMes2.tex_block);
        CommonMenuMes2.stay_frame = 1;
        CommonMenuMes2.edge_alpha = alpha;
        CommonMenuMes2.text_y = 0x158;
        half_width = CommonMenuMes2.char_width >> 1;
        GetMenuCommonPutXY(&CommonMenuMes2, 0x148 - half_width);
        CommonMenuMes2.Step();
        CommonMenuMes2.DrawMesWin();
    } else {
        MGFillBox(screen, 0, 0, 0, 0x80);
    }
    cover = 0x80;
    switch (DEnterMenu.state) {
        case 1:
            cover = 0x80 - DEnterMenu.counter * 6;
            break;
        case 2:
            cover = DEnterMenu.counter * 9;
            break;
    }
    if (cover < 0) {
        cover = 0;
    }
    if (cover > 0x80) {
        cover = 0x80;
    }
    switch (DEnterMenu.state) {
        case 1:
        case 2:
            MGFillBox(screen, 0, 0, 0, cover);
            break;
    }
    setbilinear(1);
}

#ifdef NON_MATCHING
static void DunEnterBoardWaku(int x, int y, int alpha) {
    CRect_i_ source(0, 0, 160, 32);

    DrawMenu2DSprite(DunLogBoard, CRect_i_(x, y, 160, 32), source, alpha);
    DrawMenu2DSprite(DunLogBoard, CRect_i_(x, y + 32, 160, 168),
                     CRect_i_(0, 32, 160, 168), alpha);
    DrawMenu2DSprite(DunLogBoard, CRect_i_(x, y + 200, 160, 32),
                     CRect_i_(0, 200, 160, 32), alpha);
}

static void DunEnterBoard(int x, int y, int alpha) {
    int row;
    int top = y + 26;
    int bottom = top + 200;

    DunEnterBoardWaku(x, y, alpha);
    for (row = 0; row < 5 && DEnterMenu.scroll_top + row < DEnterMenu.floor_count; row++) {
        int floor = DEnterMenu.scroll_top + row;
        int row_y = top + row * 40;

        DrawDunEnterFloorName(x + 18, row_y, floor + 1, top, bottom, alpha);
        DrawGetAtoraNumBoard(floor, x + 70, row_y, top, bottom, alpha);
        DrawEnemyNum(x + 146, row_y + 16, top, bottom, DEnterMenu.kills[floor], alpha);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DunEnterBoardWaku__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DunEnterBoard__Fiii);
#endif

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

static void DrawGetAtoraNumBoard(int floor, int x, int y, int top, int bottom, int alpha) {
    int collected = (u8) DEnterMenu.collected_atra[floor];
    int maximum = (u8) DEnterMenu.max_atra[floor];

    if (y < bottom && y + 36 > top) {
        DrawDunNumberClip(x + 5, y + 8, top, bottom, collected / 10, alpha);
        DrawDunNumberClip(x + 17, y + 8, top, bottom, collected % 10, alpha);
        DrawMenu2DSprite(DunLogBoard, CRect_i_(x + 34, y + 1, 30, 35),
                         CRect_i_(179, 32, 30, 35), alpha);
        DrawEnemyNum(x + 122, y + 16, top, bottom - 6, maximum, alpha);
    }
}

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
#ifdef NON_MATCHING
static void DrawDunEnterFloorName(int x, int y, int floor, int top, int bottom, int alpha) {
    int source_x = DEnterMenu.dungeon < 6 ? DEnterMenu.dungeon * 32
                                          : (DEnterMenu.dungeon - 6) * 32;
    int source_y = DEnterMenu.dungeon < 6 ? 0 : 128;
    int clipped_y = y;
    int clipped_source = source_x;
    int height = 28;

    MenuTextureClip(clipped_y, clipped_source, height, top, bottom);
    if (clipped_y < bottom) {
        DrawMenu2DSprite(DunLogBoard2, CRect_i_(x, clipped_y, 112, height),
                         CRect_i_(source_y, clipped_source, 112, height), alpha);
        DrawDunNumberClip(x + 88, y + 8, top, bottom, (floor / 10) % 10, alpha);
        DrawDunNumberClip(x + 100, y + 8, top, bottom, floor % 10, alpha);
    }
}

/** Buffer that holds the character-change screen's asynchronously read data. */
static u_long128 *quick_change_buffer;
/** Optional pairs of screen coordinates for the selectable party members. */
static int *quick_change_positions;
/** Texture block replaced temporarily by the character-change screen. */
static int quick_change_texture_block;
/** Party member currently highlighted by the character-change screen. */
static int quick_change_selected;
/** Mode controlling how cancellation leaves the character-change screen. */
static int quick_change_state;

void StartQuickChange(u_long128 *buffer, int texture_block, int *positions, int mode) {
    quick_change_buffer = MenuCalcBufAlignment(buffer);
    quick_change_positions = positions;
    quick_change_texture_block = texture_block;
    quick_change_selected = UserStatus != NULL ? UserStatus->cur_chara : 0;
    quick_change_state = mode != 0 ? 2 : 0;
    CharaChangeInitToGL(quick_change_buffer, quick_change_selected);
    GamePad.SetAutoRepeat(0xF000, 30, 5);
    GamePad.MenuModeOn(0x78);
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawDunEnterFloorName__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", StartQuickChange__FP1iPii);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1348__2);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1349);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1350__3);
int CharaChangeLoop(void) {
    int result = CharaChangeKey();

    ReadBG();
    CharaChangeDraw();
    ItemVolumeStep.LoopStep(60);
    if (result != 0) {
        MenuTextureReload(quick_change_texture_block);
        DngActiveWeaponTextureCopy();
        ItemVolumeStep.CheckItemVolume();
        GamePad.MenuModeOff();
        GamePad.AutoRepeatOff();
        TexManager.DeleteTextureBlock(quick_change_texture_block);
        TexManager.CleanUpTextureList();
    }
    return result;
}
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1373);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1374);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1375);
#ifdef NON_MATCHING
int CharaChangeKey(void) {
    int previous = quick_change_selected;
    int party_size = UserStatus != NULL ? UserStatus->party_size : 1;

    if (GamePad.Down(0x3000)) {
        quick_change_selected--;
    } else if (GamePad.Down(0xC000)) {
        quick_change_selected++;
    }
    if (quick_change_selected < 0) {
        quick_change_selected = party_size - 1;
    } else if (quick_change_selected >= party_size) {
        quick_change_selected = 0;
    }
    if (previous != quick_change_selected) {
        CharaChangeInitToGL(quick_change_buffer, quick_change_selected);
        ComMenuSePlay(0);
    }
    if (GamePad.Down(0x40) && UserStatus != NULL) {
        UserStatus->cur_chara = quick_change_selected;
        ComMenuSePlay(1);
        return 1;
    }
    if (GamePad.Down(0x20)) {
        ComMenuSePlay(2);
        return quick_change_state == 2 ? 2 : 1;
    }
    return 0;
}

void CharaChangeDraw(void) {
    int index;
    int party_size = UserStatus != NULL ? UserStatus->party_size : 0;

    MGFillBox(CRect_i_(0, 0, 0x2800, 0x1C00), 0, 0, 0, 96);
    for (index = 0; index < party_size; index++) {
        int x = quick_change_positions != NULL ? quick_change_positions[index * 2]
                                               : 120 + index * 72;
        int y = quick_change_positions != NULL ? quick_change_positions[index * 2 + 1] : 190;
        int alpha = index == quick_change_selected ? 128 : 64;
        DrawMenuObjectVibe(x, y, index, alpha);
    }
    CommonMenuMes3.Step();
    CommonMenuMes3.DrawMesWin();
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", CharaChangeKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", CharaChangeDraw__Fv);
#endif

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

#ifdef NON_MATCHING
int DngActItemModelBuild(int wait) {
    int slot;
    int read_index = 0;

    if (ReadBGSync() != 0) {
        if (!wait) {
            ReadBG();
            return 0;
        }
        while (ReadBGSync() != 0) {
        }
    }
    for (slot = 0; slot < 3; slot++) {
        int item_no = BtlMenuStatusPt->item_pack.quick_item_slot[slot];
        if (item_no >= ITEM_DUNGEON_START) {
            BG_READ_INFO *model = GetReadBGFile(read_index++);
            BG_READ_INFO *texture = GetReadBGFile(read_index++);
            if (model != NULL && texture != NULL) {
                mainItemModel.SetCashModel(item_no, (u_int *) model->buffer,
                                           (u_int *) texture->buffer, texture->size);
            }
        }
    }
    return 1;
}

void DngActiveItemTextureCopy(void) {
    char source[] = "itemicon";
    char destination[] = "reserved";
    int slot;

    if (UserStatus == NULL) {
        return;
    }
    for (slot = 0; slot < 3; slot++) {
        int item_no = BtlMenuStatusPt->item_pack.quick_item_slot[slot];
        COM_ITEM_INFO *info = GetCommonItemInfo(item_no);
        if (item_no >= ITEM_DUNGEON_START && info != NULL && info->icon_index >= 0) {
            int icon = info->icon_index;
            setItemToReserved(source, (icon & 7) * 32, (icon >> 3) * 32,
                              destination, slot * 32 + 32, 0);
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DngActItemModelBuild__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DngActiveItemTextureCopy__Fv);
#endif
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
void DngActiveWeaponTextureCopy(void) {
    char source[] = "weaponicon";
    char destination[] = "reserved";
    int weapons[3];
    int index;

    if (UserStatus == NULL) {
        return;
    }
    weapons[0] = BtlMenuStatusPt
                     ->chara_weapons[UserStatus->cur_chara]
                                    [BtlMenuStatusPt->equipped_weapon_slot[UserStatus->cur_chara]]
                     .item_no;
    weapons[2] = GetDefaultWeaponNo(UserStatus->cur_chara);
    weapons[1] = weapons[2] + 1;
    for (index = 0; index < 3; index++) {
        COM_ITEM_INFO *info = GetCommonItemInfo(weapons[index]);
        if (info != NULL) {
            int icon = info->icon_index;
            setItemToReserved(source, (icon & 7) * 32, (icon >> 3) * 32,
                              destination, index * 32, 0);
        }
    }
}

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

int GetAtraTipNowHave(int atla_no, int georama) {
    int plot;

    if (atla_no < 40) {
        SV_EDIT_PARTS_INFO *part = SaveData->GetEditPartsInfo(georama, atla_no);
        return part != NULL && part->flag != 0;
    }
    atla_no -= 40;
    s16 *elements = SaveData->GetElemData(georama);
    for (int index = 0; index < 128; index++) {
        if (elements[index] == atla_no) {
            return 1;
        }
    }
    for (plot = 0; plot < 24; plot++) {
        SV_EDIT_PARTS_INFO *part = SaveData->GetEditPartsInfo(georama, plot);
        EDIT_PARTS_ATRA *definition = GetEditAtraPartsData(georama, plot);
        if (part == NULL || definition == NULL) {
            continue;
        }
        for (int socket = 0; socket < 6; socket++) {
            if (definition->elements[socket].id == atla_no && part->npc_slot[socket] != 0) {
                return 1;
            }
        }
    }
    return 0;
}

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
#ifdef NON_MATCHING
int InitItemPolygonView(int item_no, u_long128 *buffer) {
    char model_path[64];
    char texture_path[76];
    int size;
    u_long128 *aligned;

    if (item_no < ITEM_ATTACH_START || item_no > 0x100) {
        return 0;
    }
    BtGetItemNamePath(model_path, texture_path, item_no);
    StartReadBG();
    MDebugItemPolyViewFlag = 0;
    polyreadflag = 0;
    aligned = MenuCalcBufAlignment(buffer);
    if (!LoadFileBG(model_path, aligned, &size)) {
        return 1;
    }
    aligned = MenuCalcBufAlignment(aligned + (size >> 4) + 1);
    if (!LoadFileBG(texture_path, aligned, &size)) {
        return 1;
    }
    ItemPolyView = NULL;
    return 0;
}

static int EnterItemPolygonView(void) {
    BG_READ_INFO *model;
    BG_READ_INFO *texture;

    if (ReadBGSync() != 0 || polyreadflag != 0 || MDebugItemPolyViewFlag != 0) {
        return 0;
    }
    model = GetReadBGFile(0);
    texture = GetReadBGFile(1);
    if (model == NULL || texture == NULL) {
        return 0;
    }
    MenuEffectCashBuffer.base = (u8 *) texture->buffer + texture->size;
    MenuEffectCashBuffer.limit = 0x6000;
    MenuEffectCashBuffer.Reset();
    ItemPolyView = (CFrame *) LoadMDSFile((u_int *) model->buffer, &MenuEffectCashBuffer, 0,
                                         (char **) 0, (char **) 0);
    if (ItemPolyView == NULL) {
        return 0;
    }
    menudebugpos[0] = 0.0f;
    menudebugpos[1] = 0.0f;
    menudebugpos[2] = 96.0f;
    menudebugrot[0] = menudebugrot[1] = menudebugrot[2] = 0.0f;
    menudebugrscale[0] = menudebugrscale[1] = menudebugrscale[2] = 1.0f;
    MDebugItemPolyViewFlag = 1;
    return 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", InitItemPolygonView__FiP1);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", EnterItemPolygonView__Fv);
#endif

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

int DebugItemGetKey(void) {
    int result;
    int selection;
    int page;
    int item_no;
    WEAPON_DATA *data;
    int count;

    result = 0;
    selection = ItemAutoGet.selection;
    page = ItemAutoGet.page;
    if (GamePad.Down(0x1000)) {
        ItemAutoGet.selection -= 8;
    }
    if (GamePad.Down(0x4000)) {
        ItemAutoGet.selection += 8;
    }
    if (GamePad.Down(0x2000)) {
        ItemAutoGet.selection += 1;
    }
    if (GamePad.Down(0x8000)) {
        ItemAutoGet.selection -= 1;
    }
    if (GamePad.Down(0x100)) {
        if (ItemAutoGet.show_model) {
            ItemAutoGet.show_model = 0;
        } else {
            ItemAutoGet.show_model = 1;
        }
        polyreadflag = InitItemPolygonView(ConvDebugSelectToExcelListNo(ItemAutoGet.selection), BtlMenuReadBuf);
    }
    if (GamePad.Down(5)) {
        ItemAutoGet.selection -= 0x40;
    }
    if (GamePad.Down(0xA)) {
        ItemAutoGet.selection += 0x40;
    }
    if (ItemAutoGet.selection < 0) {
        ItemAutoGet.selection += 0x140;
    }
    if (ItemAutoGet.selection > 0x13F) {
        ItemAutoGet.selection -= 0x140;
    }
    ItemAutoGet.page = ItemAutoGet.selection >> 6;
    if (selection != ItemAutoGet.selection || page != ItemAutoGet.page) {
        ComMenuSePlay(0);
    }
    if (GamePad.Down(0x40)) {
        ComMenuSePlay(1);
        count = rand() % 3 + 1;
        BtlMenuStatusPt->GetItem(ConvDebugSelectToExcelListNo(ItemAutoGet.selection), count);
    }
    if (GamePad.Down(0x20)) {
        result = -1;
        CommonMenuMes2.mes_made = result;
        ComMenuSePlay(2);
    }
    if (GamePad.Down2(0x40)) {
        for (item_no = 0x101; item_no < 0x179; item_no++) {
            data = GetWeaponData(item_no);
            if (data != NULL && data->flags != 0 && data->flags != 1) {
                BtlMenuStatusPt->GetItem(item_no, 0);
            }
        }
        ComMenuSePlay(1);
    }
    return result;
}

#ifdef NON_MATCHING
void DebugItemGetDraw(void) {
    int item_no = ConvDebugSelectToExcelListNo(ItemAutoGet.selection);
    COM_ITEM_INFO *info = GetCommonItemInfo(item_no);
    int icon_x;
    int icon_y;
    CTexture *icons;

    MGFillBox(CRect_i_(70, 40, 256, 128), 0, 0, 0, 128);
    icons = RetCTex(item_no, icon_x, icon_y);
    if (icons != NULL) {
        MenuTextureReload(-1);
        DrawMenu2DSprite(icons, CRect_i_(70, 80, 256, 128),
                         CRect_i_(0, 0, 256, 128), 128);
        DrawMenu2DSprite(icons,
                         CRect_i_(46 + (ItemAutoGet.selection & 7) * 32,
                                  80 + ((ItemAutoGet.selection & 0x3F) >> 3) * 32,
                                  32, 32),
                         CRect_i_(icon_x, icon_y, 32, 32), 128);
    }
    DrawMenuObjectVibe(46 + (ItemAutoGet.selection & 7) * 32,
                       80 + ((ItemAutoGet.selection & 0x3F) >> 3) * 32, 1, 64);
    if (info != NULL && CommonMenuMes2.mes_made != info->msg + 500) {
        CommonMenuMes2.MakeMesWin(info->msg + 500);
    }
    if (ItemAutoGet.show_model) {
        DrawItemDataView(item_no);
    }
}

static void DrawItemDataView(int item_no) {
    COM_ITEM_INFO *info = GetCommonItemInfo(item_no);
    RECT digits = {0x20, 0x48, 12, 12};

    MGFillBox(CRect_i_(350, 60, 230, 300), 8, 8, 16, 112);
    if (info != NULL && DunLogBoard != NULL) {
        DrawMenuNumber(item_no, 374, 84, DunLogBoard, digits, 128, 0);
        DrawMenuNumber(info->icon_index, 374, 108, DunLogBoard, digits, 128, 0);
        DrawMenuNumber(info->msg, 374, 132, DunLogBoard, digits, 128, 0);
    }
    if (item_no > 0x83) {
        if (GamePad.Down(0x10)) {
            polyreadflag = InitItemPolygonView(item_no, BtlMenuReadBuf);
        }
        if (polyreadflag == 0) {
            polyreadflag = EnterItemPolygonView();
        }
        if (polyreadflag != 0) {
            DrawItemPolygonView();
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DebugItemGetDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_dungeon", DrawItemDataView__Fi);
#endif
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2140__2);
