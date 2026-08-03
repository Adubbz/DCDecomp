#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct ATTACH_LIST;
class CCharacter;
struct ITEM_PACK;
struct MAP_JUMP_COMPARE;
struct RECT;
struct WEAPON_HAVE;


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
 * @mangled GetFishMardanGarayanNum__Fv
 * @address 0x1F1340
 * @size 0x30
 * @unknownret
 */
void GetFishMardanGarayanNum(void);

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

/**
 * @mangled GetDefaultWeaponNo__Fi
 * @address 0x1F3DA0
 * @size 0x20
 * @unknownret
 */
void GetDefaultWeaponNo(int);

/**
 * @mangled IsDefaultWeapon__Fi
 * @address 0x1F3DC0
 * @size 0x90
 * @unknownret
 */
void IsDefaultWeapon(int);

/**
 * @mangled SetNowEquipWeaponDataForMsg__Fii
 * @address 0x1F3E50
 * @size 0x20
 * @unknownret
 */
void SetNowEquipWeaponDataForMsg(int, int);

/**
 * @mangled GetNowEquipWeaponDataForMsg__FRiRi
 * @address 0x1F3E70
 * @size 0x70
 * @unknownret
 */
void GetNowEquipWeaponDataForMsg(int &, int &);

/**
 * @mangled GetGradationColorInfo2__Fi
 * @address 0x1F3EE0
 * @size 0x20
 * @unknownret
 */
void GetGradationColorInfo2(int);

/**
 * @mangled GetNowSelectWeapon__Fv
 * @address 0x1F3F00
 * @size 0x40
 * @unknownret
 */
void GetNowSelectWeapon(void);

/**
 * @mangled EscapeDungeonMode__Fv
 * @address 0x1F3F40
 * @size 0x60
 * @unknownret
 */
void EscapeDungeonMode(void);

/**
 * @mangled SetEscapeDngFlag__Fi
 * @address 0x1F3FA0
 * @size 0x10
 * @unknownret
 */
void SetEscapeDngFlag(int);

/**
 * @mangled GetEscapeDngFlag__Fv
 * @address 0x1F3FB0
 * @size 0x10
 * @unknownret
 */
void GetEscapeDngFlag(void);

/**
 * @mangled SetInteriorOutFlag__Fi
 * @address 0x1F3FC0
 * @size 0x10
 * @unknownret
 */
void SetInteriorOutFlag(int);

/**
 * @mangled GetInteriorOutFlag__Fv
 * @address 0x1F3FD0
 * @size 0x10
 * @unknownret
 */
void GetInteriorOutFlag(void);

/**
 * @mangled DrawDngYesNoDialog__Fiii
 * @address 0x1F3FE0
 * @size 0xC0
 * @unknownret
 */
void DrawDngYesNoDialog(int, int, int);

/**
 * @mangled GetMenuModeMax__Fv
 * @address 0x1F40A0
 * @size 0x70
 * @unknownret
 */
void GetMenuModeMax(void);

/**
 * @mangled GetMenuIconPos__FiPi
 * @address 0x1F4110
 * @size 0x50
 * @unknownret
 */
void GetMenuIconPos(int, int *);

/**
 * @mangled BtlMenuMekeIconInfo__FPii
 * @address 0x1F4160
 * @size 0xF0
 * @unknownret
 */
void BtlMenuMekeIconInfo(int *, int);

/**
 * @mangled DrawBtlMenuBar__Fv
 * @address 0x1F4250
 * @size 0x2A0
 * @unknownret
 */
void DrawBtlMenuBar(void);

/**
 * @mangled GetLimmitMsg__Fv
 * @address 0x1F44F0
 * @size 0x70
 * @unknownret
 */
void GetLimmitMsg(void);

/**
 * @mangled DrawBattleMain__Fv
 * @address 0x1F4560
 * @size 0x310
 * @unknownret
 */
void DrawBattleMain(void);

