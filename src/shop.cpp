#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 760

#include "shop.hpp"

#include <libvu0.h>

#include <cmath>

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
#include "rect.hpp"
#include "savedata.hpp"
#include "texture.hpp"

// CUserStatus and CStockItem are only dereferenced by the drafts that need
// their full class definitions; those include the owning header themselves.
class CUserStatus;
class CStockItem;

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
    u8 unk_08[4];
    s32 unk_0C;
    s32 unk_10;
    s32 unk_14;
    float unk_18;
    u8 unk_1C[4];
    u8 unk_20[0x144];
    s32 unk_164;
    s32 unk_168;
    s32 unk_16C;
    u8 unk_170[4];
    s16 unk_174;
    s16 unk_176;
    s32 unk_178;
    s32 unk_17C;
    s16 unk_180;
    s16 unk_182;
    s32 unk_184;
    s16 unk_188;
    s16 unk_18A;
    s16 unk_18C;
    s16 unk_18E;
    s32 unk_190;
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

/** Shared UI state for the charge shop and item shop screens. */
extern ShopMenuWork ShopMenu;

/** Player status the shop currently open is reading and writing. */
extern CUserStatus *ShopUserStatusPt;

/** Stock inventory the shop currently open is reading and writing. */
extern CStockItem *ShopStockPt;

/** Camera the menu draws 3D models under. */
extern CCamera MenuCamera;

/** Model the menus draw a character with; the shopkeeper while a shop is open. */
extern CCharacter MenuCharaFrame;

/** Arena the shopkeeper's model and the item shop's board tables are read into. */
extern CDataAlloc2<1> ShopCashBuffer;

/** Texture the shop board frame, tags and tickets are drawn from. */
extern CTexture *ShopBoard;

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

/** Nonzero while the item shop is open, zero while the charge shop is open. */
extern s16 ChargeOrShopFlag;

/**
 * State of the fishing prize exchange screen.
 */
struct FishMenuWork {
    s16 tex_block; /**< Texture block the exchange's textures are entered into. */
    u8 unk_02[6];
    s32 point; /**< Fishing points the player has left to spend. */
    u8 unk_0C[0x1C];
};

STATIC_ASSERT(sizeof(FishMenuWork) == 0x28);

/** State of the fishing prize exchange screen. */
extern FishMenuWork FishMenu;

/**
 * State of the fishing record screen.
 */
