#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 639

#include "menu_dungeon.hpp"

#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "battlemenu.hpp"
#include "btactstatus.hpp"
#include "btmisc.hpp"
#include "camera.hpp"
#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "debugfont.hpp"
#include "dun/gameloop.hpp"
#include "editatra.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "mainitemmodel.hpp"
#include "mds.hpp"
#include "memcard.hpp"
#include "memorycardaccess.hpp"
#include "menuetc.hpp"
#include "menu_inventory.hpp"
#include "menu_misc.hpp"
#include "menuitemstep.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "shot_freefuncs.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

DUN_ENTER_MENU DEnterMenu;

/**
 * State of the character change menu and its character positions.
 */
struct CHARA_CHANGE_MENU {
    s8 selected;   /**< Party member the ring has turned to. */
    s8 cursor_row; /**< Row the cursor is on in the message window. */
    s8 party_size; /**< Number of party members on the ring. */
    s8 unk_03;
    float unk_04;
    float ring_pos[6][2]; /**< Each member's offset from the ring's centre. */
    s16 ring_slot[6];     /**< Each member's place on the ring, counted from the front. */
    float unk_44;
    s16 unk_48;
    u8 unk_4a[2];
    s32 unk_4c;
    u8 unk_50[2];
    s8 unk_52;
    u8 unk_53;
    float cursor_x; /**< Screen x of the cursor. */
    float cursor_y; /**< Screen y of the cursor. */
    s16 mode;       /**< Mode the menu was opened with; 1 uses up an item when the leader changes. */
    u8 unk_5e[2];
};

STATIC_ASSERT(sizeof(CHARA_CHANGE_MENU) == 0x60);

/** State of the character change menu. */
static CHARA_CHANGE_MENU ChangeMenu;

int MenuEtcErrCnt;

/** Texture of the dungeon entrance board. */
CTexture *DunLogBoard;

/** Texture of the floor list on the dungeon entrance board. */
CTexture *DunLogBoard2;

CDngStatusData *DEnterStatusPt;

/** Number of floors available in each dungeon. */
static int maxFloorTbl__4[7] = {15, 17, 18, 18, 15, 25, 100};

/** State of the debug item menu. */
extern ITEM_AUTO_GET ItemAutoGet;

/** Model the item preview shows. */
extern CFrame *ItemPolyView;

/** Set while the debug item preview is shown. */
extern int MDebugItemPolyViewFlag;

/** Set once the item preview's files have been read. */
extern int polyreadflag;

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

    int chara = dng_status->cur_chara;
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