/**
 * @mangled DrawOtherCharaStatus__Fiiii
 * @address 0x1F4870
 * @size 0x490
 * @unknownret
 */
void DrawOtherCharaStatus(int, int, int, int);

/**
 * @mangled DngComStatus__Fiiii
 * @address 0x1F4D00
 * @size 0x720
 * @unknownret
 */
void DngComStatus(int, int, int, int);

/**
 * @mangled DrawSelCharaStatus__Fffiiiiii
 * @address 0x1F5420
 * @size 0x3F0
 * @unknownret
 */
void DrawSelCharaStatus(float, float, int, int, int, int, int, int);

/**
 * @mangled DrawBtlAtoraSelect__Fv
 * @address 0x1F5810
 * @size 0x20
 * @unknownret
 */
void DrawBtlAtoraSelect(void);

/**
 * @mangled BtlDrawOption__Fv
 * @address 0x1F5830
 * @size 0x30
 * @unknownret
 */
void BtlDrawOption(void);

/**
 * @mangled BtlDrawSave__Fv
 * @address 0x1F5860
 * @size 0x40
 * @unknownret
 */
void BtlDrawSave(void);

/**
 * @mangled BtlMenuTexBlockEnter__Fv
 * @address 0x1F58A0
 * @size 0x120
 * @unknownret
 */
void BtlMenuTexBlockEnter(void);

/**
 * @mangled BattleMenuTexEnter__Fv
 * @address 0x1F59C0
 * @size 0x140
 * @unknownret
 */
void BattleMenuTexEnter(void);

/**
 * @mangled ExitBattleMenu__Fi
 * @address 0x1F5B00
 * @size 0x1F0
 * @unknownret
 */
void ExitBattleMenu(int);

/**
 * @mangled BattleMenuInit__FPii
 * @address 0x1F5CF0
 * @size 0x460
 * @unknownret
 */
void BattleMenuInit(int *, int);

/**
 * @mangled BtlMenuDrawSpecialFlag__Fi
 * @address 0x1F6150
 * @size 0x90
 * @unknownret
 */
void BtlMenuDrawSpecialFlag(int);

/**
 * @mangled BattleMenuDraw__Fv
 * @address 0x1F61E0
 * @size 0x540
 * @unknownret
 */
void BattleMenuDraw(void);

/**
 * @mangled BattleMenuCursor__Fv
 * @address 0x1F6720
 * @size 0x1A0
 * @unknownret
 */
void BattleMenuCursor(void);

/**
 * @mangled BattleMenuAppear__Fv
 * @address 0x1F68C0
 * @size 0x180
 * @unknownret
 */
void BattleMenuAppear(void);

/**
 * @mangled BattleMenuExit__Fv
 * @address 0x1F6A40
 * @size 0xE0
 * @unknownret
 */
void BattleMenuExit(void);

/**
 * @mangled BattleMenuSelect__Fv
 * @address 0x1F6B20
 * @size 0x440
 * @unknownret
 */
void BattleMenuSelect(void);

/**
 * @mangled ToFromSelect__Fi
 * @address 0x1F6F60
 * @size 0x2A0
 * @unknownret
 */
void ToFromSelect(int);

/**
 * @mangled ForBackMenu__Fv
 * @address 0x1F7200
 * @size 0xE0
 * @unknownret
 */
void ForBackMenu(void);

/**
 * @mangled InitMenuChara__FP1
 * @address 0x1F72E0
 * @size 0x160
 * @unknownret
 */
void InitMenuChara(void /* CW back-ref target unresolved */ *);

/**
 * @mangled BattleMenuCharaKey__Fv
 * @address 0x1F7440
 * @size 0x9F0
 * @unknownret
 */
void BattleMenuCharaKey(void);

/**
 * @mangled DrawCharaSelect__Fv
 * @address 0x1F7E30
 * @size 0xF00
 * @unknownret
 */
void DrawCharaSelect(void);

/**
 * @mangled DrawWepDamageDraw__F4RECTP11WEAPON_HAVEi
 * @address 0x1F8D30
 * @size 0x4C0
 * @unknownret
 */
