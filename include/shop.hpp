#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct ATTACH_LIST;
struct ITEM_PACK;
struct MENU_ITEMDATA;
struct SHOP_ITEMLIST;
struct WEAPON_HAVE;

/**
 * @mangled GetItemShopList__Fi
 * @address 0x1E68D0
 * @size 0x20
 * @unknownret
 */
void GetItemShopList(int);

/**
 * @mangled InitShopItemListData__FP13SHOP_ITEMLIST
 * @address 0x1E68F0
 * @size 0x40
 * @unknownret
 */
void InitShopItemListData(SHOP_ITEMLIST *);

class ShopIconMove {
public:
    /**
     * @mangled IconMoveTarSet__12ShopIconMoveFiiiP13MENU_ITEMDATAffi
     * @address 0x1E6930
     * @size 0x70
     * @unknownret
     */
    void IconMoveTarSet(int, int, int, MENU_ITEMDATA *, float, float, int);

    /**
     * @mangled IconAutoMove__12ShopIconMoveFii
     * @address 0x1E69A0
     * @size 0x460
     * @unknownret
     */
    void IconAutoMove(int, int);

    /**
     * @mangled IconAutoMoveDraw__12ShopIconMoveFv
     * @address 0x1E6E00
     * @size 0xF0
     * @unknownret
     */
    void IconAutoMoveDraw(void);
};

/**
 * @mangled GetItemMoney__Fii
 * @address 0x1E6EF0
 * @size 0x50
 * @unknownret
 */
void GetItemMoney(int, int);

/**
 * @mangled ShopNoInput__FPiii
 * @address 0x1E6F40
 * @size 0x90
 * @unknownret
 */
void ShopNoInput(int *, int, int);

/**
 * @mangled InitAllHaveData__Fv
 * @address 0x1E6FD0
 * @size 0x50
 * @unknownret
 */
void InitAllHaveData(void);

/**
 * @mangled CommonShopLoop__Fv
 * @address 0x1E7020
 * @size 0x60
 * @unknownret
 */
void CommonShopLoop(void);

/**
 * @mangled ShopPolySetInit__Fii
 * @address 0x1E7080
 * @size 0x150
 * @unknownret
 */
void ShopPolySetInit(int, int);

/**
 * @mangled SetItemShopTalkMode__Fii
 * @address 0x1E71D0
 * @size 0x50
 * @unknownret
 */
void SetItemShopTalkMode(int, int);

/**
 * @mangled ShopIconDraw__FPsPUciiiiii
 * @address 0x1E7220
 * @size 0x100
 * @unknownret
 */
void ShopIconDraw(short *, unsigned char *, int, int, int, int, int, int);

/**
 * @mangled ChargeShopLRDraw__Fi
 * @address 0x1E7320
 * @size 0x1B0
 * @unknownret
 */
void ChargeShopLRDraw(int);

/**
 * @mangled ShopCurDraw__Fiiiiiii
 * @address 0x1E74D0
 * @size 0x300
 * @unknownret
 */
void ShopCurDraw(int, int, int, int, int, int, int);

/**
 * @mangled DrawShopIcon__Fiiii
 * @address 0x1E77D0
 * @size 0x70
 * @unknownret
 */
void DrawShopIcon(int, int, int, int);

/**
 * @mangled IsEnableCharge__Fi
 * @address 0x1E7840
 * @size 0x110
 * @unknownret
 */
void IsEnableCharge(int);

/**
 * @mangled ShopMenuInit__FPiii
 * @address 0x1E7950
 * @size 0x250
 * @unknownret
 */
void ShopMenuInit(int *, int, int);

/**
 * @mangled ShopMenuExit__Fv
 * @address 0x1E7BA0
 * @size 0x130
 * @unknownret
 */
void ShopMenuExit(void);

/**
 * @mangled ShopTextureLoadFix__Fv
 * @address 0x1E7CD0
 * @size 0x1D0
 * @unknownret
 */
void ShopTextureLoadFix(void);

/**
 * @mangled ShopFadeoutDraw__Fv
 * @address 0x1E7EA0
 * @size 0x100
 * @unknownret
 */
void ShopFadeoutDraw(void);

/**
 * @mangled ShopPersonReadStart__Fii
 * @address 0x1E7FA0
 * @size 0xA0
 * @unknownret
 */
void ShopPersonReadStart(int, int);

/**
 * @mangled ShopPersonBuild__Fii
 * @address 0x1E8040
 * @size 0x270
 * @unknownret
 */
void ShopPersonBuild(int, int);

/**
 * @mangled LocalShopPersonDraw__Fv
 * @address 0x1E82B0
 * @size 0xC0
 * @unknownret
 */