struct FishRecordMenuWork {
    u8 unk_00[0x1C];
    s32 tex_block; /**< Texture block the record view's textures are entered into. */
    u8 unk_20[4];
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
 * A view onto the personal item board inside CUserStatus's still-unnamed
 * 0x436C region (userstatus.hpp reaches only 0x436C of it so far): one item
 * number and one volume per dungeon-item board slot.
 */
struct ShopUserItemBoardView {
    char unk_00[2];
    s16 item_no[60];
    char unk_7A[0xD0 - 0x7A];
    s16 volume[60];
};

/** Reaches the shop item board inside a player status by its byte offset. */
static inline ShopUserItemBoardView *ShopUserItemBoard(CUserStatus *user_status) {
    return (ShopUserItemBoardView *) ((char *) user_status + 0x436C);
}

s16 *GetItemShopList(int shop_no) {
    return ItemShopList2[shop_no];
}

void InitShopItemListData(SHOP_ITEMLIST *item_list) {
    if (item_list != NULL) {
        item_list->item_no = 0;
        memset(item_list->data, 0, sizeof(item_list->data));
    }
}

void ShopIconMove::IconMoveTarSet(int slot_no, int icon_no, int item_no, MENU_ITEMDATA *item_data, float start_x, float start_y, int to_stock) {
    this->to_stock = to_stock;
    this->item_no = item_no;
    this->slot_no = slot_no;
    this->icon_no = icon_no;
    memcpy(this->data, item_data, sizeof(this->data));
    this->pos_x = start_x;
    this->pos_y = start_y;
}
INCLUDE_ASM("asm/nonmatchings/shop", IconAutoMove__12ShopIconMoveFii);
INCLUDE_ASM("asm/nonmatchings/shop", IconAutoMoveDraw__12ShopIconMoveFv);
/** An item's buy and sell price, indexed by item number. */
struct ITEM_MONEY_ENTRY {
    s16 buy_price;
    s16 sell_price;
};

/**
 * A local data block of this unit whose tail is the item price table.
 */
struct EXT_FUNC_INFO_3 {
    u8 unk_000[0x19C];
    ITEM_MONEY_ENTRY money[0x51]; /**< Buy and sell price of each item below 0x51. */
};

/** Retail's local data block holding the item price table. */
extern EXT_FUNC_INFO_3 ext_func_info__3;

/**
 * Returns an item's price, buying or selling, from the item table.
 *
 * @mangled GetItemMoney__Fii
 * @address 0x1E6EF0
 * @size 0x44
 */
static s16 GetItemMoney(int item_no, int sell) {
    if (sell != 0) {
        return ext_func_info__3.money[item_no].sell_price;
    }
    return ext_func_info__3.money[item_no].buy_price;
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

INCLUDE_ASM("asm/nonmatchings/shop", ShopPolySetInit__Fii);

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

INCLUDE_ASM("asm/nonmatchings/shop", ChargeShopLRDraw__Fi);
INCLUDE_ASM("asm/nonmatchings/shop", ShopCurDraw__Fiiiiiii);

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

INCLUDE_ASM("asm/nonmatchings/shop", IsEnableCharge__Fi);
INCLUDE_ASM("asm/nonmatchings/shop", ShopMenuInit__FPiii);
INCLUDE_RODATA("asm/nonmatchings/shop", @760);
INCLUDE_RODATA("asm/nonmatchings/shop", @761);
INCLUDE_ASM("asm/nonmatchings/shop", ShopMenuExit__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ShopTextureLoadFix__Fv);

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

INCLUDE_ASM("asm/nonmatchings/shop", ShopPersonReadStart__Fii);
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

INCLUDE_ASM("asm/nonmatchings/shop", ShopMasterVectorSet__Fi);
INCLUDE_ASM("asm/nonmatchings/shop", InitChargeShop__FPiii);
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
INCLUDE_ASM("asm/nonmatchings/shop", ChargeSelectKey__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", DrawChargeShop__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ChargeShopMaxDraw__Fiiii);
INCLUDE_ASM("asm/nonmatchings/shop", ChargeShopBoardDraw__Fiii);

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
INCLUDE_ASM("asm/nonmatchings/shop", SellMoneyCheck2__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", IncludeBuyItem2__Fv);
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

INCLUDE_ASM("asm/nonmatchings/shop", ShopSpecialFunc__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", CompItem1__Fii);
INCLUDE_ASM("asm/nonmatchings/shop", SeitonShopItemBoardSub__FP9ITEM_PACK);

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

INCLUDE_ASM("asm/nonmatchings/shop", CompAttach1__FP11ATTACH_LISTP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/shop", SeitonShopAttachBoardSub__FP11ATTACH_LIST);

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
INCLUDE_ASM("asm/nonmatchings/shop", DrawItemShopBoard2__Fiii);
INCLUDE_ASM("asm/nonmatchings/shop", DrawMoneyCheckBoard2__Fiii);
INCLUDE_ASM("asm/nonmatchings/shop", DrawCheckButton__Fiii);
INCLUDE_ASM("asm/nonmatchings/shop", DrawSmallSellTicket__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/shop", DrawBigSellTicket__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/shop", DrawSellTicket_2__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/shop", DrawLocalTicket__Fiiiiiii);
INCLUDE_ASM("asm/nonmatchings/shop", DrawSellTicket22__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/shop", ShopCancelGoodReturn2__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", GetNowMasterMsgNo2__Fii);
INCLUDE_ASM("asm/nonmatchings/shop", ShopModelMsgFunc__Fi);
INCLUDE_ASM("asm/nonmatchings/shop", SetShopTalkMsgPos__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopGetPacFileName__FiiPc);
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopGetImgFileName__FiiPc);
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopMemoryAlloc__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ItemPosInfoInit__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopGoodInitialize__Fi);
INCLUDE_ASM("asm/nonmatchings/shop", InitItemShop2__FPiii);
INCLUDE_ASM("asm/nonmatchings/shop", ItemShopSelectKey2__Fv);
INCLUDE_RODATA("asm/nonmatchings/shop", @783__4);
INCLUDE_RODATA("asm/nonmatchings/shop", @787);
INCLUDE_RODATA("asm/nonmatchings/shop", @788);
INCLUDE_RODATA("asm/nonmatchings/shop", @789__2);
INCLUDE_RODATA("asm/nonmatchings/shop", @790);
INCLUDE_RODATA("asm/nonmatchings/shop", @791);
INCLUDE_RODATA("asm/nonmatchings/shop", @792__3);
INCLUDE_RODATA("asm/nonmatchings/shop", @793__2);
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

INCLUDE_ASM("asm/nonmatchings/shop", SetFishMardanGarayanNum__Fi);
INCLUDE_RODATA("asm/nonmatchings/shop", @2912);

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
INCLUDE_ASM("asm/nonmatchings/shop", FishingExchangeDraw__Fv);

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

INCLUDE_ASM("asm/nonmatchings/shop", InitFishRecordView__FP1Pii);
INCLUDE_RODATA("asm/nonmatchings/shop", @3257);

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
INCLUDE_ASM("asm/nonmatchings/shop", FishRecordViewKey__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", FishRecordViewBoard__Fiii);
INCLUDE_ASM("asm/nonmatchings/shop", FishRecordViewDraw__Fv);

int FishRecordViewLoop() {
    int done;

    done = FishRecordViewKey();
    FishRecordViewDraw();
    return done;
}