void DrawWepDamageDraw(RECT, WEAPON_HAVE *, int);

/**
 * @mangled DrawWepStatus__FiiP11WEAPON_HAVEii
 * @address 0x1F91F0
 * @size 0xE0
 * @unknownret
 */
void DrawWepStatus(int, int, WEAPON_HAVE *, int, int);

/**
 * @mangled DrawWepVolumeDisplay__FiiP11WEAPON_HAVEi
 * @address 0x1F92D0
 * @size 0x2B0
 * @unknownret
 */
void DrawWepVolumeDisplay(int, int, WEAPON_HAVE *, int);

/**
 * @mangled DrawWeaponNameBoard__Fiiiii
 * @address 0x1F9580
 * @size 0x140
 * @unknownret
 */
void DrawWeaponNameBoard(int, int, int, int, int);

/**
 * @mangled GetWeaponNamePutX__Fii
 * @address 0x1F96C0
 * @size 0x10
 * @unknownret
 */
void GetWeaponNamePutX(int, int);

/**
 * @mangled WeaponNameDraw__Fiii
 * @address 0x1F96D0
 * @size 0x550
 * @unknownret
 */
void WeaponNameDraw(int, int, int);

/**
 * @mangled WepStatusVolumeDraw__F4RECTiPiiiii
 * @address 0x1F9C20
 * @size 0x220
 * @unknownret
 */
void WepStatusVolumeDraw(RECT, int, int *, int, int, int, int);

/**
 * @mangled DrawWeaponStatusWaku__Fiiii
 * @address 0x1F9E40
 * @size 0x70
 * @unknownret
 */
void DrawWeaponStatusWaku(int, int, int, int);

/**
 * @mangled DrawLimmitMax__Fiii
 * @address 0x1F9EB0
 * @size 0x60
 * @unknownret
 */
void DrawLimmitMax(int, int, int);

/**
 * @mangled DrawBtlMenuLRCursor__Fiiii
 * @address 0x1F9F10
 * @size 0x1A0
 * @unknownret
 */
void DrawBtlMenuLRCursor(int, int, int, int);

/**
 * @mangled DrawWeaponStatusTag__FiiP11WEAPON_HAVEiii
 * @address 0x1FA0B0
 * @size 0x7C0
 * @unknownret
 */
void DrawWeaponStatusTag(int, int, WEAPON_HAVE *, int, int, int);

/**
 * @mangled DrawWeaponElemTag__FiiP11WEAPON_HAVEiii
 * @address 0x1FA870
 * @size 0x430
 * @unknownret
 */
void DrawWeaponElemTag(int, int, WEAPON_HAVE *, int, int, int);

/**
 * @mangled DrawWeaponVsMonster__FiiP11WEAPON_HAVEiii
 * @address 0x1FACA0
 * @size 0x350
 * @unknownret
 */
void DrawWeaponVsMonster(int, int, WEAPON_HAVE *, int, int, int);

/**
 * @mangled DrawWeaponTagBoard__FiiP11WEAPON_HAVEiii
 * @address 0x1FAFF0
 * @size 0x210
 * @unknownret
 */
void DrawWeaponTagBoard(int, int, WEAPON_HAVE *, int, int, int);

/**
 * @mangled DrawAallWeapon__FiifP10CCharacterP11WEAPON_HAVEiii
 * @address 0x1FB200
 * @size 0x560
 * @unknownret
 */
void DrawAallWeapon(int, int, float, CCharacter *, WEAPON_HAVE *, int, int, int);

/**
 * @mangled BtlWeaponDraw__Fifii
 * @address 0x1FB760
 * @size 0x750
 * @unknownret
 */
void BtlWeaponDraw(int, float, int, int);

/**
 * @mangled NowWeaponStatusValue__FP11WEAPON_HAVE
 * @address 0x1FBEB0
 * @size 0x120
 * @unknownret
 */
