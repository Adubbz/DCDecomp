#pragma once

#include "common.h"

/* ?ret */ void GetItemMoney(int, int); // @ 0x1E6EF0 (0x50 bytes) -- mangled: GetItemMoney__Fii
/* ?ret */ void ShopNoInput(int *, int, int); // @ 0x1E6F40 (0x90 bytes) -- mangled: ShopNoInput__FPiii
/* ?ret */ void InitAllHaveData(void); // @ 0x1E6FD0 (0x50 bytes) -- mangled: InitAllHaveData__Fv
/* ?ret */ void CommonShopLoop(void); // @ 0x1E7020 (0x60 bytes) -- mangled: CommonShopLoop__Fv
/* ?ret */ void ShopPolySetInit(int, int); // @ 0x1E7080 (0x150 bytes) -- mangled: ShopPolySetInit__Fii
/* ?ret */ void SetItemShopTalkMode(int, int); // @ 0x1E71D0 (0x50 bytes) -- mangled: SetItemShopTalkMode__Fii
/* ?ret */ void ShopIconDraw(short *, unsigned char *, int, int, int, int, int, int); // @ 0x1E7220 (0x100 bytes) -- mangled: ShopIconDraw__FPsPUciiiiii
/* ?ret */ void ChargeShopLRDraw(int); // @ 0x1E7320 (0x1B0 bytes) -- mangled: ChargeShopLRDraw__Fi
/* ?ret */ void ShopCurDraw(int, int, int, int, int, int, int); // @ 0x1E74D0 (0x300 bytes) -- mangled: ShopCurDraw__Fiiiiiii
/* ?ret */ void DrawShopIcon(int, int, int, int); // @ 0x1E77D0 (0x70 bytes) -- mangled: DrawShopIcon__Fiiii
/* ?ret */ void IsEnableCharge(int); // @ 0x1E7840 (0x110 bytes) -- mangled: IsEnableCharge__Fi
/* ?ret */ void ShopMenuInit(int *, int, int); // @ 0x1E7950 (0x250 bytes) -- mangled: ShopMenuInit__FPiii
/* ?ret */ void ShopMenuExit(void); // @ 0x1E7BA0 (0x130 bytes) -- mangled: ShopMenuExit__Fv
/* ?ret */ void ShopTextureLoadFix(void); // @ 0x1E7CD0 (0x1D0 bytes) -- mangled: ShopTextureLoadFix__Fv
/* ?ret */ void ShopFadeoutDraw(void); // @ 0x1E7EA0 (0x100 bytes) -- mangled: ShopFadeoutDraw__Fv
/* ?ret */ void ShopPersonReadStart(int, int); // @ 0x1E7FA0 (0xA0 bytes) -- mangled: ShopPersonReadStart__Fii
/* ?ret */ void ShopPersonBuild(int, int); // @ 0x1E8040 (0x270 bytes) -- mangled: ShopPersonBuild__Fii
/* ?ret */ void LocalShopPersonDraw(void); // @ 0x1E82B0 (0xC0 bytes) -- mangled: LocalShopPersonDraw__Fv
/* ?ret */ void ShopPersonDraw(int); // @ 0x1E8370 (0x40 bytes) -- mangled: ShopPersonDraw__Fi
/* ?ret */ void ShopMasterVectorSet(int); // @ 0x1E83B0 (0xE0 bytes) -- mangled: ShopMasterVectorSet__Fi
/* ?ret */ void InitChargeShop(int *, int, int); // @ 0x1E8490 (0x190 bytes) -- mangled: InitChargeShop__FPiii
/* ?ret */ void ChargeShopLimmitCheck(void); // @ 0x1E8620 (0x280 bytes) -- mangled: ChargeShopLimmitCheck__Fv
/* ?ret */ void ExitChargeShop(void); // @ 0x1E88A0 (0x20 bytes) -- mangled: ExitChargeShop__Fv
/* ?ret */ void ChargeShopLoop(void); // @ 0x1E88C0 (0x50 bytes) -- mangled: ChargeShopLoop__Fv
/* ?ret */ void ChargeShopKey(void); // @ 0x1E8910 (0x15D0 bytes) -- mangled: ChargeShopKey__Fv
/* ?ret */ void ChargeSelectKey(void); // @ 0x1E9EE0 (0x8C0 bytes) -- mangled: ChargeSelectKey__Fv
/* ?ret */ void DrawChargeShop(void); // @ 0x1EA7A0 (0x5B0 bytes) -- mangled: DrawChargeShop__Fv
/* ?ret */ void ChargeShopMaxDraw(int, int, int, int); // @ 0x1EAD50 (0x1F0 bytes) -- mangled: ChargeShopMaxDraw__Fiiii
/* ?ret */ void ChargeShopBoardDraw(int, int, int); // @ 0x1EAF40 (0x390 bytes) -- mangled: ChargeShopBoardDraw__Fiii
/* ?ret */ void CalItemMoney(int, int); // @ 0x1EB2D0 (0x40 bytes) -- mangled: CalItemMoney__Fii
/* ?ret */ void WeaponCalMoney(WEAPON_HAVE *, int); // @ 0x1EB310 (0x90 bytes) -- mangled: WeaponCalMoney__FP11WEAPON_HAVEi
/* ?ret */ void BuyMoneyCheck2(void); // @ 0x1EB3A0 (0x1A0 bytes) -- mangled: BuyMoneyCheck2__Fv
/* ?ret */ void SellMoneyCheck2(void); // @ 0x1EB540 (0xC0 bytes) -- mangled: SellMoneyCheck2__Fv
/* ?ret */ void IncludeBuyItem2(void); // @ 0x1EB600 (0x1B0 bytes) -- mangled: IncludeBuyItem2__Fv
/* ?ret */ void CheckBuyItemFunc2(void); // @ 0x1EB7B0 (0x1D0 bytes) -- mangled: CheckBuyItemFunc2__Fv
/* ?ret */ void ExitItemShop2(void); // @ 0x1EB980 (0xA0 bytes) -- mangled: ExitItemShop2__Fv
/* ?ret */ void ShopSpecialFunc(void); // @ 0x1EBA20 (0x130 bytes) -- mangled: ShopSpecialFunc__Fv
/* ?ret */ void CompItem1(int, int); // @ 0x1EBB50 (0x120 bytes) -- mangled: CompItem1__Fii
/* ?ret */ void SeitonShopItemBoardSub(ITEM_PACK *); // @ 0x1EBC70 (0x140 bytes) -- mangled: SeitonShopItemBoardSub__FP9ITEM_PACK
/* ?ret */ void SeitonShopItemBoard(ITEM_PACK *); // @ 0x1EBDB0 (0x90 bytes) -- mangled: SeitonShopItemBoard__FP9ITEM_PACK
/* ?ret */ void CompAttach1(ATTACH_LIST *, ATTACH_LIST *); // @ 0x1EBE40 (0x100 bytes) -- mangled: CompAttach1__FP11ATTACH_LISTP11ATTACH_LIST
/* ?ret */ void SeitonShopAttachBoardSub(ATTACH_LIST *); // @ 0x1EBF40 (0x140 bytes) -- mangled: SeitonShopAttachBoardSub__FP11ATTACH_LIST
/* ?ret */ void SeitonShopAttachBoard(ATTACH_LIST *); // @ 0x1EC080 (0xA0 bytes) -- mangled: SeitonShopAttachBoard__FP11ATTACH_LIST
/* ?ret */ void ItemShopLoop2(void); // @ 0x1EC120 (0x50 bytes) -- mangled: ItemShopLoop2__Fv
/* ?ret */ void CheckSideKey2(void); // @ 0x1EC170 (0x200 bytes) -- mangled: CheckSideKey2__Fv
/* ?ret */ void DrawItemShopBoard2(int, int, int); // @ 0x1EC370 (0x2D0 bytes) -- mangled: DrawItemShopBoard2__Fiii
/* ?ret */ void DrawMoneyCheckBoard2(int, int, int); // @ 0x1EC640 (0x190 bytes) -- mangled: DrawMoneyCheckBoard2__Fiii
/* ?ret */ void DrawCheckButton(int, int, int); // @ 0x1EC7D0 (0xA0 bytes) -- mangled: DrawCheckButton__Fiii
/* ?ret */ void DrawSmallSellTicket(int, int, int, int, int, int); // @ 0x1EC870 (0xE0 bytes) -- mangled: DrawSmallSellTicket__Fiiiiii
/* ?ret */ void DrawBigSellTicket(int, int, int, int, int); // @ 0x1EC950 (0xE0 bytes) -- mangled: DrawBigSellTicket__Fiiiii
/* ?ret */ void DrawSellTicket_2(int, int, int, int, int); // @ 0x1ECA30 (0x190 bytes) -- mangled: DrawSellTicket_2__Fiiiii
/* ?ret */ void DrawLocalTicket(int, int, int, int, int, int, int); // @ 0x1ECBC0 (0x150 bytes) -- mangled: DrawLocalTicket__Fiiiiiii
/* ?ret */ void DrawSellTicket22(int, int, int, int, int); // @ 0x1ECD10 (0x280 bytes) -- mangled: DrawSellTicket22__Fiiiii
/* ?ret */ void ShopCancelGoodReturn2(void); // @ 0x1ECF90 (0x4E0 bytes) -- mangled: ShopCancelGoodReturn2__Fv
/* ?ret */ void GetNowMasterMsgNo2(int, int); // @ 0x1ED470 (0x270 bytes) -- mangled: GetNowMasterMsgNo2__Fii
/* ?ret */ void ShopModelMsgFunc(int); // @ 0x1ED6E0 (0x2E0 bytes) -- mangled: ShopModelMsgFunc__Fi
/* ?ret */ void SetShopTalkMsgPos(void); // @ 0x1ED9C0 (0xC0 bytes) -- mangled: SetShopTalkMsgPos__Fv
/* ?ret */ void ItemShopGetPacFileName(int, int, char *); // @ 0x1EDA80 (0xE0 bytes) -- mangled: ItemShopGetPacFileName__FiiPc
/* ?ret */ void ItemShopGetImgFileName(int, int, char *); // @ 0x1EDB60 (0x90 bytes) -- mangled: ItemShopGetImgFileName__FiiPc
/* ?ret */ void ItemShopMemoryAlloc(void); // @ 0x1EDBF0 (0x110 bytes) -- mangled: ItemShopMemoryAlloc__Fv
/* ?ret */ void ItemPosInfoInit(void); // @ 0x1EDD00 (0x1A0 bytes) -- mangled: ItemPosInfoInit__Fv
/* ?ret */ void ItemShopGoodInitialize(int); // @ 0x1EDEA0 (0x250 bytes) -- mangled: ItemShopGoodInitialize__Fi
/* ?ret */ void InitItemShop2(int *, int, int); // @ 0x1EE0F0 (0x190 bytes) -- mangled: InitItemShop2__FPiii
/* ?ret */ void ItemShopSelectKey2(void); // @ 0x1EE280 (0xAF0 bytes) -- mangled: ItemShopSelectKey2__Fv
/* ?ret */ void ItemShopKey2(void); // @ 0x1EED70 (0x1A90 bytes) -- mangled: ItemShopKey2__Fv
/* ?ret */ void ItemShopDraw2(void); // @ 0x1F0800 (0xA50 bytes) -- mangled: ItemShopDraw2__Fv
/* ?ret */ void GetExchangeItemList(int); // @ 0x1F1250 (0x20 bytes) -- mangled: GetExchangeItemList__Fi
/* ?ret */ void GetMardanGareyanFlag(void); // @ 0x1F1270 (0x20 bytes) -- mangled: GetMardanGareyanFlag__Fv
/* ?ret */ void SetAlreadyGetMardanWeapon(int); // @ 0x1F1290 (0x30 bytes) -- mangled: SetAlreadyGetMardanWeapon__Fi
/* ?ret */ void SetFishMardanGarayanNum(int); // @ 0x1F12C0 (0x80 bytes) -- mangled: SetFishMardanGarayanNum__Fi
/* ?ret */ void GetFishMardanGarayanNum(void); // @ 0x1F1340 (0x30 bytes) -- mangled: GetFishMardanGarayanNum__Fv
/* ?ret */ void ClearFishMardanGarayanNum(void); // @ 0x1F1370 (0x30 bytes) -- mangled: ClearFishMardanGarayanNum__Fv
/* ?ret */ void AlreadyGetMardanWeapon(void); // @ 0x1F13A0 (0x70 bytes) -- mangled: AlreadyGetMardanWeapon__Fv
/* ?ret */ void InitFishingExchange(void /* CW back-ref target unresolved */ *, int *, int); // @ 0x1F1410 (0x1C0 bytes) -- mangled: InitFishingExchange__FP1Pii
/* ?ret */ void FishMenuTextureLoad(void); // @ 0x1F15D0 (0x2B0 bytes) -- mangled: FishMenuTextureLoad__Fv
/* ?ret */ void FishingExchangeKey(void); // @ 0x1F1880 (0xBA0 bytes) -- mangled: FishingExchangeKey__Fv
/* ?ret */ void FishImageIconDraw(int, int, int, int); // @ 0x1F2420 (0x60 bytes) -- mangled: FishImageIconDraw__Fiiii
/* ?ret */ void FishExchangeItemDraw(int, int, int); // @ 0x1F2480 (0x790 bytes) -- mangled: FishExchangeItemDraw__Fiii
/* ?ret */ void FishingExchangeDraw(void); // @ 0x1F2C10 (0x120 bytes) -- mangled: FishingExchangeDraw__Fv
/* ?ret */ void ExitFishingExchange(void); // @ 0x1F2D30 (0x80 bytes) -- mangled: ExitFishingExchange__Fv
/* ?ret */ void FishingExchangeLoop(void); // @ 0x1F2DB0 (0x60 bytes) -- mangled: FishingExchangeLoop__Fv
/* ?ret */ void GetFishMsgNo(int); // @ 0x1F2E10 (0x40 bytes) -- mangled: GetFishMsgNo__Fi
/* ?ret */ void GetFishingRankData(int); // @ 0x1F2E50 (0x30 bytes) -- mangled: GetFishingRankData__Fi
/* ?ret */ void InitFishRecordView(void /* CW back-ref target unresolved */ *, int *, int); // @ 0x1F2E80 (0x120 bytes) -- mangled: InitFishRecordView__FP1Pii
/* ?ret */ void ExitFishRecord(void); // @ 0x1F2FA0 (0x60 bytes) -- mangled: ExitFishRecord__Fv
/* ?ret */ void FishRecordTextureEnter(void); // @ 0x1F3000 (0x1E0 bytes) -- mangled: FishRecordTextureEnter__Fv
/* ?ret */ void FishRecordViewKey(void); // @ 0x1F31E0 (0x410 bytes) -- mangled: FishRecordViewKey__Fv
/* ?ret */ void FishRecordViewBoard(int, int, int); // @ 0x1F35F0 (0x650 bytes) -- mangled: FishRecordViewBoard__Fiii
/* ?ret */ void FishRecordViewDraw(void); // @ 0x1F3C40 (0x120 bytes) -- mangled: FishRecordViewDraw__Fv
/* ?ret */ void FishRecordViewLoop(void); // @ 0x1F3D60 (0x40 bytes) -- mangled: FishRecordViewLoop__Fv
/* ?ret */ void GetDefaultWeaponNo(int); // @ 0x1F3DA0 (0x20 bytes) -- mangled: GetDefaultWeaponNo__Fi
/* ?ret */ void IsDefaultWeapon(int); // @ 0x1F3DC0 (0x90 bytes) -- mangled: IsDefaultWeapon__Fi
/* ?ret */ void SetNowEquipWeaponDataForMsg(int, int); // @ 0x1F3E50 (0x20 bytes) -- mangled: SetNowEquipWeaponDataForMsg__Fii
/* ?ret */ void GetNowEquipWeaponDataForMsg(int &, int &); // @ 0x1F3E70 (0x70 bytes) -- mangled: GetNowEquipWeaponDataForMsg__FRiRi
/* ?ret */ void GetGradationColorInfo2(int); // @ 0x1F3EE0 (0x20 bytes) -- mangled: GetGradationColorInfo2__Fi
/* ?ret */ void GetNowSelectWeapon(void); // @ 0x1F3F00 (0x40 bytes) -- mangled: GetNowSelectWeapon__Fv
/* ?ret */ void EscapeDungeonMode(void); // @ 0x1F3F40 (0x60 bytes) -- mangled: EscapeDungeonMode__Fv
/* ?ret */ void SetEscapeDngFlag(int); // @ 0x1F3FA0 (0x10 bytes) -- mangled: SetEscapeDngFlag__Fi
/* ?ret */ void GetEscapeDngFlag(void); // @ 0x1F3FB0 (0x10 bytes) -- mangled: GetEscapeDngFlag__Fv
/* ?ret */ void SetInteriorOutFlag(int); // @ 0x1F3FC0 (0x10 bytes) -- mangled: SetInteriorOutFlag__Fi
/* ?ret */ void GetInteriorOutFlag(void); // @ 0x1F3FD0 (0x10 bytes) -- mangled: GetInteriorOutFlag__Fv
/* ?ret */ void DrawDngYesNoDialog(int, int, int); // @ 0x1F3FE0 (0xC0 bytes) -- mangled: DrawDngYesNoDialog__Fiii
/* ?ret */ void GetMenuModeMax(void); // @ 0x1F40A0 (0x70 bytes) -- mangled: GetMenuModeMax__Fv
/* ?ret */ void GetMenuIconPos(int, int *); // @ 0x1F4110 (0x50 bytes) -- mangled: GetMenuIconPos__FiPi
/* ?ret */ void BtlMenuMekeIconInfo(int *, int); // @ 0x1F4160 (0xF0 bytes) -- mangled: BtlMenuMekeIconInfo__FPii
/* ?ret */ void DrawBtlMenuBar(void); // @ 0x1F4250 (0x2A0 bytes) -- mangled: DrawBtlMenuBar__Fv
/* ?ret */ void GetLimmitMsg(void); // @ 0x1F44F0 (0x70 bytes) -- mangled: GetLimmitMsg__Fv
/* ?ret */ void DrawBattleMain(void); // @ 0x1F4560 (0x310 bytes) -- mangled: DrawBattleMain__Fv
/* ?ret */ void DrawOtherCharaStatus(int, int, int, int); // @ 0x1F4870 (0x490 bytes) -- mangled: DrawOtherCharaStatus__Fiiii
/* ?ret */ void DngComStatus(int, int, int, int); // @ 0x1F4D00 (0x720 bytes) -- mangled: DngComStatus__Fiiii
/* ?ret */ void DrawSelCharaStatus(float, float, int, int, int, int, int, int); // @ 0x1F5420 (0x3F0 bytes) -- mangled: DrawSelCharaStatus__Fffiiiiii
/* ?ret */ void DrawBtlAtoraSelect(void); // @ 0x1F5810 (0x20 bytes) -- mangled: DrawBtlAtoraSelect__Fv
/* ?ret */ void BtlDrawOption(void); // @ 0x1F5830 (0x30 bytes) -- mangled: BtlDrawOption__Fv
/* ?ret */ void BtlDrawSave(void); // @ 0x1F5860 (0x40 bytes) -- mangled: BtlDrawSave__Fv
/* ?ret */ void BtlMenuTexBlockEnter(void); // @ 0x1F58A0 (0x120 bytes) -- mangled: BtlMenuTexBlockEnter__Fv
/* ?ret */ void BattleMenuTexEnter(void); // @ 0x1F59C0 (0x140 bytes) -- mangled: BattleMenuTexEnter__Fv
/* ?ret */ void ExitBattleMenu(int); // @ 0x1F5B00 (0x1F0 bytes) -- mangled: ExitBattleMenu__Fi
/* ?ret */ void BattleMenuInit(int *, int); // @ 0x1F5CF0 (0x460 bytes) -- mangled: BattleMenuInit__FPii
/* ?ret */ void BtlMenuDrawSpecialFlag(int); // @ 0x1F6150 (0x90 bytes) -- mangled: BtlMenuDrawSpecialFlag__Fi
/* ?ret */ void BattleMenuDraw(void); // @ 0x1F61E0 (0x540 bytes) -- mangled: BattleMenuDraw__Fv
/* ?ret */ void BattleMenuCursor(void); // @ 0x1F6720 (0x1A0 bytes) -- mangled: BattleMenuCursor__Fv
/* ?ret */ void BattleMenuAppear(void); // @ 0x1F68C0 (0x180 bytes) -- mangled: BattleMenuAppear__Fv
/* ?ret */ void BattleMenuExit(void); // @ 0x1F6A40 (0xE0 bytes) -- mangled: BattleMenuExit__Fv
/* ?ret */ void BattleMenuSelect(void); // @ 0x1F6B20 (0x440 bytes) -- mangled: BattleMenuSelect__Fv
/* ?ret */ void ToFromSelect(int); // @ 0x1F6F60 (0x2A0 bytes) -- mangled: ToFromSelect__Fi
/* ?ret */ void ForBackMenu(void); // @ 0x1F7200 (0xE0 bytes) -- mangled: ForBackMenu__Fv
/* ?ret */ void InitMenuChara(void /* CW back-ref target unresolved */ *); // @ 0x1F72E0 (0x160 bytes) -- mangled: InitMenuChara__FP1
/* ?ret */ void BattleMenuCharaKey(void); // @ 0x1F7440 (0x9F0 bytes) -- mangled: BattleMenuCharaKey__Fv
/* ?ret */ void DrawCharaSelect(void); // @ 0x1F7E30 (0xF00 bytes) -- mangled: DrawCharaSelect__Fv
/* ?ret */ void DrawWepDamageDraw(RECT, WEAPON_HAVE *, int); // @ 0x1F8D30 (0x4C0 bytes) -- mangled: DrawWepDamageDraw__F4RECTP11WEAPON_HAVEi
/* ?ret */ void DrawWepStatus(int, int, WEAPON_HAVE *, int, int); // @ 0x1F91F0 (0xE0 bytes) -- mangled: DrawWepStatus__FiiP11WEAPON_HAVEii
/* ?ret */ void DrawWepVolumeDisplay(int, int, WEAPON_HAVE *, int); // @ 0x1F92D0 (0x2B0 bytes) -- mangled: DrawWepVolumeDisplay__FiiP11WEAPON_HAVEi
/* ?ret */ void DrawWeaponNameBoard(int, int, int, int, int); // @ 0x1F9580 (0x140 bytes) -- mangled: DrawWeaponNameBoard__Fiiiii
/* ?ret */ void GetWeaponNamePutX(int, int); // @ 0x1F96C0 (0x10 bytes) -- mangled: GetWeaponNamePutX__Fii
/* ?ret */ void WeaponNameDraw(int, int, int); // @ 0x1F96D0 (0x550 bytes) -- mangled: WeaponNameDraw__Fiii
/* ?ret */ void WepStatusVolumeDraw(RECT, int, int *, int, int, int, int); // @ 0x1F9C20 (0x220 bytes) -- mangled: WepStatusVolumeDraw__F4RECTiPiiiii
/* ?ret */ void DrawWeaponStatusWaku(int, int, int, int); // @ 0x1F9E40 (0x70 bytes) -- mangled: DrawWeaponStatusWaku__Fiiii
/* ?ret */ void DrawLimmitMax(int, int, int); // @ 0x1F9EB0 (0x60 bytes) -- mangled: DrawLimmitMax__Fiii
/* ?ret */ void DrawBtlMenuLRCursor(int, int, int, int); // @ 0x1F9F10 (0x1A0 bytes) -- mangled: DrawBtlMenuLRCursor__Fiiii
/* ?ret */ void DrawWeaponStatusTag(int, int, WEAPON_HAVE *, int, int, int); // @ 0x1FA0B0 (0x7C0 bytes) -- mangled: DrawWeaponStatusTag__FiiP11WEAPON_HAVEiii
/* ?ret */ void DrawWeaponElemTag(int, int, WEAPON_HAVE *, int, int, int); // @ 0x1FA870 (0x430 bytes) -- mangled: DrawWeaponElemTag__FiiP11WEAPON_HAVEiii
/* ?ret */ void DrawWeaponVsMonster(int, int, WEAPON_HAVE *, int, int, int); // @ 0x1FACA0 (0x350 bytes) -- mangled: DrawWeaponVsMonster__FiiP11WEAPON_HAVEiii
/* ?ret */ void DrawWeaponTagBoard(int, int, WEAPON_HAVE *, int, int, int); // @ 0x1FAFF0 (0x210 bytes) -- mangled: DrawWeaponTagBoard__FiiP11WEAPON_HAVEiii
/* ?ret */ void DrawAallWeapon(int, int, float, CCharacter *, WEAPON_HAVE *, int, int, int); // @ 0x1FB200 (0x560 bytes) -- mangled: DrawAallWeapon__FiifP10CCharacterP11WEAPON_HAVEiii
/* ?ret */ void BtlWeaponDraw(int, float, int, int); // @ 0x1FB760 (0x750 bytes) -- mangled: BtlWeaponDraw__Fifii
/* ?ret */ void NowWeaponStatusValue(WEAPON_HAVE *); // @ 0x1FBEB0 (0x120 bytes) -- mangled: NowWeaponStatusValue__FP11WEAPON_HAVE
/* ?ret */ void EnableWeaponElemNone(int); // @ 0x1FBFD0 (0x80 bytes) -- mangled: EnableWeaponElemNone__Fi
/* ?ret */ void WeaponMenuCheckElemValue(WEAPON_HAVE *, WEAPON_HAVE *); // @ 0x1FC050 (0xC0 bytes) -- mangled: WeaponMenuCheckElemValue__FP11WEAPON_HAVEP11WEAPON_HAVE
/* ?ret */ void WeaponMenuCheckEnableSetElem(WEAPON_HAVE *, WEAPON_HAVE *, int); // @ 0x1FC110 (0x110 bytes) -- mangled: WeaponMenuCheckEnableSetElem__FP11WEAPON_HAVEP11WEAPON_HAVEi
/* ?ret */ void DrawWeaponSelectDialog(int, int, int); // @ 0x1FC220 (0x530 bytes) -- mangled: DrawWeaponSelectDialog__Fiii
/* ?ret */ void InitWeaponSelect(int, int); // @ 0x1FC750 (0x3D0 bytes) -- mangled: InitWeaponSelect__Fii
/* ?ret */ void ExitWeaponMenuSelect(void); // @ 0x1FCB20 (0x2D0 bytes) -- mangled: ExitWeaponMenuSelect__Fv
/* ?ret */ void WeaponMenuSelect(void); // @ 0x1FCDF0 (0x1080 bytes) -- mangled: WeaponMenuSelect__Fv
/* ?ret */ void WeaponMenuKastumSelectUp(int, int); // @ 0x1FDE70 (0x60 bytes) -- mangled: WeaponMenuKastumSelectUp__Fii
/* ?ret */ void WeaponMenuKastumSelectDown(int, int); // @ 0x1FDED0 (0x50 bytes) -- mangled: WeaponMenuKastumSelectDown__Fii
/* ?ret */ void WeaponSelectKey(void); // @ 0x1FDF20 (0x1790 bytes) -- mangled: WeaponSelectKey__Fv
/* ?ret */ void WepAttachHaveCancel(void); // @ 0x1FF6B0 (0x1A0 bytes) -- mangled: WepAttachHaveCancel__Fv
/* ?ret */ void WeaponMenuAttachModeKey(void); // @ 0x1FF850 (0x240 bytes) -- mangled: WeaponMenuAttachModeKey__Fv
/* ?ret */ void WeaponMenuActWepKey(void); // @ 0x1FFA90 (0xD0 bytes) -- mangled: WeaponMenuActWepKey__Fv
/* ?ret */ void WeaponMenuTagKey(void); // @ 0x1FFB60 (0x5C0 bytes) -- mangled: WeaponMenuTagKey__Fv
/* ?ret */ void WeaponMenuAttachWepKey(void); // @ 0x200120 (0x420 bytes) -- mangled: WeaponMenuAttachWepKey__Fv
/* ?ret */ void WeaponMenuAttachKey(void); // @ 0x200540 (0x270 bytes) -- mangled: WeaponMenuAttachKey__Fv
/* ?ret */ void RepairAndLevelUpDraw(int, int, int); // @ 0x2007B0 (0x290 bytes) -- mangled: RepairAndLevelUpDraw__Fiii
/* ?ret */ void DrawBuildUpWeaponSelect(int, int, int); // @ 0x200A40 (0x240 bytes) -- mangled: DrawBuildUpWeaponSelect__Fiii
/* ?ret */ void WeaponMenuDraw(void); // @ 0x200C80 (0x11B0 bytes) -- mangled: WeaponMenuDraw__Fv
/* ?ret */ void ItemTrushKey(int *, int *, int); // @ 0x201E30 (0x2F0 bytes) -- mangled: ItemTrushKey__FPiPii
/* ?ret */ void DrawTrushItem(void); // @ 0x202120 (0x300 bytes) -- mangled: DrawTrushItem__Fv
/* ?ret */ void ExitItemSelect(void); // @ 0x202420 (0x90 bytes) -- mangled: ExitItemSelect__Fv
/* ?ret */ void StartBGReadItemMenuWepIcon(void /* CW back-ref target unresolved */ *, int &); // @ 0x2024B0 (0x60 bytes) -- mangled: StartBGReadItemMenuWepIcon__FP1Ri
/* ?ret */ void ReadSyncItemMenuWepIcon(void); // @ 0x202510 (0xD0 bytes) -- mangled: ReadSyncItemMenuWepIcon__Fv
/* ?ret */ void InitItemMode(int, int); // @ 0x2025E0 (0x630 bytes) -- mangled: InitItemMode__Fii
/* ?ret */ void InitItemTrushStart(void); // @ 0x202C10 (0x80 bytes) -- mangled: InitItemTrushStart__Fv
/* ?ret */ void ExistItemMenu(void); // @ 0x202C90 (0xC0 bytes) -- mangled: ExistItemMenu__Fv
/* ?ret */ void ChangeMenuChara(void); // @ 0x202D50 (0x1C0 bytes) -- mangled: ChangeMenuChara__Fv
/* ?ret */ void ItemMenuMainKey(void); // @ 0x202F10 (0x2AA0 bytes) -- mangled: ItemMenuMainKey__Fv
/* ?ret */ void ItemMenuModeDraw(void); // @ 0x2059B0 (0xA30 bytes) -- mangled: ItemMenuModeDraw__Fv
/* ?ret */ void ItemMenuModeKey(void); // @ 0x2063E0 (0x4E0 bytes) -- mangled: ItemMenuModeKey__Fv
/* ?ret */ void ActiveItemDraw(int, int, int); // @ 0x2068C0 (0x1F0 bytes) -- mangled: ActiveItemDraw__Fiii
/* ?ret */ void MenuCharaPolyDraw(void); // @ 0x206AB0 (0x90 bytes) -- mangled: MenuCharaPolyDraw__Fv
/* ?ret */ void ItemMenuCharaStatusDraw(int, int, int, int); // @ 0x206B40 (0xDA0 bytes) -- mangled: ItemMenuCharaStatusDraw__Fiiii
/* ?ret */ void ItemNaviCursor(int); // @ 0x2078E0 (0x2E0 bytes) -- mangled: ItemNaviCursor__Fi
/* ?ret */ void CharaStatusMsgDraw(int, int, int, int, int); // @ 0x207BC0 (0x230 bytes) -- mangled: CharaStatusMsgDraw__Fiiiii
/* ?ret */ void BattleMenuAtoraKey(void); // @ 0x207DF0 (0x100 bytes) -- mangled: BattleMenuAtoraKey__Fv
/* ?ret */ void InitMenuMove(int, int, void /* CW back-ref target unresolved */ *); // @ 0x207EF0 (0x420 bytes) -- mangled: InitMenuMove__FiiP1
/* ?ret */ void GetTownOrDngPos(void); // @ 0x208310 (0x180 bytes) -- mangled: GetTownOrDngPos__Fv
/* ?ret */ void MenuMoveKey(void); // @ 0x208490 (0xB60 bytes) -- mangled: MenuMoveKey__Fv
/* ?ret */ void DrawMenuMove(void); // @ 0x208FF0 (0xCD0 bytes) -- mangled: DrawMenuMove__Fv
/* ?ret */ void DrawEscapeItem(int, int, int); // @ 0x209CC0 (0x2C0 bytes) -- mangled: DrawEscapeItem__Fiii
/* ?ret */ void StartLoadWorldMap(int, void /* CW back-ref target unresolved */ *); // @ 0x209F80 (0xC0 bytes) -- mangled: StartLoadWorldMap__FiP1
/* ?ret */ void LoadWorldMap(void); // @ 0x20A040 (0x330 bytes) -- mangled: LoadWorldMap__Fv
/* ?ret */ void LocalDrawWorldMap(void); // @ 0x20A370 (0x70 bytes) -- mangled: LocalDrawWorldMap__Fv
/* ?ret */ void DrawWorldMap(int); // @ 0x20A3E0 (0x50 bytes) -- mangled: DrawWorldMap__Fi
/* ?ret */ void MenuDataSwap(MAP_JUMP_COMPARE *, MAP_JUMP_COMPARE *); // @ 0x20A430 (0x70 bytes) -- mangled: MenuDataSwap__FP16MAP_JUMP_COMPAREP16MAP_JUMP_COMPARE
/* ?ret */ void GetNearWorldPos(int, int *); // @ 0x20A4A0 (0x3C0 bytes) -- mangled: GetNearWorldPos__FiPi
/* ?ret */ void WorldMapMoveKey(void); // @ 0x20A860 (0x150 bytes) -- mangled: WorldMapMoveKey__Fv
/* ?ret */ void DrawMapCheck(int); // @ 0x20A9B0 (0x150 bytes) -- mangled: DrawMapCheck__Fi
/* ?ret */ void GetVisitInfo(int, int); // @ 0x20AB00 (0x170 bytes) -- mangled: GetVisitInfo__Fii
/* ?ret */ void IsLoadMapNo(void); // @ 0x20AC70 (0x110 bytes) -- mangled: IsLoadMapNo__Fv
/* ?ret */ void MapNoTransFunc(int); // @ 0x20AD80 (0xE0 bytes) -- mangled: MapNoTransFunc__Fi
/* ?ret */ void BattleMenuOptionKey(void); // @ 0x20AE60 (0x110 bytes) -- mangled: BattleMenuOptionKey__Fv
/* ?ret */ void BattleMenuSaveKey(void); // @ 0x20AF70 (0x100 bytes) -- mangled: BattleMenuSaveKey__Fv
/* ?ret */ void BattleManualInit(int *, void /* CW back-ref target unresolved */ *); // @ 0x20B070 (0x20 bytes) -- mangled: BattleManualInit__FPiP1
/* ?ret */ void BattleManualKey(void); // @ 0x20B090 (0x100 bytes) -- mangled: BattleManualKey__Fv
/* ?ret */ void BattleManualDraw(void); // @ 0x20B190 (0x20 bytes) -- mangled: BattleManualDraw__Fv
/* ?ret */ void DrawStatusNumberNowAndMax(int *, int, int, int, int); // @ 0x20B1B0 (0x130 bytes) -- mangled: DrawStatusNumberNowAndMax__FPiiiii
/* ?ret */ void DrawWepHole(int, int, WEAPON_HAVE *, int, int); // @ 0x20B2E0 (0x2A0 bytes) -- mangled: DrawWepHole__FiiP11WEAPON_HAVEii
