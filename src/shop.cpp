#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 760

#include "shop.hpp"

#include "dataread.hpp"
#include "menu_draw.hpp"
#include "savedata.hpp"

#ifdef NON_MATCHING
s16 *GetItemShopList(int shop_no) {
    return ItemShopList2[shop_no];
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", GetItemShopList__Fi);
#endif

void InitShopItemListData(SHOP_ITEMLIST *item_list) {
    if (item_list != NULL) {
        item_list->unk_00 = 0;
        memset(item_list->unk_04, 0, sizeof(item_list->unk_04));
    }
}

#ifdef NON_MATCHING
void ShopIconMove::IconMoveTarSet(int slot_no, int icon_no, int item_no, MENU_ITEMDATA *item_data, float start_x, float start_y, int to_stock) {
    this->to_stock = to_stock;
    this->item_no = item_no;
    this->slot_no = slot_no;
    this->icon_no = icon_no;
    memcpy(this->data, item_data, sizeof(this->data));
    this->pos_x = start_x;
    this->pos_y = start_y;
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", IconMoveTarSet__12ShopIconMoveFiiiP13MENU_ITEMDATAffi);
#endif
INCLUDE_ASM("asm/nonmatchings/shop", IconAutoMove__12ShopIconMoveFii);
INCLUDE_ASM("asm/nonmatchings/shop", IconAutoMoveDraw__12ShopIconMoveFv);
#ifdef NON_MATCHING
/** An item's buy and sell price, indexed by item number. */
struct ITEM_MONEY_ENTRY {
    s16 buy_price;
    s16 sell_price;
};

extern u8 ext_func_info__3_unk_000[0x19C];
extern ITEM_MONEY_ENTRY ext_func_info__3_money[0x51];

s16 GetItemMoney(int item_no, int sell) {
    if (sell != 0) {
        return ext_func_info__3_money[item_no].sell_price;
    }
    return ext_func_info__3_money[item_no].buy_price;
}
#else
INCLUDE_ASM("asm/nonmatchings/shop", GetItemMoney__Fii);
#endif
INCLUDE_ASM("asm/nonmatchings/shop", ShopNoInput__FPiii);

void InitAllHaveData() {
    InitHaveData(ShopHaveItemPt);
    InitHaveWep(ShopHaveWepPt);
    InitHaveAttach(ShopHaveAttachPt);
    ShopHaveItemPt->unk_00 = 0;
}

INCLUDE_ASM("asm/nonmatchings/shop", CommonShopLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ShopPolySetInit__Fii);
INCLUDE_ASM("asm/nonmatchings/shop", SetItemShopTalkMode__Fii);
INCLUDE_ASM("asm/nonmatchings/shop", ShopIconDraw__FPsPUciiiiii);
INCLUDE_ASM("asm/nonmatchings/shop", ChargeShopLRDraw__Fi);
INCLUDE_ASM("asm/nonmatchings/shop", ShopCurDraw__Fiiiiiii);
INCLUDE_ASM("asm/nonmatchings/shop", DrawShopIcon__Fiiii);
INCLUDE_ASM("asm/nonmatchings/shop", IsEnableCharge__Fi);
INCLUDE_ASM("asm/nonmatchings/shop", ShopMenuInit__FPiii);
INCLUDE_RODATA("asm/nonmatchings/shop", @760);
INCLUDE_RODATA("asm/nonmatchings/shop", @761);
INCLUDE_ASM("asm/nonmatchings/shop", ShopMenuExit__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ShopTextureLoadFix__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ShopFadeoutDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ShopPersonReadStart__Fii);
INCLUDE_ASM("asm/nonmatchings/shop", ShopPersonBuild__Fii);
INCLUDE_ASM("asm/nonmatchings/shop", LocalShopPersonDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ShopPersonDraw__Fi);
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
INCLUDE_ASM("asm/nonmatchings/shop", CalItemMoney__Fii);
INCLUDE_ASM("asm/nonmatchings/shop", WeaponCalMoney__FP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/shop", BuyMoneyCheck2__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", SellMoneyCheck2__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", IncludeBuyItem2__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", CheckBuyItemFunc2__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ExitItemShop2__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ShopSpecialFunc__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", CompItem1__Fii);
INCLUDE_ASM("asm/nonmatchings/shop", SeitonShopItemBoardSub__FP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/shop", SeitonShopItemBoard__FP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/shop", CompAttach1__FP11ATTACH_LISTP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/shop", SeitonShopAttachBoardSub__FP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/shop", SeitonShopAttachBoard__FP11ATTACH_LIST);

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
INCLUDE_ASM("asm/nonmatchings/shop", GetExchangeItemList__Fi);
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

INCLUDE_ASM("asm/nonmatchings/shop", AlreadyGetMardanWeapon__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", InitFishingExchange__FP1Pii);
INCLUDE_RODATA("asm/nonmatchings/shop", @2943);
INCLUDE_RODATA("asm/nonmatchings/shop", @2948);
INCLUDE_ASM("asm/nonmatchings/shop", FishMenuTextureLoad__Fv);
INCLUDE_RODATA("asm/nonmatchings/shop", @2962);
INCLUDE_RODATA("asm/nonmatchings/shop", @2963);
INCLUDE_RODATA("asm/nonmatchings/shop", @2964);
INCLUDE_ASM("asm/nonmatchings/shop", FishingExchangeKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/shop", @3159);
INCLUDE_ASM("asm/nonmatchings/shop", FishImageIconDraw__Fiiii);
INCLUDE_ASM("asm/nonmatchings/shop", FishExchangeItemDraw__Fiii);
INCLUDE_ASM("asm/nonmatchings/shop", FishingExchangeDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/shop", ExitFishingExchange__Fv);

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

INCLUDE_ASM("asm/nonmatchings/shop", GetFishMsgNo__Fi);

SV_FISH_DATA *GetFishingRankData(int rank_index) {
    return SaveData->GetFishingRank(rank_index);
}

INCLUDE_ASM("asm/nonmatchings/shop", InitFishRecordView__FP1Pii);
INCLUDE_RODATA("asm/nonmatchings/shop", @3257);
INCLUDE_ASM("asm/nonmatchings/shop", ExitFishRecord__Fv);
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