void NowWeaponStatusValue(WEAPON_HAVE *);

/**
 * @mangled EnableWeaponElemNone__Fi
 * @address 0x1FBFD0
 * @size 0x80
 * @unknownret
 */
void EnableWeaponElemNone(int);

/**
 * @mangled WeaponMenuCheckElemValue__FP11WEAPON_HAVEP11WEAPON_HAVE
 * @address 0x1FC050
 * @size 0xC0
 * @unknownret
 */
void WeaponMenuCheckElemValue(WEAPON_HAVE *, WEAPON_HAVE *);

/**
 * @mangled WeaponMenuCheckEnableSetElem__FP11WEAPON_HAVEP11WEAPON_HAVEi
 * @address 0x1FC110
 * @size 0x110
 * @unknownret
 */
void WeaponMenuCheckEnableSetElem(WEAPON_HAVE *, WEAPON_HAVE *, int);

/**
 * @mangled DrawWeaponSelectDialog__Fiii
 * @address 0x1FC220
 * @size 0x530
 * @unknownret
 */
void DrawWeaponSelectDialog(int, int, int);

/**
 * @mangled InitWeaponSelect__Fii
 * @address 0x1FC750
 * @size 0x3D0
 * @unknownret
 */
void InitWeaponSelect(int, int);

/**
 * @mangled ExitWeaponMenuSelect__Fv
 * @address 0x1FCB20
 * @size 0x2D0
 * @unknownret
 */
void ExitWeaponMenuSelect(void);

/**
 * @mangled WeaponMenuSelect__Fv
 * @address 0x1FCDF0
 * @size 0x1080
 * @unknownret
 */
void WeaponMenuSelect(void);

/**
 * @mangled WeaponMenuKastumSelectUp__Fii
 * @address 0x1FDE70
 * @size 0x60
 * @unknownret
 */
void WeaponMenuKastumSelectUp(int, int);

/**
 * @mangled WeaponMenuKastumSelectDown__Fii
 * @address 0x1FDED0
 * @size 0x50
 * @unknownret
 */
void WeaponMenuKastumSelectDown(int, int);

/**
 * @mangled WeaponSelectKey__Fv
 * @address 0x1FDF20
 * @size 0x1790
 * @unknownret
 */
void WeaponSelectKey(void);

/**
 * @mangled WepAttachHaveCancel__Fv
 * @address 0x1FF6B0
 * @size 0x1A0
 * @unknownret
 */
void WepAttachHaveCancel(void);

/**
 * @mangled WeaponMenuAttachModeKey__Fv
 * @address 0x1FF850
 * @size 0x240
 * @unknownret
 */
void WeaponMenuAttachModeKey(void);

/**
 * @mangled WeaponMenuActWepKey__Fv
 * @address 0x1FFA90
 * @size 0xD0
 * @unknownret
 */
void WeaponMenuActWepKey(void);

/**
 * @mangled WeaponMenuTagKey__Fv
 * @address 0x1FFB60
 * @size 0x5C0
 * @unknownret
 */
void WeaponMenuTagKey(void);

/**
 * @mangled WeaponMenuAttachWepKey__Fv
 * @address 0x200120
 * @size 0x420
 * @unknownret
 */
void WeaponMenuAttachWepKey(void);

/**
 * @mangled WeaponMenuAttachKey__Fv
 * @address 0x200540
 * @size 0x270
 * @unknownret
 */
void WeaponMenuAttachKey(void);

/**
 * @mangled RepairAndLevelUpDraw__Fiii
 * @address 0x2007B0
 * @size 0x290
 * @unknownret
 */
void RepairAndLevelUpDraw(int, int, int);

/**
 * @mangled DrawBuildUpWeaponSelect__Fiii
 * @address 0x200A40
 * @size 0x240
 * @unknownret
 */
void DrawBuildUpWeaponSelect(int, int, int);

/**
 * @mangled WeaponMenuDraw__Fv
 * @address 0x200C80
 * @size 0x11B0
 * @unknownret
 */