void LocalShopPersonDraw(void);

/**
 * @mangled ShopPersonDraw__Fi
 * @address 0x1E8370
 * @size 0x40
 * @unknownret
 */
void ShopPersonDraw(int);

/**
 * @mangled ShopMasterVectorSet__Fi
 * @address 0x1E83B0
 * @size 0xE0
 * @unknownret
 */
void ShopMasterVectorSet(int);

/**
 * @mangled InitChargeShop__FPiii
 * @address 0x1E8490
 * @size 0x190
 * @unknownret
 */
void InitChargeShop(int *, int, int);

/**
 * @mangled ChargeShopLimmitCheck__Fv
 * @address 0x1E8620
 * @size 0x280
 * @unknownret
 */
void ChargeShopLimmitCheck(void);

/**
 * @mangled ExitChargeShop__Fv
 * @address 0x1E88A0
 * @size 0x20
 * @unknownret
 */
void ExitChargeShop(void);

/**
 * @mangled ChargeShopLoop__Fv
 * @address 0x1E88C0
 * @size 0x50
 * @unknownret
 */
void ChargeShopLoop(void);

/**
 * @mangled ChargeShopKey__Fv
 * @address 0x1E8910
 * @size 0x15D0
 * @unknownret
 */
void ChargeShopKey(void);

/**
 * @mangled ChargeSelectKey__Fv
 * @address 0x1E9EE0
 * @size 0x8C0
 * @unknownret
 */
void ChargeSelectKey(void);

/**
 * @mangled DrawChargeShop__Fv
 * @address 0x1EA7A0
 * @size 0x5B0
 * @unknownret
 */
void DrawChargeShop(void);

/**
 * @mangled ChargeShopMaxDraw__Fiiii
 * @address 0x1EAD50
 * @size 0x1F0
 * @unknownret
 */
void ChargeShopMaxDraw(int, int, int, int);

/**
 * @mangled ChargeShopBoardDraw__Fiii
 * @address 0x1EAF40
 * @size 0x390
 * @unknownret
 */
void ChargeShopBoardDraw(int, int, int);

/**
 * @mangled CalItemMoney__Fii
 * @address 0x1EB2D0
 * @size 0x40
 * @unknownret
 */
void CalItemMoney(int, int);

/**
 * @mangled WeaponCalMoney__FP11WEAPON_HAVEi
 * @address 0x1EB310
 * @size 0x90
 * @unknownret
 */
void WeaponCalMoney(WEAPON_HAVE *, int);

/**
 * @mangled BuyMoneyCheck2__Fv
 * @address 0x1EB3A0
 * @size 0x1A0
 * @unknownret
 */
void BuyMoneyCheck2(void);

/**
 * @mangled SellMoneyCheck2__Fv
 * @address 0x1EB540
 * @size 0xC0
 * @unknownret
 */
void SellMoneyCheck2(void);

/**
 * @mangled IncludeBuyItem2__Fv
 * @address 0x1EB600
 * @size 0x1B0
 * @unknownret
 */
void IncludeBuyItem2(void);

/**
 * @mangled CheckBuyItemFunc2__Fv
 * @address 0x1EB7B0
 * @size 0x1D0
 * @unknownret
 */
void CheckBuyItemFunc2(void);

/**
 * @mangled ExitItemShop2__Fv
 * @address 0x1EB980
 * @size 0xA0
 * @unknownret
 */
void ExitItemShop2(void);

/**
 * @mangled ShopSpecialFunc__Fv
 * @address 0x1EBA20
 * @size 0x130
 * @unknownret
 */
void ShopSpecialFunc(void);

/**
 * @mangled CompItem1__Fii
 * @address 0x1EBB50
 * @size 0x120
 * @unknownret
 */
void CompItem1(int, int);

/**
 * @mangled SeitonShopItemBoardSub__FP9ITEM_PACK
 * @address 0x1EBC70
 * @size 0x140
 * @unknownret
 */
void SeitonShopItemBoardSub(ITEM_PACK *);

/**
 * @mangled SeitonShopItemBoard__FP9ITEM_PACK
 * @address 0x1EBDB0
 * @size 0x90
 * @unknownret
 */
void SeitonShopItemBoard(ITEM_PACK *);

/**
 * @mangled CompAttach1__FP11ATTACH_LISTP11ATTACH_LIST
 * @address 0x1EBE40
 * @size 0x100
 * @unknownret
 */
void CompAttach1(ATTACH_LIST *, ATTACH_LIST *);

/**
 * @mangled SeitonShopAttachBoardSub__FP11ATTACH_LIST
 * @address 0x1EBF40
 * @size 0x140
 * @unknownret
 */
void SeitonShopAttachBoardSub(ATTACH_LIST *);

