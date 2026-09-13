#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct ATTACH_LIST;
struct ITEM_PACK;
struct MENU_ITEMDATA;
struct SHOP_ITEMLIST;
struct SV_FISH_DATA;
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
 * Returns an item's price, buying or selling, from the item table.
 *
 * @mangled GetItemMoney__Fii
 * @address 0x1E6EF0
 * @size 0x50
 */
s16 GetItemMoney(int, int);

/**
 * @mangled ShopNoInput__FPiii
 * @address 0x1E6F40
 * @size 0x90
 * @unknownret
 */
void ShopNoInput(int *, int, int);

/**
 * Clears the shop's held item, weapon and attachment lists.
 *
 * @mangled InitAllHaveData__Fv
 * @address 0x1E6FD0
 * @size 0x50
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
 * Records the line the shopkeeper is to say and how it is to be shown.
 *
 * @mangled SetItemShopTalkMode__Fii
 * @address 0x1E71D0
 * @size 0x50
 */
void SetItemShopTalkMode(int, int);

/**
 * Draws the icons of one shop board row.
 *
 * @mangled ShopIconDraw__FPsPUciiiiii
 * @address 0x1E7220
 * @size 0x100
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
 * Starts a shop menu up: its buffers, its textures, its board mode and the gamepad.
 *
 * @mangled ShopMenuInit__FPiii
 * @address 0x1E7950
 * @size 0x250
 */
void ShopMenuInit(int *, int, int);

/**
 * Tears a shop menu down: its textures, its messages and the gamepad.
 *
 * @mangled ShopMenuExit__Fv
 * @address 0x1E7BA0
 * @size 0x130
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
 * Draws the shopkeeper and points the menu camera at them.
 *
 * @mangled LocalShopPersonDraw__Fv
 * @address 0x1E82B0
 * @size 0xC0
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
 * Turns the shopkeeper to face the menu camera.
 *
 * @mangled ShopMasterVectorSet__Fi
 * @address 0x1E83B0
 * @size 0xE0
 */
void ShopMasterVectorSet(int);

/**
 * Starts the charge shop up on the player's stock.
 *
 * @mangled InitChargeShop__FPiii
 * @address 0x1E8490
 * @size 0x190
 */
void InitChargeShop(int *, int, int);

/**
 * Keeps the charge shop's scrolled view on the row the cursor is on.
 *
 * @mangled ChargeShopLimmitCheck__Fv
 * @address 0x1E8620
 * @size 0x280
 */
void ChargeShopLimmitCheck(void);

/**
 * Runs one frame of the charge shop and returns the mode its input handler left.
 *
 * @mangled ChargeShopLoop__Fv
 * @address 0x1E88C0
 * @size 0x50
 */
int ChargeShopLoop(void);

/**
 * Handles one frame of charge shop input and returns the mode it leaves the shop in.
 *
 * @mangled ChargeShopKey__Fv
 * @address 0x1E8910
 * @size 0x15D0
 */
int ChargeShopKey(void);

/**
 * @mangled ChargeSelectKey__Fv
 * @address 0x1E9EE0
 * @size 0x8C0
 * @unknownret
 */
void ChargeSelectKey(void);

/**
 * Draws one frame of the charge shop.
 *
 * @mangled DrawChargeShop__Fv
 * @address 0x1EA7A0
 * @size 0x5B0
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
 * Draws the charge shop's personal board: its frame, scroll bar, tags and icons.
 *
 * @mangled ChargeShopBoardDraw__Fiii
 * @address 0x1EAF40
 * @size 0x390
 */
void ChargeShopBoardDraw(int, int, int);

/**
 * Returns the shop price of one item, which is zero for the item numbers below 0x51.
 *
 * @mangled CalItemMoney__Fii
 * @address 0x1EB2D0
 * @size 0x40
 */
int CalItemMoney(int, int);

/**
 * @mangled WeaponCalMoney__FP11WEAPON_HAVEi
 * @address 0x1EB310
 * @size 0x90
 * @unknownret
 */
void WeaponCalMoney(WEAPON_HAVE *, int);

/**
 * Totals what the goods currently marked for purchase cost.
 *
 * @mangled BuyMoneyCheck2__Fv
 * @address 0x1EB3A0
 * @size 0x1A0
 */
int BuyMoneyCheck2(void);

/**
 * Totals what the goods currently marked for sale fetch.
 *
 * @mangled SellMoneyCheck2__Fv
 * @address 0x1EB540
 * @size 0xC0
 */
int SellMoneyCheck2(void);

/**
 * @mangled IncludeBuyItem2__Fv
 * @address 0x1EB600
 * @size 0x1B0
 * @unknownret
 */
void IncludeBuyItem2(void);

/**
 * Returns a bit mask of the reasons the pending purchase cannot go through.
 *
 * @mangled CheckBuyItemFunc2__Fv
 * @address 0x1EB7B0
 * @size 0x1D0
 */
int CheckBuyItemFunc2(void);

/**
 * Leaves the item shop, returning the goods not bought and recording the shop game flag.
 *
 * @mangled ExitItemShop2__Fv
 * @address 0x1EB980
 * @size 0xA0
 */
void ExitItemShop2(void);

/**
 * Drops the shop special good from the stock once the player already carries one.
 *
 * @mangled ShopSpecialFunc__Fv
 * @address 0x1EBA20
 * @size 0x130
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
 * Sorts one shop item board into order and returns one when any entry moved.
 *
 * @mangled SeitonShopItemBoardSub__FP9ITEM_PACK
 * @address 0x1EBC70
 * @size 0x140
 */
int SeitonShopItemBoardSub(ITEM_PACK *);

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
 * Sorts one attachment board into order and returns one when any entry moved.
 *
 * @mangled SeitonShopAttachBoardSub__FP11ATTACH_LIST
 * @address 0x1EBF40
 * @size 0x140
 */
int SeitonShopAttachBoardSub(ATTACH_LIST *);

/**
 * @mangled SeitonShopAttachBoard__FP11ATTACH_LIST
 * @address 0x1EC080
 * @size 0xA0
 * @unknownret
 */
void SeitonShopAttachBoard(ATTACH_LIST *);

/**
 * Runs one frame of the item shop and returns the mode its input handler left.
 *
 * @mangled ItemShopLoop2__Fv
 * @address 0x1EC120
 * @size 0x50
 */
int ItemShopLoop2(void);

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
 * Draws the shop's confirmation button.
 *
 * @mangled DrawCheckButton__Fiii
 * @address 0x1EC7D0
 * @size 0xA0
 */
void DrawCheckButton(int, int, int);

/**
 * Draws the small price ticket, clipped to the digits it has to show.
 *
 * @mangled DrawSmallSellTicket__Fiiiiii
 * @address 0x1EC870
 * @size 0xE0
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
 * Draws the selling price ticket of one shop slot.
 *
 * @mangled DrawSellTicket_2__Fiiiii
 * @address 0x1ECA30
 * @size 0x190
 */
void DrawSellTicket_2(int, int, int, int, int);

/**
 * Draws the price ticket of one shop slot, small or large according to the price.
 *
 * @mangled DrawLocalTicket__Fiiiiiii
 * @address 0x1ECBC0
 * @size 0x150
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
 * Places the shopkeeper's message window over the shopkeeper.
 *
 * @mangled SetShopTalkMsgPos__Fv
 * @address 0x1ED9C0
 * @size 0xC0
 */
void SetShopTalkMsgPos(void);

/**
 * Builds the archive file name of one shop's goods into the buffer it is given.
 *
 * @mangled ItemShopGetPacFileName__FiiPc
 * @address 0x1EDA80
 * @size 0xE0
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
 * Allocates and clears the item shop's working buffer.
 *
 * @mangled ItemShopMemoryAlloc__Fv
 * @address 0x1EDBF0
 * @size 0x110
 */
void ItemShopMemoryAlloc(void);

/**
 * Rebuilds the shop's slot table, marking each item and weapon slot as taken or free.
 *
 * @mangled ItemPosInfoInit__Fv
 * @address 0x1EDD00
 * @size 0x1A0
 */
void ItemPosInfoInit(void);

/**
 * Fills the shop stock from the goods list of the shop number it is given.
 *
 * @mangled ItemShopGoodInitialize__Fi
 * @address 0x1EDEA0
 * @size 0x250
 */
void ItemShopGoodInitialize(int);

/**
 * Starts the item shop up: its goods, its slot table and its buffers.
 *
 * @mangled InitItemShop2__FPiii
 * @address 0x1EE0F0
 * @size 0x190
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
 * Handles one frame of item shop input and returns the mode it leaves the shop in.
 *
 * @mangled ItemShopKey2__Fv
 * @address 0x1EED70
 * @size 0x1A90
 */
int ItemShopKey2(void);

/**
 * Draws one frame of the item shop.
 *
 * @mangled ItemShopDraw2__Fv
 * @address 0x1F0800
 * @size 0xA50
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
 * Returns the save data's Mardan Garayan progress flag.
 *
 * @mangled GetMardanGareyanFlag__Fv
 * @address 0x1F1270
 * @size 0x20
 */
int GetMardanGareyanFlag(void);

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
 * Reports whether the Mardan Garayan weapon has been handed over: zero once game flag 0xCA
 * marks it taken, one or two otherwise according to the Mardan Garayan flag.
 *
 * @mangled AlreadyGetMardanWeapon__Fv
 * @address 0x1F13A0
 * @size 0x70
 */
int AlreadyGetMardanWeapon(void);

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
 * Handles one frame of fishing exchange input and returns the mode it leaves the exchange in.
 *
 * @mangled FishingExchangeKey__Fv
 * @address 0x1F1880
 * @size 0xBA0
 */
int FishingExchangeKey(void);

/**
 * Draws one fish icon.
 *
 * @mangled FishImageIconDraw__Fiiii
 * @address 0x1F2420
 * @size 0x60
 */
void FishImageIconDraw(int, int, int, int);

/**
 * Draws the fishing exchange's goods, their prices and its help window.
 *
 * @mangled FishExchangeItemDraw__Fiii
 * @address 0x1F2480
 * @size 0x790
 */
void FishExchangeItemDraw(int, int, int);

/**
 * Draws one frame of the fishing exchange.
 *
 * @mangled FishingExchangeDraw__Fv
 * @address 0x1F2C10
 * @size 0x120
 */
void FishingExchangeDraw(void);

/**
 * Leaves the fishing exchange and saves the fishing points it ends on.
 *
 * @mangled ExitFishingExchange__Fv
 * @address 0x1F2D30
 * @size 0x80
 */
void ExitFishingExchange(void);

/**
 * Runs one frame of the fishing exchange and returns one once its input handler has closed it.
 *
 * @mangled FishingExchangeLoop__Fv
 * @address 0x1F2DB0
 * @size 0x60
 */
int FishingExchangeLoop(void);

/**
 * @mangled GetFishMsgNo__Fi
 * @address 0x1F2E10
 * @size 0x40
 * @unknownret
 */
void GetFishMsgNo(int);

/**
 * Returns one entry of the fishing leaderboard, or NULL when that rank is empty.
 *
 * @mangled GetFishingRankData__Fi
 * @address 0x1F2E50
 * @size 0x30
 */
SV_FISH_DATA *GetFishingRankData(int);

/**
 * @mangled InitFishRecordView__FP1Pii
 * @address 0x1F2E80
 * @size 0x120
 * @unknownret
 */
void InitFishRecordView(void /* CW back-ref target unresolved */ *, int *, int);

/**
 * Leaves the fishing record view and releases its texture block.
 *
 * @mangled ExitFishRecord__Fv
 * @address 0x1F2FA0
 * @size 0x60
 */
void ExitFishRecord(void);

/**
 * Loads the fishing record view's textures and message buffers.
 *
 * @mangled FishRecordTextureEnter__Fv
 * @address 0x1F3000
 * @size 0x1E0
 */
void FishRecordTextureEnter(void);

/**
 * Handles one frame of fishing record input and returns the mode it leaves the view in.
 *
 * @mangled FishRecordViewKey__Fv
 * @address 0x1F31E0
 * @size 0x410
 */
int FishRecordViewKey(void);

/**
 * Draws the fishing record board: each rank, its fish and its size.
 *
 * @mangled FishRecordViewBoard__Fiii
 * @address 0x1F35F0
 * @size 0x650
 */
void FishRecordViewBoard(int, int, int);

/**
 * Draws one frame of the fishing record view.
 *
 * @mangled FishRecordViewDraw__Fv
 * @address 0x1F3C40
 * @size 0x120
 */
void FishRecordViewDraw(void);

/**
 * Runs one frame of the fish record view and returns the mode its input handler left.
 *
 * @mangled FishRecordViewLoop__Fv
 * @address 0x1F3D60
 * @size 0x40
 */
int FishRecordViewLoop(void);