void WeaponMenuDraw(void);

/**
 * @mangled ItemTrushKey__FPiPii
 * @address 0x201E30
 * @size 0x2F0
 * @unknownret
 */
void ItemTrushKey(int *, int *, int);

/**
 * @mangled DrawTrushItem__Fv
 * @address 0x202120
 * @size 0x300
 * @unknownret
 */
void DrawTrushItem(void);

/**
 * @mangled ExitItemSelect__Fv
 * @address 0x202420
 * @size 0x90
 * @unknownret
 */
void ExitItemSelect(void);

/**
 * @mangled StartBGReadItemMenuWepIcon__FP1Ri
 * @address 0x2024B0
 * @size 0x60
 * @unknownret
 */
void StartBGReadItemMenuWepIcon(void /* CW back-ref target unresolved */ *, int &);

/**
 * @mangled ReadSyncItemMenuWepIcon__Fv
 * @address 0x202510
 * @size 0xD0
 * @unknownret
 */
void ReadSyncItemMenuWepIcon(void);

/**
 * @mangled InitItemMode__Fii
 * @address 0x2025E0
 * @size 0x630
 * @unknownret
 */
void InitItemMode(int, int);

/**
 * @mangled InitItemTrushStart__Fv
 * @address 0x202C10
 * @size 0x80
 * @unknownret
 */
void InitItemTrushStart(void);

/**
 * @mangled ExistItemMenu__Fv
 * @address 0x202C90
 * @size 0xC0
 * @unknownret
 */
void ExistItemMenu(void);

/**
 * @mangled ChangeMenuChara__Fv
 * @address 0x202D50
 * @size 0x1C0
 * @unknownret
 */
void ChangeMenuChara(void);

/**
 * @mangled ItemMenuMainKey__Fv
 * @address 0x202F10
 * @size 0x2AA0
 * @unknownret
 */
void ItemMenuMainKey(void);

/**
 * @mangled ItemMenuModeDraw__Fv
 * @address 0x2059B0
 * @size 0xA30
 * @unknownret
 */
void ItemMenuModeDraw(void);

/**
 * @mangled ItemMenuModeKey__Fv
 * @address 0x2063E0
 * @size 0x4E0
 * @unknownret
 */
void ItemMenuModeKey(void);

/**
 * @mangled ActiveItemDraw__Fiii
 * @address 0x2068C0
 * @size 0x1F0
 * @unknownret
 */
void ActiveItemDraw(int, int, int);

/**
 * @mangled MenuCharaPolyDraw__Fv
 * @address 0x206AB0
 * @size 0x90
 * @unknownret
 */
void MenuCharaPolyDraw(void);

/**
 * @mangled ItemMenuCharaStatusDraw__Fiiii
 * @address 0x206B40
 * @size 0xDA0
 * @unknownret
 */
void ItemMenuCharaStatusDraw(int, int, int, int);

/**
 * @mangled ItemNaviCursor__Fi
 * @address 0x2078E0
 * @size 0x2E0
 * @unknownret
 */
void ItemNaviCursor(int);

/**
 * @mangled CharaStatusMsgDraw__Fiiiii
 * @address 0x207BC0
 * @size 0x230
 * @unknownret
 */
void CharaStatusMsgDraw(int, int, int, int, int);

/**
 * @mangled BattleMenuAtoraKey__Fv
 * @address 0x207DF0
 * @size 0x100
 * @unknownret
 */
void BattleMenuAtoraKey(void);

/**
 * @mangled InitMenuMove__FiiP1
 * @address 0x207EF0
 * @size 0x420
 * @unknownret
 */
void InitMenuMove(int, int, void /* CW back-ref target unresolved */ *);

/**
 * @mangled GetTownOrDngPos__Fv
 * @address 0x208310
 * @size 0x180
 * @unknownret
 */
void GetTownOrDngPos(void);

/**
 * @mangled MenuMoveKey__Fv
 * @address 0x208490
 * @size 0xB60
 * @unknownret
 */
