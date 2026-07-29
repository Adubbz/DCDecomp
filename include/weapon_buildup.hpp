#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
struct ATTACH_LIST;
class CTexture;
struct IHAVEITEM;
struct ITEM_PACK;
struct WEAPON_HAVE;
struct WEP_BUILDUP_INFO;


/* ?ret */ void PersonalBoardWeaponPush(IHAVEITEM *, int); // @ 0x22F0A0 (0x350 bytes) -- mangled: PersonalBoardWeaponPush__FP9IHAVEITEMi
/* ?ret */ void PersonalBoardAttachPush(IHAVEITEM *, int); // @ 0x22F3F0 (0xE0 bytes) -- mangled: PersonalBoardAttachPush__FP9IHAVEITEMi
/* ?ret */ void PersonalBoardItemGetorSwap(int); // @ 0x22F4D0 (0x80 bytes) -- mangled: PersonalBoardItemGetorSwap__Fi
/* ?ret */ void PersonalBoardItemCancel(void); // @ 0x22F550 (0x210 bytes) -- mangled: PersonalBoardItemCancel__Fv
/* ?ret */ void PersonalRetMax(int); // @ 0x22F760 (0x70 bytes) -- mangled: PersonalRetMax__Fi
/* ?ret */ void DrawPersonalBoard(int, int, int, int, int); // @ 0x22F7D0 (0x200 bytes) -- mangled: DrawPersonalBoard__Fiiiii
/* ?ret */ void DrawNowEquipWeaponMark(int, int, int, int, int); // @ 0x22F9D0 (0x100 bytes) -- mangled: DrawNowEquipWeaponMark__Fiiiii
/* ?ret */ void CommonIconDraw(int, int, int, int, int, int, int); // @ 0x22FAD0 (0x4F0 bytes) -- mangled: CommonIconDraw__Fiiiiiii
/* ?ret */ void PersonalBoardDrawWaku(int, int, CTexture *, int); // @ 0x22FFC0 (0x180 bytes) -- mangled: PersonalBoardDrawWaku__FiiP8CTexturei
/* ?ret */ void PersonalBoardOptionDraw(int, int, int, int, CTexture *, int); // @ 0x230140 (0xD0 bytes) -- mangled: PersonalBoardOptionDraw__FiiiiP8CTexturei
/* ?ret */ void PersonalBoardTagDraw(int, int, int, CTexture *, int, int); // @ 0x230210 (0x510 bytes) -- mangled: PersonalBoardTagDraw__FiiiP8CTextureii
/* ?ret */ void PersonalBoardScrlBarDraw(int, int, int, float &, unsigned char, CTexture *, int); // @ 0x230720 (0x2A0 bytes) -- mangled: PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei
/* ?ret */ void PersonalBoardMaxDraw(int, int, int, CTexture *, int); // @ 0x2309C0 (0x240 bytes) -- mangled: PersonalBoardMaxDraw__FiiiP8CTexturei
/* ?ret */ void DrawPersonalBoardBase(int, int, int, int, int, CTexture *, int); // @ 0x230C00 (0x1C0 bytes) -- mangled: DrawPersonalBoardBase__FiiiiiP8CTexturei
/* ?ret */ void DrawPerBoardDraw(int, int, int, int, int, int, CTexture *, int); // @ 0x230DC0 (0x2A0 bytes) -- mangled: DrawPerBoardDraw__FiiiiiiP8CTexturei
/* ?ret */ void CommonTrushDraw(int, int, int); // @ 0x231060 (0x140 bytes) -- mangled: CommonTrushDraw__Fiii
/* ?ret */ void IsEnableTrushThrow(int); // @ 0x2311A0 (0x1C0 bytes) -- mangled: IsEnableTrushThrow__Fi
/* ?ret */ void CommonMoneyBoardDraw(int, int, int, int); // @ 0x231360 (0x180 bytes) -- mangled: CommonMoneyBoardDraw__Fiiii
/* ?ret */ void SearchBoardNowPosItemExist(int, int); // @ 0x2314E0 (0xE0 bytes) -- mangled: SearchBoardNowPosItemExist__Fii
/* ?ret */ void GetBoardSpace(int, int *); // @ 0x2315C0 (0x200 bytes) -- mangled: GetBoardSpace__FiPi
/* ?ret */ void SwapItem(ITEM_PACK *, int, int); // @ 0x2317C0 (0x40 bytes) -- mangled: SwapItem__FP9ITEM_PACKii
/* ?ret */ void CompItem(int, int); // @ 0x231800 (0x120 bytes) -- mangled: CompItem__Fii
/* ?ret */ void SeitonItemBoardSub(ITEM_PACK *); // @ 0x231920 (0x120 bytes) -- mangled: SeitonItemBoardSub__FP9ITEM_PACK
/* ?ret */ void SeitonItemBoard(ITEM_PACK *); // @ 0x231A40 (0x90 bytes) -- mangled: SeitonItemBoard__FP9ITEM_PACK
/* ?ret */ void GetAttachKind(int); // @ 0x231AD0 (0xA0 bytes) -- mangled: GetAttachKind__Fi
/* ?ret */ void CompAttach(ATTACH_LIST *, ATTACH_LIST *); // @ 0x231B70 (0x100 bytes) -- mangled: CompAttach__FP11ATTACH_LISTP11ATTACH_LIST
/* ?ret */ void SeitonAttachBoardSub(ATTACH_LIST *); // @ 0x231C70 (0x120 bytes) -- mangled: SeitonAttachBoardSub__FP11ATTACH_LIST__2  // disambiguated by disassembler ("__2" suffix); real retail name has no suffix
/* ?ret */ void SeitonAttachBoard(ATTACH_LIST *); // @ 0x231D90 (0x90 bytes) -- mangled: SeitonAttachBoard__FP11ATTACH_LIST
/* ?ret */ void WhatIsKindofItem(int); // @ 0x231E20 (0x70 bytes) -- mangled: WhatIsKindofItem__Fi
/* ?ret */ void WhoIsWeaponEquip(int); // @ 0x231E90 (0x80 bytes) -- mangled: WhoIsWeaponEquip__Fi
/* ?ret */ void GetWeaponHoleNum(int); // @ 0x231F10 (0xC0 bytes) -- mangled: GetWeaponHoleNum__Fi
/* ?ret */ void GetNowWeaponAttachNum(WEAPON_HAVE *); // @ 0x231FD0 (0xB0 bytes) -- mangled: GetNowWeaponAttachNum__FP11WEAPON_HAVE
/* ?ret */ void GetWeaponMaxExp(WEAPON_HAVE *); // @ 0x232080 (0xB0 bytes) -- mangled: GetWeaponMaxExp__FP11WEAPON_HAVE
/* ?ret */ void GetNowItemNum(short, ITEM_PACK *); // @ 0x232130 (0x90 bytes) -- mangled: GetNowItemNum__FsP9ITEM_PACK
/* ?ret */ void DeleteItemAfterUseItem(short, ITEM_PACK *); // @ 0x2321C0 (0xD0 bytes) -- mangled: DeleteItemAfterUseItem__FsP9ITEM_PACK
/* ?ret */ void GetNowModeMaxNum(int, int *); // @ 0x232290 (0x200 bytes) -- mangled: GetNowModeMaxNum__FiPi
/* ?ret */ void WepDataListToHaveCopy(int, WEAPON_HAVE *); // @ 0x232490 (0x1C0 bytes) -- mangled: WepDataListToHaveCopy__FiP11WEAPON_HAVE
/* ?ret */ void AttachDataListToHaveCopy(int, ATTACH_LIST *); // @ 0x232650 (0x70 bytes) -- mangled: AttachDataListToHaveCopy__FiP11ATTACH_LIST
/* ?ret */ void ItemDataToHaveCopy(int); // @ 0x2326C0 (0x110 bytes) -- mangled: ItemDataToHaveCopy__Fi
/* ?ret */ void DrawFullSizePicture(CTexture *, int, int, int); // @ 0x2327D0 (0x60 bytes) -- mangled: DrawFullSizePicture__FP8CTextureiii
/* ?ret */ void EastKingTextureEnter(void); // @ 0x232830 (0x430 bytes) -- mangled: EastKingTextureEnter__Fv
/* ?ret */ void EastKingMsgDraw(void); // @ 0x232C60 (0x1A0 bytes) -- mangled: EastKingMsgDraw__Fv
/* ?ret */ void GetPrevEastKingSndVol(void); // @ 0x232E00 (0x30 bytes) -- mangled: GetPrevEastKingSndVol__Fv
/* ?ret */ void InitEastKingEvent(int, int *, void /* CW back-ref target unresolved */ *); // @ 0x232E30 (0x1B0 bytes) -- mangled: InitEastKingEvent__FiPiP1
/* ?ret */ void EastKingEventKey(void); // @ 0x232FE0 (0x360 bytes) -- mangled: EastKingEventKey__Fv
/* ?ret */ void EastKingEventDraw(void); // @ 0x233340 (0x1E0 bytes) -- mangled: EastKingEventDraw__Fv
/* ?ret */ void GetNowManualPartTgaNum(void); // @ 0x233520 (0x40 bytes) -- mangled: GetNowManualPartTgaNum__Fv
/* ?ret */ void GetGameFlagForManualMenu(void); // @ 0x233560 (0x70 bytes) -- mangled: GetGameFlagForManualMenu__Fv
/* ?ret */ void ManualImgLoad(void); // @ 0x2335D0 (0x1B0 bytes) -- mangled: ManualImgLoad__Fv
/* ?ret */ void ManualImgEnter(void); // @ 0x233780 (0x310 bytes) -- mangled: ManualImgEnter__Fv
/* ?ret */ void DrawPrevNextCursor(void); // @ 0x233A90 (0x150 bytes) -- mangled: DrawPrevNextCursor__Fv
/* ?ret */ void DrawManualMsg(void); // @ 0x233BE0 (0x1F0 bytes) -- mangled: DrawManualMsg__Fv
/* ?ret */ void InitMenuManual(int *, void /* CW back-ref target unresolved */ *); // @ 0x233DD0 (0x130 bytes) -- mangled: InitMenuManual__FPiP1
/* ?ret */ void SetManualMsgBuffer(void); // @ 0x233F00 (0x590 bytes) -- mangled: SetManualMsgBuffer__Fv
/* ?ret */ void ExitManualMenu(void); // @ 0x234490 (0x90 bytes) -- mangled: ExitManualMenu__Fv
/* ?ret */ void GetNowManualMenuMode(void); // @ 0x234520 (0x10 bytes) -- mangled: GetNowManualMenuMode__Fv
/* ?ret */ void MenuManualKey(void); // @ 0x234530 (0x7A0 bytes) -- mangled: MenuManualKey__Fv
/* ?ret */ void MenuManualDraw(void); // @ 0x234CD0 (0x310 bytes) -- mangled: MenuManualDraw__Fv
/* ?ret */ void BuildMenuCompVolume(char, char); // @ 0x234FE0 (0x70 bytes) -- mangled: BuildMenuCompVolume__Fcc
/* ?ret */ void BuildMenuCompVolume(short, short); // @ 0x235050 (0x70 bytes) -- mangled: BuildMenuCompVolume__Fss
/* ?ret */ void CompareBuildUpModelData2(WEAPON_HAVE *, WEAPON_HAVE *); // @ 0x2350C0 (0x150 bytes) -- mangled: CompareBuildUpModelData2__FP11WEAPON_HAVEP11WEAPON_HAVE
/* ?ret */ void IsLastWeapon(int); // @ 0x235210 (0xB0 bytes) -- mangled: IsLastWeapon__Fi
/* ?ret */ void IsNotBuildUpWeapon(int); // @ 0x2352C0 (0x60 bytes) -- mangled: IsNotBuildUpWeapon__Fi
/* ?ret */ void SetWeaponBuildValue(WEAPON_HAVE *, int); // @ 0x235320 (0x80 bytes) -- mangled: SetWeaponBuildValue__FP11WEAPON_HAVEi
/* ?ret */ void EnableBuildUpModelSpecial(WEP_BUILDUP_INFO *, WEAPON_HAVE *); // @ 0x2353A0 (0xE0 bytes) -- mangled: EnableBuildUpModelSpecial__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE
/* ?ret */ void EnableBuildUpModel(WEP_BUILDUP_INFO *, WEAPON_HAVE *); // @ 0x235480 (0x1D0 bytes) -- mangled: EnableBuildUpModel__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE
