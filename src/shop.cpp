#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 760

#include "shop.hpp"

#include <libvu0.h>

#include <cmath>

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
    s16 unk_00;
    s16 unk_02;
    s16 unk_04;
    s16 unk_06;
    PERSONAL_BOARD board; /**< The player's side of the shop: the personal board and the records it holds. */
    s32 unk_168;
    float unk_16C;
    float unk_170;
    s16 unk_174;
    u8 unk_176;
    u8 unk_177;
    float unk_178;
    float unk_17C;
    s16 unk_180;
    s16 unk_182;
    s32 unk_184;
    s16 unk_188;
    s16 unk_18A;
    s16 unk_18C;
    s16 unk_18E;
    s16 unk_190;
    s16 unk_192;
    s16 unk_194;
    s16 unk_196;
    s16 unk_198;
    s16 unk_19A;
    s16 unk_19C;
    s16 unk_19E;
    s32 unk_1A0;
    s32 unk_1A4;
};

STATIC_ASSERT(sizeof(ShopMenuWork) == 0x1A8);

/** Returns the magnitude of an integer. */
extern "C" int abs(int);

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

/**
 * State of the fishing prize exchange screen.
 */
struct FishMenuWork {
    s16 tex_block; /**< Texture block the exchange's textures are entered into. */
    u8 unk_02[2];
    s16 ready; /**< Nonzero once the exchange's contents may be drawn. */
    u8 unk_06[2];
    s32 point; /**< Fishing points the player has left to spend. */
    u8 unk_0C[0xA];
    s16 fade_mode; /**< Whether the exchange is fading in (0) or out (1). */
    u8 unk_18[8];
    s32 fade_count; /**< Frames the current fade has run for. */
    u8 unk_24[4];
};

STATIC_ASSERT(sizeof(FishMenuWork) == 0x28);

/** State of the fishing prize exchange screen. */
extern FishMenuWork FishMenu;

/**
 * State of the fishing record screen.
 */
