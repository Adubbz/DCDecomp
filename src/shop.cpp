#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 760

#include "shop.hpp"

#include <libvu0.h>

#include <cmath>
#include <cstdlib>

#include "battlemenu.hpp"
#include "camera.hpp"
#include "character.hpp"
#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "gamepad.hpp"
#include "mathutil.hpp"
#include "memcard.hpp"
#include "menu_draw.hpp"
#include "menu_inventory.hpp"
#include "menuitemstep.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

/**
 * Shop UI bookkeeping shared by the charge shop and item shop screens: their
 * cursor, phase and animation state. Only the handful of fields read outside
 * this unit's own functions are named.
 */
struct ShopMenuWork {
    s16 shop_no;  /**< Shop being run. */
    s16 side;     /**< Board the cursor is on: 0 the shop's stock, 1 the player's own board. */
    s16 mode;     /**< How the shop was opened. */
    s16 unk_06;
    PERSONAL_BOARD board; /**< The player's side of the shop: the personal board and the records it holds. */
    s32 unk_168;
    float stock_y;      /**< Screen Y the stock board draws at, eased toward its top row. */
    float stock_scroll; /**< Scroll bar position of the stock board. */
    s16 unk_174;
    u8 stock_top_row; /**< Row the stock board shows first. */
    u8 unk_177;
    float cursor_x; /**< Screen X of the cursor, eased toward its cell. */
    float cursor_y; /**< Screen Y of the cursor, eased toward its cell. */
    s16 talk_mode;  /**< What the shopkeeper is saying or waiting on; 0 while the player shops. */
    s16 unk_182;
    s32 step_count; /**< Frames the shop has spent in its talk mode. */
    s16 ready;      /**< Nonzero once the shop's textures are entered. */
    s16 tex_block;  /**< Texture block the shop's textures are entered into. */
    s16 unk_18C;
    s16 alpha;      /**< Opacity the shop draws with. */
    s16 lang;       /**< Language the shop's plates are laid out for. */
    s16 unk_192;
    s16 person_state;     /**< Shopkeeper model: 1 while it is read, 2 once it is built, 0 when there is none. */
    s16 person_tex_block; /**< Texture block the shopkeeper's textures are entered into. */
    s16 unk_198;
    s16 msg_mode; /**< How the shopkeeper's message is shown. */
    s16 unk_19C;
    s16 unk_19E;
    s32 unk_1A0;
    s32 unk_1A4;
};

STATIC_ASSERT(sizeof(ShopMenuWork) == 0x1A8);

/** Shared UI state for the charge shop and item shop screens. */
extern ShopMenuWork ShopMenu;

/** The icon being carried between the shop's board and the player's. */
extern ShopIconMove ShopDataMove;

/** Player status the shop currently open is reading and writing. */
extern CUserStatus *ShopUserStatusPt;

/** Stock inventory the shop currently open is reading and writing. */
extern CStockItem *ShopStockPt;

/** Camera the menu draws 3D models under. */
extern CCamera MenuCamera;

/** Model the menus draw a character with; the shopkeeper while a shop is open. */
extern CCharacter MenuCharaFrame;

/** Texture the personal board's frame, tags and arrows are drawn from. */
extern CTexture *PerBoardTex;

/** Arena the editor's menus are read into. */
extern CDataAlloc2<1> EdMenuBuffer;

/** Steps item volumes for the menus. */
extern CMenuItemStep ItemVolumeStep;

/** Texture of the frame drawn while a menu waits for its data. */
extern CTexture *StayTex;

/** Arena the shopkeeper's model and the item shop's board tables are read into. */
extern CDataAlloc2<1> ShopCashBuffer;

/** Texture the shop board frame, tags and tickets are drawn from. */
extern CTexture *ShopBoard;

/** Icon sheet of the consumable items. */
extern CTexture *ItemIcon;

/** Icon sheet of the weapons. */
extern CTexture *WepIcon;

/** Per-slot state (0 = empty, 1 = held, 2 = just moved) of the personal item board. */
extern s32 *ItemBoardInfo;

/** Per-slot state of the personal weapon board, indexed by character then slot. */
extern s32 (*WeaponBoardInfo)[10];

/** Per-slot state of the personal attachment board. */
extern s32 *AttachBoardInfo;

/** Per-slot state of the charge shop's personal board. */
extern s32 *ShopBoardInfo;

/** The charge shop's goods list, one entry per personal board slot. */
extern SHOP_ITEMLIST *ShopListPt;

/** Working copy of the item shop's board, allocated out of the shop's arena. */
extern SHOP_ITEMLIST *ShopWorkBuf;

/** Screen position of the shop's help window. */
extern float ShopHelpWinPos[2];

/** Height of the shop's help window. */
extern float ShopHelpWinH;

/** Width of the shop's help window. */
extern float ShopHelpWinW;

/** Number of goods on each charge shop's board. */
extern s16 ChargeShopMax[3];

/** Nonzero while the item shop is open, zero while the charge shop is open. */
extern s16 ChargeOrShopFlag;

#ifdef NON_MATCHING // draft declarations
#include <cstdio>
#include <cstring>

#include "itemdata.hpp"
#include "menu_dungeon.hpp"
#include "menu_misc.hpp"
#include "stockitem.hpp"

extern CDataAlloc2<1> ShopCashBuffer2;

static void ShopMasterVectorSet(int);
static int ChargeSelectKey();
static void ShopModelMsgFunc(int);
#endif

/**
 * State of the fishing prize exchange screen.
 */
struct FishMenuWork {
    s16 tex_block;  /**< Texture block the exchange's textures are entered into. */
    s16 tex_block2; /**< Second texture block lent to the exchange. */
    s16 ready;      /**< Nonzero once the exchange's contents may be drawn. */
    s16 warning;    /**< Which refusal the exchange shows, as an offset from its first refusal message. */
    s32 point;      /**< Fishing points the player has left to spend. */
    s32 cursor_y;   /**< Screen Y of the cursor, eased toward its row. */
    s16 mode;       /**< How the exchange was opened. */
    s16 confirm;    /**< Choice the confirmation window's cursor is on: 0 yes, 1 no. */
    s16 cursor;     /**< Prize the cursor is on. */
    s16 fade_mode;  /**< What the exchange is doing: 0 opening, 1 closing, 3 choosing, 4 confirming, 5 refusing. */
    s16 top;        /**< Prize the list shows first. */
    u8 unk_1A[6];
    s32 fade_count;     /**< Frames the current fade has run for. */
    u_long128 *buffer;  /**< Buffer the exchange's files are read into. */
};

STATIC_ASSERT(sizeof(FishMenuWork) == 0x28);

/** State of the fishing prize exchange screen. */
extern FishMenuWork FishMenu;

/**
 * State of the fishing record screen.
 */
struct FishRecordMenuWork {
    s32 cursor;     /**< Rank the cursor is on. */
    s32 top;        /**< Rank the board shows first. */
    s32 mode;       /**< The mode the record view was opened in. */
    s32 fade_mode;  /**< Whether the record view is fading in (0) or out (1). */
    s32 fade_count; /**< Frames the current fade has run for. */
    s32 cursor_y;   /**< Screen Y of the cursor, eased toward its row. */
    s32 ready;      /**< Nonzero once the record view's contents may be drawn. */
    s32 tex_block;  /**< Texture block the record view's textures are entered into. */
    s32 tex_block2; /**< Second texture block the record view's textures are entered into. */
};

STATIC_ASSERT(sizeof(FishRecordMenuWork) == 0x24);

/** State of the fishing record screen. */
extern FishRecordMenuWork FishRecordMenu;

/** Texture the fishing exchange's fish icons are drawn from. */
extern CTexture *FishMenuTex;

/** Message number, less thirty, describing each fishing prize. */
extern s8 FishMsg[18];

/**
 * One prize the fishing exchange offers.
 */
struct FISH_EXCHANGE_ITEM {
    s16 item_no; /**< Prize the exchange offers. */
    s16 price;   /**< Fishing points the prize costs. */
};

STATIC_ASSERT(sizeof(FISH_EXCHANGE_ITEM) == 4);

/** The prizes the fishing exchange offers. */
extern FISH_EXCHANGE_ITEM exitemlst[35];

/** Sort priority of each dungeon-item sort key for the item board sort. */
extern s32 sort_table[9];

/** Sort priority of each attachment kind for the attachment board sort. */
extern s32 asort_table[5];

/** Ordering the next item board sort tries, from one to eight. */
extern s32 sort_top_type;

/** Ordering the next attachment board sort tries, from zero to four. */
extern s32 asort_top_type;

/**
 * Gives the dungeon item pack a player status carries.
 */
static inline ITEM_PACK *ShopUserItemPack(CUserStatus *user_status) {
    return &user_status->item_pack;
}

/** An item's buy and sell price. */
struct ITEM_MONEY_ENTRY {
    s16 buy_price;
    s16 sell_price;
};

/** The buy and sell price of every item from 0x51 on, indexed by item number less 0x51. */
ITEM_MONEY_ENTRY PriceList[296] = {
    {300, 150},
    {300, 150},
    {300, 150},
    {300, 150},
    {300, 150},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {300, 150},
    {260, 130},
    {260, 130},
    {300, 150},
    {3000, 600},
    {3000, 600},
    {3000, 600},
    {3000, 600},
    {3000, 600},
    {3000, 600},
    {3000, 600},
    {3000, 600},
    {3000, 600},
    {3000, 600},
    {3000, 600},
    {3000, 600},
    {5000, 1000},
    {2, 1},
    {2, 1},
    {2, 1},
    {300, 150},
    {300, 150},
    {300, 150},
    {300, 150},
    {300, 150},
    {300, 150},
    {300, 150},
    {300, 150},
    {300, 150},
    {300, 150},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {400, 200},
    {440, 220},
    {380, 190},
    {400, 200},
    {1000, 500},
    {1000, 500},
    {1000, 500},
    {1000, 500},
    {1000, 500},
    {1000, 500},
    {2, 1},
    {2, 1},
    {2, 1},
    {10, 5},
    {30, 15},
    {60, 30},
    {20, 10},
    {130, 65},
    {300, 150},
    {80, 40},
    {120, 60},
    {100, 50},
    {300, 150},
    {60, 30},
    {2, 1},
    {2, 1},
    {2, 1},
    {80, 40},
    {4, 2},
    {100, 50},
    {100, 50},
    {100, 50},
    {100, 50},
    {100, 50},
    {100, 50},
    {80, 40},
    {90, 45},
    {120, 60},
    {80, 40},
    {2, 1},
    {43, 22},
    {2, 1},
    {50, 25},
    {20, 10},
    {100, 50},
    {20, 10},
    {1000, 500},
    {100, 50},
    {800, 400},
    {800, 400},
    {500, 250},
    {200, 100},
    {2, 1},
    {500, 250},
    {300, 150},
    {450, 225},
    {400, 200},
    {420, 210},
    {380, 190},
    {2, 1},
    {1000, 1000},
    {300, 150},
    {2, 1},
    {2, 1},
    {2, 1},
    {400, 200},
    {400, 200},
    {400, 200},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {300, 150},
    {300, 150},
    {180, 90},
    {2, 1},
    {500, 250},
    {800, 400},
    {800, 400},
    {1000, 500},
    {2, 1},
    {2, 1},
    {2, 1},
    {50, 25},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {20, 10},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {300, 75},
    {500, 125},
    {2500, 625},
    {700, 175},
    {800, 200},
    {1000, 250},
    {400, 100},
    {2000, 500},
    {3000, 750},
    {2000, 500},
    {2400, 600},
    {500, 125},
    {3000, 750},
    {3000, 750},
    {2, 1},
    {3000, 750},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 0},
    {2, 1},
    {2, 1},
    {2, 1},
    {800, 200},
    {920, 230},
    {2, 1},
    {900, 225},
    {990, 248},
    {2500, 625},
    {1500, 375},
    {2, 1},
    {1000, 250},
    {2000, 500},
    {940, 235},
    {1500, 375},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {360, 90},
    {600, 150},
    {1000, 250},
    {400, 100},
    {900, 225},
    {1000, 250},
    {1200, 300},
    {2, 1},
    {2, 1},
    {500, 125},
    {600, 150},
    {2, 1},
    {900, 225},
    {2, 1},
    {2, 1},
    {500, 125},
    {700, 175},
    {800, 200},
    {850, 212},
    {1000, 250},
    {400, 100},
    {900, 225},
    {1500, 375},
    {2, 1},
    {2, 1},
    {2, 1},
    {850, 212},
    {200, 50},
    {2, 1},
    {1000, 250},
    {2, 1},
    {2, 1},
    {400, 100},
    {700, 175},
    {600, 150},
    {720, 180},
    {800, 200},
    {1200, 300},
    {1400, 350},
    {2, 1},
    {2, 1},
    {2, 1},
    {400, 100},
    {300, 75},
    {2, 1},
    {720, 180},
    {2, 1},
    {2, 1},
    {800, 200},
    {1000, 250},
    {1200, 300},
    {1500, 375},
    {1700, 425},
    {2000, 500},
    {2, 1},
    {2, 1},
    {2, 1},
    {2, 1},
    {300, 75},
    {1800, 450},
    {800, 200},
    {1000, 250},
    {2, 1},
    {2, 1},
    {3000, 750},
    {3200, 800},
    {3300, 825},
    {3400, 850},
    {4000, 1000},
    {5500, 1375},
    {6500, 1625},
    {2, 1},
    {2, 1},
    {1500, 375},
    {3400, 850},
    {1000, 250},
};

/**
 * Gives the goods list one item shop sells from.
 *
 * One shop's twenty-item goods list, eighteen shops long, each ended by -1.
 */
static s16 ItemShopList2[18][20] = {
    {0x94, 0x91, 0xB1, 0xB7, 0xAF, 0xAE, 0xB0, 0x97, 0x99, 0x9F, 0xEB, 0x5B, 0x5C, 0x51, 0x52, 0x53, 0x54, 0x55, 0x6F, 0xC0},
    {0x94, 0x9B, 0x92, 0xB0, 0xB1, 0xB7, 0xAE, 0xAF, 0x73, 0x97, 0x99, 0xEB, 0xC0, 0x105, 0xC5, 0xC7, -1},
    {0xE2, 0xE2, 0xE2, 0xC1, 0xC1, 0xBE, 0xBE, 0xF5, 0xF5, 0xF5, 0x91, 0x92, 0x93, 0xAE, -1},
    {0x91, 0x92, 0x93, 0x96, 0x97, 0x98, -1},
    {0x91, 0x92, 0x93, 0x94, 0x96, 0x5B, 0x5C, 0x5D, 0x5E, -1},
    {0x91, 0x92, 0x93, 0x96, 0x9B, 0x51, 0x52, 0x53, 0x54, 0x55, -1},
    {0x91, 0x92, 0x93, 0x96, 0x95, 0x9F, 0x71, 0x78, 0x70, -1},
    {0xA6, 0xA7, 0xA8, 0xA9, 0xAA, 0xB1, 0xB0, 0xAE, -1},
    {0x109, 0x104, 0x130, 0x140, 0x14F, 0xB1, 0xB7, 0xAE, 0xB0, 0xAF, 0xEB, 0xC0, -1},
    {0x93, 0x9B, 0x95, 0x9A, 0x9F, 0xB1, 0xB7, 0xAE, 0xB0, 0xAF, 0x54, 0x72, 0x75, 0xEB, 0xC0, 0xBB, -1},
    {0x91, 0x92, 0x93, 0x95, 0x9F, 0x74, 0xAE, 0xB0, 0xAF, 0xB1, 0xB7, 0xEB, 0x16D, 0x176, 0xC0, -1},
    {0x93, 0x95, 0x9A, 0xAE, 0xB0, 0xAF, 0xB1, 0xB7, 0xEB, 0xC0, -1},
    {0xA1, 0xA2, 0xA3, 0xA4, 0xA5, 0x51, 0x52, 0x53, 0x54, 0x55, 0x71, 0x78, 0xC0, -1},
    {0x94, 0x91, 0xB1, 0xB7, 0xB0, 0xAE, 0xAF, 0x97, 0xC0, -1},
    {0x94, 0x9B, 0x92, 0xB0, 0xB1, 0xB7, 0xAE, 0xAF, 0x73, 0x97, 0x99, 0xEB, 0xC0, -1},
    {0x93, 0x9B, 0x98, 0x99, 0x9A, 0x9F, 0xAE, 0xB0, 0xAF, 0xB1, 0xB7, 0xEB, 0xC0, -1},
    {0x5F, 0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, -1},
    {0x5B, 0x5C, 0x5D, 0x5E, 0x6F, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x78, -1},
};

static void DrawSellTicket_2(int x, int y, int clip_top, int clip_bottom, int mode);

static void SetShopTalkMsgPos();

static void DrawCheckButton(int x, int y, int mode);

static void DrawSmallSellTicket(int selected, int x, int y, int clip_top, int clip_bottom, int mode);

static void ItemShopGoodInitialize(int shop_no);

s16 *GetItemShopList(int shop_no) {
    return ItemShopList2[shop_no];
}

void InitShopItemListData(SHOP_ITEMLIST *item_list) {
    if (item_list != NULL) {
        item_list->item_no = 0;
        memset(&item_list->data, 0, sizeof(item_list->data));
    }
}

void ShopIconMove::IconMoveTarSet(int slot_no, int icon_no, int item_no, MENU_ITEMDATA *item_data, float start_x, float start_y, int to_stock) {
    this->to_stock = to_stock;
    this->item_no = item_no;
    this->slot_no = slot_no;
    this->icon_no = icon_no;
    memcpy(&this->data, item_data, sizeof(this->data));
    this->pos_x = start_x;
    this->pos_y = start_y;
}

int ShopIconMove::IconAutoMove(int is_buy, int force_arrive) {
    if (item_no < 0x51) {
        return -1;
    }

    int col = icon_no % 5 * 0x28;
    int row = icon_no / 5 * 0x28;
    int target_x;
    int target_y;

    if (is_buy) {
        target_x = col + 0x16A;
        target_y = row + 0x86;
    } else {
        target_x = col + 0x16A;
        target_y = row + 0x90;
    }
    if (to_stock) {
        target_x = col + 0x3E;
        target_y = row + 0x90;
    }

    pos_x += (float) (target_x - (int) pos_x) / 4.0f;
    pos_y += (float) (target_y - (int) pos_y) / 4.0f;

    int arrived = 0;
    if (force_arrive || (float) abs((int) (pos_x - (float) target_x)) < 4.0f) {
        pos_x = target_x;
        arrived++;
    }
    if (force_arrive || (float) abs((int) (pos_y - (float) target_y)) < 4.0f) {
        pos_y = target_y;
        arrived++;
    }

    if (arrived >= 2) {
        s32 *board_info;

        switch (WhatIsKindofItem(item_no)) {
            case 0:
                if (to_stock) {
                    s16 item = item_no;
                    s16 volume = data.volume;
                    ShopStockPt->SetItemToPos(slot_no, &item, &volume);
                } else {
                    ITEM_PACK *pack = ShopUserItemPack(ShopUserStatusPt);
                    pack->item[slot_no] = item_no;
                    pack->item_vol[slot_no] = data.volume;
                    board_info = &ItemBoardInfo[slot_no];
                }
                break;
            case 2:
                if (to_stock) {
                    ShopStockPt->SetAttachToPos(slot_no, &data.attach);
                } else {
                    DNG_CONSUMABLE *attach = ShopUserStatusPt->consumable_items;
                    memcpy(&attach[slot_no], &data.attach, sizeof(DNG_CONSUMABLE));
                    attach[slot_no].id = item_no;
                    board_info = &AttachBoardInfo[slot_no];
                }
                break;
            case 1:
                if (to_stock) {
                    ShopStockPt->SetWepToPos(slot_no, &data.weapon);
                } else {
                    int chara_no = slot_no / 10;
                    CUserStatus *status = ShopUserStatusPt;
                    WEAPON_HAVE *row = status->chara_weapons[chara_no];
                    WEAPON_HAVE *weapon = &row[slot_no % 10];
                    memcpy(weapon, &data.weapon, sizeof(WEAPON_HAVE));
                    weapon->item_no = item_no;
                    board_info = &WeaponBoardInfo[0][slot_no];
                }
                break;
        }
        if (ChargeOrShopFlag) {
            *board_info = 2;
        }
        unk_02 = -1;
        slot_no = -1;
        icon_no = -1;
        item_no = -1;
        pos_y = 0.0f;
        pos_x = 0.0f;
        memset(&data, 0, sizeof(data));
    }
    return 0;
}

void ShopIconMove::IconAutoMoveDraw() {
    if (item_no >= 0x51) {
        int kind = WhatIsKindofItem(item_no);

        if (ShopMenu.board.page == kind) {
            int num = 0;
            int item = item_no;

            if (item == 0x5A) {
                num = data.param[1];
            }
            if (item >= 0x5B && item < 0x5F) {
                num = data.param[item - 0x57];
            }
            DrawIconParts(item, pos_x, pos_y, 0, 0x280, 0x80, num);
        }
    }
}

/**
 * Returns an item's price, buying or selling, from the item table.
 *
 * @mangled GetItemMoney__Fii
 * @address 0x1E6EF0
 * @size 0x44
 */
static s16 GetItemMoney(int item_no, int sell) {
    if (sell != 0) {
        return PriceList[item_no - 0x51].sell_price;
    }
    return PriceList[item_no - 0x51].buy_price;
}

int ShopNoInput(int *state, int shop_no, int mode) {
    if (shop_no < 0 || shop_no > 200) {
        shop_no = 0;
    }
    if (shop_no < 100) {
        if (shop_no > 20) {
            shop_no = 0;
        }
        InitItemShop2(state, shop_no, mode);
        ChargeOrShopFlag = 1;
    } else {
        shop_no -= 100;
        if (shop_no > 5) {
            shop_no = 0;
        }
        InitChargeShop(state, shop_no, mode);
        ChargeOrShopFlag = 0;
    }
    return 1;
}

void InitAllHaveData() {
    InitHaveData(ShopHaveItemPt);
    InitHaveWep(ShopHaveWepPt);
    InitHaveAttach(ShopHaveAttachPt);
    ShopHaveItemPt->unk_00 = 0;
}

int CommonShopLoop() {
    int done = 0;

    ShopMenu.unk_06 = 0;
    switch (ChargeOrShopFlag) {
        case 0:
            done = ChargeShopLoop();
            break;
        case 1:
            done = ItemShopLoop2();
            break;
    }
    return done;
}

/**
 * Places, scales and turns the shopkeeper's model for one shop.
 *
 * @mangled ShopPolySetInit__Fii
 * @address 0x1E7080
 * @size 0x150
 */