/**
 * @mangled SeitonShopAttachBoard__FP11ATTACH_LIST
 * @address 0x1EC080
 * @size 0xA0
 * @unknownret
 */
void SeitonShopAttachBoard(ATTACH_LIST *);

/**
 * @mangled ItemShopLoop2__Fv
 * @address 0x1EC120
 * @size 0x50
 * @unknownret
 */
void ItemShopLoop2(void);

/**
 * @mangled CheckSideKey2__Fv
 * @address 0x1EC170
 * @size 0x200
 * @unknownret
 */
void CheckSideKey2(void);

/**
 * @mangled DrawItemShopBoard2__Fiii
 * @address 0x1EC370
 * @size 0x2D0
 * @unknownret
 */
void DrawItemShopBoard2(int, int, int);

/**
 * @mangled DrawMoneyCheckBoard2__Fiii
 * @address 0x1EC640
 * @size 0x190
 * @unknownret
 */
void DrawMoneyCheckBoard2(int, int, int);

/**
 * @mangled DrawCheckButton__Fiii
 * @address 0x1EC7D0
 * @size 0xA0
 * @unknownret
 */
void DrawCheckButton(int, int, int);

/**
 * @mangled DrawSmallSellTicket__Fiiiiii
 * @address 0x1EC870
 * @size 0xE0
 * @unknownret
 */
void DrawSmallSellTicket(int, int, int, int, int, int);

/**
 * @mangled DrawBigSellTicket__Fiiiii
 * @address 0x1EC950
 * @size 0xE0
 * @unknownret
 */
void DrawBigSellTicket(int, int, int, int, int);

/**
 * @mangled DrawSellTicket_2__Fiiiii
 * @address 0x1ECA30
 * @size 0x190
 * @unknownret
 */
void DrawSellTicket_2(int, int, int, int, int);

/**
 * @mangled DrawLocalTicket__Fiiiiiii
 * @address 0x1ECBC0
 * @size 0x150
 * @unknownret
 */
void DrawLocalTicket(int, int, int, int, int, int, int);

/**
 * @mangled DrawSellTicket22__Fiiiii
 * @address 0x1ECD10
 * @size 0x280
 * @unknownret
 */
void DrawSellTicket22(int, int, int, int, int);

/**
 * @mangled ShopCancelGoodReturn2__Fv
 * @address 0x1ECF90
 * @size 0x4E0
 * @unknownret
 */
void ShopCancelGoodReturn2(void);

/**
 * @mangled GetNowMasterMsgNo2__Fii
 * @address 0x1ED470
 * @size 0x270
 * @unknownret
 */
void GetNowMasterMsgNo2(int, int);

/**
 * @mangled ShopModelMsgFunc__Fi
 * @address 0x1ED6E0
 * @size 0x2E0
 * @unknownret
 */
void ShopModelMsgFunc(int);

/**
 * @mangled SetShopTalkMsgPos__Fv
 * @address 0x1ED9C0
 * @size 0xC0
 * @unknownret
 */
void SetShopTalkMsgPos(void);

/**
 * @mangled ItemShopGetPacFileName__FiiPc
 * @address 0x1EDA80
 * @size 0xE0
 * @unknownret
 */
void ItemShopGetPacFileName(int, int, char *);

/**
 * @mangled ItemShopGetImgFileName__FiiPc
 * @address 0x1EDB60
 * @size 0x90
 * @unknownret
 */
void ItemShopGetImgFileName(int, int, char *);

/**
 * @mangled ItemShopMemoryAlloc__Fv
 * @address 0x1EDBF0
 * @size 0x110
 * @unknownret
 */
void ItemShopMemoryAlloc(void);

/**
 * @mangled ItemPosInfoInit__Fv
 * @address 0x1EDD00
 * @size 0x1A0
 * @unknownret
 */
void ItemPosInfoInit(void);

/**
 * @mangled ItemShopGoodInitialize__Fi
 * @address 0x1EDEA0
 * @size 0x250
 * @unknownret
 */
void ItemShopGoodInitialize(int);

/**
 * @mangled InitItemShop2__FPiii
 * @address 0x1EE0F0
 * @size 0x190
 * @unknownret
 */
void InitItemShop2(int *, int, int);

/**
 * @mangled ItemShopSelectKey2__Fv
 * @address 0x1EE280
 * @size 0xAF0
 * @unknownret
 */
void ItemShopSelectKey2(void);

/**
 * @mangled ItemShopKey2__Fv
 * @address 0x1EED70
 * @size 0x1A90
 * @unknownret
 */
void ItemShopKey2(void);

/**
 * @mangled ItemShopDraw2__Fv
 * @address 0x1F0800
 * @size 0xA50
 * @unknownret
 */