void MenuMoveKey(void);

/**
 * @mangled DrawMenuMove__Fv
 * @address 0x208FF0
 * @size 0xCD0
 * @unknownret
 */
void DrawMenuMove(void);

/**
 * @mangled DrawEscapeItem__Fiii
 * @address 0x209CC0
 * @size 0x2C0
 * @unknownret
 */
void DrawEscapeItem(int, int, int);

/**
 * @mangled StartLoadWorldMap__FiP1
 * @address 0x209F80
 * @size 0xC0
 * @unknownret
 */
void StartLoadWorldMap(int, void /* CW back-ref target unresolved */ *);

/**
 * @mangled LoadWorldMap__Fv
 * @address 0x20A040
 * @size 0x330
 * @unknownret
 */
void LoadWorldMap(void);

/**
 * @mangled LocalDrawWorldMap__Fv
 * @address 0x20A370
 * @size 0x70
 * @unknownret
 */
void LocalDrawWorldMap(void);

/**
 * @mangled DrawWorldMap__Fi
 * @address 0x20A3E0
 * @size 0x50
 * @unknownret
 */
void DrawWorldMap(int);

/**
 * @mangled MenuDataSwap__FP16MAP_JUMP_COMPAREP16MAP_JUMP_COMPARE
 * @address 0x20A430
 * @size 0x70
 * @unknownret
 */
void MenuDataSwap(MAP_JUMP_COMPARE *, MAP_JUMP_COMPARE *);

/**
 * @mangled GetNearWorldPos__FiPi
 * @address 0x20A4A0
 * @size 0x3C0
 * @unknownret
 */
void GetNearWorldPos(int, int *);

/**
 * @mangled WorldMapMoveKey__Fv
 * @address 0x20A860
 * @size 0x150
 * @unknownret
 */
void WorldMapMoveKey(void);

/**
 * @mangled DrawMapCheck__Fi
 * @address 0x20A9B0
 * @size 0x150
 * @unknownret
 */
void DrawMapCheck(int);

/**
 * @mangled GetVisitInfo__Fii
 * @address 0x20AB00
 * @size 0x170
 * @unknownret
 */
void GetVisitInfo(int, int);

/**
 * @mangled IsLoadMapNo__Fv
 * @address 0x20AC70
 * @size 0x110
 * @unknownret
 */
void IsLoadMapNo(void);

/**
 * @mangled MapNoTransFunc__Fi
 * @address 0x20AD80
 * @size 0xE0
 * @unknownret
 */
void MapNoTransFunc(int);

/**
 * @mangled BattleMenuOptionKey__Fv
 * @address 0x20AE60
 * @size 0x110
 * @unknownret
 */
void BattleMenuOptionKey(void);

/**
 * @mangled BattleMenuSaveKey__Fv
 * @address 0x20AF70
 * @size 0x100
 * @unknownret
 */
void BattleMenuSaveKey(void);

/**
 * @mangled BattleManualInit__FPiP1
 * @address 0x20B070
 * @size 0x20
 * @unknownret
 */
void BattleManualInit(int *, void /* CW back-ref target unresolved */ *);

/**
 * @mangled BattleManualKey__Fv
 * @address 0x20B090
 * @size 0x100
 * @unknownret
 */
void BattleManualKey(void);

/**
 * @mangled BattleManualDraw__Fv
 * @address 0x20B190
 * @size 0x20
 * @unknownret
 */
void BattleManualDraw(void);

/**
 * @mangled DrawStatusNumberNowAndMax__FPiiiii
 * @address 0x20B1B0
 * @size 0x130
 * @unknownret
 */
void DrawStatusNumberNowAndMax(int *, int, int, int, int);

/**
 * @mangled DrawWepHole__FiiP11WEAPON_HAVEii
 * @address 0x20B2E0
 * @size 0x2A0
 * @unknownret
 */
void DrawWepHole(int, int, WEAPON_HAVE *, int, int);