static void ShopPolySetInit(int shop_no, int person_no) {
    float place[2][18][3] = {
        {
            {-7.84f, -15.5f, 0.9f},
            {-7.3f, -9.555f, 0.25f},
            {-7.04f, -21.21f, 1.0f},
            {-7.56f, -18.967f, 1.0f},
            {-7.0f, -14.0f, 1.0f},
            {-7.3359f, -15.818726f, 0.95f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f},
        },
        {
            {-7.01f, -17.0f, 0.9f},
            {-7.21f, -7.8f, 0.5f},
            {-7.46f, -19.6f, 1.0f},
            {-8.0665f, -18.923f, 1.0f},
            {-8.0665f, -18.923f, 1.0f},
            {-8.0665f, -18.923f, 1.0f},
            {-8.0665f, -18.923f, 1.0f},
            {-7.0f, -20.5f, 1.0f},
            {-7.5378f, -15.362f, 0.8f},
            {-7.0f, -19.0f, 0.8f},
            {-7.0f, -15.0f, 1.0f},
            {-7.0f, -17.0f, 1.0f},
            {-7.6f, -18.7f, 0.8f},
            {-7.01f, -17.2f, 0.9f},
            {-7.21f, -7.8f, 0.5f},
            {-7.5378f, -18.5f, 0.8f},
            {-7.0f, -17.0f, 1.0f},
            {-7.0f, -17.0f, 1.0f},
        },
    };
    float turn[2][18][4] = {
        {
            {0.005f, 0.26413f, 0.0f, 0.0f},
            {0.05f, 0.249446f, 0.0f, 0.0f},
            {-0.033f, 0.2382f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
        },
        {
            {-0.177612f, 0.23744f, 0.0f, 0.0f},
            {-0.177612f, 0.23744f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.070679f, 0.271298f, -0.02832f, 0.0f},
            {-0.050537f, 0.255213f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {-0.026733f, 0.251785f, 0.0f, 0.0f},
            {0.0f, 0.0f, 0.0f, 0.0f},
        },
    };
    float position[4];
    float scale[4];
    float rotation[4];

    position[0] = place[shop_no][person_no][0];
    position[1] = place[shop_no][person_no][1];
    position[2] = 1.0f;
    position[3] = 0.0f;
    for (int i = 0; i < 4; i++) {
        scale[i] = place[shop_no][person_no][2];
        rotation[i] = turn[shop_no][person_no][i];
    }
    MenuCharaFrame.SetPosition(position);
    MenuCharaFrame.SetScale(scale);
    MenuCharaFrame.SetRotation(rotation);
}

/**
 * Records the line the shopkeeper is to say and how it is to be shown.
 *
 * @mangled SetItemShopTalkMode__Fii
 * @address 0x1E71D0
 * @size 0x50
 */
static void SetItemShopTalkMode(int talk_mode, int msg_mode) {
    if (talk_mode >= 0) {
        ShopMenu.talk_mode = talk_mode;
    }
    if (msg_mode >= 0) {
        ShopMenu.msg_mode = msg_mode;
    }
    if (ShopMenu.msg_mode == 1) {
        CommonMenuMes3.mes_made = -1;
        ShopMenu.unk_19E = -1;
    }
}

/**
 * Draws the icons of one shop board row.
 *
 * @mangled ShopIconDraw__FPsPUciiiiii
 * @address 0x1E7220
 * @size 0xFC
 */
static void ShopIconDraw(short *item_no, unsigned char *value, int count, int x, int y, int mode, int clip, int alpha) {
    int draw_x = x;
    int draw_y = y;
    int i;

    for (i = 0; i < count; i++) {
        DrawIconParts(item_no[i], draw_x, draw_y, mode, clip, alpha, value[i]);
        draw_x += 0x28;
        if (i % 5 == 4) {
            draw_x = x;
            draw_y += 0x28;
        }
    }
}

/**
 * Draws the left and right arrows of the recharge shop.
 *
 * @mangled ChargeShopLRDraw__Fi
 * @address 0x1E7320
 * @size 0x1AC
 */
static void ChargeShopLRDraw(int mode) {
    int x = -1;
    int gap = x;

    switch (ShopMenu.side) {
        case 0:
            x = 0x38;
            gap = 0xD8;
            break;
        case 1:
            x = 0x146;
            gap = 0xE6;
            break;
    }
    if (0 < x) {
        CRect_i_ texel(0x62, 0x14, 0x1A, 0x18);
        int y = 66.0f + 4.0f * sinf(3.1415927f * (CursorVibeCnt % 79 - 40) / 40.0f);

        DrawMenu2DSprite(PerBoardTex, CRect_i_(x, y, texel.width, texel.height), texel, mode);
        texel.x += texel.width;
        DrawMenu2DSprite(PerBoardTex, CRect_i_(x + gap, y, texel.width, texel.height), texel, mode);
    }
}

/**
 * Draws the shop cursor over the slot it stands on.
 *
 * @mangled ShopCurDraw__Fiiiiiii
 * @address 0x1E74D0
 * @size 0x2FC
 */
static void ShopCurDraw(int x, int y, int pos, int top, int mode, int select, int alpha) {
    float cur_x;
    float cur_y;
    int waku_x;
    int waku_y;
    int vibe = select * 0x20 + 0x40;
    int width;
    int height;

    height = width = 0x26;
    switch (mode) {
        case 0: {
            cur_x = x + pos % 5 * 0x28;
            int row = pos / 5 - top;
            if (row < 0) {
                row = 0;
            }
            if (row > 3) {
                row = 3;
            }
            cur_y = y + row * 0x28;
            if (ShopMenu.board.cursor_area == 2) {
                cur_x = x + 0xD2;
                cur_y = y + 0x8C;
            }
            waku_x = (int) cur_x + 0x1E;
            waku_y = (int) cur_y - 0xA;
            break;
        }
        case 1:
            cur_x = x + 0x90;
            cur_y = y + 0x9E;
            waku_x = (int) cur_x + 0x1E;
            waku_y = (int) cur_y - 0xA;
            width = 0x64;
            break;
    }
    DrawMenuWaku(waku_x, waku_y, width, height, 0, StayTex, alpha);
    if (select) {
        cur_x += 34.0f;
        cur_y += 20.0f;
    }
    ShopMenu.cursor_x += (cur_x - ShopMenu.cursor_x) / 4.0f;
    ShopMenu.cursor_y += (cur_y - ShopMenu.cursor_y) / 4.0f;
    if (select == 2) {
        DrawMenuVibeItem(ShopMenu.cursor_x, ShopMenu.cursor_y, 0, -0xE, alpha);
    }
    DrawMenuObjectVibe(ShopMenu.cursor_x, ShopMenu.cursor_y, 1, vibe);
    CursorVibeCnt++;
    if (CursorVibeCnt >= 0x202FBF00) {
        CursorVibeCnt = 0;
    }
}

/**
 * Draws one shop icon at a position.
 *
 * @mangled DrawShopIcon__Fiiii
 * @address 0x1E77D0
 * @size 0x6C
 */
static void DrawShopIcon(int x, int y, int selected, int mode) {
    int v = 0x50;
    int width = 0xA2;

    if (selected) {
        v += 0x28;
        width = 0xC8;
    }
    DrawMenu2DSprite(ShopBoard, CRect_i_(x, y, width, 0x28), CRect_i_(0x14, v, width, 0x28), mode);
}

/**
 * Reports whether an item may be recharged.
 *
 * @mangled IsEnableCharge__Fi
 * @address 0x1E7840
 * @size 0x10C
 */
static int IsEnableCharge(int item_no) {
    int enable = 0;

    if (item_no >= 0x101) {
        int chara_no = WhoIsWeaponEquip(item_no);
        CUserStatus *status = ShopUserStatusPt;
        WEAPON_HAVE *weapons = status->chara_weapons[chara_no];
        int default_no = GetDefaultWeaponNo(chara_no);

        for (int i = 0; i < 10; i++) {
            int weapon_no = weapons[i].item_no;

            if (weapon_no == default_no || weapon_no == default_no + 1) {
                enable = 1;
                break;
            }
        }
        if (ShopUserStatusPt->party_size - 1 < chara_no) {
            enable = 1;
        }
        if (ShopMenu.board.unk_15C >= 0) {
            enable = 0;
        }
    } else {
        enable = 1;
        if (item_no == 0xF2) {
            enable = 0;
        }
    }
    return enable;
}

/**
 * Starts a shop menu up: its buffers, its textures, its board mode and the gamepad.
 *
 * @mangled ShopMenuInit__FPiii
 * @address 0x1E7950
 * @size 0x248
 */
static void ShopMenuInit(int *tex_block, int shop_no, int mode) {
    u_long128 *buffer;
    int limit;

    buffer = BtlMenuBufferSet(mode);
    buffer = MenuCalcBufAlignment(buffer);
    limit = EdMenuBuffer.limit >> 1;
    ShopCashBuffer.base = (u_char *) buffer;
    ShopCashBuffer.limit = limit;
    ShopCashBuffer.used = 0;
    ShopUserStatusPt = (CUserStatus *) SaveData->GetDngStatus();
    ShopMenu.lang = GetMenuLangFlag();
    StartReadBG();
    ShopCashBuffer.Alloc((LoadFileBGMenuData("itemshop.pak", buffer) >> 4) + 0x102);
    ShopMenu.shop_no = shop_no;
    ShopMenu.mode = mode;
    ShopMenu.tex_block = tex_block[0];
    ShopMenu.ready = 0;
    ShopMenu.person_tex_block = tex_block[1];
    ShopMenu.person_state = 1;
    ShopMenu.alpha = 0;
    ShopMenu.side = 1;
    InitPersonalBoardMode(ShopUserStatusPt, &ShopMenu.board, 0, 0);
    ShopHaveItemPt = &ShopMenu.board.held_item;
    ShopHaveWepPt = &ShopMenu.board.weapon;
    ShopHaveAttachPt = &ShopMenu.board.held_attach;
    ShopMenu.stock_top_row = 0;
    ShopMenu.unk_174 = 0;
    ShopMenu.step_count = 0;
    ShopMenu.talk_mode = 1;
    StayTex = TexManager.GetTexture("stayframe", -1);
    ItemVolumeStep.CheckItemVolume();
    ShopDataMove.unk_02 = -1;
    ShopDataMove.slot_no = -1;
    ShopDataMove.icon_no = -1;
    ShopDataMove.item_no = -1;
    ShopDataMove.pos_y = 0.0f;
    ShopDataMove.pos_x = 0.0f;
    memset(&ShopDataMove.data, 0, sizeof(ShopDataMove.data));
    SetMenuTrushMark(ShopUserItemPack(ShopUserStatusPt));
    GamePad.SetAutoRepeat(0xF000, 0x1E, 5);
    GamePad.MenuModeOn(0x78);
}

/**
 * Tears a shop menu down: its textures, its messages and the gamepad.
 *
 * @mangled ShopMenuExit__Fv
 * @address 0x1E7BA0
 * @size 0x12C
 */
static void ShopMenuExit() {
    ITEM_PACK *pack = ShopUserItemPack(ShopUserStatusPt);
    int i;
    int j;

    pack->item_count = 0;
    for (i = 0; i < 3; i++) {
        if (pack->quick_item_slot[i] >= ITEM_DUNGEON_START) {
            pack->item_count += (s8) pack->quick_item_qty[i];
        }
    }
    for (j = 0; j < pack->num; j++) {
        if (pack->item[j] >= ITEM_DUNGEON_START) {
            pack->item_count++;
        }
    }
    DeleteMenuTrushMark();
    CommonMenuMes3.auto_pos = -1;
    AtoraNameMes.rows = 4;
    TexManager.DeleteTextureBlock(ShopMenu.tex_block);
    TexManager.DeleteTextureBlock(ShopMenu.person_tex_block);
    TexManager.CleanUpTextureList();
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
}

void ShopTextureLoadFix() {
    LOADTEXTURE_INFO2 info[3] = {
        {"#frame_imageshop#640#448#4", 0, 0},
        {NULL, 0, 0},
        {NULL, 0, 0},
    };

    info[0].block_no = ShopMenu.tex_block;
    info[1].block_no = ShopMenu.tex_block;
    BG_READ_INFO *file = GetReadBGFile(0);
    info[1].name = (char *) GetPackFile((u_int *) file->buffer, "itemshop.img", NULL);
    TexManager.DeleteTextureBlock(ShopMenu.tex_block);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, info);
    ShopBoard = TexManager.GetTexture("shopbrd", ShopMenu.tex_block);
    PerBoardTex = TexManager.GetTexture("perbrd", ShopMenu.tex_block);
    WepIcon = TexManager.GetTexture("wepicon", ShopMenu.tex_block);
    ItemIcon = TexManager.GetTexture("itemicon", ShopMenu.tex_block);
    ShopMenu.ready = 1;
    s16 *shop_messages = (s16 *) GetPackFile((u_int *) file->buffer, "itemshop.bin", NULL);
    s16 *keeper_messages = (s16 *) GetPackFile((u_int *) file->buffer, "shopman.bin", NULL);
    InitMenuMesSet(2, shop_messages);
    CommonMenuMes3.SetBuff(keeper_messages);
}

/**
 * Draws the fade that covers the shop while it opens and closes.
 *
 * @mangled ShopFadeoutDraw__Fv
 * @address 0x1E7EA0
 * @size 0xF8
 */
static void ShopFadeoutDraw() {
    int alpha = 0;

    switch (ShopMenu.talk_mode) {
        case 1:
            alpha = 0x80 - ShopMenu.step_count * 3;
            break;
        case 2:
            alpha = ShopMenu.step_count * 3 + 0x40;
            break;
    }
    if (alpha < 0) {
        alpha = 0;
    }
    if (alpha > 0x80) {
        alpha = 0x80;
    }
    FrameImageDraw(0x40, alpha);
    switch (ShopMenu.talk_mode) {
        case 0:
        case 0x19:
            ShopMenu.step_count = 0;
            break;
        default:
            if (ShopMenu.ready != 0) {
                ShopMenu.step_count++;
            }
            break;
    }
}

/**
 * Starts reading a shopkeeper's model in the background.
 *
 * @mangled ShopPersonReadStart__Fii
 * @address 0x1E7FA0
 * @size 0x98
 */
static int ShopPersonReadStart(int shop_no, int person_no) {
    char file_name[76];
    int size;
    u_long128 *buffer;

    ItemShopGetPacFileName(shop_no, person_no, file_name);
    buffer = (u_long128 *) (ShopCashBuffer.base + ShopCashBuffer.used * 16);
    buffer = MenuCalcBufAlignment(buffer);
    StartReadBG();
    if (!LoadFileBG(file_name, buffer, &size)) {
        return 0;
    }
    ReadBG();
    ShopMenu.person_state = 0;
    return 1;
}

/**
 * Builds the shopkeeper's model using the current shop data.
 */
static int ShopPersonBuild(int, int);

#ifdef NON_MATCHING
static int ShopPersonBuild(int kind, int shop_no) {
    char name[64];
    int size;

    if (ShopMenu.person_state == 0 && ReadBGSync() != 0) {
        return 0;
    }
    ItemShopGetImgFileName(kind, shop_no, name);
    BG_READ_INFO *file = GetReadBGFile(0);
    u_int *pack = (u_int *) file->buffer;
    u_char *model_area = (u_char *) pack + ((file->size >> 4) + 1) * 16;
    LOADTEXTURE_INFO2 texture = {0};
    texture.block_no = ShopMenu.person_tex_block;
    texture.name = (char *) GetPackFile(pack, name, &size);
    TexManager.DeleteTextureBlock(ShopMenu.person_tex_block);
    TexManager.LoadTextureBlockEX(-1, &texture);
    size = EdMenuBuffer.limit - ShopCashBuffer.limit;
    ShopCashBuffer2.base = model_area;
    ShopCashBuffer2.limit = size;
    ShopCashBuffer2.used = 0;
    MenuCharaFrame.Initialize();
    MenuCharaFrame.LoadPackData(pack, "info.cfg", &ShopCashBuffer2, &ShopCashBuffer2, NULL);
    sceVu0FVECTOR position = {0.0f, 0.0f, 0.0f, 0.0f};
    MenuCharaFrame.SetPosition(position);
    ShopPolySetInit(kind, shop_no);
    if (MenuCharaFrame.frame == NULL) {
        printf("Frame is NULL\n");
        return 0;
    }
    ShopMenu.unk_19C = 3;
    MenuCharaFrame.SetMotion(ShopMenu.unk_19C, 0);
    SetItemShopTalkMode(3, 1);
    ShopMenu.unk_1A4 = 0;
    ShopMenu.unk_19E = 0;
    ShopMasterVectorSet(0);
    ShopMenu.unk_1A0 = 0;
    return 2;
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", ShopPersonBuild__Fii);
#endif

/**
 * Sets the shopkeeper's model direction toward the menu camera.
 */
static void ShopMasterVectorSet(int);

/**
 * Draws the shopkeeper and points the menu camera at them.
 *
 * @mangled LocalShopPersonDraw__Fv
 * @address 0x1E82B0
 * @size 0xB8
 */
static void LocalShopPersonDraw() {
    float ref[4] = {0.0f, 0.0f, -30.0f, 1.0f};
    float pos[4] = {0.0f, 0.0f, 30.0f, 1.0f};

    MenuCamera.SetRef(ref);
    MenuCamera.SetPos(pos);
    ShopMasterVectorSet(0);
    MenuCharaFrame.Step();
    if (ShopMenu.unk_1A0 < 4) {
        ShopMenu.unk_1A0++;
    } else {
        MenuCharaFrame.Draw();
    }
}

/**
 * Draws the shopkeeper.
 *
 * @mangled ShopPersonDraw__Fi
 * @address 0x1E8370
 * @size 0x3C
 */
static void ShopPersonDraw(int) {
    MenuTextureReload(ShopMenu.person_tex_block);
    MenuPolygonDraw(0x80, LocalShopPersonDraw);
}

/**
 * Points the shopkeeper's model at the camera.
 *
 * @mangled ShopMasterVectorSet__Fi
 * @address 0x1E83B0
 * @size 0xD8
 * Turns the shopkeeper to face the menu camera.
 */
static void ShopMasterVectorSet(int mode) {
    float camera_pos[4];
    float pos[4];
    float rotation[4];
    float offset[4];
    float angle;

    switch (mode) {
        case 0:
            MenuCamera.GetPos(camera_pos);
            break;
        case 1:
            break;
    }
    sceVu0CopyVector(pos, MenuCharaFrame.pos);
    MenuCharaFrame.GetRotation(rotation);
    sceVu0SubVector(offset, pos, camera_pos);
    angle = atan2f(-offset[0], -offset[2]);
    rotation[1] = AngleInterpolate(rotation[1], angle, 0.1f, 0);
    MenuCharaFrame.SetRotation(rotation);
}

void InitChargeShop(int *state, int shop_no, int mode) {
    int rows;

    if (shop_no >= 100) {
        shop_no -= 100;
    }
    ShopMenuInit(state, shop_no, mode);
    ShopMenu.board.cursor = 0;
    ShopMenu.side = 1;
    ShopMenu.cursor_x = (ShopMenu.board.cursor % 5) * 0x28 + 0x154;
    ShopMenu.cursor_y = 120.0f;
    ShopStockPt = SaveData->GetStockItem();
    rows = ChargeShopMax[0] / 5;
    ShopMenu.stock_top_row = 0;
    ShopMenu.stock_y = 0x8A - ShopMenu.stock_top_row * 0x28;
    ShopMenu.stock_scroll = 142.0f + 114.0f * ShopMenu.stock_top_row / rows;
    ShopMenu.unk_174 = 0;
    GetMainMenuRightHelpWinLangOffset(ShopHelpWinPos[0], ShopHelpWinPos[1], ShopHelpWinW, ShopHelpWinH);
}

#ifdef NON_MATCHING
void ChargeShopLimmitCheck() {
    int max = ChargeShopMax[ShopMenu.board.page];
    int rows = max / 5;
    int last_top = rows - 4;

    if (last_top < 0) {
        last_top = 0;
    }
    if (max - 1 < ShopMenu.board.cursor && ShopMenu.side == 0) {
        while (ShopMenu.board.cursor >= max) {
            ShopMenu.board.cursor -= 5;
        }
        ShopMenu.stock_top_row = ShopMenu.board.cursor / 5 - 3;
        if ((s8) ShopMenu.stock_top_row < 0) {
            ShopMenu.stock_top_row = 0;
        }
        ShopMenu.stock_y = 0x8A - ShopMenu.stock_top_row * 0x28;
        if (rows <= 0) {
            rows = 4;
        }
        ShopMenu.stock_scroll = 142.0f + 114.0f * ShopMenu.stock_top_row / rows;
        return;
    }
    if (last_top < ShopMenu.stock_top_row) {
        while (last_top < ShopMenu.stock_top_row) {
            ShopMenu.stock_top_row--;
        }
        ShopMenu.stock_y = 0x8A - ShopMenu.stock_top_row * 0x28;
        ShopMenu.stock_scroll = 142.0f + 114.0f * ShopMenu.stock_top_row / rows;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", ChargeShopLimmitCheck__Fv);
#endif

static void ExitChargeShop() {
    ShopMenuExit();
}

int ChargeShopLoop() {
    int done;

    ReadBG();
    done = ChargeShopKey();
    DrawChargeShop();
    if (done) {
        ExitChargeShop();
    }
    return done;
}

#ifdef NON_MATCHING
static inline void ShopDataMoveClear() {
    ShopDataMove.unk_02 = -1;
    ShopDataMove.slot_no = -1;
    ShopDataMove.icon_no = -1;
    ShopDataMove.item_no = -1;
    ShopDataMove.pos_y = 0.0f;
    ShopDataMove.pos_x = 0.0f;
    memset(&ShopDataMove.data, 0, sizeof(WEAPON_HAVE));
}

static inline void ShopDataMoveFinish() {
    if (ShopDataMove.icon_no >= 0) {
        ShopDataMove.IconAutoMove(ChargeOrShopFlag, 1);
        ShopDataMoveClear();
    }
}

int ChargeShopKey() {
    int result = 0;
    int item_no;
    u8 record[0xF8];
    u8 weapon[0xF8];
    u8 attach[0x20];

    if (ShopMenu.ready == 0) {
        if (ReadBGSync() == 0) {
            ShopTextureLoadFix();
            ShopPersonReadStart(0, ShopMenu.shop_no);
        }
        return 0;
    }
    ITEM_PACK *pack = &ShopUserStatusPt->item_pack;
    switch (ShopMenu.talk_mode) {
        case 1:
            ShopMenu.alpha += 8;
            if (ShopMenu.alpha >= 0x80) {
                ShopMenu.alpha = 0x80;
            }
            if (ShopMenu.step_count > 20 && ShopMenu.ready != 0 && ShopMenu.alpha >= 0x80) {
                ShopMenu.talk_mode = 0;
            }
            break;
        case 2:
            ShopMenu.alpha -= 8;
            if (ShopMenu.alpha <= 0) {
                ShopMenu.alpha = 0;
            }
            if (ShopMenu.step_count > 26 && ShopMenu.alpha <= 0) {
                result = 1;
            }
            break;
        case 3:
            CommonMenuMes3.page_arrow = 1;
            if (GamePad.Down(0xF000) != 0 || GamePad.AllOn() != 0) {
                ShopMenu.talk_mode = 0;
                ComMenuSePlay(2);
                CommonMenuMes3.page_arrow = 0;
            }
            break;
        case 8:
            CommonMenuMes3.page_arrow = 1;
            if (GamePad.Down(0xF000) != 0) {
                ShopMenu.talk_mode = 0;
                ComMenuSePlay(2);
                CommonMenuMes3.page_arrow = 0;
            }
        case 10:
        case 7:
            CommonMenuMes3.page_arrow = 1;
            if (GamePad.Down(0x60) != 0) {
                SetItemShopTalkMode(0, 0);
                ComMenuSePlay(2);
                CommonMenuMes3.page_arrow = 0;
            }
            break;
        case 17:
            if (GamePad.Down(0x20) != 0) {
                ShopMenu.talk_mode = 0;
                ComMenuSePlay(2);
            } else if (GamePad.Down(0x50) != 0) {
                ShopDataMoveFinish();
                int space = ShopStockPt->GetNowModeSpace(ShopMenu.board.page);
                int icon = space - ShopMenu.stock_top_row * 5;
                s16 cursor = ShopMenu.board.cursor;
                switch (ShopMenu.board.page) {
                    case 0:
                        item_no = pack->item[cursor];
                        *(int *) record = pack->item_vol[cursor];
                        printf("charge vol = %d\n", *(int *) record);
                        pack->item[cursor] = -1;
                        pack->item_vol[cursor] = 0;
                        break;
                    case 2: {
                        ATTACH_LIST *list = (ATTACH_LIST *) &ShopUserStatusPt->consumable_items[cursor];
                        item_no = list->item_no;
                        memcpy(record, list, sizeof(ATTACH_LIST));
                        memset(list, 0, sizeof(ATTACH_LIST));
                        break;
                    }
                    case 1: {
                        WEAPON_HAVE *have = &ShopUserStatusPt->chara_weapons[cursor / 10][cursor % 10];
                        item_no = have->item_no;
                        memcpy(record, have, sizeof(WEAPON_HAVE));
                        memset(have, 0, sizeof(WEAPON_HAVE));
                        break;
                    }
                }
                ShopDataMove.IconMoveTarSet(space, icon, item_no, (MENU_ITEMDATA *) record,
                                            ShopMenu.board.cursor % 5 * 0x28 + 0x156,
                                            (ShopMenu.board.cursor / 5 - ShopMenu.board.top_row) * 0x28 + 0x94, 1);
                if (icon < 0 || icon >= 20) {
                    ShopDataMove.IconAutoMove(ChargeOrShopFlag, 1);
                    ShopDataMoveClear();
                }
                SetItemShopTalkMode(0, 0);
                ComMenuSePlay(1);
            }
            break;
        case 18:
            if (GamePad.Down(0x50) != 0) {
                int page;
                s16 got = 0;
                s16 vol;
                ShopDataMoveFinish();
                memset(weapon, 0, sizeof(weapon));
                switch (ShopMenu.board.page) {
                    case 0:
                        vol = 0;
                        ShopStockPt->SetItemToPos(ShopMenu.board.cursor, &got, &vol);
                        *(int *) weapon = vol;
                        break;
                    case 2:
                        ShopStockPt->SetAttachToPos(ShopMenu.board.cursor, (ATTACH_LIST *) weapon);
                        got = *(s16 *) weapon;
                        break;
                    case 1:
                        ShopStockPt->SetWepToPos(ShopMenu.board.cursor, (WEAPON_HAVE *) weapon);
                        got = *(s16 *) weapon;
                        break;
                }
                int space = GetBoardSpace(got, &page);
                int icon = space - ShopMenu.board.top_row * 5;
                ShopDataMove.IconMoveTarSet(space, icon, got, (MENU_ITEMDATA *) weapon,
                                            ShopMenu.board.cursor % 5 * 0x28 + 0x34,
                                            (ShopMenu.board.cursor / 5 - ShopMenu.stock_top_row) * 0x28 + 0x94, 0);
                if (icon < 0 || icon >= 20) {
                    ShopDataMove.IconAutoMove(ChargeOrShopFlag, 1);
                    ShopDataMoveClear();
                }
                SetItemShopTalkMode(0, 0);
                ComMenuSePlay(1);
            } else if (GamePad.Down(0x20) != 0) {
                ShopMenu.talk_mode = 0;
                ComMenuSePlay(2);
            }
            break;
        case 25:
            CommonMenuMes3.page_arrow = 1;
            if (GamePad.Down(0x60) != 0) {
                ShopMenu.talk_mode = 2;
                ShopMenu.step_count = 0;
                CommonMenuMes3.page_arrow = 0;
                ComMenuSePlay(1);
            }
            break;
        case 24:
            CommonMenuMes3.page_arrow = 0;
            if (GamePad.Down(0x40) != 0) {
                SetItemShopTalkMode(0, 0);
                ComMenuSePlay(1);
                CommonMenuMes3.page_arrow = 0;
            } else if (GamePad.Down(0x20) != 0) {
                SetItemShopTalkMode(25, 1);
                ComMenuSePlay(2);
                CommonMenuMes3.page_arrow = 0;
            }
            break;
        case 0: {
            if (ShopMenu.person_state == 0) {
                ShopMenu.person_state = ShopPersonBuild(0, ShopMenu.shop_no);
            }
            int page = ShopMenu.board.page;
            int cursor = ShopMenu.board.cursor;
            int left = 0;
            switch (ShopMenu.side) {
                case 0:
                    left = ChargeSelectKey();
                    break;
                case 1:
                    if (ShopHaveItemPt->item_no < 0x51) {
                        BoardModeChangeKey();
                        PersonalBoardLimmitCheck();
                        ChargeShopLimmitCheck();
                    }
                    left = PersonalBoardKeySub();
                    if (left == 0 && GamePad.Down(0x40) != 0) {
                        PERSONAL_BOARD *board = &ShopMenu.board;
                        switch (board->cursor_area) {
                            case 2: {
                                s16 held = ShopHaveItemPt->item_no;
                                if (held < 0x51) {
                                    ComMenuSePlay(2);
                                } else {
                                    if (IsEnableTrushThrow(held) != 0) {
                                        board->trash_anim = 1;
                                        board->trash_frame = 0;
                                        InitAllHaveData();
                                    }
                                    ComMenuSePlay(2);
                                }
                                break;
                            }
                            case 1:
                                if (PersonalBoardItemGetorSwap(ShopMenu.board.cursor) != 0) {
                                    if (ShopHaveItemPt->item_no >= 0x51) {
                                        ShopHaveItemPt->unk_00 = 1;
                                    } else {
                                        InitAllHaveData();
                                        ShopMenu.board.unk_15C = -1;
                                    }
                                    ComMenuSePlay(1);
                                } else {
                                    ComMenuSePlay(2);
                                }
                                break;
                        }
                    } else if (left == 0 && GamePad.Down(0x80) != 0) {
                        switch (ShopMenu.board.page) {
                            case 0:
                                SeitonItemBoard(pack);
                                SetMenuTrushMark(pack);
                                break;
                            case 2:
                                SeitonAttachBoard((ATTACH_LIST *) ShopUserStatusPt->consumable_items);
                                break;
                        }
                        ComMenuSePlay(1);
                    } else if (left == 0 && GamePad.Down(0x10) != 0) {
                        int enable = 1;
                        if (ShopMenu.board.cursor_area == 2) {
                            ComMenuSePlay(2);
                        } else if (ShopHaveItemPt->item_no >= 0x51) {
                            ComMenuSePlay(2);
                        } else {
                            s16 target = SearchBoardNowPosItemExist(ShopMenu.board.page, ShopMenu.board.cursor);
                            switch (ShopMenu.board.page) {
                                case 2:
                                case 0:
                                    break;
                                case 1: {
                                    int owner = WhoIsWeaponEquip(target);
                                    if (target < 0x101) {
                                        ComMenuSePlay(2);
                                    } else {
                                        if (owner == IsDefaultWeapon(target)) {
                                            SetItemShopTalkMode(7, 1);
                                            enable = 0;
                                        }
                                        if (ShopMenu.board.cursor % 10 ==
                                            ShopUserStatusPt->equipped_weapon_slot[owner]) {
                                            SetItemShopTalkMode(7, 1);
                                            enable = 0;
                                        }
                                    }
                                    break;
                                }
                            }
                            if (enable != 0) {
                                enable = IsEnableCharge(target);
                                if (enable == 0) {
                                    SetItemShopTalkMode(7, 1);
                                }
                            }
                            if (ShopStockPt->GetNowModeSpace(ShopMenu.board.page) < 0) {
                                enable = 0;
                                SetItemShopTalkMode(8, 1);
                            }
                            if (target < 0x51) {
                                SetItemShopTalkMode(0, 0);
                                enable = 0;
                            }
                            if (enable != 0) {
                                ShopMenu.talk_mode = 17;
                                ComMenuSePlay(1);
                            } else {
                                ComMenuSePlay(2);
                            }
                        }
                    }
                    break;
            }
            if (GamePad.Down(0x20) != 0) {
                ComMenuSePlay(2);
                if (ShopHaveItemPt->item_no < 0x51) {
                    SetItemShopTalkMode(24, 1);
                } else {
                    switch (ShopHaveItemPt->unk_00) {
                        case 1:
                            PersonalBoardItemCancel();
                            break;
                        case 0:
                            switch (ShopHaveItemPt->unk_04) {
                                case 0:
                                    ShopStockPt->SetItemToPos(ShopHaveItemPt->unk_0C, &ShopHaveItemPt->item_no,
                                                              &ShopHaveItemPt->volume);
                                    break;
                                case 1:
                                    ShopStockPt->GetWeaponInfo(ShopHaveItemPt->unk_0C, (WEAPON_HAVE *) weapon);
                                    ShopStockPt->SetWepToPos(ShopHaveItemPt->unk_0C, ShopHaveWepPt);
                                    ShopHaveItemPt->item_no = *(s16 *) weapon;
                                    break;
                                case 2:
                                    ShopStockPt->GetAttachInfo(ShopHaveItemPt->unk_0C, (ATTACH_LIST *) attach);
                                    ShopStockPt->SetAttachToPos(ShopHaveItemPt->unk_0C, ShopHaveAttachPt);
                                    ShopHaveItemPt->item_no = *(s16 *) attach;
                                    break;
                            }
                            if (ShopHaveItemPt->item_no < 0x51) {
                                InitAllHaveData();
                            }
                            break;
                    }
                }
            }
            switch (left) {
                case 0:
                    break;
                case 1:
                    ShopMenu.side = 0;
                    ShopMenu.board.cursor =
                        (ShopMenu.stock_top_row + (ShopMenu.board.cursor / 5 - ShopMenu.board.top_row)) * 5 + 4;
                    break;
            }
            if (cursor != ShopMenu.board.cursor || page != ShopMenu.board.page) {
                int rows = ChargeShopMax[ShopMenu.board.page] / 5;
                int last_top = rows - 4;
                if (last_top < 0) {
                    last_top = 0;
                }
                if (last_top < ShopMenu.stock_top_row) {
                    ShopMenu.stock_top_row = ShopMenu.board.cursor / 5 - 3;
                    if ((s8) ShopMenu.stock_top_row < 0) {
                        ShopMenu.stock_top_row = 0;
                    }
                    ShopMenu.stock_y = 0x8A - ShopMenu.stock_top_row * 0x28;
                    if (rows <= 0) {
                        rows = 4;
                    }
                    ShopMenu.stock_scroll = 142.0f + 114.0f * ShopMenu.stock_top_row / rows;
                }
                ComMenuSePlay(0);
            }
            break;
        }
    }
    int mes_no = 0;
    int item = 0;
    int value = 0;
    int name_mes = -1;
    int cursor = ShopMenu.board.cursor;
    if (ShopHaveItemPt->item_no >= 0x51) {
        item = ShopHaveItemPt->item_no;
        COM_ITEM_INFO *info = GetCommonItemInfo(item);
        if (info != NULL) {
            mes_no = info->msg + 500;
        }
        value = GetAttachVolumeForMsg(ShopHaveAttachPt);
        if (ShopHaveItemPt->item_no == 0x5A) {
            name_mes = ShopHaveAttachPt->unk_02 + 100;
        }
    }
    switch (ShopMenu.side) {
        case 0:
            switch (ShopMenu.board.page) {
                case 0:
                    item = ShopStockPt->dungeon_items[cursor];
                    break;
                case 1: {
                    COM_ITEM_INFO *info = GetCommonItemInfo(ShopStockPt->weapons[cursor].item_no);
                    item = info != NULL ? info->msg : -1;
                    if (item >= 0x101) {
                        value = ShopStockPt->weapons[cursor].unk_02;
                    }
                    break;
                }
                case 2:
                    item = ShopStockPt->attachments[cursor].item_no;
                    if (item >= 0x51) {
                        mes_no = item + 500;
                        value = GetAttachVolumeForMsg(&ShopStockPt->attachments[cursor]);
                        if (item == 0x5A) {
                            name_mes = ShopStockPt->attachments[cursor].unk_02 + 100;
                        }
                    }
                    break;
            }
            break;
        case 1:
            switch (ShopMenu.board.page) {
                case 0:
                    item = pack->item[cursor];
                    if (item >= 0x84) {
                        mes_no = item + 500;
                    }
                    break;
                case 1: {
                    WEAPON_HAVE *have = &ShopUserStatusPt->chara_weapons[cursor / 10][cursor % 10];
                    COM_ITEM_INFO *info = GetCommonItemInfo(have->item_no);
                    item = info != NULL ? info->msg : -1;
                    if (item >= 0) {
                        mes_no = item + 500;
                        value = have->unk_02;
                    }
                    break;
                }
                case 2: {
                    ATTACH_LIST *list = (ATTACH_LIST *) &ShopUserStatusPt->consumable_items[cursor];
                    item = list->item_no;
                    if (item >= 0x51) {
                        mes_no = item + 500;
                        value = GetAttachVolumeForMsg(list);
                        if (item == 0x5A) {
                            name_mes = list->unk_02 + 100;
                        }
                    }
                    break;
                }
            }
            if (ShopMenu.board.cursor_area == 2) {
                mes_no = 1000;
            }
            break;
    }
    if (item > 0) {
        mes_no = item + 500;
    }
    if (CommonMenuMes2.mes_made != mes_no || (name_mes > 0 && CommonMenuMes2.mes_no[0] != name_mes) ||
        CommonMenuMes2.value != value) {
        CommonMenuMes2.value_signed = 1;
        CommonMenuMes2.value = value;
        if (name_mes > 0) {
            CommonMenuMes2.mes_no[0] = name_mes;
        }
        if (mes_no <= 500) {
            mes_no = 0;
        }
        printf("msgno = %d\n", mes_no);
        CommonMenuMes2.mes_made = -1;
        CommonMenuMes2.MakeMesWin(mes_no);
    }
    return result;
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", ChargeShopKey__Fv);
#endif

/**
 * Moves the cursor across the recharge shop's list.
 *
 * @mangled ChargeSelectKey__Fv
 * @address 0x1E9EE0
 * @size 0x8C0
 */
static int ChargeSelectKey() {
    if (ShopHaveItemPt->item_no < 0x51 && BoardModeChangeKey()) {
        PersonalBoardLimmitCheck();
        ChargeShopLimmitCheck();
    }
    int count = ChargeShopMax[ShopMenu.board.page];

    if (GamePad.Down(0x1000)) {
        ShopMenu.board.cursor -= 5;
        if (ShopMenu.board.cursor < 0) {
            ShopMenu.board.cursor += 5;
        }
        if (ShopMenu.board.cursor / 5 < ShopMenu.stock_top_row) {
            ShopMenu.stock_top_row--;
        }
    }
    if (GamePad.Down(0x4000)) {
        if (ShopMenu.board.cursor < count - 5) {
            ShopMenu.board.cursor += 5;
        }
        if (ShopMenu.stock_top_row + 3 < ShopMenu.board.cursor / 5) {
            ShopMenu.stock_top_row++;
        }
    }
    if (GamePad.Down(0x8000) && ShopMenu.board.cursor % 5 != 0) {
        ShopMenu.board.cursor--;
    }
    if (GamePad.Down(0x2000)) {
        if (ShopMenu.board.cursor % 5 == 4) {
            ShopMenu.side = 1;
            ShopMenu.board.cursor = (ShopMenu.board.top_row + (ShopMenu.board.cursor / 5 - ShopMenu.stock_top_row)) * 5;
        } else {
            ShopMenu.board.cursor++;
        }
    }
    switch (ShopMenu.side) {
        case 0:
            int se = 2;
            IHAVEITEM saved;
            memcpy(&saved, ShopHaveItemPt, sizeof(IHAVEITEM));
            if (GamePad.Down(0x40)) {
                // Put the held item into the stock slot under the cursor.
                if (ShopHaveItemPt->item_no >= 0x51 && !IsEnableCharge(ShopHaveItemPt->item_no)) {
                    ComMenuSePlay(2);
                    SetItemShopTalkMode(7, 1);
                    return 0;
                }
                int mode = ShopMenu.board.page;
                int kind = WhatIsKindofItem(ShopHaveItemPt->item_no);
                if (mode != kind && kind != -1) {
                    se = 2;
                } else {
                    switch (mode) {
                        case 0:
                            ShopStockPt->SetItemToPos(ShopMenu.board.cursor, &ShopHaveItemPt->item_no, &ShopHaveItemPt->volume);
                            break;
                        case 1:
                            ShopStockPt->SetWepToPos(ShopMenu.board.cursor, ShopHaveWepPt);
                            if (ShopHaveWepPt->item_no < 0x51) {
                                ShopHaveItemPt->item_no = -1;
                                InitHaveWep(ShopHaveWepPt);
                                ShopMenu.board.unk_15C = -1;
                            } else {
                                ShopHaveItemPt->item_no = ShopHaveWepPt->item_no;
                            }
                            break;
                        case 2:
                            ShopStockPt->SetAttachToPos(ShopMenu.board.cursor, ShopHaveAttachPt);
                            if (ShopHaveAttachPt->item_no < 0x51) {
                                ShopHaveItemPt->item_no = -1;
                                InitHaveAttach(ShopHaveAttachPt);
                                ShopMenu.board.unk_15C = -1;
                            } else {
                                ShopHaveItemPt->item_no = ShopHaveAttachPt->item_no;
                            }
                            break;
                    }
                    ShopHaveItemPt->unk_00 = 0;
                }
                if (ShopHaveItemPt->item_no < 0x51) {
                    InitAllHaveData();
                } else {
                    ShopHaveItemPt->unk_00 = 0;
                    ShopHaveItemPt->unk_04 = ShopMenu.board.page;
                    ShopHaveItemPt->unk_0C = ShopMenu.board.cursor;
                    se = 1;
                }
                if (memcmp(&saved, ShopHaveItemPt, sizeof(IHAVEITEM)) != 0 || se != 2) {
                    ComMenuSePlay(1);
                } else {
                    ComMenuSePlay(2);
                }
            } else if (GamePad.Down(0x10)) {
                // Check whether the good under the cursor can be taken for charging.
                if (ShopHaveItemPt->item_no >= 0x51) {
                    ComMenuSePlay(2);
                    return 0;
                }
                int ok = 1;
                ATTACH_LIST attach;
                WEAPON_HAVE weapon;
                int kind;
                int full;
                s16 item;
                s16 volume;

                switch (ShopMenu.board.page) {
                    case 0:
                        ShopStockPt->GetItemInfo(ShopMenu.board.cursor, &item, &volume);
                        break;
                    case 2:
                        ShopStockPt->GetAttachInfo(ShopMenu.board.cursor, &attach);
                        item = attach.item_no;
                        break;
                    case 1:
                        ShopStockPt->GetWeaponInfo(ShopMenu.board.cursor, &weapon);
                        item = weapon.item_no;
                        break;
                }
                GetBoardSpace(item, &kind);
                full = 0;
                int used = 0;
                int max = 0;
                GetNowModeMaxNum(ShopMenu.board.page, &full);
                switch (kind) {
                    case 0: {
                        ITEM_PACK *pack = ShopUserItemPack(ShopUserStatusPt);

                        max = pack->num;
                        for (int i = 0; i < 3; i++) {
                            if (pack->quick_item_slot[i] >= 0x84) {
                                used += pack->quick_item_qty[i];
                            }
                        }
                        for (int i = 0; i < max; i++) {
                            if (pack->item[i] >= 0x84) {
                                used++;
                            }
                        }
                        break;
                    }
                    case 1: {
                        int i;
                        max = 10;
                        int chara_no = WhoIsWeaponEquip(item);
                        CUserStatus *status = ShopUserStatusPt;
                        WEAPON_HAVE *weapons = status->chara_weapons[chara_no];

                        for (i = 0; i < 10; i++) {
                            if (weapons[i].item_no >= 0x101) {
                                used++;
                            }
                        }
                        break;
                    }
                    case 2: {
                        int i;
                        max = 40;
                        DNG_CONSUMABLE *attachments = ShopUserStatusPt->consumable_items;

                        for (i = 0; i < 40; i++) {
                            if (attachments[i].id >= 0x51) {
                                used++;
                            }
                        }
                        break;
                    }
                }
                if (ShopDataMove.item_no > 0) {
                    used++;
                }
                if (used >= max) {
                    full = 1;
                }
                if (full && item >= 0x51) {
                    ok = 0;
                    SetItemShopTalkMode(0xA, 1);
                }
                if (item < 0x51) {
                    ok = 0;
                    SetItemShopTalkMode(0, 0);
                }
                if (ok) {
                    ShopMenu.talk_mode = 0x12;
                    ComMenuSePlay(1);
                } else {
                    ComMenuSePlay(2);
                }
            } else if (GamePad.Down(0x80)) {
                switch (ShopMenu.board.page) {
                    case 0:
                        ShopStockPt->SeitonItem();
                        break;
                    case 1:
                        break;
                    case 2:
                        ShopStockPt->SeitonAttach();
                        break;
                }
                ComMenuSePlay(1);
            }
            break;
    }
    return 0;
}

#ifdef NON_MATCHING
void DrawChargeShop() {
    int text_x;
    int text_y;

    setbilinear(0);
    MenuWorldTrans(&MenuCamera);
    int bright = 0x40;
    switch (ShopMenu.talk_mode) {
        case 1:
            bright = 0x80 - ShopMenu.step_count * 3;
            break;
        case 2:
            bright = ShopMenu.step_count * 3 + 0x40;
            break;
    }
    if (bright < 0x40) {
        bright = 0x40;
    }
    if (bright > 0x80) {
        bright = 0x80;
    }
    FrameImageDraw(bright, 0x80);
    if (ShopMenu.ready != 0) {
        int cur_x;
        int top_row;
        int state;
        MenuTextureReload(ShopMenu.tex_block);
        DrawPersonalBoard(0x154, 0x84, ShopMenu.board.page, 0x80, 0);
        CommonTrushDraw(0x232, 0x118, 0x80);
        CommonMoneyBoardDraw(0x163, 0x12C, ShopUserStatusPt->money, 0x80);
        ChargeShopBoardDraw(0x32, 0x84, 0x80);
        if (ShopHaveItemPt->item_no < 0x51) {
            ChargeShopLRDraw(0x80);
        }
        if (ShopMenu.talk_mode != 24 && ShopMenu.talk_mode != 25) {
            switch (ShopMenu.side) {
                case 0:
                    cur_x = 0x22;
                    top_row = ShopMenu.stock_top_row;
                    break;
                case 1:
                    cur_x = 0x144;
                    top_row = (u8) ShopMenu.board.top_row;
                    break;
            }
            if (ShopHaveItemPt->item_no >= 0x51) {
                state = 2;
            } else {
                switch (ShopMenu.side) {
                    case 1:
                        if (SearchBoardNowPosItemExist(ShopMenu.board.page, ShopMenu.board.cursor) <= 0) {
                            state = 0;
                        } else {
                            state = 1;
                        }
                        break;
                    case 0:
                        state = ShopStockPt->SearchSpace(ShopMenu.board.cursor, ShopMenu.board.page);
                        if (state > 0) {
                            state = 1;
                        }
                        break;
                }
            }
            ShopCurDraw(cur_x, 0x90, ShopMenu.board.cursor, top_row, 0, state, 0x80);
        }
        DrawShopIcon(0x4C, 0x2A, 1, 0x80);
        ShopDataMove.IconAutoMoveDraw();
        ShopDataMove.IconAutoMove(ChargeOrShopFlag, 0);
        if (ShopMenu.talk_mode == 17 || ShopMenu.talk_mode == 18) {
            int prompt[2] = {0x516, 0x517};
            int mes_no = prompt[ShopMenu.talk_mode - 17];
            if (CommonMenuMes1.mes_made != mes_no) {
                CommonMenuMes1.MakeMesWin(mes_no);
            }
            CommonMenuMes1.text_x = 0x14A;
            CommonMenuMes1.text_y = 0xBE;
            if (ShopMenu.talk_mode == 17) {
                CommonMenuMes1.text_x = 0x96;
            }
            CommonMenuMes1.stay_frame = 1;
            CommonMenuMes1.Step();
            CommonMenuMes1.DrawMesWin();
        } else {
            CommonMenuMes1.stay_frame = 0;
        }
        int help_x = (int) ShopHelpWinPos[0];
        MenuHelpWinDraw(help_x, (int) ShopHelpWinPos[1], ShopHelpWinW, ShopHelpWinH, 0x80);
        GetMainMenuRightHelpMsgLangOffset(text_x, text_y);
        CommonMenuMes2.text_x = (int) (ShopHelpWinPos[0] + text_x);
        CommonMenuMes2.text_y = (int) (ShopHelpWinPos[1] + text_y);
    }
    if (ShopMenu.person_state == 2) {
        ShopPersonDraw(ShopMenu.shop_no);
    }
    if (ShopMenu.ready != 0) {
        MenuTextureReload(CommonMenuMes2.tex_block);
        CommonMenuMes2.Step();
        CommonMenuMes2.DrawMesWin();
        if (ShopHaveItemPt->item_no < 0x51) {
            s16 plate_x[7][2] = {{0xA2, 0xB4}, {0xB4, 0xB4}, {0xB4, 0xB4}, {0xB4, 0xB4},
                                 {0xB4, 0xB4}, {0xB4, 0xB4}, {0xB4, 0xB4}};
            int mes_no = 0x519;
            AtoraNameMes.text_x = plate_x[ShopMenu.lang][0];
            if (ShopMenu.side == 1) {
                mes_no = 0x518;
                AtoraNameMes.text_x = plate_x[ShopMenu.lang][1];
            }
            if (AtoraNameMes.mes_made != mes_no) {
                AtoraNameMes.MakeMesWin(mes_no);
            }
            AtoraNameMes.stay_frame = 1;
            AtoraNameMes.text_y = 0x162;
            AtoraNameMes.Step();
            AtoraNameMes.DrawMesWin();
        }
    }
    ShopModelMsgFunc(0);
    ShopFadeoutDraw();
    setbilinear(1);
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", DrawChargeShop__Fv);
#endif
#ifdef NON_MATCHING
void ChargeShopMaxDraw(int max, int x, int y, int alpha) {
    DrawMenu2DSprite(ShopBoard, CRect_i_(x + 0xD2, y - 0x28 + 1, 0x30, 0x2F), CRect_i_(0x100, 0x90, 0x30, 0x30), alpha);
    RECT digits = {0x90, 0xDC, 0xC, 0xD};
    DrawMenuNumber(max, x + 0xF7, y - 0xE, ShopBoard, digits, 1, alpha);
    int count = 0;
    switch (ShopMenu.board.page) {
        case 0:
            for (int i = 0; i < 60; i++) {
                if (ShopStockPt->dungeon_items[i] >= 0x84) {
                    count++;
                }
            }
            break;
        case 1:
            for (int i = 0; i < 30; i++) {
                if (ShopStockPt->weapons[i].item_no >= 0x101) {
                    count++;
                }
            }
            break;
        case 2:
            for (int i = 0; i < 30; i++) {
                if (ShopStockPt->attachments[i].item_no >= 0x51) {
                    count++;
                }
            }
            break;
    }
    DrawMenuNumber(count, x + 0xF2, y - 0x22, ShopBoard, digits, 1, alpha);
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", ChargeShopMaxDraw__Fiiii);
#endif

void ChargeShopBoardDraw(int x, int y, int alpha) {
    s16 items[120];
    u8 values[120];
    int top = y + 9;
    int bottom = y + 0xA9;
    int board_y;
    int left = x + 0x14;

    board_y = y + 6 - ShopMenu.stock_top_row * 0x28;
    ShopMenu.stock_y += ((float) board_y - ShopMenu.stock_y) / 4.0f;
    board_y = ShopMenu.stock_y;
    DrawPerBoardDraw(0, 0x64, left, board_y, top, bottom, ShopBoard, alpha);

    int board_mode = ShopMenu.board.page;
    int i;

    switch (board_mode) {
        case 1:
            for (i = 0; i < 30; i++) {
                items[i] = ShopStockPt->weapons[i].item_no;
                values[i] = 0;
            }
            break;
        case 0:
            for (i = 0; i < 60; i++) {
                items[i] = ShopStockPt->dungeon_items[i];
                values[i] = 0;
            }
            break;
        case 2:
            for (i = 0; i < 30; i++) {
                items[i] = ShopStockPt->attachments[i].item_no;
                if (items[i] >= 0x5B && items[i] < 0x5F) {
                    values[i] = (&ShopStockPt->attachments[i].item_no)[items[i] - 0x57];
                } else if (items[i] == 0x5A) {
                    values[i] = ShopStockPt->attachments[i].unk_02;
                } else {
                    values[i] = 0;
                }
            }
            break;
    }
    for (; i < 60; i++) {
        items[i] = -1;
        values[i] = 0;
    }
    ShopIconDraw(items, values, 0x80, left + 4, board_y + 6, top, bottom, 0x80);

    int tag = 0;
    switch (board_mode) {
        case 0:
            tag += 0xC;
            break;
        case 1:
            tag += 0xA;
            break;
        case 2:
            tag = 1;
            break;
    }
    PersonalBoardTagDraw(board_mode, x, y, ShopBoard, tag, alpha);
    PersonalBoardDrawWaku(x, y, ShopBoard, alpha);
    PersonalBoardScrlBarDraw(ChargeShopMax[board_mode], x, y, ShopMenu.stock_scroll, ShopMenu.stock_top_row, ShopBoard, alpha);
    ChargeShopMaxDraw(ChargeShopMax[board_mode], x, y, alpha);
}

/**
 * Returns the shop price of one item, which is zero for the item numbers below 0x51.
 *
 * @mangled CalItemMoney__Fii
 * @address 0x1EB2D0
 * @size 0x40
 */
static int CalItemMoney(int item_no, int sell) {
    if (item_no < 0x51) {
        return 0;
    }
    return GetItemMoney(item_no, sell);
}

/**
 * Totals the shop price of the attachments fitted to a weapon.
 *
 * @mangled WeaponCalMoney__FP11WEAPON_HAVEi
 * @address 0x1EB310
 * @size 0x84
 */
static int WeaponCalMoney(WEAPON_HAVE *weapon, int sell) {
    int total;
    int i;

    if (weapon == NULL) {
        return 0;
    }
    total = 0;
    for (i = 0; i < 6; i++) {
        ATTACH_LIST *attach = &weapon->attach[i];
        if (attach != NULL && attach->item_no >= 0x51) {
            total += CalItemMoney(attach->item_no, sell);
        }
    }
    return total;
}

#ifdef NON_MATCHING
int BuyMoneyCheck2() {
    int max[3] = {100, 60, 40};
    int total = 0;
    ITEM_PACK *pack = &ShopUserStatusPt->item_pack;

    for (int i = 0; i < 100; i++) {
        if (ItemBoardInfo[i] == 1) {
            total += CalItemMoney(pack->item[i], 0);
        }
    }
    for (int chara = 0; chara < 6; chara++) {
        for (int i = 0; i < 10; i++) {
            if (WeaponBoardInfo[chara][i] == 1) {
                WEAPON_HAVE *weapon = &ShopUserStatusPt->chara_weapons[chara][i];
                total += CalItemMoney(weapon->item_no, 0) + WeaponCalMoney(weapon, 0);
            }
        }
    }
    DNG_CONSUMABLE *attach = ShopUserStatusPt->consumable_items;
    for (int i = 0; i < 40; i++, attach++) {
        if (AttachBoardInfo[i] == 1) {
            total += CalItemMoney(attach->id, 0);
        }
    }
    return total;
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", BuyMoneyCheck2__Fv);
#endif

/**
 * Totals what the goods currently marked for sale fetch.
 *
 * @mangled SellMoneyCheck2__Fv
 * @address 0x1EB540
 * @size 0xB4
 */
static int SellMoneyCheck2() {
    int total = 0;
    int i;

    for (i = 0; i < 30; i++) {
        if (ShopBoardInfo[i] == 2) {
            int item_no = ShopListPt[i].item_no;
            if (item_no >= ITEM_ATTACH_START) {
                int money = CalItemMoney(item_no, 1);
                if (item_no >= ITEM_WEAPON_START) {
                    money += WeaponCalMoney(&ShopListPt[i].data.weapon, 1);
                }
                total += money;
            }
        }
    }
    return total;
}

/**
 * Settles which goods are marked for purchase against what may be afforded.
 *
 * @mangled IncludeBuyItem2__Fv
 * @address 0x1EB600
 * @size 0x1A4
 */
static void IncludeBuyItem2() {
    int buy = BuyMoneyCheck2();
    int balance = SellMoneyCheck2() - buy;
    CUserStatus *status;
    int money;
    int i;
    int j;

    for (i = 0; i < 30; i++) {
        if (ShopBoardInfo[i] == 2) {
            ShopBoardInfo[i] = 0;
            memset(&ShopListPt[i], 0, sizeof(SHOP_ITEMLIST));
        }
    }
    for (j = 0; j < 100; j++) {
        if (ItemBoardInfo[j] == 1) {
            ItemBoardInfo[j] = 2;
        }
    }
    // All six characters' weapon rows, walked as one run of sixty slots.
    for (i = 0; i < 60; i++) {
        if (WeaponBoardInfo[0][i] == 1) {
            WeaponBoardInfo[0][i] = 2;
        }
    }
    for (i = 0; i < 40; i++) {
        if (AttachBoardInfo[i] == 1) {
            AttachBoardInfo[i] = 2;
        }
    }
    status = ShopUserStatusPt;
    money = status->money + balance;
    if (money >= 0xFFFF) {
        status->money = 0xFFFF;
    } else {
        status->money = money;
    }
    ItemShopGoodInitialize(ShopMenu.shop_no);
    ItemPosInfoInit();
}

/**
 * Reports the bit flags that prevent the marked item purchase.
 *
 * @mangled CheckBuyItemFunc2__Fv
 * @address 0x1EB7B0
 * @size 0x1C4
 */
static int CheckBuyItemFunc2() {
    int ret = 1;
    int shop_slot;

    for (shop_slot = 0; shop_slot < 30; shop_slot++) {
        if (ShopBoardInfo[shop_slot] == 2) {
            ret |= 2;
            break;
        }
    }

    int carried = 0;
    ITEM_PACK *pack = ShopUserItemPack(ShopUserStatusPt);
    int i;

    for (i = 0; i < 3; i++) {
        if (pack->quick_item_slot[i] >= 0x84) {
            carried += pack->quick_item_qty[i];
        }
    }
    for (i = 0; i < pack->num; i++) {
        if (pack->item[i] >= 0x84) {
            carried++;
        }
    }

    int board_max[3] = {100, 60, 40};
    s32 *board_info[3] = {ItemBoardInfo, WeaponBoardInfo[0], AttachBoardInfo};
    int board;
    int slot;

    for (board = 0; board < 3; board++) {
        for (slot = 0; slot < board_max[board]; slot++) {
            if (board_info[board][slot] == 1) {
                ret |= 4;
                break;
            }
        }
        if (ret & 4) {
            break;
        }
    }
    if ((ret & 4) && carried > pack->num) {
        ret = 8;
    }
    return ret;
}

/**
 * Leaves the item shop, returning the goods not bought and recording the shop game flag.
 *
 * @mangled ExitItemShop2__Fv
 * @address 0x1EB980
 * @size 0x9C
 */
static void ExitItemShop2() {
    CDngStatusData *dng_status;

    ShopCancelGoodReturn2();
    ShopMenuExit();
    if (SaveData != NULL && ShopMenu.shop_no == 1 && !SaveData->GetGameFlag(0xC8)) {
        dng_status = SaveData->GetDngStatus();
        if (dng_status != NULL && dng_status->SearchItemIndexNo(5) >= 0) {
            SaveData->SetGameFlag(0xC8, 1);
        }
    }
}

/**
 * Drops the shop special good from the stock once the player already carries one.
 *
 * @mangled ShopSpecialFunc__Fv
 * @address 0x1EBA20
 * @size 0x128
 */
static void ShopSpecialFunc() {
    int found;
    int i;
    WEAPON_HAVE *weapons;

    if (ShopMenu.shop_no == 1) {
        found = 0;
        weapons = ShopUserStatusPt->chara_weapons[0];
        for (i = 0; i < 10; i++) {
            if (weapons[i].item_no == 5) {
                found = 1;
                break;
            }
        }
        if (ShopDataMove.item_no == 5) {
            found = 1;
        }
        if (found) {
            for (i = 0; i < 30; i++) {
                if (ShopListPt[i].item_no == 5 && ShopBoardInfo[i] == 1) {
                    memset(&ShopListPt[i], 0, sizeof(SHOP_ITEMLIST));
                    ShopBoardInfo[i] = 0;
                    return;
                }
            }
        }
    }
}

int CompItem1(int first_item_no, int second_item_no) {
    ITEM_DATA *first = GetItemData(first_item_no);
    ITEM_DATA *second = GetItemData(second_item_no);
    int first_priority = 0;
    int second_priority = 0;

    if (first != NULL) {
        first_priority = sort_table[first->sort_key];
    }
    if (second != NULL) {
        second_priority = sort_table[second->sort_key];
    }
    if (first_item_no < ITEM_DUNGEON_START) {
        first_priority = 9;
    }
    if (second_item_no < ITEM_DUNGEON_START) {
        second_priority = 9;
    }
    if (second_priority < first_priority) {
        return 1;
    }
    if (first_priority < second_priority) {
        return -1;
    }
    if (second_item_no < first_item_no) {
        return 1;
    }
    if (first_item_no < second_item_no) {
        return -1;
    }
    return 0;
}

int SeitonShopItemBoardSub(ITEM_PACK *pack) {
    int sort_type = sort_top_type;
    int first_slot;
    int second_slot;
    int moved;

    for (first_slot = 0; first_slot < 9; first_slot++) {
        sort_table[sort_type] = first_slot;
        sort_type++;
        if (sort_type >= 9) {
            sort_type = 0;
        }
    }
    sort_table[0] = 9;
    moved = false;
    for (first_slot = 0; first_slot < pack->num - 1; first_slot++) {
        for (second_slot = first_slot + 1; second_slot < pack->num; second_slot++) {
            if (CompItem1(pack->item[first_slot], pack->item[second_slot]) > 0) {
                SwapItem(pack, first_slot, second_slot);
                MenuDataSwap(&ItemBoardInfo[first_slot], &ItemBoardInfo[second_slot]);
                moved = true;
            }
        }
    }
    return moved;
}

/**
 * Sorts the item board, trying each ordering until one changes it.
 *
 * @mangled SeitonShopItemBoard__FP9ITEM_PACK
 * @address 0x1EBDB0
 * @size 0x88
 */
static void SeitonShopItemBoard(ITEM_PACK *pack) {
    int i;

    if (pack == NULL) {
        return;
    }
    for (i = 0; i < 9; i++) {
        if (SeitonShopItemBoardSub(pack)) {
            return;
        }
        sort_top_type++;
        if (sort_top_type >= 9) {
            sort_top_type = 1;
        }
    }
}

int CompAttach1(ATTACH_LIST *first, ATTACH_LIST *second) {
    int first_priority = asort_table[GetAttachKind(first->item_no)];
    int second_priority = asort_table[GetAttachKind(second->item_no)];
    int second_item_no;
    int first_item_no;

    first_item_no = first->item_no;
    if (ITEM_ATTACH_START > first_item_no) {
        first_priority = 5;
    }
    second_item_no = second->item_no;
    if (ITEM_ATTACH_START > second_item_no) {
        second_priority = 5;
    }
    if (second_priority < first_priority) {
        return 1;
    }
    if (first_priority < second_priority) {
        return -1;
    }
    if (first_item_no > second_item_no) {
        return 1;
    }
    if (first_item_no < second_item_no) {
        return -1;
    }
    return 0;
}

int SeitonShopAttachBoardSub(ATTACH_LIST *attachments) {
    int sort_type = asort_top_type;
    int first_slot;
    int second_slot;
    int moved;

    for (first_slot = 0; first_slot < 5; first_slot++) {
        asort_table[sort_type] = first_slot;
        sort_type++;
        if (sort_type >= 5) {
            sort_type = 0;
        }
    }
    asort_table[0] = 5;
    moved = false;
    for (first_slot = 0; first_slot < 39; first_slot++) {
        for (second_slot = first_slot + 1; second_slot < 40; second_slot++) {
            if (CompAttach1(&attachments[first_slot], &attachments[second_slot]) > 0) {
                MenuDataSwap(&attachments[first_slot], &attachments[second_slot]);
                MenuDataSwap(&AttachBoardInfo[first_slot], &AttachBoardInfo[second_slot]);
                moved = true;
            }
        }
    }
    return moved;
}

/**
 * Sorts the attachment board, trying each ordering until one changes it.
 *
 * @mangled SeitonShopAttachBoard__FP11ATTACH_LIST
 * @address 0x1EC080
 * @size 0x94
 */
static int SeitonShopAttachBoard(ATTACH_LIST *list) {
    int i;

    if (list == NULL) {
        return 0;
    }
    for (i = 0; i < 5; i++) {
        if (SeitonShopAttachBoardSub(list)) {
            break;
        }
        asort_top_type++;
        if (asort_top_type >= 5) {
            asort_top_type = 0;
        }
    }
    return 1;
}

int ItemShopLoop2() {
    int done;

    ReadBG();
    done = ItemShopKey2();
    ItemShopDraw2();
    if (done) {
        ExitItemShop2();
    }
    return done;
}

#ifdef NON_MATCHING
void CheckSideKey2() {
    int se;

    if (GamePad.Down(0x9000) != 0) {
        ShopMenu.side = 0;
        ShopMenu.board.cursor_area = 1;
        ShopMenu.board.cursor = (ShopMenu.stock_top_row + 3) * 5 + 3;
    }
    if (GamePad.Down(0x40) != 0) {
        ShopMenu.unk_06 = 1;
        if (ShopHaveItemPt->item_no >= 0x51) {
            se = 2;
        } else {
            int flags = CheckBuyItemFunc2();
            if (flags & 1) {
                se = 2;
                SetItemShopTalkMode(23, 1);
            }
            if ((flags & 2) || (flags & 4)) {
                int money = ShopUserStatusPt->money;
                int buy = BuyMoneyCheck2();
                int balance = money + (SellMoneyCheck2() - buy);
                if (balance < 0) {
                    SetItemShopTalkMode(21, 1);
                    se = 2;
                } else if (balance >= 0x10000) {
                    SetItemShopTalkMode(22, 1);
                    se = 2;
                } else {
                    SetItemShopTalkMode(12, 1);
                    se = 1;
                }
            }
            if (flags & 8) {
                SetItemShopTalkMode(10, 1);
            }
        }
        ComMenuSePlay(se);
    }
    if (GamePad.Down(0x2000) != 0) {
        ShopMenu.side = 1;
        ShopMenu.board.cursor = (ShopMenu.board.top_row + 3) * 5;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", CheckSideKey2__Fv);
#endif

/**
 * Draws the item shop's board with its goods and their prices.
 *
 * @mangled DrawItemShopBoard2__Fiii
 * @address 0x1EC370
 * @size 0x2C4
 */
static void DrawItemShopBoard2(int x, int y, int alpha) {
    int top = y + 9;
    int bottom = y + 0xA9;
    int board_y;
    int left = x + 0x14;

    board_y = y + 6 - ShopMenu.stock_top_row * 0x28;
    ShopMenu.stock_y += ((float) board_y - ShopMenu.stock_y) / 4.0f;
    board_y = ShopMenu.stock_y;
    DrawPerBoardDraw(0, 0x1E, left, board_y, top, bottom, ShopBoard, 0x80);

    int icon_x = left + 2;
    int icon_y = board_y + 6;
    for (int i = 0; i < 0x1E; i++) {
        int item = ShopListPt[i].item_no;
        int num = 0;

        if (item >= 0x5B && item < 0x5F) {
            num = ShopListPt[i].data.param[item - 0x57];
        }
        if (item == 0x5A) {
            num = ShopListPt[i].data.param[1];
        }
        DrawIconParts(item, icon_x, icon_y, top, bottom, alpha, num);
        icon_x += 0x28;
        if (i % 5 == 4) {
            icon_x = left + 2;
            icon_y += 0x28;
        }
    }
    DrawSellTicket_2(left + 2, board_y + 6, top, bottom, 0x80);

    CRect_i_ screen(x, y - 0x13, 0x80, 0x14);
    CRect_i_ texel(0x100, 0x7C, 0x80, 0x14);
    DrawMenu2DSprite(ShopBoard, screen, texel, alpha);
    screen.x += 0x80;
    texel.x += 0x80;
    texel.y = 0x1C;
    DrawMenu2DSprite(ShopBoard, screen, texel, alpha);

    PersonalBoardDrawWaku(x, y, ShopBoard, 0x80);
    PersonalBoardScrlBarDraw(0x1E, x, y, ShopMenu.stock_scroll, ShopMenu.stock_top_row, ShopBoard, 0x80);
    DrawCheckButton(x + 0xA8, y + 0xAA, 0x80);
}

#ifdef NON_MATCHING
void DrawMoneyCheckBoard2(int x, int y, int alpha) {
    int u;
    int v;

    DrawMenu2DSprite(ShopBoard, CRect_i_(x, y + 1, 0x60, 0x1B), CRect_i_(0xD0, 0xC0, 0x60, 0x1C), alpha);
    int buy = BuyMoneyCheck2();
    int balance = SellMoneyCheck2() - buy;
    RECT digits = {0, 0xDC, 0xC, 0xC};
    if (balance < 0) {
        digits.y += 0xC;
        u = 0x84;
        v = 0xE8;
    }
    if (balance > 0) {
        digits.y += 0x18;
        u = 0x78;
        v = 0xF4;
    }
    int number_y = y + 7;
    int left = DrawMenuNumber(abs(balance), x + 0x54, number_y, ShopBoard, digits, 1, alpha);
    if (balance != 0) {
        DrawMenu2DSprite(ShopBoard, CRect_i_(left - 0xC, number_y, 0xC, 0xC), CRect_i_(u, v, 0xC, 0xC), alpha);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", DrawMoneyCheckBoard2__Fiii);
#endif

/**
 * Draws the shop's confirmation button.
 *
 * @mangled DrawCheckButton__Fiii
 * @address 0x1EC7D0
 * @size 0x9C
 */
static void DrawCheckButton(int x, int y, int mode) {
    int u = 0x130;

    switch (ShopMenu.talk_mode) {
        case 0x1A:
            u = 0x190;
            if (ShopMenu.step_count > 8) {
                ShopMenu.talk_mode = 0;
            }
            break;
    }
    DrawMenu2DSprite(ShopBoard, CRect_i_(x, y, 0x60, 0x20), CRect_i_(u, 0x90, 0x60, 0x20), mode);
}

/**
 * Draws the small price ticket, clipped to the digits it has to show.
 *
 * @mangled DrawSmallSellTicket__Fiiiiii
 * @address 0x1EC870
 * @size 0xE0
 */
static void DrawSmallSellTicket(int selected, int x, int y, int clip_top, int clip_bottom, int mode) {
    int draw_x = x + 0x16;
    int draw_y = y + 0x18;
    int v = 0xB0;
    int height = 0xC;

    if (selected) {
        v = 0xBC;
    }
    if (!(clip_top < draw_y + 0xC && clip_bottom > draw_y)) {
        return;
    }
    MenuTextureClip(draw_y, v, height, clip_top, clip_bottom);
    DrawMenu2DSprite(ShopBoard, CRect_i_(draw_x, draw_y, 0x10, height), CRect_i_(0x130, v, 0x10, height), mode);
}

/**
 * Draws the large price ticket of the shop slot under the cursor.
 *
 * @mangled DrawBigSellTicket__Fiiiii
 * @address 0x1EC950
 * @size 0xE0
 */
static void DrawBigSellTicket(int selected, int money, int x, int y, int mode) {
    int draw_x = x + 0x12;
    int draw_y = y + 0x14;
    int u = 0x1A0;
    RECT clip = {0x140, 0xB0, 8, 0xC};

    if (selected) {
        u = 0x1CC;
        clip.y += 0xC;
    }
    DrawMenu2DSprite(ShopBoard, CRect_i_(draw_x, draw_y, 0x2C, 0x20), CRect_i_(u, 0xB0, 0x2C, 0x20), mode);
    DrawMenuNumber(money, draw_x + 0x24, draw_y + 0xE, ShopBoard, clip, 0, mode);
}

/**
 * Draws the selling price ticket of one shop slot.
 *
 * @mangled DrawSellTicket_2__Fiiiii
 * @address 0x1ECA30
 * @size 0x184
 */
static void DrawSellTicket_2(int x, int y, int clip_top, int clip_bottom, int mode) {
    int draw_x = x;
    int draw_y = y;
    int visible;
    int selected;
    int state;
    int i;

    for (i = 0; i < 30; i++) {
        state = ShopBoardInfo[i];
        if (state == 0) {
            draw_x += 0x28;
            if (i % 5 == 4) {
                draw_x = x;
                draw_y += 0x28;
            }
        } else {
            visible = 1;
            if (ShopListPt[i].item_no < ITEM_ATTACH_START) {
                visible = 0;
            }
            if (ShopMenu.side == 0 && i == ShopMenu.board.cursor) {
                visible = 0;
            }
            selected = 0;
            if (state == 2) {
                selected = 1;
            }
            if (visible) {
                DrawSmallSellTicket(selected, draw_x, draw_y, clip_top, clip_bottom, mode);
            }
            draw_x += 0x28;
            if (i % 5 == 4) {
                draw_x = x;
                draw_y += 0x28;
            }
        }
    }
}

/**
 * Draws the price ticket of one shop slot, small or large according to the price.
 *
 * @mangled DrawLocalTicket__Fiiiiiii
 * @address 0x1ECBC0
 * @size 0x14C
 */
static void DrawLocalTicket(int x, int y, int clip_top, int clip_bottom, int slot, int item_no, int mode) {
    int money;
    int ticket_x;
    int ticket_y;

    if (slot == ShopMenu.board.cursor && ShopMenu.side == 1) {
        money = CalItemMoney(item_no, 0);
        if (money < 0) {
            money = 1;
        }
        ticket_x = x + (slot % 5) * 0x28;
        ticket_y = y + (slot / 5) * 0x28;
        if (ticket_y >= clip_top || ticket_y < clip_bottom) {
            DrawBigSellTicket(0, money, ticket_x, ticket_y, 0x80);
        }
    } else {
        ticket_x = x + (slot % 5) * 0x28;
        ticket_y = y + (slot / 5) * 0x28;
        DrawSmallSellTicket(0, ticket_x, ticket_y, clip_top, clip_bottom, mode);
    }
}

#ifdef NON_MATCHING
void DrawSellTicket22(int x, int y, int top, int bottom, int alpha) {
    int max[3] = {100, 60, 40};
    ITEM_PACK *pack = &ShopUserStatusPt->item_pack;
    DNG_CONSUMABLE *attach = ShopUserStatusPt->consumable_items;

    switch (ShopMenu.board.page) {
        case 0:
            for (int i = 0; i < 100; i++) {
                if (ItemBoardInfo[i] == 1) {
                    int item_no = pack->item[i];
                    if (item_no >= 0x84) {
                        DrawLocalTicket(x, y, top, bottom, i, item_no, alpha);
                    }
                }
            }
            return;
        case 1:
            for (int chara = 0; chara < 6; chara++) {
                WEAPON_HAVE *weapons = ShopUserStatusPt->chara_weapons[chara];
                for (int i = 0; i < 10; i++) {
                    if (WeaponBoardInfo[chara][i] == 1) {
                        int item_no = weapons[i].item_no;
                        if (item_no >= 0x101) {
                            DrawLocalTicket(x, y, top, bottom, i + chara * 10, item_no, 0x80);
                        }
                    }
                }
            }
            return;
        case 2:
            for (int i = 0; i < 40; i++) {
                if (AttachBoardInfo[i] == 1) {
                    int item_no = attach[i].id;
                    if (item_no >= 0x51) {
                        DrawLocalTicket(x, y, top, bottom, i, item_no, 0x80);
                    }
                }
            }
            return;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", DrawSellTicket22__Fiiiii);
#endif
#ifdef NON_MATCHING
void ShopCancelGoodReturn2() {
    int count = -1;
    int page = -1;
    DNG_CONSUMABLE *attach = ShopUserStatusPt->consumable_items;
    ITEM_PACK *pack = &ShopUserStatusPt->item_pack;

    for (int i = 0; i < 100; i++) {
        if (ItemBoardInfo[i] == 1) {
            count++;
            ShopWorkBuf[count].item_no = pack->item[i];
            *(int *) &ShopWorkBuf[count].data = pack->item_vol[i];
            pack->item[i] = 0;
            pack->item_vol[i] = 0;
            ItemBoardInfo[i] = 0;
        }
    }
    for (int i = 0; i < 60; i++) {
        if (WeaponBoardInfo[0][i] == 1) {
            WEAPON_HAVE *weapon = &ShopUserStatusPt->chara_weapons[i / 10][i % 10];
            int item_no = weapon->item_no;
            if (item_no >= 0x101) {
                count++;
                ShopWorkBuf[count].item_no = item_no;
                memcpy(&ShopWorkBuf[count].data, weapon, sizeof(WEAPON_HAVE));
                InitHaveWep(weapon);
                WeaponBoardInfo[0][i] = 0;
            }
        }
    }
    for (int i = 0; i < 40; i++) {
        if (AttachBoardInfo[i] == 1 && attach != NULL) {
            count++;
            ATTACH_LIST *list = (ATTACH_LIST *) &attach[i];
            ShopWorkBuf[count].item_no = list->item_no;
            memcpy(&ShopWorkBuf[count].data, list, sizeof(ATTACH_LIST));
            InitHaveAttach(list);
            AttachBoardInfo[i] = 0;
        }
    }
    for (int i = 0; i < 30; i++) {
        if (ShopBoardInfo[i] == 2) {
            int item_no = ShopListPt[i].item_no;
            if (item_no >= 0x51) {
                int space = GetBoardSpace(item_no, &page);
                if (space >= 0) {
                    s32 *info;
                    switch (page) {
                        case 0:
                            pack->item[space] = item_no;
                            pack->item_vol[space] = *(int *) &ShopListPt[i].data;
                            info = ItemBoardInfo;
                            break;
                        case 1: {
                            WEAPON_HAVE *weapon = &ShopUserStatusPt->chara_weapons[space / 10][space % 10];
                            memcpy(weapon, &ShopListPt[i].data, sizeof(WEAPON_HAVE));
                            weapon->item_no = item_no;
                            info = WeaponBoardInfo[0];
                            break;
                        }
                        case 2: {
                            ATTACH_LIST *list = (ATTACH_LIST *) &attach[space];
                            memcpy(list, &ShopListPt[i].data, sizeof(ATTACH_LIST));
                            list->item_no = item_no;
                            info = AttachBoardInfo;
                            break;
                        }
                    }
                    info[space] = 2;
                    memset(&ShopListPt[i], 0, sizeof(SHOP_ITEMLIST));
                    ShopBoardInfo[i] = 0;
                }
            }
        }
    }
    int next = 0;
    for (int i = 0; i < 30; i++) {
        if (ShopListPt[i].item_no < 0x51) {
            if (count < next) {
                break;
            }
            ShopBoardInfo[i] = 1;
            memcpy(&ShopListPt[i], &ShopWorkBuf[next], sizeof(SHOP_ITEMLIST));
            ShopListPt[i].item_no = ShopWorkBuf[next].item_no;
            next++;
        }
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", ShopCancelGoodReturn2__Fv);
#endif

/**
 * Chooses the line the shopkeeper says for the shop's current state.
 *
 * @mangled GetNowMasterMsgNo2__Fii
 * @address 0x1ED470
 * @size 0x268
 */
static int GetNowMasterMsgNo2(int, int);
static int GetNowMasterMsgNo2(int shop, int kind) {
    int mes_no;
    int base = shop * 2000;

    mes_no = base + 2000 + kind * 100;

    switch (ShopMenu.talk_mode) {
        case 3:
            break;
        case 7:
            mes_no += 0x32;
            break;
        case 21:
            mes_no += 0x34;
            break;
        case 22:
            mes_no += 0x38;
            break;
        case 23:
            mes_no += 0x33;
            break;
        case 4:
            mes_no += 0x36;
            break;
        case 5:
            mes_no += 0x35;
            break;
        case 8:
            mes_no += 0x3A;
            break;
        case 11:
        case 10:
            mes_no += 0x37;
            break;
        case 6:
            mes_no += 0x41;
            break;
        case 12: {
            int flags = CheckBuyItemFunc2();
            if (flags & 2) {
                mes_no = base + 2070 + kind * 100;
            }
            if (flags & 4) {
                mes_no = base + 2071 + kind * 100;
            }
            if (flags & 6) {
                mes_no = base + 2072 + kind * 100;
            }
            break;
        }
        case 20:
            mes_no += 0x4B;
            break;
        case 24:
            mes_no += 0x5A;
            break;
        case 25:
        case 2:
            mes_no += 0x5B;
            break;
        case 0:
            switch (ShopMenu.side) {
                case 0:
                    mes_no += 0x14;
                    break;
                case 1:
                    if (ShopMenu.board.cursor_area == 2) {
                        mes_no += 0x28;
                    } else {
                        mes_no += 0x1E;
                    }
                    break;
                case 2:
                    mes_no += 0x3C;
                    break;
            }
            break;
    }
    return mes_no;
}

/**
 * Runs the shopkeeper's speech and the model's reaction to it.
 *
 * @mangled ShopModelMsgFunc__Fi
 * @address 0x1ED6E0
 * @size 0x2D8
 */
static void ShopModelMsgFunc(int shop_no) {
    if (ShopMenu.person_state == 2) {
        int motion = ShopMenu.unk_19C;

        switch (ShopMenu.msg_mode) {
            case 0:
                motion = 0;
                if (GamePad.AllOn()) {
                    ShopMenu.unk_1A4 = 0;
                } else {
                    ShopMenu.unk_1A4++;
                    if (ShopMenu.unk_1A4 >= 0x140) {
                        ShopMenu.msg_mode = 1;
                        motion = 3;
                    }
                }
                break;
            case 1:
                switch (ShopMenu.talk_mode) {
                    case 0:
                        if (GamePad.AllOn()) {
                            ShopMenu.msg_mode = 0;
                            ShopMenu.unk_1A4 = 0;
                            motion = 0;
                        }
                        break;
                    default:
                        motion = 3;
                        break;
                }
                break;
        }
        if (ShopMenu.msg_mode == 1) {
            int msg_no = GetNowMasterMsgNo2(shop_no, ShopMenu.shop_no);

            if (ShopMenu.unk_19E != msg_no || GamePad.Down(0x60)) {
                ShopMenu.unk_19E = msg_no;
                CommonMenuMes3.mes_made = -1;
                CommonMenuMes3.MakeMesWin(ShopMenu.unk_19E);
                motion = 3;
            }
            switch (ShopMenu.talk_mode) {
                case 2:
                case 1:
                    break;
                default:
                    if (ShopMenu.person_state) {
                        SetShopTalkMsgPos();
                        CommonMenuMes3.tail_on = 1;
                        CommonMenuMes3.auto_pos = 8;
                        CommonMenuMes3.Step();
                        if (ShopMenu.unk_1A0 >= 4) {
                            CommonMenuMes3.DrawMesWin();
                        }
                        setbilinear(0);
                    }
                    break;
            }
        }
        switch (CommonMenuMes3.State()) {
            case 0:
            case 4:
                motion = 0;
                break;
            case 1:
            case 2:
                motion = 3;
                break;
        }
        if (ShopMenu.unk_19C != motion) {
            ShopMenu.unk_19C = motion;
            MenuCharaFrame.SetMotion(ShopMenu.unk_19C, 0);
        }
    }
}

/**
 * Places the shopkeeper's speech bubble above their model.
 *
 * @mangled SetShopTalkMsgPos__Fv
 * @address 0x1ED9C0
 * @size 0xB4
 * Places the shopkeeper's message window over the shopkeeper.
 */
static void SetShopTalkMsgPos() {
    float pos[4];
    int screen[6];
    int msg_pos[2];
    float scale[3];

    sceVu0CopyVector(pos, MenuCharaFrame.pos);
    MenuCharaFrame.GetScale(scale);
    pos[0] -= 2.0f;
    pos[1] += 0.85f * MenuCharaFrame.body_height;
    pos[3] = 1.0f;
    MGRotTransPers2D(screen, pos, 0);
    msg_pos[0] = screen[0];
    msg_pos[1] = screen[1];
    CommonMenuMes3.AutoSet(msg_pos);
}

#ifdef NON_MATCHING
void ItemShopGetPacFileName(int kind, int shop_no, char *name) {
    char *names[2][18] = {
        {"p13", "p31", "p39", "p54", "p74", "c03", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL},
        {"p02", "p32", "p35", "p36", "p36", "p36", "p36", "p37", "p49", "p55", "p75", "c03", "p41", "p02", "p32", "p38",
         "c03", "c03"}};
    char file[32];
    char path[64] = "commenu/shopchara/";

    strcpy(file, names[kind][shop_no]);
    strcat(file, "a.pac");
    strcat(path, file);
    strcpy(name, path);
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopGetPacFileName__FiiPc);
#endif
#ifdef NON_MATCHING
void ItemShopGetImgFileName(int kind, int shop_no, char *name) {
    char *names[2][18] = {
        {"p13a", "p31a", "p39a", "p54a", "p74a", "c03c", "", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
         NULL},
        {"p02a", "p32a", "p35a", "p36a", "p36a", "p36a", "p36a", "p37a", "p49a", "p55a", "p75a", "c03c", "p41a", "p02a",
         "p32a", "p38a", "c03c", "c03c"}};

    strcpy(name, names[kind][shop_no]);
    strcat(name, "01.img");
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopGetImgFileName__FiiPc);
#endif

void ItemShopMemoryAlloc() {
    ShopBoardInfo = (s32 *) ShopCashBuffer.Alloc(0x78);
    ItemBoardInfo = (s32 *) ShopCashBuffer.Alloc(0x190);
    WeaponBoardInfo = (s32(*)[10]) ShopCashBuffer.Alloc(0xF0);
    AttachBoardInfo = (s32 *) ShopCashBuffer.Alloc(0xA0);
    memset(ShopBoardInfo, 0, 0x78);
    memset(ItemBoardInfo, 0, 0x190);
    memset(WeaponBoardInfo, 0, 0xF0);
    memset(AttachBoardInfo, 0, 0xA0);
    ShopListPt = (SHOP_ITEMLIST *) ShopCashBuffer.Alloc(0x1D88);
    memset(ShopListPt, 0, 0x1D88);
    ShopWorkBuf = (SHOP_ITEMLIST *) ShopCashBuffer.Alloc(0x1D88);
}

void ItemPosInfoInit() {
    int i;
    int j;
    ITEM_PACK *pack = ShopUserItemPack(ShopUserStatusPt);

    for (i = 0; i < 100; i++) {
        if (pack->item[i] >= 0x84) {
            ItemBoardInfo[i] = 2;
        } else {
            ItemBoardInfo[i] = 0;
        }
    }
    for (i = 0; i < 6; i++) {
        CUserStatus *status = ShopUserStatusPt;
        WEAPON_HAVE *weapons = status->chara_weapons[i];

        for (j = 0; j < 10; j++) {
            if (weapons[j].item_no >= 0x101) {
                WeaponBoardInfo[i][j] = 2;
            } else {
                WeaponBoardInfo[i][j] = 0;
            }
        }
    }
    DNG_CONSUMABLE *attach = ShopUserStatusPt->consumable_items;
    for (i = 0; i < 40; i++) {
        if (attach[i].id >= 0x51) {
            AttachBoardInfo[i] = 2;
        } else {
            AttachBoardInfo[i] = 0;
        }
    }
}

/**
 * Fills the goods board from one shop's list.
 *
 * @mangled ItemShopGoodInitialize__Fi
 * @address 0x1EDEA0
 * @size 0x24C
 * Fills the shop stock from the goods list of the shop number it is given.
 */
static void ItemShopGoodInitialize(int shop_no) {
    s16 *list = GetItemShopList(shop_no);

    for (int i = 0; i < 20; i++) {
        s16 item_no = list[i];

        if (item_no >= 0x51) {
            switch (WhatIsKindofItem(item_no)) {
                case 1:
                    WepDataListToHaveCopy(item_no, &ShopListPt[i].data.weapon);
                    break;
                case 2:
                    AttachDataListToHaveCopy(item_no, &ShopListPt[i].data.attach);
                    if (item_no >= 0x5B && item_no < 0x5F) {
                        ShopListPt[i].data.param[item_no - 0x57] = 1;
                    }
                    break;
                case 0:
                    ShopListPt[i].data.volume = ItemDataToHaveCopy(item_no);
                    break;
                default:
                    memset(&ShopListPt[i], 0, sizeof(SHOP_ITEMLIST));
                    break;
            }
            ShopListPt[i].item_no = item_no;
            ShopBoardInfo[i] = 1;
        } else {
            memset(&ShopListPt[i], 0, sizeof(SHOP_ITEMLIST));
            ShopBoardInfo[i] = 0;
        }
    }
    for (int i = 20; i < 30; i++) {
        ShopBoardInfo[i] = 0;
        memset(&ShopListPt[i], 0, sizeof(SHOP_ITEMLIST));
    }
    ShopSpecialFunc();
    InitAllHaveData();
}

void InitItemShop2(int *state, int shop_no, int mode) {
    ShopMenuInit(state, shop_no, mode);
    ItemShopMemoryAlloc();
    ItemShopGoodInitialize(shop_no);
    ItemPosInfoInit();
    InitAllHaveData();
    ShopHaveItemPt->unk_00 = 0;
    ShopMenu.board.cursor = 0;
    ShopMenu.side = 0;
    ShopMenu.stock_top_row = 0;
    ShopMenu.stock_scroll = 142.0f + 114.0f * ShopMenu.stock_top_row / 6.0f;
    ShopMenu.stock_y = 0x7E - ShopMenu.stock_top_row * 0x28;
    ShopMenu.cursor_x = 86.0f;
    ShopMenu.cursor_y = 152.0f;
    ShopMenu.cursor_x = (ShopMenu.board.cursor % 5) * 0x28 + 0x154;
    ShopMenu.cursor_y = 120.0f;
    GetMainMenuRightHelpWinLangOffset(ShopHelpWinPos[0], ShopHelpWinPos[1], ShopHelpWinW, ShopHelpWinH);
}

#ifdef NON_MATCHING
void ItemShopSelectKey2() {
    u8 held[0xF8];
    u8 taken[0xF8];

    if (GamePad.Down(0x1000) != 0) {
        ShopMenu.board.cursor -= 5;
        if (ShopMenu.board.cursor < 0) {
            ShopMenu.board.cursor += 5;
        }
        if (ShopMenu.board.cursor / 5 < ShopMenu.stock_top_row) {
            ShopMenu.stock_top_row--;
        }
    }
    if (GamePad.Down(0x4000) != 0) {
        if (ShopMenu.board.cursor >= 25) {
            ShopMenu.side = 2;
        } else {
            ShopMenu.board.cursor += 5;
        }
        if (ShopMenu.stock_top_row + 3 < ShopMenu.board.cursor / 5) {
            ShopMenu.stock_top_row++;
        }
    }
    if (GamePad.Down(0x8000) != 0 && ShopMenu.board.cursor % 5 != 0) {
        ShopMenu.board.cursor--;
    }
    if (GamePad.Down(0x2000) != 0) {
        if (ShopMenu.board.cursor % 5 == 4) {
            ShopMenu.side = 1;
            ShopMenu.board.cursor = (ShopMenu.board.top_row + (ShopMenu.board.cursor / 5 - ShopMenu.stock_top_row)) * 5;
        } else {
            ShopMenu.board.cursor++;
        }
    }
    if (ShopMenu.side == 0 && ShopMenu.board.cursor > 30) {
        while (ShopMenu.board.cursor > 30) {
            ShopMenu.board.cursor -= 5;
        }
        ShopMenu.stock_top_row = ShopMenu.board.cursor / 5 - 2;
        ShopMenu.side = 2;
        return;
    }
    if (GamePad.Down(0x40) != 0) {
        ShopMenu.unk_06 = 1;
        int cursor = ShopMenu.board.cursor;
        if (ShopListPt[cursor].item_no < 0x51 && ShopHaveItemPt->item_no < 0x51) {
            ComMenuSePlay(2);
            return;
        }
        int enable = IsEnableCharge(ShopHaveItemPt->item_no);
        if (enable != 0) {
            int item_no = ShopHaveItemPt->item_no;
            if (item_no >= 0x84) {
                ITEM_DATA *data = GetItemData(item_no);
                if (data != NULL) {
                    if (data->kind_flags & 0x10) {
                        enable = 0;
                    }
                    if (ShopHaveItemPt->item_no == 0xB9) {
                        enable = 0;
                    }
                }
            }
            if (ShopHaveItemPt->item_no == 0x10C && GetMenuHebikiriFlag() == 0) {
                enable = 0;
            }
        }
        if (ShopMenu.board.unk_15C >= 0) {
            ComMenuSePlay(2);
            SetItemShopTalkMode(5, 1);
            return;
        }
        if (enable == 0) {
            ComMenuSePlay(2);
            SetItemShopTalkMode(4, 1);
            return;
        }
        int shop_info = ShopBoardInfo[cursor];
        int have_info = ShopHaveItemPt->unk_00;
        memset(taken, 0, sizeof(taken));
        SHOP_ITEMLIST *good = &ShopListPt[cursor];
        int good_kind = WhatIsKindofItem(good->item_no);
        int good_no = good->item_no;
        switch (good_kind) {
            case 0:
                *(int *) taken = *(int *) &good->data;
                break;
            case 1:
                memcpy(taken, &good->data, sizeof(WEAPON_HAVE));
                break;
            case 2:
                memcpy(taken, &good->data, sizeof(ATTACH_LIST));
                break;
            default:
                InitShopItemListData(good);
                break;
        }
        int held_kind = WhatIsKindofItem(ShopHaveItemPt->item_no);
        int held_no = ShopHaveItemPt->item_no;
        switch (held_kind) {
            case 0:
                *(int *) held = ShopHaveItemPt->volume;
                break;
            case 1:
                memcpy(held, ShopHaveWepPt, sizeof(WEAPON_HAVE));
                break;
            case 2:
                memcpy(held, ShopHaveAttachPt, sizeof(ATTACH_LIST));
                break;
        }
        switch (good_kind) {
            case 0:
                ShopHaveItemPt->volume = *(int *) taken;
                break;
            case 1:
                memcpy(ShopHaveWepPt, taken, sizeof(WEAPON_HAVE));
                break;
            case 2:
                memcpy(ShopHaveAttachPt, taken, sizeof(ATTACH_LIST));
                break;
        }
        ShopHaveItemPt->item_no = good_no;
        switch (held_kind) {
            case 0:
                *(int *) &good->data = *(int *) held;
                break;
            case 1:
                memcpy(&good->data, held, sizeof(WEAPON_HAVE));
                break;
            case 2:
                memcpy(&good->data, held, sizeof(ATTACH_LIST));
                break;
        }
        good->item_no = held_no;
        ShopHaveItemPt->unk_00 = shop_info;
        ShopBoardInfo[cursor] = have_info;
        if (ShopHaveItemPt->item_no < 0x51) {
            InitAllHaveData();
            ShopMenu.board.unk_15C = -1;
        } else {
            ShopHaveItemPt->unk_08 = cursor;
            ShopMenu.board.page = good_kind;
            PersonalBoardLimmitCheck();
        }
        ComMenuSePlay(1);
    } else if (GamePad.Down(0x10) != 0) {
        ShopMenu.unk_06 = 1;
        if (ShopHaveItemPt->item_no >= 0x51) {
            ComMenuSePlay(2);
            return;
        }
        if (ShopBoardInfo[ShopMenu.board.cursor] == 1) {
            int item_no = ShopListPt[ShopMenu.board.cursor].item_no;
            int price = CalItemMoney(item_no, 0);
            int enable = 1;
            if (item_no < 0x51) {
                enable = 0;
            }
            if (ShopUserStatusPt->money < price) {
                enable = 0;
                SetItemShopTalkMode(21, 1);
            }
            int page = WhatIsKindofItem(item_no);
            if (GetBoardSpace(item_no, &page) < 0) {
                enable = 0;
                SetItemShopTalkMode(11, 1);
            }
            int full = 0;
            int max = 0;
            int used = 0;
            int owner = WhoIsWeaponEquip(item_no);
            switch (page) {
                case 0: {
                    ITEM_PACK *pack = &ShopUserStatusPt->item_pack;
                    max = pack->num;
                    for (int i = 0; i < 3; i++) {
                        if (pack->quick_item_slot[i] >= 0x84) {
                            used += pack->quick_item_qty[i];
                        }
                    }
                    for (int i = 0; i < max; i++) {
                        if (pack->item[i] >= 0x84) {
                            used++;
                        }
                    }
                    break;
                }
                case 1:
                    max = 10;
                    for (int i = 0; i < 10; i++) {
                        if (ShopUserStatusPt->chara_weapons[owner][i].item_no >= 0x101) {
                            used++;
                        }
                    }
                    break;
                case 2:
                    max = 40;
                    for (int i = 0; i < 40; i++) {
                        if (ShopUserStatusPt->consumable_items[i].id >= 0x51) {
                            used++;
                        }
                    }
                    break;
            }
            if (ShopDataMove.item_no > 0) {
                used++;
            }
            for (int i = 0; i < 30; i++) {
                if (page >= 0 && page == WhatIsKindofItem(ShopListPt[i].item_no) && ShopBoardInfo[i] == 2) {
                    if (page == 1) {
                        if (owner == WhoIsWeaponEquip(ShopListPt[i].item_no)) {
                            used++;
                        }
                    } else {
                        used++;
                    }
                }
            }
            if (used >= max) {
                full = 1;
            }
            if (full != 0) {
                enable = 0;
                SetItemShopTalkMode(11, 1);
            }
            if (enable != 0) {
                ShopMenu.talk_mode = 13;
                ComMenuSePlay(1);
            } else {
                ComMenuSePlay(2);
            }
        } else {
            ComMenuSePlay(2);
        }
    }
    if (BoardModeChangeKey() != 0) {
        PersonalBoardLimmitCheck();
        ComMenuSePlay(0);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopSelectKey2__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/shop", @819);
INCLUDE_RODATA("asm/nonmatchings/shop", @837__3);
INCLUDE_RODATA("asm/nonmatchings/shop", @838__2);
INCLUDE_RODATA("asm/nonmatchings/shop", @1180);
INCLUDE_RODATA("asm/nonmatchings/shop", @1181);
INCLUDE_RODATA("asm/nonmatchings/shop", @2107);
INCLUDE_RODATA("asm/nonmatchings/shop", @2108);
INCLUDE_RODATA("asm/nonmatchings/shop", @2109);
INCLUDE_RODATA("asm/nonmatchings/shop", @2110);
INCLUDE_RODATA("asm/nonmatchings/shop", @2111);
INCLUDE_RODATA("asm/nonmatchings/shop", @2112);
INCLUDE_RODATA("asm/nonmatchings/shop", @2113);
INCLUDE_RODATA("asm/nonmatchings/shop", @2114);
INCLUDE_RODATA("asm/nonmatchings/shop", @2115);
INCLUDE_RODATA("asm/nonmatchings/shop", @2116);
INCLUDE_RODATA("asm/nonmatchings/shop", @2117);
INCLUDE_RODATA("asm/nonmatchings/shop", @2118);
INCLUDE_RODATA("asm/nonmatchings/shop", @2119);
INCLUDE_RODATA("asm/nonmatchings/shop", @2120__2);
INCLUDE_RODATA("asm/nonmatchings/shop", @2121__2);
INCLUDE_RODATA("asm/nonmatchings/shop", @2122__2);
INCLUDE_RODATA("asm/nonmatchings/shop", @2126);
INCLUDE_RODATA("asm/nonmatchings/shop", @2127__2);
INCLUDE_RODATA("asm/nonmatchings/shop", @2128);
INCLUDE_RODATA("asm/nonmatchings/shop", @2129);
INCLUDE_RODATA("asm/nonmatchings/shop", @2130);
INCLUDE_RODATA("asm/nonmatchings/shop", @2131);
INCLUDE_RODATA("asm/nonmatchings/shop", @2132);
INCLUDE_RODATA("asm/nonmatchings/shop", @2133);
INCLUDE_RODATA("asm/nonmatchings/shop", @2134);
INCLUDE_RODATA("asm/nonmatchings/shop", @2135);
INCLUDE_RODATA("asm/nonmatchings/shop", @2136);
INCLUDE_RODATA("asm/nonmatchings/shop", @2137);
INCLUDE_RODATA("asm/nonmatchings/shop", @2138);
INCLUDE_RODATA("asm/nonmatchings/shop", @2139);
INCLUDE_RODATA("asm/nonmatchings/shop", @2140);
INCLUDE_RODATA("asm/nonmatchings/shop", @2141);
INCLUDE_RODATA("asm/nonmatchings/shop", @2142);
INCLUDE_RODATA("asm/nonmatchings/shop", @2143);
INCLUDE_RODATA("asm/nonmatchings/shop", @2146);
#ifdef NON_MATCHING
static inline void ShopSwapHeldGood(SHOP_ITEMLIST *good) {
    u8 taken[0xF8];
    u8 held[0xF8];

    memset(taken, 0, sizeof(taken));
    int good_kind = WhatIsKindofItem(good->item_no);
    switch (good_kind) {
        case 0:
            *(int *) taken = *(int *) &good->data;
            break;
        case 1:
            memcpy(taken, &good->data, sizeof(WEAPON_HAVE));
            break;
        case 2:
            memcpy(taken, &good->data, sizeof(ATTACH_LIST));
            break;
    }
    int held_kind = WhatIsKindofItem(ShopHaveItemPt->item_no);
    switch (held_kind) {
        case 0:
            *(int *) held = ShopHaveItemPt->volume;
            break;
        case 1:
            memcpy(held, ShopHaveWepPt, sizeof(WEAPON_HAVE));
            break;
        case 2:
            memcpy(held, ShopHaveAttachPt, sizeof(ATTACH_LIST));
            break;
    }
    switch (good_kind) {
        case 0:
            ShopHaveItemPt->volume = *(int *) taken;
            break;
        case 1:
            memcpy(ShopHaveWepPt, taken, sizeof(WEAPON_HAVE));
            break;
        case 2:
            memcpy(ShopHaveAttachPt, taken, sizeof(ATTACH_LIST));
            break;
    }
    switch (held_kind) {
        case 0:
            *(int *) &good->data = *(int *) held;
            break;
        case 1:
            memcpy(&good->data, held, sizeof(WEAPON_HAVE));
            break;
        case 2:
            memcpy(&good->data, held, sizeof(ATTACH_LIST));
            break;
    }
}

int ItemShopKey2() {
    int result = 0;
    u8 record[0xF8];
    s32 *info;
    int page;

    if (ShopMenu.ready == 0) {
        if (ReadBGSync() == 0) {
            ShopTextureLoadFix();
            ShopPersonReadStart(1, ShopMenu.shop_no);
        }
        return result;
    }
    ITEM_PACK *pack = &ShopUserStatusPt->item_pack;
    switch (ShopMenu.talk_mode) {
        case 1:
            ShopMenu.alpha += 8;
            if (ShopMenu.alpha >= 0x80) {
                ShopMenu.alpha = 0x80;
            }
            if (ShopMenu.step_count > 20 && ShopMenu.ready != 0 && ShopMenu.alpha >= 0x80) {
                ShopMenu.talk_mode = 0;
            }
            break;
        case 2:
            ShopMenu.alpha -= 8;
            if (ShopMenu.alpha <= 0) {
                ShopMenu.alpha = 0;
            }
            if (ShopMenu.step_count > 26 && ShopMenu.alpha <= 0) {
                result = 1;
            }
            break;
        case 14:
            if (GamePad.Down(0x50) != 0) {
                s16 cursor = ShopMenu.board.cursor;
                int item_no;
                WEAPON_HAVE *weapon;
                switch (ShopMenu.board.page) {
                    case 0:
                        item_no = pack->item[cursor];
                        pack->item[cursor] = -1;
                        pack->item_vol[cursor] = 0;
                        info = ItemBoardInfo;
                        break;
                    case 2: {
                        ATTACH_LIST *list = (ATTACH_LIST *) &ShopUserStatusPt->consumable_items[cursor];
                        item_no = list->item_no;
                        memset(list, 0, sizeof(ATTACH_LIST));
                        info = AttachBoardInfo;
                        break;
                    }
                    case 1:
                        weapon = &ShopUserStatusPt->chara_weapons[cursor / 10][cursor % 10];
                        item_no = weapon->item_no;
                        info = WeaponBoardInfo[0];
                        break;
                }
                int money = CalItemMoney(item_no, 1);
                if (item_no >= 0x101) {
                    money += WeaponCalMoney(weapon, 1);
                    memset(weapon, 0, sizeof(WEAPON_HAVE));
                }
                int total = ShopUserStatusPt->money + money;
                if (total >= 0xFFFF) {
                    ShopUserStatusPt->money = 0xFFFF;
                } else {
                    ShopUserStatusPt->money = total;
                }
                info[cursor] = 0;
                ShopMenu.talk_mode = 0;
                ComMenuSePlay(0x9A);
            } else if (GamePad.Down(0x20) != 0) {
                ShopMenu.talk_mode = 0;
                ComMenuSePlay(2);
            }
            break;
        case 13:
            if (CommonMenuMes1.mes_made != 0x4B4) {
                CommonMenuMes1.MakeMesWin(0x4B4);
            }
            if (GamePad.Down(0x50) != 0) {
                int item_no = ShopListPt[ShopMenu.board.cursor].item_no;
                ShopDataMoveFinish();
                int price = CalItemMoney(item_no, 0);
                page = WhatIsKindofItem(item_no);
                int space = GetBoardSpace(item_no, &page);
                int icon = space - ShopMenu.board.top_row * 5;
                switch (page) {
                    case 0:
                        *(int *) record = *(int *) &ShopListPt[ShopMenu.board.cursor].data;
                        info = ItemBoardInfo;
                        break;
                    case 1:
                        memcpy(record, &ShopListPt[ShopMenu.board.cursor].data, sizeof(WEAPON_HAVE));
                        info = WeaponBoardInfo[0];
                        break;
                    case 2:
                        memcpy(record, &ShopListPt[ShopMenu.board.cursor].data, sizeof(ATTACH_LIST));
                        info = AttachBoardInfo;
                        break;
                }
                ShopMenu.board.page = page;
                ShopDataMove.IconMoveTarSet(space, icon, item_no, (MENU_ITEMDATA *) record,
                                            ShopMenu.board.cursor % 5 * 0x28 + 0x34,
                                            (ShopMenu.board.cursor / 5 - ShopMenu.stock_top_row) * 0x28 + 0x94, 0);
                if (icon < 0 || icon >= 20) {
                    ShopDataMove.IconAutoMove(ChargeOrShopFlag, 1);
                    ShopDataMoveClear();
                }
                info[space] = 2;
                PersonalBoardLimmitCheck();
                ShopSpecialFunc();
                int money = ShopUserStatusPt->money;
                if (money - price >= 0xFFFF) {
                    ShopUserStatusPt->money = 0xFFFF;
                } else {
                    ShopUserStatusPt->money = money - price;
                }
                SetItemShopTalkMode(0, 0);
                ComMenuSePlay(0x9A);
            } else if (GamePad.Down(0x20) != 0) {
                SetItemShopTalkMode(0, 0);
                ComMenuSePlay(2);
            }
            break;
        case 6:
        case 10:
            CommonMenuMes3.page_arrow = 1;
            if (GamePad.Down(0x40) != 0) {
                SetItemShopTalkMode(0, 0);
                ComMenuSePlay(1);
                CommonMenuMes3.page_arrow = 0;
            } else if (GamePad.Down(0x20) != 0) {
                ComMenuSePlay(2);
                CommonMenuMes3.page_arrow = 0;
                SetItemShopTalkMode(0, 0);
                ShopCancelGoodReturn2();
            }
            break;
        case 4:
        case 5:
            if (GamePad.Down(0x60) != 0) {
                ShopMenu.talk_mode = 0;
                int item_no = ShopHaveItemPt->item_no;
                int space = GetBoardSpace(item_no, &page);
                if (space < 0) {
                    ComMenuSePlay(2);
                } else {
                    switch (page) {
                        case 0:
                            pack->item[space] = item_no;
                            pack->item_vol[space] = ShopHaveItemPt->volume;
                            break;
                        case 1: {
                            int chara = space / 10;
                            int slot = space % 10;
                            WEAPON_HAVE *weapon = &ShopUserStatusPt->chara_weapons[chara][slot];
                            memcpy(weapon, ShopHaveWepPt, sizeof(WEAPON_HAVE));
                            weapon->item_no = item_no;
                            if (ShopMenu.board.unk_15C >= 0) {
                                ShopUserStatusPt->equipped_weapon_slot[chara] = slot;
                                ShopMenu.board.unk_15C = -1;
                            }
                            break;
                        }
                        case 2: {
                            ATTACH_LIST *list = (ATTACH_LIST *) &ShopUserStatusPt->consumable_items[space];
                            memcpy(list, ShopHaveAttachPt, sizeof(ATTACH_LIST));
                            list->item_no = item_no;
                            break;
                        }
                    }
                    InitAllHaveData();
                    ComMenuSePlay(2);
                }
            }
            break;
        case 3:
            if (GamePad.Down(0xF060) != 0) {
                ShopMenu.talk_mode = 0;
                CommonMenuMes3.page_arrow = 0;
            }
            break;
        case 9:
        case 11:
        case 16:
        case 20:
        case 21:
        case 22:
        case 23:
            CommonMenuMes3.page_arrow = 1;
            if (GamePad.Down(0x60) != 0) {
                ComMenuSePlay(2);
                SetItemShopTalkMode(0, 0);
                CommonMenuMes3.page_arrow = 0;
            }
            break;
        case 25:
            CommonMenuMes3.page_arrow = 1;
            if (GamePad.Down(0x60) != 0) {
                ShopMenu.talk_mode = 2;
                ShopMenu.step_count = 0;
                CommonMenuMes3.page_arrow = 0;
                ComMenuSePlay(2);
            }
            break;
        case 24:
            CommonMenuMes3.page_arrow = 1;
            if (GamePad.Down(0x40) != 0) {
                SetItemShopTalkMode(0, 0);
                CommonMenuMes3.page_arrow = 0;
                ComMenuSePlay(1);
            } else if (GamePad.Down(0x20) != 0) {
                SetItemShopTalkMode(25, 1);
                CommonMenuMes3.page_arrow = 0;
                ComMenuSePlay(2);
            }
            break;
        case 12:
            if (GamePad.Down(0x40) != 0) {
                SetItemShopTalkMode(20, 1);
                IncludeBuyItem2();
                ComMenuSePlay(0x9A);
            } else if (GamePad.Down(0x20) != 0) {
                SetItemShopTalkMode(0, 0);
                ComMenuSePlay(2);
            }
            break;
        case 0: {
            if (ShopMenu.person_state == 0) {
                ShopMenu.person_state = ShopPersonBuild(1, ShopMenu.shop_no);
            }
            int cursor = ShopMenu.board.cursor;
            int old_page = ShopMenu.board.page;
            switch (ShopMenu.side) {
                case 2:
                    CheckSideKey2();
                    break;
                case 0:
                    ItemShopSelectKey2();
                    break;
                case 1: {
                    int left = PersonalBoardKey();
                    if (left == 0 && GamePad.Down(0x40) != 0) {
                        PERSONAL_BOARD *board = &ShopMenu.board;
                        int held_info = ShopHaveItemPt->unk_00;
                        switch (board->cursor_area) {
                            case 2: {
                                ComMenuSePlay(2);
                                s16 held = ShopHaveItemPt->item_no;
                                if (held >= 0x51 && held_info != 1 && IsEnableTrushThrow(held) != 0) {
                                    board->trash_anim = 1;
                                    board->trash_frame = 0;
                                    ShopHaveItemPt->item_no = 0;
                                }
                                break;
                            }
                            case 1: {
                                int pos = ShopMenu.board.cursor;
                                switch (ShopMenu.board.page) {
                                    case 0:
                                        info = ItemBoardInfo;
                                        break;
                                    case 1:
                                        info = WeaponBoardInfo[0];
                                        break;
                                    case 2:
                                        info = AttachBoardInfo;
                                        break;
                                }
                                s32 *slot = &info[pos];
                                int slot_info = *slot;
                                if (ShopMenu.board.page == 1 && held_info == 1 &&
                                    (ShopHaveItemPt->item_no == 0xB1 || ShopHaveItemPt->item_no == 0xB2)) {
                                    ComMenuSePlay(2);
                                } else if (PersonalBoardItemGetorSwap(pos) != 1) {
                                    ComMenuSePlay(2);
                                } else {
                                    ShopHaveItemPt->unk_00 = slot_info;
                                    *slot = held_info;
                                    if (ShopHaveItemPt->item_no < 0x51) {
                                        InitAllHaveData();
                                        ShopMenu.board.unk_15C = -1;
                                    } else {
                                        ShopHaveItemPt->unk_08 = pos;
                                    }
                                    ComMenuSePlay(1);
                                }
                                break;
                            }
                        }
                    } else if (left == 0 && GamePad.Down(0x10) != 0) {
                        ShopMenu.unk_06 = 1;
                        if (ShopHaveItemPt->item_no >= 0x51) {
                            ComMenuSePlay(2);
                            return 0;
                        }
                        s16 target = SearchBoardNowPosItemExist(ShopMenu.board.page, ShopMenu.board.cursor);
                        s32 *slot;
                        switch (ShopMenu.board.page) {
                            case 0:
                                slot = &ItemBoardInfo[ShopMenu.board.cursor];
                                break;
                            case 2:
                                slot = &AttachBoardInfo[ShopMenu.board.cursor];
                                break;
                            case 1:
                                slot = &WeaponBoardInfo[0][ShopMenu.board.cursor];
                                break;
                        }
                        if (*slot == 1) {
                            ComMenuSePlay(2);
                        } else {
                            int enable = IsEnableCharge(target);
                            if (enable != 0) {
                                if (target < 0x102 && target >= 0x84) {
                                    ITEM_DATA *data = GetItemData(target);
                                    if (data != NULL && ((data->kind_flags & 0x10) || ShopHaveItemPt->item_no == 0xB9)) {
                                        enable = 0;
                                        SetItemShopTalkMode(4, 1);
                                    }
                                }
                                if (target >= 0x101) {
                                    int chara = ShopMenu.board.cursor / 10;
                                    if (chara == IsDefaultWeapon(target)) {
                                        SetItemShopTalkMode(4, 1);
                                        enable = 0;
                                    }
                                    if (target == 0x10C && GetMenuHebikiriFlag() == 0) {
                                        SetItemShopTalkMode(4, 1);
                                        enable = 0;
                                    }
                                    if (ShopMenu.board.cursor % 10 ==
                                        ShopUserStatusPt->equipped_weapon_slot[ShopMenu.board.cursor / 10]) {
                                        enable = 0;
                                        SetItemShopTalkMode(5, 1);
                                    }
                                }
                            } else {
                                SetItemShopTalkMode(4, 1);
                            }
                            int money = CalItemMoney(target, 1);
                            if (target >= 0x101) {
                                money += WeaponCalMoney(
                                    &ShopUserStatusPt->chara_weapons[ShopMenu.board.cursor / 10][ShopMenu.board.cursor % 10],
                                    1);
                            }
                            if (money <= 0) {
                                money = 1;
                            }
                            if (ShopUserStatusPt->money + money >= 0x10000) {
                                SetItemShopTalkMode(22, 1);
                                enable = 0;
                            }
                            if (target < 0x51) {
                                ComMenuSePlay(2);
                            } else if (enable != 0) {
                                ShopMenu.talk_mode = 14;
                                ComMenuSePlay(1);
                            } else {
                                ComMenuSePlay(2);
                            }
                        }
                    }
                    if (left != 0) {
                        ShopMenu.side = 0;
                        ShopMenu.board.cursor =
                            (ShopMenu.stock_top_row + (ShopMenu.board.cursor / 5 - ShopMenu.board.top_row)) * 5 + 4;
                    }
                    break;
                }
            }
            if (ShopMenu.unk_06 == 0 && GamePad.Down(0x20) != 0) {
                ComMenuSePlay(2);
                s16 held = ShopHaveItemPt->item_no;
                if (held < 0x51) {
                    if (ShopMenu.side == 2) {
                        CommonMenuMes3.mes_made = -1;
                        ShopMenu.msg_mode = 1;
                        int flags = CheckBuyItemFunc2();
                        if (flags & 1) {
                            ShopMenu.talk_mode = 24;
                        }
                        if (flags & 6) {
                            ShopMenu.talk_mode = 6;
                            ShopMenu.side = 2;
                        }
                        if (flags & 8) {
                            ShopMenu.talk_mode = 10;
                        }
                    } else {
                        ShopMenu.side = 2;
                    }
                } else {
                    int held_info = ShopHaveItemPt->unk_00;
                    switch (held_info) {
                        case 1: {
                            int free = -1;
                            for (int i = 0; i < 30; i++) {
                                if (ShopBoardInfo[i] == 0) {
                                    free = i;
                                    break;
                                }
                            }
                            if (free < 0) {
                                ComMenuSePlay(2);
                            } else {
                                SHOP_ITEMLIST *good = &ShopListPt[free];
                                ShopSwapHeldGood(good);
                                MenuDataSwap(&ShopHaveItemPt->unk_00, &ShopBoardInfo[free]);
                                MenuDataSwap(&ShopHaveItemPt->item_no, &good->item_no);
                            }
                            break;
                        }
                        case 2: {
                            page = WhatIsKindofItem(held);
                            switch (page) {
                                case 0:
                                    info = ItemBoardInfo;
                                    break;
                                case 1:
                                    info = WeaponBoardInfo[0];
                                    break;
                                case 2:
                                    info = AttachBoardInfo;
                                    break;
                            }
                            int space = GetBoardSpace(held, &page);
                            int max = PersonalRetMax(page);
                            if (space < 0 || space >= max) {
                                ComMenuSePlay(2);
                            } else {
                                s32 *slot = &info[space];
                                int slot_info = *slot;
                                ShopHaveItemPt->unk_04 = page;
                                ShopHaveItemPt->unk_0C = space;
                                int equipped = ShopMenu.board.unk_15C;
                                int item_no = ShopHaveItemPt->item_no;
                                PersonalBoardItemCancel();
                                if (equipped >= 0) {
                                    ShopUserStatusPt->equipped_weapon_slot[WhoIsWeaponEquip(item_no)] = space % 10;
                                }
                                ShopHaveItemPt->unk_00 = slot_info;
                                *slot = held_info;
                            }
                            break;
                        }
                    }
                }
            } else if (GamePad.Down(0x80) != 0) {
                switch (ShopMenu.board.page) {
                    case 0:
                        SeitonShopItemBoard(pack);
                        SetMenuTrushMark(pack);
                        break;
                    case 2:
                        SeitonShopAttachBoard((ATTACH_LIST *) ShopUserStatusPt->consumable_items);
                        break;
                }
                ComMenuSePlay(1);
            }
            if (cursor != ShopMenu.board.cursor || old_page != ShopMenu.board.page) {
                ComMenuSePlay(0);
            }
            int mes_no = 0;
            int value = 0;
            int name_mes = -1;
            if (ShopHaveItemPt->item_no >= 0x51) {
                COM_ITEM_INFO *item_info = GetCommonItemInfo(ShopHaveItemPt->item_no);
                if (item_info != NULL) {
                    mes_no = item_info->msg + 500;
                }
                value = GetAttachVolumeForMsg(ShopHaveAttachPt);
                if (ShopHaveItemPt->item_no == 0x5A) {
                    name_mes = GetWeaponMsgNo2(ShopHaveAttachPt->unk_02);
                }
            }
            int item_no = -1;
            switch (ShopMenu.side) {
                case 2:
                    mes_no = 0x4B3;
                    break;
                case 0: {
                    SHOP_ITEMLIST *good = &ShopListPt[ShopMenu.board.cursor];
                    item_no = good->item_no;
                    if (item_no >= 0x101) {
                        value = ((WEAPON_HAVE *) &good->data)->unk_02;
                    }
                    if (item_no >= 0x5B && item_no < 0x5F) {
                        value = GetAttachVolumeForMsg((ATTACH_LIST *) &good->data);
                    }
                    if (item_no == 0x5A) {
                        name_mes = GetWeaponMsgNo2(((ATTACH_LIST *) &good->data)->unk_02);
                        value = ((s16 *) &good->data)[3];
                    }
                    break;
                }
                case 1:
                    switch (ShopMenu.board.page) {
                        case 0:
                            item_no = pack->item[ShopMenu.board.cursor];
                            break;
                        case 1: {
                            WEAPON_HAVE *weapon =
                                &ShopUserStatusPt->chara_weapons[ShopMenu.board.cursor / 10][ShopMenu.board.cursor % 10];
                            item_no = weapon->item_no;
                            value = weapon->unk_02;
                            break;
                        }
                        case 2: {
                            ATTACH_LIST *list = (ATTACH_LIST *) &ShopUserStatusPt->consumable_items[ShopMenu.board.cursor];
                            if (list != NULL) {
                                item_no = list->item_no;
                                if (item_no > 0) {
                                    value = GetAttachVolumeForMsg(list);
                                    if (list->item_no == 0x5A) {
                                        name_mes = GetWeaponMsgNo2(list->unk_02);
                                    }
                                }
                            }
                            break;
                        }
                    }
                    break;
            }
            if (item_no >= 0x51) {
                COM_ITEM_INFO *item_info = GetCommonItemInfo(item_no);
                if (item_info != NULL) {
                    mes_no = item_info->msg + 500;
                }
            }
            if (CommonMenuMes2.mes_made != mes_no || (name_mes > 0 && CommonMenuMes2.mes_no[0] != name_mes + 100) ||
                CommonMenuMes2.value != value) {
                CommonMenuMes2.value_signed = 1;
                CommonMenuMes2.value_show = 0;
                CommonMenuMes2.value = value;
                if (name_mes > 0) {
                    CommonMenuMes2.mes_no[0] = name_mes + 100;
                }
                if (mes_no <= 500) {
                    mes_no = 0;
                }
                CommonMenuMes2.mes_made = -1;
                CommonMenuMes2.MakeMesWin(mes_no);
            }
            break;
        }
    }
    return result;
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopKey2__Fv);
#endif
#ifdef NON_MATCHING
void ItemShopDraw2() {
    int text_x;
    int text_y;

    setbilinear(0);
    MenuWorldTrans(&MenuCamera);
    int bright = 0x40;
    switch (ShopMenu.talk_mode) {
        case 1:
            bright = 0x80 - ShopMenu.step_count * 3;
            break;
        case 2:
            bright = ShopMenu.step_count * 4 + 0x40;
            break;
    }
    if (bright < 0x40) {
        bright = 0x40;
    }
    if (bright > 0x80) {
        bright = 0x80;
    }
    FrameImageDraw(bright, 0x80);
    if (ShopMenu.ready != 0) {
        MenuTextureReload(ShopMenu.tex_block);
        int count = PersonalRetMax(ShopMenu.board.page);
        ShopMenu.board.y += ((float) (0x7F - ShopMenu.board.top_row * 0x28) - ShopMenu.board.y) / 4.0f;
        int cur_x = 0x168;
        int board_y = (int) ShopMenu.board.y;
        int mark = 0;
        if (ShopMenu.board.page == 1) {
            mark = 2;
        }
        DrawPerBoardDraw(mark, count, 0x168, board_y, 0x81, 0x121, PerBoardTex, 0x80);
        CommonIconDraw(ShopMenu.board.page, count, 0x16A, board_y + 6, 0x81, 0x121, 0x80);
        PersonalBoardOptionDraw(ShopMenu.board.page, count, 0x154, 0x78, PerBoardTex, 0x80);
        CommonTrushDraw(0x232, 0x10C, 0x80);
        CommonMoneyBoardDraw(0x163, 0x120, ShopUserStatusPt->money, 0x80);
        DrawMoneyCheckBoard2(0x1C8, 0x120, 0x80);
        DrawItemShopBoard2(0x32, 0x78, 0x80);
        ChargeShopLRDraw(0x80);
        ShopDataMove.IconAutoMoveDraw();
        ShopDataMove.IconAutoMove(ChargeOrShopFlag, 0);
        int top_row;
        switch (ShopMenu.side) {
            case 0:
            case 2:
                cur_x = 0x22;
                top_row = ShopMenu.stock_top_row;
                break;
            case 1:
                cur_x = 0x144;
                top_row = (u8) ShopMenu.board.top_row;
                break;
        }
        int state = 0;
        if (ShopHaveItemPt->item_no >= 0x51) {
            state = 2;
        } else {
            switch (ShopMenu.side) {
                case 2:
                    break;
                case 1:
                    state = SearchBoardNowPosItemExist(ShopMenu.board.page, ShopMenu.board.cursor) < 0x51 ? 0 : 1;
                    break;
                case 0:
                    if (ShopListPt[ShopMenu.board.cursor].item_no > 0x51) {
                        state = 1;
                    }
                    break;
            }
        }
        int on_button = 0;
        if (ShopMenu.side == 2) {
            on_button = 1;
        }
        ShopCurDraw(cur_x, 0x84, ShopMenu.board.cursor, top_row, on_button, state, 0x80);
        DrawShopIcon(0x4C, 0x2A, 0, 0x80);
        switch (ShopMenu.side) {
            case 0: {
                int cursor = ShopMenu.board.cursor;
                int item_no = ShopListPt[cursor].item_no;
                if (item_no >= 0x51) {
                    int selling = 0;
                    if (ShopBoardInfo[cursor] == 2) {
                        selling = 1;
                    }
                    int money = CalItemMoney(item_no, selling);
                    if (item_no >= 0x101) {
                        money += WeaponCalMoney((WEAPON_HAVE *) &ShopListPt[cursor].data, selling);
                    }
                    if (money < 0) {
                        money = 1;
                    }
                    DrawBigSellTicket(selling, money, cursor % 5 * 0x28 + 0x4A,
                                      (int) (6.0f + ShopMenu.stock_y + (float) (cursor / 5 * 0x28)), 0x80);
                }
                break;
            }
            case 1:
                if (ShopMenu.talk_mode == 14) {
                    int cursor = ShopMenu.board.cursor;
                    int item_no;
                    switch (ShopMenu.board.page) {
                        case 0:
                            item_no = ShopUserStatusPt->item_pack.item[cursor];
                            break;
                        case 2:
                            item_no = ShopUserStatusPt->consumable_items[cursor].id;
                            break;
                        case 1:
                            item_no = ShopUserStatusPt->chara_weapons[cursor / 10][cursor % 10].item_no;
                            break;
                    }
                    int ticket_y = (int) (6.0f + ShopMenu.board.y);
                    int money = CalItemMoney(item_no, 1);
                    if (item_no >= 0x101) {
                        money += WeaponCalMoney(&ShopUserStatusPt->chara_weapons[cursor / 10][cursor % 10], 1);
                    }
                    if (money <= 0) {
                        money = 1;
                    }
                    DrawBigSellTicket(1, money, cursor % 5 * 0x28 + 0x16A, ticket_y + cursor / 5 * 0x28, 0x80);
                }
                break;
        }
        DrawSellTicket22(0x16A, (int) (6.0f + ShopMenu.board.y), 0x81, 0x121, 0x80);
        int help_x = (int) ShopHelpWinPos[0];
        MenuHelpWinDraw(help_x, (int) ShopHelpWinPos[1], ShopHelpWinW, ShopHelpWinH, 0x80);
        GetMainMenuRightHelpMsgLangOffset(text_x, text_y);
        CommonMenuMes2.text_x = (int) (ShopHelpWinPos[0] + text_x);
        CommonMenuMes2.text_y = (int) (ShopHelpWinPos[1] + text_y);
    }
    if (ShopMenu.person_state == 2) {
        ShopPersonDraw(ShopMenu.shop_no);
    }
    if (ShopMenu.ready != 0) {
        MenuTextureReload(CommonMenuMes2.tex_block);
        CommonMenuMes2.Step();
        CommonMenuMes2.DrawMesWin();
        if (ShopHaveItemPt->item_no < 0x51) {
            int plate[3] = {0x4B6, 0x4B7, 0x4B8};
            int mes_no = plate[ShopMenu.side];
            if (AtoraNameMes.mes_made != mes_no) {
                AtoraNameMes.MakeMesWin(mes_no);
            }
            AtoraNameMes.stay_frame = 1;
            AtoraNameMes.text_x = 0xB4;
            AtoraNameMes.text_y = 0x168;
            AtoraNameMes.Step();
            AtoraNameMes.DrawMesWin();
        }
        if (ShopMenu.talk_mode != 14 && ShopMenu.talk_mode != 13) {
            CommonMenuMes1.stay_frame = 0;
        } else {
            s16 prompt[2] = {0x4B4, 0x4B5};
            int mes_no = prompt[ShopMenu.talk_mode - 13];
            if (CommonMenuMes1.mes_made != mes_no) {
                CommonMenuMes1.MakeMesWin(mes_no);
            }
            u8 offset[7][2] = {{0x1E, 0x32}, {0x18, 0x32}, {0x18, 0x32}, {0x18, 0x32},
                               {0x18, 0x32}, {0x18, 0x32}, {0x18, 0x32}};
            CommonMenuMes1.text_x = offset[ShopMenu.lang][0] + 0x12C;
            CommonMenuMes1.text_y = 0xBE;
            if (ShopMenu.talk_mode == 14) {
                CommonMenuMes1.text_x = offset[ShopMenu.lang][1] + 0x64;
            }
            CommonMenuMes1.stay_frame = 1;
            CommonMenuMes1.Step();
            CommonMenuMes1.DrawMesWin();
        }
    }
    ShopModelMsgFunc(1);
    ShopFadeoutDraw();
    setbilinear(1);
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopDraw2__Fv);
#endif

/**
 * Returns one prize the fishing exchange offers.
 *
 * @mangled GetExchangeItemList__Fi
 * @address 0x1F1250
 * @size 0x18
 */
static FISH_EXCHANGE_ITEM *GetExchangeItemList(int index) {
    return &exitemlst[index];
}

int GetMardanGareyanFlag() {
    return SaveData->GetMardanGareyanFlag();
}

void SetAlreadyGetMardanWeapon(int value) {
    SaveData->SetGameFlag(0xCA, value);
}

void SetFishMardanGarayanNum(int count) {
    int total = count + GetFishMardanGarayanNum();

    if (total < 0) {
        total = 0;
    }
    if (total > 10000) {
        total = 10000;
    }
    SaveData->SetGameIntFlag(0x14, total);
    printf("now mardan num(IntFlag):\t%d\n", GetFishMardanGarayanNum());
}

int GetFishMardanGarayanNum() {
    return SaveData->GetGameIntFlag(0x14);
}

void ClearFishMardanGarayanNum() {
    SaveData->SetGameIntFlag(0x14, 0);
}

/**
 * Reports whether the Mardan Garayan weapon has been handed over: zero once game flag 0xCA
 * marks it taken, one or two otherwise according to the Mardan Garayan flag.
 *
 * @mangled AlreadyGetMardanWeapon__Fv
 * @address 0x1F13A0
 * @size 0x70
 */
static int AlreadyGetMardanWeapon() {
    int flag = SaveData->GetGameFlag(0xCA);

    if (flag == 0) {
        if (GetMardanGareyanFlag() > 0) {
            return 1;
        }
        return 2;
    }
    if (flag == 1) {
        return 0;
    }
    return flag;
}

#ifdef NON_MATCHING
void InitFishingExchange(u_long128 *buffer, int *texture_blocks, int mode) {
    FishMenu.buffer = (u_long128 *) (EdMenuBuffer.base + EdMenuBuffer.used * 16);
    FishMenu.buffer = MenuCalcBufAlignment(FishMenu.buffer);
    FishMenu.tex_block = texture_blocks[0];
    FishMenu.tex_block2 = texture_blocks[1];
    FishMenu.mode = mode;
    StartReadBG();
    FishMenu.buffer = FishMenu.buffer + (LoadFileBGMenuData("fishmenu.pac", FishMenu.buffer) >> 4) + 1;
    FishMenu.buffer = MenuCalcBufAlignment(FishMenu.buffer);
    FishMenu.ready = 0;
    FishMenu.confirm = 1;
    FishMenu.cursor = 0;
    FishMenu.top = 0;
    FishMenu.fade_mode = 0;
    FishMenu.fade_count = 0;
    FishMenu.point = SaveData->GetFishingPoint();
    if (FishMenu.point < 0) {
        SaveData->SetFishingPoint(0);
        FishMenu.point = SaveData->GetFishingPoint();
    }
    if (FishMenu.point >= 10000) {
        FishMenu.point = 9999;
    }
    StayTex = TexManager.GetTexture("stayframe", -1);
    GamePad.SetAutoRepeat(0xF000, 0x1E, 5);
    GamePad.MenuModeOn(0x78);
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", InitFishingExchange__FP1Pii);
#endif
INCLUDE_RODATA("asm/nonmatchings/shop", @2943);
INCLUDE_RODATA("asm/nonmatchings/shop", @2948);
#ifdef NON_MATCHING
int FishMenuTextureLoad() {
    int done = 0;

    if (FishMenu.ready != 0) {
        return 1;
    }
    if (ReadBGSync() == 0) {
        BG_READ_INFO *file = GetReadBGFile(0);
        LOADTEXTURE_INFO2 texture = {0};
        texture.block_no = FishMenu.tex_block;
        texture.name = (char *) GetPackFile((u_int *) file->buffer, "fishing.img", NULL);
        TexManager.DeleteTextureBlock(FishMenu.tex_block);
        TexManager.CleanUpTextureList();
        TexManager.LoadTextureBlockEX(-1, &texture);
        FishMenuTex = TexManager.GetTexture("fishbrd", -1);
        WepIcon = TexManager.GetTexture("wepicon", -1);
        ItemIcon = TexManager.GetTexture("itemicon", -1);
        InitMenuMesSet(0, (short *) GetPackFile((u_int *) file->buffer, "fishmes.bin", NULL));
        CommonMenuMes2.mes_made = -1;
        AtoraNameMes.Preset(1);
        for (int i = 0; i < 5; i++) {
            AtoraNameMes.mes_no[i] = GetExchangeItemList(i)->item_no + 100;
        }
        AtoraNameMes.narrow_gaiji = 1;
        AtoraNameMes.style = 4;
        AtoraNameMes.value_signed = 0;
        AtoraNameMes.value_show = 1;
        AtoraNameMes.mes_made = -1;
        AtoraNameMes.MakeMesWin(0xC8);
        AtoraNameMes.Step();
        FishMenu.ready = 1;
        CommonMenuMes3.value_signed = 0;
        CommonMenuMes3.value_show = 1;
        CommonMenuMes3.stay_frame = 1;
        CommonMenuMes3.value = 0;
        int digits = GetNumberKeta(0);
        CommonMenuMes3.mes_made = -1;
        CommonMenuMes3.MakeMesWin(digits + 0xCD);
        FishMenu.cursor_y = 0x7E;
        done = 1;
    }
    return done;
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", FishMenuTextureLoad__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/shop", @2962);
INCLUDE_RODATA("asm/nonmatchings/shop", @2963);
INCLUDE_RODATA("asm/nonmatchings/shop", @2964);
#ifdef NON_MATCHING
int FishingExchangeKey() {
    int result = 0;

    ReadBG();
    int mardan = AlreadyGetMardanWeapon();
    int party = SaveData->GetDngStatus()->party_size;
    if (party <= 0) {
        party = 1;
    }
    int last = party + 0x19;
    int last_top = party + 0x16;
    if (mardan == 1) {
        last++;
        last_top++;
    }
    switch (FishMenu.fade_mode) {
        case 0:
            FishMenuTextureLoad();
            FishMenu.fade_count++;
            if (FishMenu.ready != 0 && FishMenu.fade_count > 32) {
                FishMenu.fade_mode = 3;
            }
            break;
        case 1:
            FishMenu.fade_count++;
            if (FishMenu.fade_count > 32) {
                result = 1;
            }
            break;
        case 3: {
            int cursor = FishMenu.cursor;
            int top = FishMenu.top;
            if (GamePad.Down(0x200A) != 0) {
                FishMenu.top += 5;
                FishMenu.cursor += 5;
            }
            if (GamePad.Down(0x8005) != 0) {
                FishMenu.top -= 5;
                FishMenu.cursor -= 5;
                if (FishMenu.cursor < 0 || FishMenu.top < 0) {
                    FishMenu.cursor = 0;
                    FishMenu.top = 0;
                }
            }
            if (GamePad.Down(0x1000) != 0) {
                FishMenu.cursor--;
                if (FishMenu.cursor < 0) {
                    FishMenu.cursor = 0;
                }
                if (FishMenu.cursor < FishMenu.top) {
                    FishMenu.top--;
                }
                if (FishMenu.top < 0) {
                    FishMenu.top = 0;
                    FishMenu.cursor = 0;
                }
            }
            if (GamePad.Down(0x4000) != 0) {
                FishMenu.cursor++;
                if (last < FishMenu.cursor) {
                    FishMenu.cursor = last;
                }
                if (FishMenu.top < FishMenu.cursor - 4) {
                    FishMenu.top++;
                    if (last_top < FishMenu.top) {
                        FishMenu.top = last_top - 1;
                    }
                }
            }
            if (last < FishMenu.cursor) {
                FishMenu.cursor = last;
            }
            if (last_top < FishMenu.top) {
                FishMenu.top = last_top - 1;
            }
            if (cursor != FishMenu.cursor) {
                ComMenuSePlay(0);
            }
            FISH_EXCHANGE_ITEM *prize = GetExchangeItemList(FishMenu.cursor);
            if (mardan == 1 && FishMenu.cursor == last) {
                prize = GetExchangeItemList(0x20);
            }
            if (prize != NULL) {
                COM_ITEM_INFO *info = GetCommonItemInfo(prize->item_no);
                if (info != NULL) {
                    int mes_no = info->msg + 500;
                    if (CommonMenuMes2.mes_made != mes_no) {
                        CommonMenuMes2.MakeMesWin(mes_no);
                    }
                }
            }
            if (GamePad.Down(0x40) != 0) {
                CUserStatus *status = (CUserStatus *) SaveData->GetDngStatus();
                int full = 0;
                int kind = WhatIsKindofItem(prize->item_no);
                int count = 0;
                switch (kind) {
                    case 0: {
                        ITEM_PACK *pack = &status->item_pack;
                        for (int i = 0; i < 3; i++) {
                            count += pack->quick_item_qty[i];
                        }
                        for (int i = 0; i < pack->num; i++) {
                            if (pack->item[i] >= 0x84) {
                                count++;
                            }
                        }
                        if (count >= pack->num) {
                            full = 1;
                        }
                        break;
                    }
                    case 1: {
                        int held = 0;
                        WEAPON_HAVE *weapons = status->chara_weapons[WhoIsWeaponEquip(prize->item_no)];
                        for (int i = 0; i < 10; i++) {
                            if (weapons[i].item_no >= 0x101) {
                                held++;
                            }
                        }
                        if (held >= 10) {
                            full = 1;
                        }
                        break;
                    }
                    case 2: {
                        int held = 0;
                        for (; count < 40; count++) {
                            if (status->consumable_items[count].id >= 0x51) {
                                held++;
                            }
                        }
                        if (held >= 40) {
                            full = 1;
                        }
                        break;
                    }
                }
                if (FishMenu.point < prize->price) {
                    FishMenu.fade_mode = 5;
                    FishMenu.warning = 14;
                    ComMenuSePlay(2);
                } else if (full != 0) {
                    FishMenu.warning = kind;
                    FishMenu.fade_mode = 5;
                    ComMenuSePlay(2);
                } else {
                    FishMenu.confirm = 1;
                    FishMenu.cursor_y = FishMenu.confirm * 0x24 + 0x102;
                    FishMenu.fade_mode = 4;
                    ComMenuSePlay(1);
                }
            } else if (GamePad.Down(0x20) != 0) {
                FishMenu.fade_mode = 1;
                FishMenu.fade_count = 0;
                ComMenuSePlay(2);
            }
            if (top != FishMenu.top) {
                FISH_EXCHANGE_ITEM *entry = GetExchangeItemList(FishMenu.top);
                for (int i = 0; i < 5; i++) {
                    if (mardan == 1 && FishMenu.cursor == FishMenu.top + i && FishMenu.cursor == last) {
                        entry = GetExchangeItemList(0x20);
                    }
                    if (entry == NULL) {
                        printf("getinfo is NULL\n");
                    } else {
                        COM_ITEM_INFO *info = GetCommonItemInfo(entry->item_no);
                        if (info != NULL) {
                            AtoraNameMes.mes_no[i] = info->msg + 100;
                            entry++;
                        }
                    }
                }
                AtoraNameMes.mes_made = -1;
                AtoraNameMes.MakeMesWin(0xC8);
            }
            break;
        }
        case 4: {
            if (GamePad.Down(0x5000) != 0) {
                if (FishMenu.confirm != 0) {
                    FishMenu.confirm = 0;
                } else {
                    FishMenu.confirm = 1;
                }
                ComMenuSePlay(0);
            }
            FISH_EXCHANGE_ITEM *prize;
            if (GamePad.Down(0x40) != 0) {
                prize = GetExchangeItemList(FishMenu.cursor);
                if (mardan == 1 && FishMenu.cursor == last) {
                    prize = GetExchangeItemList(0x20);
                }
                if (prize == NULL) {
                    ComMenuSePlay(2);
                    break;
                }
                int price = prize->price;
                int enough = 1;
                if (FishMenu.point < price) {
                    enough = 0;
                }
                if (FishMenu.confirm == 0) {
                    if (enough != 0) {
                        ComMenuSePlay(0x9A);
                        ((CDngStatusData *) SaveData->GetDngStatus())->GetItem(prize->item_no, 0);
                        FishMenu.point -= price;
                        if (prize->item_no == 0x116) {
                            SetAlreadyGetMardanWeapon(1);
                            ClearFishMardanGarayanNum();
                            FishMenu.top--;
                            FishMenu.cursor--;
                        }
                        if (FishMenu.point < 0) {
                            FishMenu.point = 0;
                        }
                    } else {
                        ComMenuSePlay(2);
                    }
                } else {
                    ComMenuSePlay(2);
                }
                FishMenu.cursor_y = (FishMenu.cursor - FishMenu.top) * 0x22 + 0x7E;
                FishMenu.fade_mode = 3;
            } else if (GamePad.Down(0x20) != 0) {
                ComMenuSePlay(2);
                FishMenu.fade_mode = 3;
            }
            prize = GetExchangeItemList(FishMenu.cursor);
            if (mardan == 1 && FishMenu.cursor == last) {
                prize = GetExchangeItemList(0x20);
            }
            if (prize != NULL) {
                COM_ITEM_INFO *info = GetCommonItemInfo(prize->item_no);
                if (info != NULL) {
                    int name = info->msg + 100;
                    if (CommonMenuMes1.mes_made != 0xCA || CommonMenuMes1.mes_no[0] != name ||
                        CommonMenuMes1.values[0] != prize->price) {
                        CommonMenuMes1.mes_made = -1;
                        CommonMenuMes1.mes_no[0] = name;
                        CommonMenuMes1.values[0] = prize->price;
                        CommonMenuMes1.MakeMesWin(0xCA);
                    }
                }
            }
            break;
        }
        case 5: {
            if (GamePad.Down(0x60) != 0) {
                FishMenu.fade_mode = 3;
                ComMenuSePlay(2);
            }
            int mes_no = FishMenu.warning + 0xCB;
            if (CommonMenuMes1.mes_made != mes_no) {
                CommonMenuMes1.MakeMesWin(mes_no);
            }
            break;
        }
    }
    CursorVibeCnt++;
    if (CursorVibeCnt >= 0x066FF300) {
        CursorVibeCnt = 0;
    }
    return result;
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", FishingExchangeKey__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/shop", @3159);

/**
 * Draws one fish icon.
 *
 * @mangled FishImageIconDraw__Fiiii
 * @address 0x1F2420
 * @size 0x54
 */
static void FishImageIconDraw(int x, int y, int width, int mode) {
    DrawMenu2DSprite(FishMenuTex, CRect_i_(x, y, width, 0x28), CRect_i_(0, 0xD0, width, 0x28), mode);
}

#ifdef NON_MATCHING
void FishExchangeItemDraw(int x, int y, int alpha) {
    float win_x;
    float win_y;
    float win_w;
    float win_h;
    int text_x;
    int text_y;

    MenuTextureReload(FishMenu.tex_block);
    int mardan = AlreadyGetMardanWeapon();
    int party = SaveData->GetDngStatus()->party_size;
    if (party <= 0) {
        party = 1;
    }
    int last = party + 0x19;
    if (mardan == 1) {
        last++;
    }
    DrawMenu2DSprite(FishMenuTex, CRect_i_(x, y, 0x160, 0xD0), CRect_i_(0, 0, 0x160, 0xD0), alpha);
    float rows = last;
    int bar_x = x + 0x144;
    int bar_y = (int) ((float) (y + 0x28) + FishMenu.top * (126.0f / rows));
    float length = 630.0f / rows - 8.0f;
    CRect_i_ source(0xF0, 0xD0, 8, 4);
    DrawMenu2DSprite(FishMenuTex, CRect_i_(bar_x, bar_y, 8, 4), source, alpha);
    source.y += 4;
    DrawMenu2DSprite(FishMenuTex, CRect_i_(bar_x, bar_y + 4, 8, (int) length), source, alpha);
    source.y += 4;
    DrawMenu2DSprite(FishMenuTex, CRect_i_(bar_x, (int) ((float) (bar_y + 4) + length), 8, 4), source, alpha);
    int item_x = x + 0x16;
    int item_y = y + 0x14;
    for (int i = 0; i < 5; i++) {
        FISH_EXCHANGE_ITEM *prize = GetExchangeItemList(FishMenu.top + i);
        if (mardan == 1 && i == 4 && FishMenu.top + 4 == last) {
            prize = GetExchangeItemList(0x20);
        }
        DrawIconParts(prize->item_no, item_x, item_y, y, y + 0xCE, alpha, 0);
        DrawMenu2DSprite(FishMenuTex, CRect_i_(item_x + 0x104, item_y + 8, 0x20, 0x14), CRect_i_(0x1E0, 0xEC, 0x20, 0x14),
                         alpha);
        RECT digits = {0x140, 0xEA, 0x10, 0x16};
        DrawMenuNumber(prize->price, item_x + 0x106, item_y + 6, FishMenuTex, digits, 1, alpha);
        if (i >= 0 && i < 10) {
            AtoraNameMes.line_pos[i].x = item_x + 0x24;
            AtoraNameMes.line_pos[i].y = item_y + 4;
        }
        item_y += 0x22;
    }
    int target_y = y + 0x14 + (FishMenu.cursor - FishMenu.top) * 0x22;
    int cursor_x = item_x - 0x1C;
    if (FishMenu.fade_mode == 4) {
        cursor_x = 0xF2;
        target_y = (FishMenu.confirm << 5) + 0x102;
    }
    FishMenu.cursor_y += (int) ((float) (target_y - FishMenu.cursor_y) / 4.0f);
    if (abs(FishMenu.cursor_y - target_y) < 2) {
        FishMenu.cursor_y = target_y;
    }
    int cursor_y = FishMenu.cursor_y;
    MenuTextureReload(CommonMenuMes2.tex_block);
    GetMainMenuRightHelpWinLangOffset(win_x, win_y, win_w, win_h);
    int help_x = (int) win_x;
    MenuHelpWinDraw(help_x, (int) win_y, win_w, win_h, 0x80);
    GetMainMenuRightHelpMsgLangOffset(text_x, text_y);
    CommonMenuMes2.edge_alpha = alpha;
    CommonMenuMes2.text_x = (int) (win_x + text_x);
    CommonMenuMes2.text_y = (int) (win_y + text_y);
    CommonMenuMes2.Step();
    CommonMenuMes2.DrawMesWin();
    AtoraNameMes.edge_alpha = alpha;
    AtoraNameMes.Step();
    AtoraNameMes.DrawMesWin();
    if (CommonMenuMes3.value != FishMenu.point) {
        CommonMenuMes3.value = FishMenu.point;
        int digits = GetNumberKeta(FishMenu.point);
        CommonMenuMes3.mes_made = -1;
        CommonMenuMes3.MakeMesWin(digits + 0xCD);
    }
    CommonMenuMes3.edge_alpha = alpha;
    CommonMenuMes3.text_x = 0x46;
    CommonMenuMes3.text_y = 0x140;
    CommonMenuMes3.Step();
    CommonMenuMes3.DrawMesWin();
    if (FishMenu.fade_mode == 4 || FishMenu.fade_mode == 5) {
        AllFadeForMenu(0x40);
        if (FishMenu.fade_mode == 4) {
            CRect_i_ dest(0x110, 0x102, 0x60, 0x1F);
            CRect_i_ window(0x1A0, 0, 0x60, 0x20);
            MenuTextureReload(FishMenu.tex_block);
            DrawMenu2DSprite(FishMenuTex, dest, window, 0x80);
            dest.y += 0x20;
            window.y = 0x20;
            DrawMenu2DSprite(FishMenuTex, dest, window, 0x80);
            CommonMenuMes1.auto_pos = 5;
        } else {
            CommonMenuMes1.auto_pos = 5;
        }
        MenuTextureReload(CommonMenuMes1.tex_block);
        CommonMenuMes1.stay_frame = 1;
        CommonMenuMes1.text_x = 0xDC;
        CommonMenuMes1.text_y = 0x8C;
        CommonMenuMes1.Step();
        CommonMenuMes1.DrawMesWin();
    }
    if (FishMenu.fade_mode != 5) {
        DrawMenuObjectVibe(cursor_x, cursor_y, 1, 0x40);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", FishExchangeItemDraw__Fiii);
#endif

void FishingExchangeDraw() {
    int frame_alpha;
    int alpha;

    setbilinear(0);
    frame_alpha = 0x40;
    alpha = 0x80;
    switch (FishMenu.fade_mode) {
        case 0:
            frame_alpha = alpha - FishMenu.fade_count * 2;
            alpha = FishMenu.fade_count * 4;
            break;
        case 1:
            frame_alpha = FishMenu.fade_count * 2 + 0x40;
            alpha = alpha - FishMenu.fade_count * 4;
            break;
    }
    if (frame_alpha > 0x80) {
        frame_alpha = 0x80;
    }
    if (frame_alpha < 0x40) {
        frame_alpha = 0x40;
    }
    if (alpha > 0x80) {
        alpha = 0x80;
    }
    if (alpha < 0) {
        alpha = 0;
    }
    FrameImageDraw(frame_alpha, 0x80);
    if (FishMenu.ready != 0) {
        FishImageIconDraw(0x50, 0x32, 0xF0, alpha);
        FishExchangeItemDraw(0x9C, 0x6A, alpha);
        setbilinear(1);
    }
}

void ExitFishingExchange() {
    CommonMenuMes1.auto_pos = -1;
    SaveData->SetFishingPoint(FishMenu.point);
    TexManager.DeleteTextureBlock(FishMenu.tex_block);
    TexManager.CleanUpTextureList();
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
}

int FishingExchangeLoop() {
    int done;

    done = FishingExchangeKey();
    FishingExchangeDraw();
    if (done) {
        ExitFishingExchange();
        return 1;
    }
    return 0;
}

int GetFishMsgNo(int prize_no) {
    if (prize_no < 0 || prize_no >= 18) {
        return 0;
    }
    return FishMsg[prize_no] + 30;
}

SV_FISH_DATA *GetFishingRankData(int rank_index) {
    return SaveData->GetFishingRank(rank_index);
}

void InitFishRecordView(u_long128 *buffer, int *tex_block, int mode) {
    u_long128 *load_buffer = buffer;

    if (buffer == NULL) {
        load_buffer = (u_long128 *) (EdMenuBuffer.base + EdMenuBuffer.used * 16);
    }
    load_buffer = MenuCalcBufAlignment(load_buffer);
    FishRecordMenu.tex_block = tex_block[0];
    FishRecordMenu.tex_block2 = tex_block[1];
    FishRecordMenu.mode = mode;
    StartReadBG();
    LoadFileBGMenuData("fishrec.pak", load_buffer);
    FishRecordMenu.ready = 0;
    FishRecordMenu.cursor = 0;
    FishRecordMenu.top = 0;
    FishRecordMenu.fade_count = 0;
    FishRecordMenu.fade_mode = 0;
    StayTex = TexManager.GetTexture("stayframe", -1);
    GamePad.SetAutoRepeat(0xF000, 0x1E, 5);
    GamePad.MenuModeOn(0x78);
}

/**
 * Leaves the fishing record view and releases its texture block.
 *
 * @mangled ExitFishRecord__Fv
 * @address 0x1F2FA0
 * @size 0x60
 */
static void ExitFishRecord() {
    TexManager.DeleteTextureBlock(FishRecordMenu.tex_block);
    TexManager.CleanUpTextureList();
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
}

#ifdef NON_MATCHING
void FishRecordTextureEnter() {
    if (ReadBGSync() != 0) {
        return;
    }
    BG_READ_INFO *file = GetReadBGFile(0);
    LOADTEXTURE_INFO2 texture = {0};
    texture.block_no = FishRecordMenu.tex_block;
    texture.name = (char *) GetPackFile((u_int *) file->buffer, "fishrec.img", NULL);
    TexManager.DeleteTextureBlock(FishRecordMenu.tex_block);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, &texture);
    FishMenuTex = TexManager.GetTexture("fprecbrd", -1);
    InitMenuMesSet(0, (short *) GetPackFile((u_int *) file->buffer, "fishmes.bin", NULL));
    CommonMenuMes2.mes_made = -1;
    AtoraNameMes.mes_made = -1;
    for (int i = 0; i < 5; i++) {
        SV_FISH_DATA *rank = GetFishingRankData(FishRecordMenu.top + i);
        if (rank != NULL) {
            AtoraNameMes.mes_no[i] = GetFishMsgNo(*(s16 *) rank);
        } else {
            AtoraNameMes.mes_no[i] = 0;
        }
    }
    AtoraNameMes.MakeMesWin(0xC8);
    FishRecordMenu.cursor_y = 0x7E;
    FishRecordMenu.ready = 1;
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", FishRecordTextureEnter__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/shop", @3274);
INCLUDE_RODATA("asm/nonmatchings/shop", @3275);

/**
 * Handles one frame of fishing record input and returns the mode it leaves the view in.
 *
 * @mangled FishRecordViewKey__Fv
 * @address 0x1F31E0
 * @size 0x410
 */
static int FishRecordViewKey() {
    ReadBG();
    int ret = 0;

    switch (FishRecordMenu.fade_mode) {
        case 0:
            FishRecordMenu.fade_count++;
            if (!FishRecordMenu.ready) {
                FishRecordTextureEnter();
            } else if (FishRecordMenu.fade_count > 0x20) {
                FishRecordMenu.fade_mode = 2;
                FishRecordMenu.fade_count = 0;
            }
            break;
        case 1:
            FishRecordMenu.fade_count++;
            if (FishRecordMenu.fade_count > 0x20) {
                ExitFishRecord();
                ret = 1;
            }
            break;
        case 2: {
            int old_cursor = FishRecordMenu.cursor;

            if (GamePad.Down(0x200A)) {
                FishRecordMenu.top += 5;
                FishRecordMenu.cursor += 5;
                if (FishRecordMenu.top > 0x10) {
                    FishRecordMenu.top = 0xF;
                }
                if (FishRecordMenu.cursor >= 0x13) {
                    FishRecordMenu.cursor = 0x13;
                }
            }
            if (GamePad.Down(0x8005)) {
                FishRecordMenu.top -= 5;
                FishRecordMenu.cursor -= 5;
                if (FishRecordMenu.cursor < 0 || FishRecordMenu.top < 0) {
                    FishRecordMenu.cursor = 0;
                    FishRecordMenu.top = 0;
                }
            }
            if (GamePad.Down(0x1000)) {
                FishRecordMenu.cursor--;
                if (FishRecordMenu.cursor < 0) {
                    FishRecordMenu.cursor = 0;
                }
                if (FishRecordMenu.cursor < FishRecordMenu.top) {
                    FishRecordMenu.top--;
                }
                if (FishRecordMenu.top < 0) {
                    FishRecordMenu.top = 0;
                    FishRecordMenu.cursor = 0;
                }
            }
            if (GamePad.Down(0x4000)) {
                FishRecordMenu.cursor++;
                if (FishRecordMenu.cursor >= 0x13) {
                    FishRecordMenu.cursor = 0x13;
                }
                if (FishRecordMenu.top < FishRecordMenu.cursor - 4) {
                    FishRecordMenu.top++;
                    if (FishRecordMenu.top > 0x10) {
                        FishRecordMenu.top = 0x10;
                    }
                }
            }
            if (GamePad.Down(0x20)) {
                FishRecordMenu.fade_mode = 1;
                FishRecordMenu.fade_count = 0;
            }
            if (old_cursor != FishRecordMenu.cursor) {
                ComMenuSePlay(0);
                for (int i = 0; i < 5; i++) {
                    SV_FISH_DATA *fish = GetFishingRankData(FishRecordMenu.top + i);

                    if (fish != NULL) {
                        AtoraNameMes.mes_no[i] = GetFishMsgNo(fish->fish_id);
                    } else {
                        AtoraNameMes.mes_no[i] = 0;
                    }
                }
                AtoraNameMes.mes_made = -1;
                AtoraNameMes.MakeMesWin(0xC8);
            }
            break;
        }
    }
    return ret;
}

#ifdef NON_MATCHING
void FishRecordViewBoard(int x, int y, int alpha) {
    int widths[3] = {0x54, 0x5A, 0};

    MenuTextureReload(FishMenu.tex_block);
    DrawMenu2DSprite(FishMenuTex, CRect_i_(x, y, 0x160, 0xD0), CRect_i_(0, 0, 0x160, 0xD0), alpha);
    int head_x = x + 0x10;
    CRect_i_ head(0x160, 0x1A, 0x44, 0x1C);
    for (int i = 0; i < 3; i++) {
        if (i == 2) {
            head.width = 0x74;
        }
        DrawMenu2DSprite(FishMenuTex, CRect_i_(head_x, y - 0xE, head.width, head.height - 1), head, alpha);
        head_x += widths[i];
        head.y += head.height;
    }
    int bar_x = x + 0x144;
    int bar_y = (int) ((float) (y + 0x2A) + 6.3f * FishRecordMenu.top);
    CRect_i_ source(0x110, 0xD0, 8, 4);
    DrawMenu2DSprite(FishMenuTex, CRect_i_(bar_x, bar_y, 8, 4), source, alpha);
    source.y += 4;
    DrawMenu2DSprite(FishMenuTex, CRect_i_(bar_x, bar_y + 4, 8, (int) 23.5f), source, alpha);
    source.y += 4;
    DrawMenu2DSprite(FishMenuTex, CRect_i_(bar_x, (int) ((float) (bar_y + 4) + 23.5f), 8, 4), source, alpha);
    int row_x = x + 0x12;
    int row_y = y + 6;
    for (int i = 0; i < 5; i++) {
        int rank_no = FishRecordMenu.top + i;
        SV_FISH_DATA *rank = GetFishingRankData(rank_no);
        RECT digits = {0x158, 0xDC, 0xE, 0x12};
        if (rank_no == FishRecordMenu.cursor) {
            digits.y += digits.height;
        }
        CRect_i_ medal(0x160, 0, 0x20, 0x1B);
        int medal_x = row_x + 0x10;
        if (rank_no != 0) {
            medal.x += 0x20;
            if (rank_no == FishRecordMenu.cursor) {
                medal.x += 0x20;
            }
        }
        DrawMenu2DSprite(FishMenuTex, CRect_i_(medal_x, row_y + 0x14, medal.width, medal.height - 1), medal, alpha);
        int number_x = medal_x + 0x14;
        if (GetNumberKeta(rank_no + 1) >= 2) {
            number_x += digits.width >> 1;
        }
        DrawMenuNumber(rank_no + 1, number_x, row_y + 0x18, FishMenuTex, digits, 1, alpha);
        int size = 0;
        if (rank != NULL) {
            size = (int) ((float *) rank)[1];
        }
        if (size > 0) {
            DrawMenuNumber(size, row_x + 0xFE, row_y + 0x18, FishMenuTex, digits, 1, alpha);
            int unit_width = digits.width * 2;
            DrawMenu2DSprite(FishMenuTex, CRect_i_(row_x + 0xFE, row_y + 0x16, unit_width, digits.height),
                             CRect_i_(digits.x + digits.width * 10, digits.y, unit_width, digits.height), alpha);
            if (i >= 0 && i < 10) {
                AtoraNameMes.line_pos[i].x = row_x + 0x3E;
                AtoraNameMes.line_pos[i].y = row_y + 0x14;
            }
        }
        row_y += 0x22;
    }
    if (GetMardanGareyanFlag() != 0) {
        DrawMenu2DSprite(FishMenuTex, CRect_i_(x + 0x134, y + 0xB6, 0x28, 0x28), CRect_i_(0x1D8, 0xB4, 0x28, 0x28), alpha);
    }
    int target_y = y + 0x14 + (FishRecordMenu.cursor - FishRecordMenu.top) * 0x22;
    FishRecordMenu.cursor_y += (int) ((float) (target_y - FishRecordMenu.cursor_y) / 4.0f);
    if (abs(FishRecordMenu.cursor_y - target_y) < 2) {
        FishRecordMenu.cursor_y = target_y;
    }
    int cursor_y = FishRecordMenu.cursor_y;
    MenuTextureReload(CommonMenuMes2.tex_block);
    AtoraNameMes.edge_alpha = alpha;
    AtoraNameMes.Step();
    AtoraNameMes.DrawMesWin();
    DrawMenuObjectVibe(x + 0x16 - 0x1C, cursor_y, 1, 0x40);
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", FishRecordViewBoard__Fiii);
#endif

/**
 * Draws one frame of the fishing record view.
 *
 * @mangled FishRecordViewDraw__Fv
 * @address 0x1F3C40
 * @size 0x11C
 */
static void FishRecordViewDraw() {
    int frame_alpha;
    int alpha;

    setbilinear(0);
    frame_alpha = 0x40;
    alpha = 0x80;
    switch (FishRecordMenu.fade_mode) {
        case 0:
            frame_alpha = alpha - FishRecordMenu.fade_count * 2;
            alpha = FishRecordMenu.fade_count * 4;
            break;
        case 1:
            frame_alpha = FishRecordMenu.fade_count * 2 + 0x40;
            alpha = alpha - FishRecordMenu.fade_count * 4;
            break;
    }
    if (frame_alpha > 0x80) {
        frame_alpha = 0x80;
    }
    if (frame_alpha < 0x40) {
        frame_alpha = 0x40;
    }
    if (alpha > 0x80) {
        alpha = 0x80;
    }
    if (alpha < 0) {
        alpha = 0;
    }
    FrameImageDraw(frame_alpha, 0x80);
    if (FishRecordMenu.ready != 0) {
        FishImageIconDraw(0x50, 0x32, 0x10C, alpha);
        FishRecordViewBoard(0x9C, 0x6A, alpha);
        setbilinear(1);
    }
}

int FishRecordViewLoop() {
    int done;

    done = FishRecordViewKey();
    FishRecordViewDraw();
    return done;
}