struct FishRecordMenuWork {
    s32 unk_00;
    s32 unk_04;
    s32 mode;       /**< The mode the record view was opened in. */
    s32 fade_mode;  /**< Whether the record view is fading in (0) or out (1). */
    s32 fade_count; /**< Frames the current fade has run for. */
    u8 unk_14[4];
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
    s16 unk_00;
    s16 unk_02;
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
 * A view onto the dungeon item pack inside CUserStatus's 0x4360 region, which
 * userstatus.hpp does not lay out as one: its capacity, the quick slots and the
 * dungeon items with their volumes.
 */
struct ShopUserItemPackView {
    s8 num;                /**< Number of dungeon-item slots the pack holds. */
    s8 item_count;         /**< Dungeon items carried, quick slot stacks included. */
    s16 quick_item[3];     /**< The item in each quick slot. */
    s16 quick_item_vol[3]; /**< How many of each quick slot's item are stacked. */
    s16 item[103];         /**< The item in each dungeon-item slot. */
    s16 item_vol[103];     /**< The volume of each dungeon-item slot's item. */
};

/** Reaches the dungeon item pack inside a player status by its byte offset. */
static inline ShopUserItemPackView *ShopUserItemPack(CUserStatus *user_status) {
    return (ShopUserItemPackView *) ((char *) user_status + 0x4360);
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
                    ShopUserItemPackView *pack = ShopUserItemPack(ShopUserStatusPt);
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

        if (ShopMenu.board.unk_04 == kind) {
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
        ShopMenu.unk_180 = talk_mode;
    }
    if (msg_mode >= 0) {
        ShopMenu.unk_19A = msg_mode;
    }
    if (ShopMenu.unk_19A == 1) {
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

    switch (ShopMenu.unk_02) {
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
            if (ShopMenu.board.unk_08 == 2) {
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
    ShopMenu.unk_178 += (cur_x - ShopMenu.unk_178) / 4.0f;
    ShopMenu.unk_17C += (cur_y - ShopMenu.unk_17C) / 4.0f;
    if (select == 2) {
        DrawMenuVibeItem(ShopMenu.unk_178, ShopMenu.unk_17C, 0, -0xE, alpha);
    }
    DrawMenuObjectVibe(ShopMenu.unk_178, ShopMenu.unk_17C, 1, vibe);
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
    ShopMenu.unk_190 = GetMenuLangFlag();
    StartReadBG();
    ShopCashBuffer.Alloc((LoadFileBGMenuData("itemshop.pak", buffer) >> 4) + 0x102);
    ShopMenu.unk_00 = shop_no;
    ShopMenu.unk_04 = mode;
    ShopMenu.unk_18A = tex_block[0];
    ShopMenu.unk_188 = 0;
    ShopMenu.unk_196 = tex_block[1];
    ShopMenu.unk_194 = 1;
    ShopMenu.unk_18E = 0;
    ShopMenu.unk_02 = 1;
    InitPersonalBoardMode(ShopUserStatusPt, &ShopMenu.board, 0, 0);
    ShopHaveItemPt = (IHAVEITEM *) ShopMenu.board.unk_30;
    ShopHaveWepPt = &ShopMenu.board.weapon;
    ShopHaveAttachPt = &ShopMenu.board.unk_13C;
    ShopMenu.unk_176 = 0;
    ShopMenu.unk_174 = 0;
    ShopMenu.unk_184 = 0;
    ShopMenu.unk_180 = 1;
    StayTex = TexManager.GetTexture("stayframe", -1);
    ItemVolumeStep.CheckItemVolume();
    ShopDataMove.unk_02 = -1;
    ShopDataMove.slot_no = -1;
    ShopDataMove.icon_no = -1;
    ShopDataMove.item_no = -1;
    ShopDataMove.pos_y = 0.0f;
    ShopDataMove.pos_x = 0.0f;
    memset(&ShopDataMove.data, 0, sizeof(ShopDataMove.data));
    SetMenuTrushMark((ITEM_PACK *) ShopUserItemPack(ShopUserStatusPt));
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
    ShopUserItemPackView *pack = ShopUserItemPack(ShopUserStatusPt);
    int i;
    int j;

    pack->item_count = 0;
    for (i = 0; i < 3; i++) {
        if (pack->quick_item[i] >= ITEM_DUNGEON_START) {
            pack->item_count += (s8) pack->quick_item_vol[i];
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
    TexManager.DeleteTextureBlock(ShopMenu.unk_18A);
    TexManager.DeleteTextureBlock(ShopMenu.unk_196);
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

    info[0].block_no = ShopMenu.unk_18A;
    info[1].block_no = ShopMenu.unk_18A;
    BG_READ_INFO *file = GetReadBGFile(0);
    info[1].name = (char *) GetPackFile((u_int *) file->buffer, "itemshop.img", NULL);
    TexManager.DeleteTextureBlock(ShopMenu.unk_18A);
    TexManager.CleanUpTextureList();
    TexManager.LoadTextureBlockEX(-1, info);
    ShopBoard = TexManager.GetTexture("shopbrd", ShopMenu.unk_18A);
    PerBoardTex = TexManager.GetTexture("perbrd", ShopMenu.unk_18A);
    WepIcon = TexManager.GetTexture("wepicon", ShopMenu.unk_18A);
    ItemIcon = TexManager.GetTexture("itemicon", ShopMenu.unk_18A);
    ShopMenu.unk_188 = 1;
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

    switch (ShopMenu.unk_180) {
        case 1:
            alpha = 0x80 - ShopMenu.unk_184 * 3;
            break;
        case 2:
            alpha = ShopMenu.unk_184 * 3 + 0x40;
            break;
    }
    if (alpha < 0) {
        alpha = 0;
    }
    if (alpha > 0x80) {
        alpha = 0x80;
    }
    FrameImageDraw(0x40, alpha);
    switch (ShopMenu.unk_180) {
        case 0:
        case 0x19:
            ShopMenu.unk_184 = 0;
            break;
        default:
            if (ShopMenu.unk_188 != 0) {
                ShopMenu.unk_184++;
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
    ShopMenu.unk_194 = 0;
    return 1;
}

INCLUDE_ASM("asm/nonmatchings/shop", ShopPersonBuild__Fii);

/**
 * Draws the shopkeeper and points the menu camera at them.
 *
 * @mangled LocalShopPersonDraw__Fv
 * @address 0x1E82B0
 * @size 0xB8
 */
static void LocalShopPersonDraw();
INCLUDE_ASM("asm/nonmatchings/shop", LocalShopPersonDraw__Fv);

/**
 * Draws the shopkeeper.
 *
 * @mangled ShopPersonDraw__Fi
 * @address 0x1E8370
 * @size 0x3C
 */
static void ShopPersonDraw(int) {
    MenuTextureReload(ShopMenu.unk_196);
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
    ShopMenu.board.unk_0C = 0;
    ShopMenu.unk_02 = 1;
    ShopMenu.unk_178 = (ShopMenu.board.unk_0C % 5) * 0x28 + 0x154;
    ShopMenu.unk_17C = 120.0f;
    ShopStockPt = SaveData->GetStockItem();
    rows = ChargeShopMax[0] / 5;
    ShopMenu.unk_176 = 0;
    ShopMenu.unk_16C = 0x8A - ShopMenu.unk_176 * 0x28;
    ShopMenu.unk_170 = 142.0f + 114.0f * ShopMenu.unk_176 / rows;
    ShopMenu.unk_174 = 0;
    GetMainMenuRightHelpWinLangOffset(ShopHelpWinPos[0], ShopHelpWinPos[1], ShopHelpWinW, ShopHelpWinH);
}

INCLUDE_ASM("asm/nonmatchings/shop", ChargeShopLimmitCheck__Fv);

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

INCLUDE_ASM("asm/nonmatchings/shop", ChargeShopKey__Fv);

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
    int count = ChargeShopMax[ShopMenu.board.unk_04];

    if (GamePad.Down(0x1000)) {
        ShopMenu.board.unk_0C -= 5;
        if (ShopMenu.board.unk_0C < 0) {
            ShopMenu.board.unk_0C += 5;
        }
        if (ShopMenu.board.unk_0C / 5 < ShopMenu.unk_176) {
            ShopMenu.unk_176--;
        }
    }
    if (GamePad.Down(0x4000)) {
        if (ShopMenu.board.unk_0C < count - 5) {
            ShopMenu.board.unk_0C += 5;
        }
        if (ShopMenu.unk_176 + 3 < ShopMenu.board.unk_0C / 5) {
            ShopMenu.unk_176++;
        }
    }
    if (GamePad.Down(0x8000) && ShopMenu.board.unk_0C % 5 != 0) {
        ShopMenu.board.unk_0C--;
    }
    if (GamePad.Down(0x2000)) {
        if (ShopMenu.board.unk_0C % 5 == 4) {
            ShopMenu.unk_02 = 1;
            ShopMenu.board.unk_0C = (ShopMenu.board.unk_18 + (ShopMenu.board.unk_0C / 5 - ShopMenu.unk_176)) * 5;
        } else {
            ShopMenu.board.unk_0C++;
        }
    }
    switch (ShopMenu.unk_02) {
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
                int mode = ShopMenu.board.unk_04;
                int kind = WhatIsKindofItem(ShopHaveItemPt->item_no);
                if (mode != kind && kind != -1) {
                    se = 2;
                } else {
                    switch (mode) {
                        case 0:
                            ShopStockPt->SetItemToPos(ShopMenu.board.unk_0C, &ShopHaveItemPt->item_no, &ShopHaveItemPt->volume);
                            break;
                        case 1:
                            ShopStockPt->SetWepToPos(ShopMenu.board.unk_0C, ShopHaveWepPt);
                            if (ShopHaveWepPt->item_no < 0x51) {
                                ShopHaveItemPt->item_no = -1;
                                InitHaveWep(ShopHaveWepPt);
                                ShopMenu.board.unk_15C = -1;
                            } else {
                                ShopHaveItemPt->item_no = ShopHaveWepPt->item_no;
                            }
                            break;
                        case 2:
                            ShopStockPt->SetAttachToPos(ShopMenu.board.unk_0C, ShopHaveAttachPt);
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
                    ShopHaveItemPt->unk_04 = ShopMenu.board.unk_04;
                    ShopHaveItemPt->unk_0C = ShopMenu.board.unk_0C;
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

                switch (ShopMenu.board.unk_04) {
                    case 0:
                        ShopStockPt->GetItemInfo(ShopMenu.board.unk_0C, &item, &volume);
                        break;
                    case 2:
                        ShopStockPt->GetAttachInfo(ShopMenu.board.unk_0C, &attach);
                        item = attach.item_no;
                        break;
                    case 1:
                        ShopStockPt->GetWeaponInfo(ShopMenu.board.unk_0C, &weapon);
                        item = weapon.item_no;
                        break;
                }
                GetBoardSpace(item, &kind);
                full = 0;
                int used = 0;
                int max = 0;
                GetNowModeMaxNum(ShopMenu.board.unk_04, &full);
                switch (kind) {
                    case 0: {
                        ShopUserItemPackView *pack = ShopUserItemPack(ShopUserStatusPt);

                        max = pack->num;
                        for (int i = 0; i < 3; i++) {
                            if (pack->quick_item[i] >= 0x84) {
                                used += pack->quick_item_vol[i];
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
                    ShopMenu.unk_180 = 0x12;
                    ComMenuSePlay(1);
                } else {
                    ComMenuSePlay(2);
                }
            } else if (GamePad.Down(0x80)) {
                switch (ShopMenu.board.unk_04) {
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

INCLUDE_ASM("asm/nonmatchings/shop", DrawChargeShop__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ChargeShopMaxDraw__Fiiii);

void ChargeShopBoardDraw(int x, int y, int alpha) {
    s16 items[120];
    u8 values[120];
    int top = y + 9;
    int bottom = y + 0xA9;
    int board_y;
    int left = x + 0x14;

    board_y = y + 6 - ShopMenu.unk_176 * 0x28;
    ShopMenu.unk_16C += ((float) board_y - ShopMenu.unk_16C) / 4.0f;
    board_y = ShopMenu.unk_16C;
    DrawPerBoardDraw(0, 0x64, left, board_y, top, bottom, ShopBoard, alpha);

    int board_mode = ShopMenu.board.unk_04;
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
    PersonalBoardScrlBarDraw(ChargeShopMax[board_mode], x, y, ShopMenu.unk_170, ShopMenu.unk_176, ShopBoard, alpha);
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

INCLUDE_ASM("asm/nonmatchings/shop", BuyMoneyCheck2__Fv);

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
    money = status->unk_4346 + balance;
    if (money >= 0xFFFF) {
        status->unk_4346 = 0xFFFF;
    } else {
        status->unk_4346 = money;
    }
    ItemShopGoodInitialize(ShopMenu.unk_00);
    ItemPosInfoInit();
}

INCLUDE_ASM("asm/nonmatchings/shop", CheckBuyItemFunc2__Fv);

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
    if (SaveData != NULL && ShopMenu.unk_00 == 1 && !SaveData->GetGameFlag(0xC8)) {
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

    if (ShopMenu.unk_00 == 1) {
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

INCLUDE_ASM("asm/nonmatchings/shop", CheckSideKey2__Fv);

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

    board_y = y + 6 - ShopMenu.unk_176 * 0x28;
    ShopMenu.unk_16C += ((float) board_y - ShopMenu.unk_16C) / 4.0f;
    board_y = ShopMenu.unk_16C;
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
    PersonalBoardScrlBarDraw(0x1E, x, y, ShopMenu.unk_170, ShopMenu.unk_176, ShopBoard, 0x80);
    DrawCheckButton(x + 0xA8, y + 0xAA, 0x80);
}

INCLUDE_ASM("asm/nonmatchings/shop", DrawMoneyCheckBoard2__Fiii);

/**
 * Draws the shop's confirmation button.
 *
 * @mangled DrawCheckButton__Fiii
 * @address 0x1EC7D0
 * @size 0x9C
 */
static void DrawCheckButton(int x, int y, int mode) {
    int u = 0x130;

    switch (ShopMenu.unk_180) {
        case 0x1A:
            u = 0x190;
            if (ShopMenu.unk_184 > 8) {
                ShopMenu.unk_180 = 0;
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

INCLUDE_ASM("asm/nonmatchings/shop", DrawBigSellTicket__Fiiiii);

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
            if (ShopMenu.unk_02 == 0 && i == ShopMenu.board.unk_0C) {
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

    if (slot == ShopMenu.board.unk_0C && ShopMenu.unk_02 == 1) {
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

INCLUDE_ASM("asm/nonmatchings/shop", DrawSellTicket22__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/shop", ShopCancelGoodReturn2__Fv);

/**
 * Chooses the line the shopkeeper says for the shop's current state.
 *
 * @mangled GetNowMasterMsgNo2__Fii
 * @address 0x1ED470
 * @size 0x268
 */
static int GetNowMasterMsgNo2(int, int);
INCLUDE_ASM("asm/nonmatchings/shop", GetNowMasterMsgNo2__Fii);

/**
 * Runs the shopkeeper's speech and the model's reaction to it.
 *
 * @mangled ShopModelMsgFunc__Fi
 * @address 0x1ED6E0
 * @size 0x2D8
 */
static void ShopModelMsgFunc(int shop_no) {
    if (ShopMenu.unk_194 == 2) {
        int motion = ShopMenu.unk_19C;

        switch (ShopMenu.unk_19A) {
            case 0:
                motion = 0;
                if (GamePad.AllOn()) {
                    ShopMenu.unk_1A4 = 0;
                } else {
                    ShopMenu.unk_1A4++;
                    if (ShopMenu.unk_1A4 >= 0x140) {
                        ShopMenu.unk_19A = 1;
                        motion = 3;
                    }
                }
                break;
            case 1:
                switch (ShopMenu.unk_180) {
                    case 0:
                        if (GamePad.AllOn()) {
                            ShopMenu.unk_19A = 0;
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
        if (ShopMenu.unk_19A == 1) {
            int msg_no = GetNowMasterMsgNo2(shop_no, ShopMenu.unk_00);

            if (ShopMenu.unk_19E != msg_no || GamePad.Down(0x60)) {
                ShopMenu.unk_19E = msg_no;
                CommonMenuMes3.mes_made = -1;
                CommonMenuMes3.MakeMesWin(ShopMenu.unk_19E);
                motion = 3;
            }
            switch (ShopMenu.unk_180) {
                case 2:
                case 1:
                    break;
                default:
                    if (ShopMenu.unk_194) {
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

INCLUDE_ASM("asm/nonmatchings/shop", ItemShopGetPacFileName__FiiPc);
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopGetImgFileName__FiiPc);

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
    ShopUserItemPackView *pack = ShopUserItemPack(ShopUserStatusPt);

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
    ShopMenu.board.unk_0C = 0;
    ShopMenu.unk_02 = 0;
    ShopMenu.unk_176 = 0;
    ShopMenu.unk_170 = 142.0f + 114.0f * ShopMenu.unk_176 / 6.0f;
    ShopMenu.unk_16C = 0x7E - ShopMenu.unk_176 * 0x28;
    ShopMenu.unk_178 = 86.0f;
    ShopMenu.unk_17C = 152.0f;
    ShopMenu.unk_178 = (ShopMenu.board.unk_0C % 5) * 0x28 + 0x154;
    ShopMenu.unk_17C = 120.0f;
    GetMainMenuRightHelpWinLangOffset(ShopHelpWinPos[0], ShopHelpWinPos[1], ShopHelpWinW, ShopHelpWinH);
}

INCLUDE_ASM("asm/nonmatchings/shop", ItemShopSelectKey2__Fv);
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
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopKey2__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopDraw2__Fv);

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

INCLUDE_ASM("asm/nonmatchings/shop", GetMardanGareyanFlag__Fv);

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

INCLUDE_ASM("asm/nonmatchings/shop", InitFishingExchange__FP1Pii);
INCLUDE_RODATA("asm/nonmatchings/shop", @2943);
INCLUDE_RODATA("asm/nonmatchings/shop", @2948);
INCLUDE_ASM("asm/nonmatchings/shop", FishMenuTextureLoad__Fv);
INCLUDE_RODATA("asm/nonmatchings/shop", @2962);
INCLUDE_RODATA("asm/nonmatchings/shop", @2963);
INCLUDE_RODATA("asm/nonmatchings/shop", @2964);
INCLUDE_ASM("asm/nonmatchings/shop", FishingExchangeKey__Fv);
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

INCLUDE_ASM("asm/nonmatchings/shop", FishExchangeItemDraw__Fiii);

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
    FishRecordMenu.unk_00 = 0;
    FishRecordMenu.unk_04 = 0;
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

INCLUDE_ASM("asm/nonmatchings/shop", FishRecordTextureEnter__Fv);
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
            int old_cursor = FishRecordMenu.unk_00;

            if (GamePad.Down(0x200A)) {
                FishRecordMenu.unk_04 += 5;
                FishRecordMenu.unk_00 += 5;
                if (FishRecordMenu.unk_04 > 0x10) {
                    FishRecordMenu.unk_04 = 0xF;
                }
                if (FishRecordMenu.unk_00 >= 0x13) {
                    FishRecordMenu.unk_00 = 0x13;
                }
            }
            if (GamePad.Down(0x8005)) {
                FishRecordMenu.unk_04 -= 5;
                FishRecordMenu.unk_00 -= 5;
                if (FishRecordMenu.unk_00 < 0 || FishRecordMenu.unk_04 < 0) {
                    FishRecordMenu.unk_00 = 0;
                    FishRecordMenu.unk_04 = 0;
                }
            }
            if (GamePad.Down(0x1000)) {
                FishRecordMenu.unk_00--;
                if (FishRecordMenu.unk_00 < 0) {
                    FishRecordMenu.unk_00 = 0;
                }
                if (FishRecordMenu.unk_00 < FishRecordMenu.unk_04) {
                    FishRecordMenu.unk_04--;
                }
                if (FishRecordMenu.unk_04 < 0) {
                    FishRecordMenu.unk_04 = 0;
                    FishRecordMenu.unk_00 = 0;
                }
            }
            if (GamePad.Down(0x4000)) {
                FishRecordMenu.unk_00++;
                if (FishRecordMenu.unk_00 >= 0x13) {
                    FishRecordMenu.unk_00 = 0x13;
                }
                if (FishRecordMenu.unk_04 < FishRecordMenu.unk_00 - 4) {
                    FishRecordMenu.unk_04++;
                    if (FishRecordMenu.unk_04 > 0x10) {
                        FishRecordMenu.unk_04 = 0x10;
                    }
                }
            }
            if (GamePad.Down(0x20)) {
                FishRecordMenu.fade_mode = 1;
                FishRecordMenu.fade_count = 0;
            }
            if (old_cursor != FishRecordMenu.unk_00) {
                ComMenuSePlay(0);
                for (int i = 0; i < 5; i++) {
                    SV_FISH_DATA *fish = GetFishingRankData(FishRecordMenu.unk_04 + i);

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

INCLUDE_ASM("asm/nonmatchings/shop", FishRecordViewBoard__Fiii);

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