int SetAttachMentValue(int item_no, int slot, short level, ATTACH_LIST *) {
    CDngStatusData *status;
    ATTACH_LIST *attach;
    ATTACH_DATA *data;
    s16 held_no;

    if (item_no < ITEM_ATTACH_START || item_no >= ITEM_DUNGEON_START) {
        return -1;
    }
    status = SaveData->GetDngStatus();
    DNG_CONSUMABLE *items = status->consumable_items;
    attach = (ATTACH_LIST *) &items[slot];
    data = GetAttachData(item_no);
    held_no = attach->item_no;
    if (held_no < ITEM_ATTACH_START || held_no >= ITEM_DUNGEON_START) {
        return -1;
    }
    memset(attach, 0, sizeof(ATTACH_LIST));
    attach->item_no = held_no;
    memcpy(attach, data, sizeof(ATTACH_LIST));
    if (level <= 0) {
        level = 1;
    }
    if (level > 3) {
        level = 3;
    }
    if (held_no >= ITEM_ATTACH_ATTACK && held_no <= ITEM_ATTACH_MAGICAL_POWER) {
        attach->status[held_no - ITEM_ATTACH_ATTACK] += level;
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

static void DunEnterBoardWaku(int x, int y, int alpha) {
    int draw_x;
    int draw_y;
    int count;
    int height;
    int u;
    int dungeon;
    int icon;
    int v;

    DrawMenu2DSprite(DunLogBoard, CRect_i_(x, y - 1, 0x20, 0xFA), CRect_i_(0, 0, 0x20, 0xF8), alpha);
    DrawMenu2DSprite(DunLogBoard, CRect_i_(x + 0x20, y, 0x1CC, 0x20), CRect_i_(0x20, 0, 0x1B8, 0x20), alpha);
    DrawMenu2DSprite(DunLogBoard, CRect_i_(x + 0x1EC, y - 1, 0x28, 0xFA), CRect_i_(0x1D8, 0, 0x28, 0xF8), alpha);
    DrawMenu2DSprite(DunLogBoard, CRect_i_(x + 0x20, y + 0xD9, 0x1CC, 0x20), CRect_i_(0x20, 0xD8, 0x1B8, 0x20), alpha);

    // The scroll bar eases toward the list's scroll position and shrinks with a longer list.
    count = DEnterMenu.floor_count;
    if (count < 5) {
        count = 5;
    }
    draw_x = x + 0x1FC;
    draw_y = (int) (DEnterMenu.unk_008 += ((int) (32.0f + y + 108.0f * DEnterMenu.scroll_top / count) - DEnterMenu.unk_008) / 4.0f);
    height = (int) (540.0f / count);
    while (y + 0x98 < draw_y + (height + 8)) {
        height--;
    }
    DrawMenu2DSprite(DunLogBoard, CRect_i_(draw_x, draw_y, 8, 4), CRect_i_(0x60, 0x60, 8, 4), alpha);
    DrawMenu2DSprite(DunLogBoard, CRect_i_(draw_x, draw_y + 4, 8, height), CRect_i_(0x60, 0x64, 8, 4), alpha);
    DrawMenu2DSprite(DunLogBoard, CRect_i_(draw_x, draw_y + height + 4, 8, 4), CRect_i_(0x60, 0x68, 8, 4), alpha);

    draw_x = x + 0x28;
    draw_y = y - 0x14;
    dungeon = DEnterMenu.dungeon;
    icon = dungeon;
    if (icon > 5) {
        icon = 5;
    }
    u = (icon / 3) << 8;
    v = (icon % 3) * 40 + 0x100;
    if (dungeon == 6) {
        DrawMenu2DSprite(DunLogBoard, CRect_i_(draw_x, draw_y, 0x80, 0x23), CRect_i_(0x20, 0x80, 0x80, 0x24), alpha);
        DrawMenu2DSprite(DunLogBoard, CRect_i_(draw_x + 0x80, draw_y, 0x80, 0x23), CRect_i_(0x20, 0xA4, 0x80, 0x24), alpha);
    } else {
        DrawMenu2DSprite(DunLogBoard, CRect_i_(draw_x, draw_y, 0x100, 0x28), CRect_i_(u, v, 0x100, 0x28), alpha);
    }
}

/**
 * Draws the clipped floor list and collection marks on the dungeon entrance board.
 */
static void DunEnterBoard(int x, int y, int alpha) {
    float lane;
    int top;
    int row_y;
    int bottom;
    int dim;
    int i;
    int rule_x;
    int column_x;

    lane = x;
    top = y + 0x19;
    bottom = y + 0xEF;

    // Short lists ease toward their scroll position; longer ones are placed by the scroll bar.
    int rows = DEnterMenu.floor_count;
    if (rows < 5) {
        rows = 5;
    }
    int target = y + 0x1C - DEnterMenu.scroll_top * 40;
    int step = (int) ((float) target - DEnterMenu.unk_004);
    DEnterMenu.unk_004 += step >> 2;
    if (abs(step) < 2) {
        DEnterMenu.unk_004 = target;
    }
    row_y = (int) DEnterMenu.unk_004;

    CRect_i_ rule_source(0x20, 0x20, 0x28, 7);
    dim = (alpha * 80) >> 7;
    rule_x = (int) (32.0f + lane);
    if (DEnterMenu.scroll_top == 0) {
        DrawMenu2DSprite(DunLogBoard, CRect_i_(rule_x - 10, 0x73, 10, 3), rule_source, dim);
        for (int j = 0; j < 11; j++) {
            DrawMenu2DSprite(DunLogBoard, CRect_i_(rule_x, 0x73, 0x28, 3), rule_source, dim);
            rule_x += 0x28;
        }
        DrawMenu2DSprite(DunLogBoard, CRect_i_(rule_x, 0x73, 10, 3), rule_source, dim);
    }

    int icon = DEnterMenu.dungeon;
    if (icon > 5) {
        icon = 5;
    }

    column_x = x + 0x20;
    for (i = 0; i < 100; i++) {
        int source = 0x20;
        int length = 0x28;
        int position = row_y;
        lane = column_x;
        if (!(row_y < bottom)) {
            break;
        }
        if (row_y + 0x28 <= top) {
            row_y += 0x28;
            continue;
        }
        MenuTextureClip(position, source, length, top, bottom);
        CRect_i_ edge_source(0x20, source, 10, length);
        DrawMenu2DSprite(DunLogBoard, CRect_i_((int) (lane - 10.0f), position, 10, length), edge_source, dim);
        for (int j = 0; j < 12; j++) {
            DrawMenu2DSprite(DunLogBoard, CRect_i_((int) lane, position, 0x28, length), CRect_i_(0x20, source, 0x28, length),
                             dim);
            lane += 40.0f;
        }
        DrawMenu2DSprite(DunLogBoard, CRect_i_((int) lane, position, 10, length), edge_source, dim);
        if (DEnterMenu.floor_count - 1 < i) {
            row_y += 0x28;
            continue;
        }

        position = row_y + 4;
        DrawDunEnterFloorName(column_x, position, i + 1, top, bottom, alpha);
        int dungeon = DEnterMenu.dungeon;
        int max_floor = maxFloorTbl__4[dungeon];
        if (i == max_floor - 1) {
            int unused[6] = {20, 0, 30, 60, 20, 16};
            int draw_x = column_x + 0x82;
            position = row_y + 6;
            length = 0x18;
            source = dungeon * 24 + 0x20;
            MenuTextureClip(position, source, length, top, bottom);
            if (position < bottom) {
                DrawMenu2DSprite(DunLogBoard, CRect_i_(draw_x, position, 0xDC, length),
                                 CRect_i_(0xFC, source, 0xDC, length), alpha);
            }
        } else if (dungeon < 6) {
            int draw_x = column_x + 0x72;
            position = row_y;
            length = 0x20;
            source = 0x20;
            MenuTextureClip(position, source, length, top - 10, bottom);
            if (position < bottom) {
                int remaining = (u8) DEnterMenu.max_atra[i] - (u8) DEnterMenu.collected_atra[i];
                for (int k = 0; k < remaining; k++) {
                    DrawMenu2DSprite(DunLogBoard, CRect_i_(draw_x, position, 0x20, length),
                                     CRect_i_(0x48, source, 0x20, length), alpha);
                    draw_x += 0x1A;
                }
                for (int k = 0; k < (u8) DEnterMenu.collected_atra[i]; k++) {
                    DrawMenu2DSprite(DunLogBoard, CRect_i_(draw_x, position, 0x20, length),
                                     CRect_i_(0x68, source, 0x20, length), alpha);
                    draw_x += 0x1A;
                }
            }
        }
        row_y += 0x28;
    }

    MenuTextureReload(DunLogBoard->block);
    row_y = (int) DEnterMenu.unk_004;
    row_y--;
    for (int floor = 0; floor < 100; floor++) {
        if (floor == maxFloorTbl__4[DEnterMenu.dungeon] - 1) {
            break;
        }
        if (DEnterMenu.floor_count - 1 < floor) {
            continue;
        }
        int board_x = x + 0x16E;
        if (row_y < bottom) {
            DrawGetAtoraNumBoard(floor, board_x, row_y, top, bottom, alpha);
        }
        row_y += 0x28;
    }
    DunEnterBoardWaku(x, y, alpha);
}

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

/**
 * Returns where a floor row's kill count starts, given where its Atla count starts.
 */
static inline int KillCountX(int x) {
    return x + 0x36;
}

static void DrawGetAtoraNumBoard(int floor, int x, int y, int top, int bottom, int alpha) {
    int position = y;
    int source = 0x20;
    int length = 0x24;

    if (!(top < y + 0x24) || bottom <= y) {
        return;
    }
    MenuTextureClip(position, source, length, top, bottom);
    DrawMenu2DSprite(DunLogBoard, CRect_i_(x, position, 0x2B, length), CRect_i_(0x88, source, 0x2B, length), alpha);

    position = y + 8;
    int collected = (u8) DEnterMenu.collected_atra[floor];
    if (top < position) {
        DrawDunNumberClip(x + 5, position, top, bottom, collected, alpha);
    }
    position = y + 0x10;
    int maximum = (u8) DEnterMenu.max_atra[floor];
    DrawDunNumberClip(x + 0x1B, position, top, bottom, maximum, alpha);

    int kills = DEnterMenu.kills[floor];
    x = KillCountX(x);
    position = y + 1;
    source = 0x20;
    length = 0x23;
    MenuTextureClip(position, source, length, top, bottom);
    if (position < bottom) {
        DrawMenu2DSprite(DunLogBoard, CRect_i_(x, position, 0x1E, length), CRect_i_(0xB3, source, 0x1E, length), alpha);
    }
    position = y + 0x10;
    if (position < bottom - 4) {
        DrawEnemyNum(x + 0x44, position, top, bottom - 6, kills, alpha);
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

/**
 * Screen position of the character change ring's centre.
 */
int QuickCharaPos[2];

/**
 * Texture block the character change menu loads its pictures into.
 */
s16 CharaChangeTexBlock;

/**
 * Set once the character change menu's files have been read.
 */
s16 CharaChangeReadFlag;

/**
 * Buffer past the character change menu's pictures, where its models are read.
 */
u_long128 *chara_change_buf;

/**
 * Texture of the character change menu's portraits.
 */
CTexture *QuickCharaTex;

/**
 * Status of the party the character change menu picks from.
 */
CDngStatusData *ChangeStatusDataPt;

CFrame *ItemPolyView;
int MDebugItemPolyViewFlag;
int polyreadflag;

/**
 * Name of the frame-buffer texture the character change menu's pictures are drawn into.
 */
extern char chara_change_frame_image[];

INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1301);
static void DrawDunEnterFloorName(int x, int y, int floor, int top, int bottom, int alpha) {
    int position = y;
    int height;
    int source;
    int u;

    if (y < bottom) {
        height = 0x1C;
        u = 0;
        source = DEnterMenu.dungeon * 32;
        if (DEnterMenu.dungeon >= 6) {
            u = 0x80;
            source = (DEnterMenu.dungeon - 6) * 32;
        }
        MenuTextureClip(position, source, height, top, bottom);
        if (position + height >= top) {
            DrawMenu2DSprite(DunLogBoard2, CRect_i_(x, position, 0x70, height),
                             CRect_i_(u, source, 0x70, height), alpha);
        }
        if (DEnterMenu.dungeon == 5) {
            floor = BtGetFloorLevel(floor - 1);
        }
        int offset = 0;
        if (floor < 10) {
            offset = -6;
        }
        if (DEnterMenu.dungeon == 5 || DEnterMenu.dungeon == 6) {
            if (floor < 10) {
                offset = -12;
            }
            if (floor >= 10 && floor < 100) {
                offset = -6;
            }
            if (floor >= 100) {
                offset = 0;
                if (DEnterMenu.dungeon == 6 && GetMenuLangFlag() == 1) {
                    offset += 4;
                }
            }
        }
        s8 name_width[7][7] = {
            {0x50, 0x6E, 0x48, 0x68, 0x38, 0x30, 0x50},
            {0x52, 0x68, 0x60, 0x60, 0x38, 0x30, 0x64},
            {0x52, 0x68, 0x60, 0x60, 0x38, 0x30, 0x64},
            {0x52, 0x68, 0x60, 0x60, 0x38, 0x30, 0x64},
            {0x52, 0x68, 0x60, 0x60, 0x38, 0x30, 0x64},
            {0x52, 0x68, 0x60, 0x60, 0x38, 0x30, 0x64},
            {0x52, 0x68, 0x60, 0x60, 0x38, 0x30, 0x64},
        };
        x = offset + (x + name_width[GetMenuLangFlag()][DEnterMenu.dungeon]);
        position = y;
        RECT digits = {0, 0xC0, 0x10, 0x1C};
        if (y + height >= top) {
            DrawMenuNumber(floor, x, y, digits, DunLogBoard2, 0, top, bottom, alpha);
        }
    }
}

float changeMenu_long = 60.0f;

/**
 * Places the character change menu's cursor on its selected row.
 */
static inline void SetChangeMenuCursor(void) {
    ChangeMenu.cursor_x = CommonMenuMes3.text_x - 0x1C;
    ChangeMenu.cursor_y = CommonMenuMes3.text_y - 4 + ChangeMenu.cursor_row * 24;
}

void StartQuickChange(u_long128 *buffer, int texture_block, int *positions, int mode) {
    LOADTEXTURE_INFO2 table[] = {
        {chara_change_frame_image, 0, 0},
        {NULL, 0, 0},
    };
    table[0].block_no = texture_block;
    TexManager.DeleteTextureBlock(texture_block);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, table);
    chara_change_buf = buffer;
    chara_change_buf = MenuCalcBufAlignment(buffer);
    StartReadBG();
    LoadFileBGMenuData("quickchr.pac", chara_change_buf);
    CharaChangeReadFlag = 0;
    ReadBG();
    QuickCharaPos[0] = positions[0];
    QuickCharaPos[1] = positions[1];
    ChangeStatusDataPt = (CDngStatusData *) UserStatus;
    if (ChangeStatusDataPt == NULL) {
        return;
    }
    ChangeMenu.selected = ChangeStatusDataPt->cur_chara;
    ItemVolumeStep.CheckItemVolume();
    ChangeMenu.unk_4c = 0;
    StayTex = TexManager.GetTexture("stayframe", -1);
    CommonMenuMes3.text_x = 200;
    CommonMenuMes3.text_y = 190;
    changeMenu_long = 60.0f;
    ChangeMenu.mode = mode;
    ChangeMenu.cursor_row = 0;
    ChangeMenu.unk_52 = 0;
    CUserStatus *status = (CUserStatus *) ChangeStatusDataPt;
    int zone = status->res_limit_zone_current;
    if (zone < 6 && zone >= 0) {
        ChangeMenu.unk_52 = 1;
    } else if (status->cur_chara == CHARA_OSMOND && BtActStatus.unk_092 == 10) {
        ChangeMenu.unk_52 = 2;
    }
    if (ChangeMenu.mode != 0) {
        ChangeMenu.unk_03 = 2;
        SetChangeMenuCursor();
    } else {
        ChangeMenu.unk_03 = 0;
        if (ChangeMenu.unk_52 == 1) {
            ChangeMenu.cursor_row = 1;
            SetChangeMenuCursor();
        } else if (ChangeMenu.unk_52 == 2) {
            printf(" not change area \n");
            ChangeMenu.cursor_row = 1;
            SetChangeMenuCursor();
        }
    }
    ChangeMenu.party_size = ChangeStatusDataPt->party_size;
    ChangeMenu.unk_48 = 0;
    float step = 6.2831855f / ChangeMenu.party_size;
    int i;
    if (ChangeMenu.unk_44 < 0.0f) {
        i = 0;
    }
    for (i = 0; i < ChangeMenu.party_size; i++) {
        ChangeMenu.ring_slot[i] = i - ChangeMenu.selected;
        if (ChangeMenu.ring_slot[i] < 0) {
            ChangeMenu.ring_slot[i] += ChangeMenu.party_size;
        }
        float angle = 3.1415927f + step * ChangeMenu.ring_slot[i];
        ChangeMenu.ring_pos[i][0] = changeMenu_long * cos(angle);
        ChangeMenu.ring_pos[i][1] = changeMenu_long * sin(angle);
    }
    GamePad.SetAutoRepeat(0xF000, 30, 5);
    GamePad.MenuModeOn(0x78);
    CharaChangeTexBlock = texture_block;
}

int CharaChangeLoop(void) {
    if (ReadBGSync() == 0 && CharaChangeReadFlag == 0) {
        LOADTEXTURE_INFO2 table[] = {
            {chara_change_frame_image, 0, 0},
            {NULL, 0, 0},
            {NULL, 0, 0},
        };
        table[0].block_no = CharaChangeTexBlock;
        table[1].block_no = CharaChangeTexBlock;
        BG_READ_INFO *file = GetReadBGFile(0);
        if (file == NULL) {
            return 1;
        }
        table[1].name = (char *) GetPackFile((u_int *) file->buffer, "quickchr.img", NULL);
        TexManager.DeleteTextureBlock(CharaChangeTexBlock);
        TexManager.CleanUpTextureList();
        TexManager.LoadTextureBlockEX(-1, table);
        QuickCharaTex = TexManager.GetTexture("quickchara", -1);
        chara_change_buf = file->buffer + (file->size >> 4) + 4;
        chara_change_buf = MenuCalcBufAlignment(chara_change_buf);
        CharaChangeReadFlag = 1;
        InitMenuMesSet(0, (s16 *) GetPackFile((u_int *) file->buffer, "qchr.mes", NULL));
        CommonMenuMes3.auto_pos = -1;
        CommonMenuMes3.Preset(1);
        int message = 1;
        if (ChangeMenu.unk_52 == 1) {
            message = 4;
        }
        if (ChangeMenu.unk_52 == 2) {
            message = 5;
        }
        CommonMenuMes3.MakeMesWin(message);
        CommonMenuMes1.Preset(1);
        CommonMenuMes1.MakeMesWin(3);
    }
    int result = 0;
    if (CharaChangeReadFlag != 0) {
        result = CharaChangeKey();
    }
    CharaChangeDraw();
    ItemVolumeStep.LoopStep(60);
    if (result != 0) {
        MenuTextureReload(CharaChangeTexBlock);
        DngActiveWeaponTextureCopy();
        CharaChangeReadFlag = 0;
        ItemVolumeStep.CheckItemVolume();
        GamePad.MenuModeOff();
        GamePad.AutoRepeatOff();
        TexManager.DeleteTextureBlock(CharaChangeTexBlock);
        TexManager.CleanUpTextureList();
        LOADTEXTURE_INFO2 restore[] = {
            {chara_change_frame_image, 0, 0},
            {NULL, 0, 0},
        };
        restore[0].block_no = CharaChangeTexBlock;
        TexManager.LoadTextureBlockEX(-1, restore);
    }
    return result;
}

/**
 * Makes a character the party's leader.
 */
static inline void SetStatusChara(CDngStatusData *status, s8 chara) {
    status->cur_chara = chara;
}

int CharaChangeKey(void) {
    int result = 0;

    ReadBG();
    switch (ChangeMenu.unk_03) {
        case 5:
            ChangeMenu.unk_4c++;
            if (ReadBGSync() == 0 && ChangeMenu.unk_4c > 0x10) {
                BtMenuLoadChara();
                StartReadBG();
                CharaChangeInitToGL2(0);
                ChangeMenu.unk_03 = 6;
            }
            break;
        case 6:
            ChangeMenu.unk_4c++;
            if (ReadBGSync() == 0 && ChangeMenu.unk_4c > 0x10) {
                BtMenuLoad2(0);
                LockOffTargte();
                InitReadBG();
                return 1;
            }
            break;
        case 3:
        case 4: {
            int message = 1;
            if (ChangeMenu.unk_52 == 1) {
                message = 4;
            }
            if (ChangeMenu.unk_52 == 2) {
                message = 5;
            }
            if (CommonMenuMes3.mes_made != message) {
                CommonMenuMes3.MakeMesWin(message);
            }
            if (GamePad.Down(0x60)) {
                if (ChangeMenu.mode != 0) {
                    ChangeMenu.unk_03 = 2;
                    CommonMenuMes3.MakeMesWin(ChangeMenu.unk_52 == 0 ? 1 : 2);
                } else {
                    ChangeMenu.unk_03 = 0;
                }
                ComMenuSePlay(2);
            }
            break;
        }
        case 1:
            ChangeMenu.unk_04 += 1.0f;
            if (ChangeMenu.unk_04 >= 21.0f) {
                if (ChangeMenu.unk_44 > 0.0f) {
                    for (int i = 0; i < 6; i++) {
                        ChangeMenu.ring_slot[i]++;
                        if (ChangeMenu.ring_slot[i] == ChangeMenu.party_size) {
                            ChangeMenu.ring_slot[i] = 0;
                        }
                    }
                } else {
                    for (int i = 0; i < ChangeMenu.party_size; i++) {
                        ChangeMenu.ring_slot[i]--;
                        if (ChangeMenu.ring_slot[i] == -1) {
                            ChangeMenu.ring_slot[i] = ChangeMenu.party_size - 1;
                        }
                    }
                }
                ChangeMenu.unk_03 = 0;
                ChangeMenu.unk_04 = 0.0f;
                ChangeMenu.unk_44 = 0.0f;
            }
            break;
        case 2: {
            int message = 1;
            if (ChangeMenu.unk_52 == 1 || ChangeMenu.unk_52 == 2) {
                message = 2;
            }
            if (CommonMenuMes3.mes_made != message) {
                CommonMenuMes3.MakeMesWin(message);
            }
            if (GamePad.Down(0x5000)) {
                if (ChangeMenu.cursor_row > 0) {
                    ChangeMenu.cursor_row = 0;
                } else {
                    ChangeMenu.cursor_row = 1;
                }
                ComMenuSePlay(0);
            }
            if (GamePad.Down(0x40)) {
                ITEM_PACK *pack = &ChangeStatusDataPt->item_pack;
                int count = GetNowItemNum(0xAE, pack);
                if (ChangeMenu.cursor_row != 0) {
                    result = 2;
                    ComMenuSePlay(1);
                } else if (ChangeMenu.unk_52 == 1) {
                    ComMenuSePlay(2);
                    ChangeMenu.unk_03 = 3;
                    return 0;
                } else if (ChangeMenu.unk_52 == 2) {
                    ComMenuSePlay(2);
                    ChangeMenu.unk_03 = 3;
                    return 0;
                } else if (count > 0) {
                    ChangeMenu.unk_03 = 0;
                    ComMenuSePlay(1);
                } else {
                    ComMenuSePlay(2);
                }
            } else if (GamePad.Down(0x20)) {
                ComMenuSePlay(2);
            }
            break;
        }
        case 0: {
            if (GamePad.Down(0x40)) {
                if (ChangeMenu.selected > ChangeMenu.party_size - 1) {
                    ComMenuSePlay(2);
                    ChangeMenu.unk_03 = 3;
                    return 0;
                }
                if (ChangeMenu.unk_52 == 1) {
                    ComMenuSePlay(2);
                    CommonMenuMes3.MakeMesWin(4);
                    ChangeMenu.unk_03 = 3;
                    return 0;
                }
                if (ChangeMenu.unk_52 == 2) {
                    CommonMenuMes3.MakeMesWin(5);
                    ChangeMenu.unk_03 = 3;
                    ComMenuSePlay(2);
                    return 0;
                }
                CDngStatusData *status = ChangeStatusDataPt;
                int hp = status->hp[ChangeMenu.selected];
                int flags = status->GetActiveCharaStatus(ChangeMenu.selected);
                if (hp <= 0 || (flags & 2)) {
                    ComMenuSePlay(2);
                    return 0;
                }
                if (ChangeMenu.selected != status->cur_chara) {
                    ComMenuSePlay(1);
                    SetStatusChara(ChangeStatusDataPt, ChangeMenu.selected);
                    if (ChangeMenu.mode == 1) {
                        ChangeStatusDataPt->LostItem(0xAE);
                    }
                    ChangeMenu.unk_4c = 0;
                    ChangeMenu.unk_03 = 5;
                    ChangeMenu.mode = 0;
                    return 0;
                }
                ComMenuSePlay(1);
            } else if (GamePad.Down(0x20)) {
                if (ChangeStatusDataPt->hp[ChangeStatusDataPt->cur_chara] < 0 || ChangeMenu.mode != 0) {
                    ChangeMenu.unk_03 = 2;
                    ChangeMenu.cursor_row = 0;
                    ChangeMenu.cursor_x = CommonMenuMes3.text_x - 0x1E;
                    ChangeMenu.cursor_y = CommonMenuMes3.text_y + 0x10 + ChangeMenu.cursor_row * 24;
                } else {
                    result = 1;
                }
                ComMenuSePlay(2);
            }
            int previous = ChangeMenu.selected;
            if (GamePad.Down(0x3000)) {
                ChangeMenu.unk_44 = 1.0f;
                ChangeMenu.selected--;
                if (ChangeMenu.selected < 0) {
                    ChangeMenu.selected = ChangeMenu.party_size - 1;
                }
            }
            if (GamePad.Down(0xC000)) {
                ChangeMenu.unk_44 = -1.0f;
                ChangeMenu.selected++;
                if (ChangeMenu.party_size - 1 < ChangeMenu.selected) {
                    ChangeMenu.selected = 0;
                }
            }
            if (previous != ChangeMenu.selected) {
                ChangeMenu.unk_03 = 1;
                BreakReadBG();
                u_long128 *buffer = chara_change_buf;
                CharaChangeInitToGL(buffer, ChangeMenu.selected);
                ComMenuSePlay(0);
            }
            break;
        }
        case 7:
            ChangeMenu.unk_4c += 7;
            if (ChangeMenu.unk_4c > 0xFA) {
                result = 2;
            }
            break;
    }
    return result;
}

/**
 * Name of the frame texture drawn around the selected portrait.
 */
extern char stay_frame_name[];

void CharaChangeDraw(void) {
    int alpha;
    int i;
    int cursor_x;
    int cursor_y;
    float step;
    float turn;
    float angle;

    setbilinear(0);
    FrameImageDraw(100, 0x80);
    if (CharaChangeReadFlag != 0) {
        MenuTextureReload(CharaChangeTexBlock);
        CTexture *frame = TexManager.GetTexture(stay_frame_name, -1);
        int frame_x = QuickCharaPos[0] - 2.0f * changeMenu_long;
        int frame_y = QuickCharaPos[1] - 1.4f * changeMenu_long;
        alpha = 0x80;
        switch (ChangeMenu.unk_03) {
            case 6:
            case 5:
                alpha = 0x80 - ChangeMenu.unk_4c * 4;
                if (alpha < 0) {
                    alpha = 0;
                }
                break;
        }
        step = 6.2831855f / ChangeMenu.party_size;
        switch (ChangeMenu.unk_03) {
            case 6:
            case 5:
                changeMenu_long += ChangeMenu.unk_4c;
                turn = step / 20.0f;
                if (ChangeMenu.unk_44 < 0.0f) {
                    turn = -turn;
                }
                for (i = 0; i < ChangeMenu.party_size; i++) {
                    angle = 3.1415927f + (step * ChangeMenu.ring_slot[i] + turn * ChangeMenu.unk_4c);
                    ChangeMenu.ring_pos[i][0] = changeMenu_long * cos(angle);
                    ChangeMenu.ring_pos[i][1] = changeMenu_long * sin(angle);
                }
                break;
            case 1:
                turn = step / 20.0f;
                if (ChangeMenu.unk_44 < 0.0f) {
                    turn = -turn;
                }
                for (i = 0; i < ChangeMenu.party_size; i++) {
                    angle = 3.1415927f + (step * ChangeMenu.ring_slot[i] + turn * ChangeMenu.unk_04);
                    ChangeMenu.ring_pos[i][0] = changeMenu_long * cos(angle);
                    ChangeMenu.ring_pos[i][1] = changeMenu_long * sin(angle);
                }
                break;
        }
        CTexture *portraits = QuickCharaTex;
        for (int chara = 0; chara < ChangeMenu.party_size; chara++) {
            float x = QuickCharaPos[0] + ChangeMenu.ring_pos[chara][0];
            float y = QuickCharaPos[1] + ChangeMenu.ring_pos[chara][1];
            int shade = 0x80;
            int u = chara * 0x30;
            int v = 0;
            if (chara > 2) {
                u = (chara - 3) * 0x30;
                v = 0x30;
            }
            if (ChangeStatusDataPt != NULL && ChangeStatusDataPt->hp[chara] <= 0) {
                shade = 0x40;
            }
            DrawMenu2DSprite(portraits, CRect_i_(x, y, 0x30, 0x30), CRect_i_(u, v, 0x30, 0x30), shade,
                             shade, shade, alpha);
        }
        if (ChangeMenu.unk_03 != 6 && ChangeMenu.unk_03 != 5 && ChangeMenu.unk_03 != 3 &&
            ChangeMenu.unk_03 != 4) {
            DrawMenuWaku(QuickCharaPos[0] - changeMenu_long - 11.0f, QuickCharaPos[1] - 12, 0x34, 0x34, 0,
                         StayTex, 0x80);
        }
        if (ChangeMenu.unk_03 == 2 || ChangeMenu.unk_03 == 3 || ChangeMenu.unk_03 == 4) {
            AllFadeForMenu(0x40);
            CommonMenuMes3.stay_frame = 1;
            CommonMenuMes3.auto_pos = 5;
            MenuTextureReload(CommonMenuMes3.tex_block);
            CommonMenuMes3.Step();
            CommonMenuMes3.DrawMesWin();
            cursor_x = CommonMenuMes3.text_x - 0x1E;
            cursor_y = CommonMenuMes3.text_y + 0x10 + ChangeMenu.cursor_row * 0x18;
            ChangeMenu.cursor_x += (cursor_x - ChangeMenu.cursor_x) / 4.0f;
            ChangeMenu.cursor_y += (cursor_y - ChangeMenu.cursor_y) / 4.0f;
            cursor_x = ChangeMenu.cursor_x;
            cursor_y = ChangeMenu.cursor_y;
        } else {
            CommonMenuMes3.auto_pos = -1;
            cursor_x = QuickCharaPos[0] - changeMenu_long - 32.0f;
            cursor_y = QuickCharaPos[1] + 6;
            if (cursor_x < -40 || cursor_x > 640 || cursor_y < -40 || cursor_y > 450) {
                cursor_x = 650;
                cursor_y = 450;
            }
        }
        CursorVibeCnt++;
        if (CursorVibeCnt > 1080000) {
            CursorVibeCnt = 0;
        }
        if (ChangeMenu.mode != 0) {
            MenuTextureReload(CharaChangeTexBlock);
            DrawMenu2DSprite(QuickCharaTex, CRect_i_(0x5C, 0x124, 0x1A, 0x1B), CRect_i_(0xA6, 0, 0x1A, 0x1C), alpha);
            DrawMenu2DSprite(QuickCharaTex, CRect_i_(0x76, 0x124, 0x30, 0x1B), CRect_i_(0xC0, 0, 0x20, 0x1C), alpha);
            DrawMenu2DSprite(QuickCharaTex, CRect_i_(0xA6, 0x124, 0x1A, 0x1B), CRect_i_(0xE0, 0, 0x1A, 0x1C), alpha);
            int value = (u16) ChangeStatusDataPt->money_signed;
            RECT value_digits = {0x70, 0x74, 0xC, 0xC};
            DrawMenuNumber(value, 0xB7, 0x12C, QuickCharaTex, value_digits, 0, alpha);
            MenuHelpWinDraw(100, 0x140, 10.6f, 0.9f, alpha);
            DrawMenu2DSprite(QuickCharaTex, CRect_i_(0x76, 0x150, 0x20, 0x20), CRect_i_(0, 0x60, 0x20, 0x20), alpha);
            DrawMenu2DSprite(QuickCharaTex, CRect_i_(0x104, 0x158, 0x10, 0x10), CRect_i_(0x20, 0x60, 0x10, 0x10), alpha);
            MenuTextureReload(CommonMenuMes1.tex_block);
            CommonMenuMes1.line_pos[0].x = 0xA0;
            CommonMenuMes1.line_pos[0].y = 0x14A;
            CommonMenuMes1.line_pos[1].x = 0xAA;
            CommonMenuMes1.line_pos[1].y = 0x15E;
            CommonMenuMes1.Step();
            CommonMenuMes1.DrawMesWin();
            RECT count_digits = {0, 0x9E, 0xC, 0x12};
            ITEM_PACK *pack = &ChangeStatusDataPt->item_pack;
            int count = GetNowItemNum(ITEM_STAND_IN_POWDER, pack);
            int count_x = 0x122;
            count_x += (count_digits.width >> 1) * GetNumberKeta(count);
            DrawMenuNumber(count, count_x, 0x158, count_digits, StayTex, 0, 0, 0x1C0, alpha);
        }
        if (ChangeMenu.unk_03 != 6 && ChangeMenu.unk_03 != 5 && ChangeMenu.unk_03 != 3 &&
            ChangeMenu.unk_03 != 4) {
            DrawMenuObjectVibe(cursor_x, cursor_y, 1, 0x40);
        }
        setbilinear(1);
    }
}

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

/**
 * Quick-use item slots and the models they draw with.
 */
extern "C" CActiveItemPack activeItem;

int DngActItemModelBuild(int wait) {
    BG_READ_INFO *model;
    BG_READ_INFO *texture;
    u_int *model_buffer;
    u_int *texture_buffer;
    int texture_size;
    int read_index;
    int i;

    if (ReadBGSync() != 0) {
        if (wait != 0) {
            while (ReadBGSync() != 0) {
            }
        } else {
            ReadBG();
            return 0;
        }
    }
    ITEM_PACK *pack = &BtlMenuStatusPt->item_pack;
    int items[3] = {pack->quick_item_slot[0], pack->quick_item_slot[1], pack->quick_item_slot[2]};
    read_index = 0;
    for (i = 0; i < 3; i++) {
        if (items[i] < ITEM_DUNGEON_START) {
            continue;
        }
        model = GetReadBGFile(read_index * 2);
        texture = GetReadBGFile(read_index * 2 + 1);
        read_index++;
        if (model != NULL) {
            model_buffer = (u_int *) model->buffer;
        }
        if (texture != NULL) {
            texture_buffer = (u_int *) texture->buffer;
            texture_size = texture->size;
        }
        if (model == NULL || texture == NULL) {
            continue;
        }
        if (activeItem.model[i + 1] != -1) {
            activeItem.models->DeleteModel(activeItem.model[i + 1]);
            activeItem.model[i + 1] = -1;
        }
        if (activeItem.model[i + 1] != -1) {
            activeItem.models->DeleteModel(activeItem.model[i + 1]);
        }
        activeItem.model[i + 1] =
            activeItem.models->SetCashModel(items[i], model_buffer, texture_buffer, texture_size);
        activeItem.model[i + 5] = 0;
        activeItem.item[i + 1] = items[i];
    }
    return 1;
}

int DngActiveItemTextureCopy(void) {
    int i;
    ITEM_PACK *pack = &UserStatus->item_pack;
    if (pack == NULL) {
        return -1;
    }
    char source[] = "itemicon";
    for (i = 0; i < 3; i++) {
        int item_no = pack->quick_item_slot[i];
        if (item_no >= ITEM_DUNGEON_START) {
            COM_ITEM_INFO *info = GetCommonItemInfo(item_no);
            if (info != NULL) {
                int icon = info->icon_index;
                if (icon >= 0 && icon <= 256) {
                    int u = (icon % 8) * 32;
                    int v = (icon >> 3) * 32;
                    setItemToReserved(source, u, v, "itempack", i * 32 + 32, 0);
                }
            }
        }
    }
    return 1;
}
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @1841);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2044);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2045);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2046);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2047);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2048);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2049);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2050);
INCLUDE_RODATA("asm/nonmatchings/menu_dungeon", @2051);
int DngActiveWeaponTextureCopy(void) {
    int chara = UserStatus->cur_chara;
    char source[] = "wepicon";
    int slot = UserStatus->equipped_weapon_slot[chara];
    WEAPON_HAVE *owned = UserStatus->chara_weapons[chara];
    WEAPON_HAVE *weapon = &owned[slot];
    int default_no = GetDefaultWeaponNo(chara);
    s16 pos[3][2] = {{0, 0}, {0, 32}, {32, 32}};
    s16 weapons[3] = {weapon->item_no, default_no + 1, default_no};

    for (int i = 0; i < 3; i++) {
        COM_ITEM_INFO *info = GetCommonItemInfo(weapons[i]);
        if (info != NULL) {
            int icon = info->icon_index;
            int u = (icon % 8) * 32;
            int v = (icon >> 3) * 32;
            setItemToReserved(source, u, v, "itempack", pos[i][0], pos[i][1]);
        }
    }
    return 1;
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

int GetWeaponMsgNo2(s32 item_no) {
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

/**
 * Checks whether the requested Atla is present in the georama.
 */
int GetAtraTipNowHave(int tip_no, int georama_no) {
    int have;
    int i;
    int plot;
    int j;
    int id;
    s16 *elem;
    SV_EDIT_PARTS_INFO *info;
    EDIT_PARTS_ATRA *atra;

    have = 0;
    if (tip_no < 0x28) {
        SV_EDIT_PARTS_INFO *plot_info = SaveData->GetEditPartsInfo(georama_no, tip_no);
        if (plot_info != NULL && plot_info->flag != 0) {
            have = 1;
        }
    } else {
        elem = SaveData->GetElemData(georama_no);
        for (i = 0; i < 0x80; i++, elem++) {
            if (*elem == tip_no - 0x28) {
                have = 1;
                break;
            }
        }
        if (have == 0) {
            for (plot = 0; plot < 0x18; plot++) {
                info = SaveData->GetEditPartsInfo(georama_no, plot);
                atra = GetEditAtraPartsData(georama_no, plot);
                for (j = 0; j < 6; j++) {
                    EDIT_CHIP_ATTACH_DATA *element = atra->elements + j;
                    id = element->id;
                    if (id >= 0 && id == tip_no - 0x28 && info->npc_slot[j] != 0) {
                        have = 1;
                    }
                }
            }
        }
    }
    return have;
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

/**
 * Loads the selected item's model and texture files into the preview buffer.
 */
int InitItemPolygonView(int item_no, u_long128 *buffer) {
    char model_path[64];
    char texture_path[76];
    int size;
    u_long128 *texture_buffer;

    if (item_no < 0x51 || item_no >= 0x101) {
        return 0;
    }
    BtGetItemNamePath(model_path, texture_path, item_no);
    StartReadBG();
    MDebugItemPolyViewFlag = 0;
    buffer = MenuCalcBufAlignment(buffer);
    if (LoadFileBG(model_path, buffer, &size) == 0) {
        return 1;
    }
    texture_buffer = buffer + (size >> 4) + 1;
    texture_buffer = MenuCalcBufAlignment(texture_buffer);
    if (LoadFileBG(texture_path, texture_buffer, &size) == 0) {
        return 1;
    }
    ItemPolyView = NULL;
    return 0;
}

/** Position the debug item preview draws its model at. */
float menudebugpos[4] = {4.0f, 0.0f, 0.0f, 1.0f};

/** Rotation the debug item preview turns its model to. */
float menudebugrot[3] = {0.0f, 0.0f, 0.0f};

/** Scale the debug item preview draws its model at. */
float menudebugrscale[3] = {3.0f, 3.0f, 3.0f};

/**
 * Buffer the item preview's model is read into.
 */
CDataAlloc2<1> MenuItemCashBuffer(-1);

/**
 * Name of the frame-buffer texture the item preview's pictures are drawn into.
 */
extern char item_view_frame_image[];

static int EnterItemPolygonView(void) {
    BG_READ_INFO *model;
    BG_READ_INFO *texture;

    if (ReadBGSync() == 0 && polyreadflag == 0 && MDebugItemPolyViewFlag == 0) {
        LOADTEXTURE_INFO2 table[] = {
            {item_view_frame_image, 0, 0},
            {NULL, 0, 0},
            {NULL, 0, 0},
        };
        table[0].block_no = BtlMenuExReadBlock;
        table[1].block_no = BtlMenuExReadBlock;
        model = GetReadBGFile(0);
        texture = GetReadBGFile(1);
        table[1].name = (char *) texture->buffer;
        TexManager.DeleteTextureBlock(BtlMenuExReadBlock);
        TexManager.CleanUpTextureList();
        TexManager.LoadTextureBlockEX(-1, table);
        if (model == NULL) {
            return 0;
        }
        if (texture == NULL) {
            return 0;
        }
        MenuItemCashBuffer.base = (u_char *) (texture->buffer + (texture->size >> 4) + 1);
        MenuItemCashBuffer.limit = 0x6080;
        MenuItemCashBuffer.Reset();
        MDebugItemPolyViewFlag = 1;
        ItemPolyView = (CFrame *) LoadMDSFile((u_int *) model->buffer, &MenuItemCashBuffer, 0, NULL, NULL);
        sceVu0FVECTOR position = {4.0f, 0.0f, 0.0f, 1.0f};
        float rotation[3] = {0.0f, 0.0f, 0.0f};
        float scale[3] = {3.0f, 3.0f, 3.0f};
        // Each copy moves a whole vector, one float more than the rotation and scale hold.
        memcpy(menudebugpos, position, sizeof(sceVu0FVECTOR));
        memcpy(menudebugrot, rotation, sizeof(sceVu0FVECTOR));
        memcpy(menudebugrscale, scale, sizeof(sceVu0FVECTOR));
        return 1;
    }
    return 0;
}

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

void DebugItemGetDraw(void) {
    CTexture *sheets[5] = {ItemIcon, ItemIcon, WepIcon, WepIcon, WepIcon};
    int sheet_y[5] = {0, 0x100, 0, 0x100, 0x200};
    CTexture *sheet = sheets[ItemAutoGet.page];
    int y = sheet_y[ItemAutoGet.page];
    int height = 0x100;

    if (ItemAutoGet.page == 4) {
        height = 0x80;
    }
    if (sheet != NULL) {
        MenuTextureReload(sheet->block);
    }
    MGFillBox(CRect_i_(0x460, 0x280, 0x1000, 0x800), 0, 0, 0, 0x60);
    DrawMenu2DSprite(sheet, CRect_i_(0x46, 0x50, 0x100, height), CRect_i_(0, y, 0x100, height), 0x80);
    int item_no = ConvDebugSelectToExcelListNo(ItemAutoGet.selection);
    if (ItemAutoGet.show_model) {
        DrawItemDataView(item_no);
    }
    int cell = ItemAutoGet.selection - ItemAutoGet.page * 64;
    DrawMenuObjectVibe((cell % 8) * 32 + 0x2E, (cell / 8) * 32 + 0x50, 1, 0x40);
    COM_ITEM_INFO *info = GetCommonItemInfo(item_no);
    if (info != NULL) {
        int message = info->msg + 500;
        if (CommonMenuMes2.mes_made != message) {
            CommonMenuMes2.MakeMesWin(message);
        }
    }
}

/**
 * Debug text the dungeon menus print their item data into.
 */
CDebugFont MenuDbgMsg;

ITEM_AUTO_GET ItemAutoGet;

// The item data view's line formats, which the table below points at.
extern char item_templete_no[];
extern char item_templete_type[];
extern char item_templete_use[];
extern char item_templete_attribute[];
extern char item_templete_name_index[];
extern char item_templete_help_index[];
extern char item_templete_volume[];
extern char item_templete_gold[];

/**
 * Formats of the lines the item data view prints.
 */
char *ItemTemplete[8] = {
    item_templete_no,         item_templete_type,       item_templete_use,    item_templete_attribute,
    item_templete_name_index, item_templete_help_index, item_templete_volume, item_templete_gold,
};

static void DrawItemDataView(int item_no) {
    int block;

    switch (BtlMenuMode) {
        case 0:
            block = 0xC;
            break;
        case 1:
            block = 0x1F;
            break;
    }
    MenuTextureReload(block);
    int line = 0;
    char type[128] = "";
    if (0 <= item_no && item_no < ITEM_ATTACH_START) {
        return;
    }
    // The attachment index computed here goes unused.
    if (item_no >= ITEM_ATTACH_START && item_no < 0xFF) {
        int index = item_no - ITEM_ATTACH_START;
        if (index < 0) {
            index = 0;
        }
    }
    if (MDebugItemPolyViewFlag == 0) {
        MenuDbgMsg.len += sprintf(&MenuDbgMsg.text[MenuDbgMsg.len], "-----ItemData View-----\n");
        MenuDbgMsg.len += sprintf(&MenuDbgMsg.text[MenuDbgMsg.len], ItemTemplete[line++], item_no);
        MenuDbgMsg.len += sprintf(&MenuDbgMsg.text[MenuDbgMsg.len], ItemTemplete[line], type);
        type[0] = '\0';
    }
    if (GamePad.Down(0x10)) {
        polyreadflag = InitItemPolygonView(ConvDebugSelectToExcelListNo(ItemAutoGet.selection), BtlMenuReadBuf);
    }
    if (polyreadflag == 0) {
        polyreadflag = EnterItemPolygonView();
    }
    if (polyreadflag != 0) {
        DrawItemPolygonView();
    }
}