void ItemShopDraw2(void);

/**
 * @mangled GetExchangeItemList__Fi
 * @address 0x1F1250
 * @size 0x20
 * @unknownret
 */
void GetExchangeItemList(int);

/**
 * @mangled GetMardanGareyanFlag__Fv
 * @address 0x1F1270
 * @size 0x20
 * @unknownret
 */
void GetMardanGareyanFlag(void);

/**
 * @mangled SetAlreadyGetMardanWeapon__Fi
 * @address 0x1F1290
 * @size 0x30
 * @unknownret
 */
void SetAlreadyGetMardanWeapon(int);

/**
 * @mangled SetFishMardanGarayanNum__Fi
 * @address 0x1F12C0
 * @size 0x80
 * @unknownret
 */
void SetFishMardanGarayanNum(int);

/**
 * Returns the number of fish counted toward the Mardan weapon requirement.
 *
 * @mangled GetFishMardanGarayanNum__Fv
 * @address 0x1F1340
 * @size 0x28
 */
int GetFishMardanGarayanNum(void);

/**
 * @mangled ClearFishMardanGarayanNum__Fv
 * @address 0x1F1370
 * @size 0x30
 * @unknownret
 */
void ClearFishMardanGarayanNum(void);

/**
 * @mangled AlreadyGetMardanWeapon__Fv
 * @address 0x1F13A0
 * @size 0x70
 * @unknownret
 */
void AlreadyGetMardanWeapon(void);

/**
 * @mangled InitFishingExchange__FP1Pii
 * @address 0x1F1410
 * @size 0x1C0
 * @unknownret
 */
void InitFishingExchange(void /* CW back-ref target unresolved */ *, int *, int);

/**
 * @mangled FishMenuTextureLoad__Fv
 * @address 0x1F15D0
 * @size 0x2B0
 * @unknownret
 */
void FishMenuTextureLoad(void);

/**
 * @mangled FishingExchangeKey__Fv
 * @address 0x1F1880
 * @size 0xBA0
 * @unknownret
 */
void FishingExchangeKey(void);

/**
 * @mangled FishImageIconDraw__Fiiii
 * @address 0x1F2420
 * @size 0x60
 * @unknownret
 */
void FishImageIconDraw(int, int, int, int);

/**
 * @mangled FishExchangeItemDraw__Fiii
 * @address 0x1F2480
 * @size 0x790
 * @unknownret
 */
void FishExchangeItemDraw(int, int, int);

/**
 * @mangled FishingExchangeDraw__Fv
 * @address 0x1F2C10
 * @size 0x120
 * @unknownret
 */
void FishingExchangeDraw(void);

/**
 * @mangled ExitFishingExchange__Fv
 * @address 0x1F2D30
 * @size 0x80
 * @unknownret
 */
void ExitFishingExchange(void);

/**
 * @mangled FishingExchangeLoop__Fv
 * @address 0x1F2DB0
 * @size 0x60
 * @unknownret
 */
void FishingExchangeLoop(void);

/**
 * @mangled GetFishMsgNo__Fi
 * @address 0x1F2E10
 * @size 0x40
 * @unknownret
 */
void GetFishMsgNo(int);

/**
 * @mangled GetFishingRankData__Fi
 * @address 0x1F2E50
 * @size 0x30
 * @unknownret
 */
void GetFishingRankData(int);

/**
 * @mangled InitFishRecordView__FP1Pii
 * @address 0x1F2E80
 * @size 0x120
 * @unknownret
 */
void InitFishRecordView(void /* CW back-ref target unresolved */ *, int *, int);

/**
 * @mangled ExitFishRecord__Fv
 * @address 0x1F2FA0
 * @size 0x60
 * @unknownret
 */
void ExitFishRecord(void);

/**
 * @mangled FishRecordTextureEnter__Fv
 * @address 0x1F3000
 * @size 0x1E0
 * @unknownret
 */
void FishRecordTextureEnter(void);

/**
 * @mangled FishRecordViewKey__Fv
 * @address 0x1F31E0
 * @size 0x410
 * @unknownret
 */
void FishRecordViewKey(void);

/**
 * @mangled FishRecordViewBoard__Fiii
 * @address 0x1F35F0
 * @size 0x650
 * @unknownret
 */
void FishRecordViewBoard(int, int, int);

/**
 * @mangled FishRecordViewDraw__Fv
 * @address 0x1F3C40
 * @size 0x120
 * @unknownret
 */
void FishRecordViewDraw(void);

/**
 * @mangled FishRecordViewLoop__Fv
 * @address 0x1F3D60
 * @size 0x40
 * @unknownret
 */
void FishRecordViewLoop(void);
