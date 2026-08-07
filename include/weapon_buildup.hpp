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

/**
 * @mangled PersonalBoardWeaponPush__FP9IHAVEITEMi
 * @address 0x22F0A0
 * @size 0x350
 * @unknownret
 */
void PersonalBoardWeaponPush(IHAVEITEM *, int);

/**
 * @mangled PersonalBoardAttachPush__FP9IHAVEITEMi
 * @address 0x22F3F0
 * @size 0xE0
 * @unknownret
 */
void PersonalBoardAttachPush(IHAVEITEM *, int);

/**
 * @mangled PersonalBoardItemGetorSwap__Fi
 * @address 0x22F4D0
 * @size 0x80
 * @unknownret
 */
void PersonalBoardItemGetorSwap(int);

/**
 * @mangled PersonalBoardItemCancel__Fv
 * @address 0x22F550
 * @size 0x210
 * @unknownret
 */
void PersonalBoardItemCancel(void);

/**
 * @mangled PersonalRetMax__Fi
 * @address 0x22F760
 * @size 0x70
 * @unknownret
 */
void PersonalRetMax(int);

/**
 * @mangled DrawPersonalBoard__Fiiiii
 * @address 0x22F7D0
 * @size 0x200
 * @unknownret
 */
void DrawPersonalBoard(int, int, int, int, int);

/**
 * @mangled DrawNowEquipWeaponMark__Fiiiii
 * @address 0x22F9D0
 * @size 0x100
 * @unknownret
 */
void DrawNowEquipWeaponMark(int, int, int, int, int);

/**
 * @mangled CommonIconDraw__Fiiiiiii
 * @address 0x22FAD0
 * @size 0x4F0
 * @unknownret
 */
void CommonIconDraw(int, int, int, int, int, int, int);

/**
 * @mangled PersonalBoardDrawWaku__FiiP8CTexturei
 * @address 0x22FFC0
 * @size 0x180
 * @unknownret
 */
void PersonalBoardDrawWaku(int, int, CTexture *, int);

/**
 * @mangled PersonalBoardOptionDraw__FiiiiP8CTexturei
 * @address 0x230140
 * @size 0xD0
 * @unknownret
 */
void PersonalBoardOptionDraw(int, int, int, int, CTexture *, int);

/**
 * @mangled PersonalBoardTagDraw__FiiiP8CTextureii
 * @address 0x230210
 * @size 0x510
 * @unknownret
 */
void PersonalBoardTagDraw(int, int, int, CTexture *, int, int);

/**
 * @mangled PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei
 * @address 0x230720
 * @size 0x2A0
 * @unknownret
 */
void PersonalBoardScrlBarDraw(int, int, int, float &, unsigned char, CTexture *, int);

/**
 * @mangled PersonalBoardMaxDraw__FiiiP8CTexturei
 * @address 0x2309C0
 * @size 0x240
 * @unknownret
 */
void PersonalBoardMaxDraw(int, int, int, CTexture *, int);

/**
 * @mangled DrawPersonalBoardBase__FiiiiiP8CTexturei
 * @address 0x230C00
 * @size 0x1C0
 * @unknownret
 */
void DrawPersonalBoardBase(int, int, int, int, int, CTexture *, int);

/**
 * @mangled DrawPerBoardDraw__FiiiiiiP8CTexturei
 * @address 0x230DC0
 * @size 0x2A0
 * @unknownret
 */
void DrawPerBoardDraw(int, int, int, int, int, int, CTexture *, int);

/**
 * @mangled CommonTrushDraw__Fiii
 * @address 0x231060
 * @size 0x140
 * @unknownret
 */
void CommonTrushDraw(int, int, int);

/**
 * @mangled IsEnableTrushThrow__Fi
 * @address 0x2311A0
 * @size 0x1C0
 * @unknownret
 */
void IsEnableTrushThrow(int);

/**
 * @mangled CommonMoneyBoardDraw__Fiiii
 * @address 0x231360
 * @size 0x180
 * @unknownret
 */
void CommonMoneyBoardDraw(int, int, int, int);

/**
 * @mangled SearchBoardNowPosItemExist__Fii
 * @address 0x2314E0
 * @size 0xE0
 * @unknownret
 */
void SearchBoardNowPosItemExist(int, int);

/**
 * @mangled GetBoardSpace__FiPi
 * @address 0x2315C0
 * @size 0x200
 * @unknownret
 */
void GetBoardSpace(int, int *);

/**
 * @mangled SwapItem__FP9ITEM_PACKii
 * @address 0x2317C0
 * @size 0x40
 * @unknownret
 */
void SwapItem(ITEM_PACK *, int, int);

/**
 * @mangled CompItem__Fii
 * @address 0x231800
 * @size 0x120
 * @unknownret
 */
void CompItem(int, int);

/**
 * @mangled SeitonItemBoardSub__FP9ITEM_PACK
 * @address 0x231920
 * @size 0x120
 * @unknownret
 */
void SeitonItemBoardSub(ITEM_PACK *);

/**
 * @mangled SeitonItemBoard__FP9ITEM_PACK
 * @address 0x231A40
 * @size 0x90
 * @unknownret
 */
void SeitonItemBoard(ITEM_PACK *);

/**
 * Returns the sort category an attachment identifier falls in.
 *
 * The result is an AttachKind; that enum carries the ranges and the two
 * places they do not line up with what the items are.
 *
 * @mangled GetAttachKind__Fi
 * @address 0x231AD0
 * @size 0xA0
 */
int GetAttachKind(int item_no);

/**
 * @mangled CompAttach__FP11ATTACH_LISTP11ATTACH_LIST
 * @address 0x231B70
 * @size 0x100
 * @unknownret
 */
void CompAttach(ATTACH_LIST *, ATTACH_LIST *);

/**
 * @mangled SeitonAttachBoard__FP11ATTACH_LIST
 * @address 0x231D90
 * @size 0x90
 * @unknownret
 */
void SeitonAttachBoard(ATTACH_LIST *);

/**
 * @mangled WhatIsKindofItem__Fi
 * @address 0x231E20
 * @size 0x70
 * @unknownret
 */
void WhatIsKindofItem(int);

/**
 * @mangled WhoIsWeaponEquip__Fi
 * @address 0x231E90
 * @size 0x80
 * @unknownret
 */
void WhoIsWeaponEquip(int);

/**
 * @mangled GetWeaponHoleNum__Fi
 * @address 0x231F10
 * @size 0xC0
 * @unknownret
 */
void GetWeaponHoleNum(int);

/**
 * @mangled GetNowWeaponAttachNum__FP11WEAPON_HAVE
 * @address 0x231FD0
 * @size 0xB0
 * @unknownret
 */
void GetNowWeaponAttachNum(WEAPON_HAVE *);

/**
 * @mangled GetWeaponMaxExp__FP11WEAPON_HAVE
 * @address 0x232080
 * @size 0xB0
 * @unknownret
 */
void GetWeaponMaxExp(WEAPON_HAVE *);

/**
 * @mangled GetNowItemNum__FsP9ITEM_PACK
 * @address 0x232130
 * @size 0x90
 * @unknownret
 */
void GetNowItemNum(short, ITEM_PACK *);

/**
 * @mangled DeleteItemAfterUseItem__FsP9ITEM_PACK
 * @address 0x2321C0
 * @size 0xD0
 * @unknownret
 */
void DeleteItemAfterUseItem(short, ITEM_PACK *);

/**
 * @mangled GetNowModeMaxNum__FiPi
 * @address 0x232290
 * @size 0x200
 * @unknownret
 */
void GetNowModeMaxNum(int, int *);

/**
 * @mangled WepDataListToHaveCopy__FiP11WEAPON_HAVE
 * @address 0x232490
 * @size 0x1C0
 * @unknownret
 */
void WepDataListToHaveCopy(int, WEAPON_HAVE *);

/**
 * @mangled AttachDataListToHaveCopy__FiP11ATTACH_LIST
 * @address 0x232650
 * @size 0x70
 * @unknownret
 */
void AttachDataListToHaveCopy(int, ATTACH_LIST *);

/**
 * @mangled ItemDataToHaveCopy__Fi
 * @address 0x2326C0
 * @size 0x110
 * @unknownret
 */
void ItemDataToHaveCopy(int);

/**
 * @mangled DrawFullSizePicture__FP8CTextureiii
 * @address 0x2327D0
 * @size 0x60
 * @unknownret
 */
void DrawFullSizePicture(CTexture *, int, int, int);

/**
 * @mangled EastKingTextureEnter__Fv
 * @address 0x232830
 * @size 0x430
 * @unknownret
 */
void EastKingTextureEnter(void);

/**
 * @mangled EastKingMsgDraw__Fv
 * @address 0x232C60
 * @size 0x1A0
 * @unknownret
 */
void EastKingMsgDraw(void);

/**
 * @mangled GetPrevEastKingSndVol__Fv
 * @address 0x232E00
 * @size 0x30
 * @unknownret
 */
void GetPrevEastKingSndVol(void);

/**
 * @mangled InitEastKingEvent__FiPiP1
 * @address 0x232E30
 * @size 0x1B0
 * @unknownret
 */
void InitEastKingEvent(int, int *, void /* CW back-ref target unresolved */ *);

/**
 * @mangled EastKingEventKey__Fv
 * @address 0x232FE0
 * @size 0x360
 * @unknownret
 */
void EastKingEventKey(void);

/**
 * @mangled EastKingEventDraw__Fv
 * @address 0x233340
 * @size 0x1E0
 * @unknownret
 */
void EastKingEventDraw(void);

/**
 * @mangled GetNowManualPartTgaNum__Fv
 * @address 0x233520
 * @size 0x40
 * @unknownret
 */
void GetNowManualPartTgaNum(void);

/**
 * @mangled GetGameFlagForManualMenu__Fv
 * @address 0x233560
 * @size 0x70
 * @unknownret
 */
void GetGameFlagForManualMenu(void);

/**
 * @mangled ManualImgLoad__Fv
 * @address 0x2335D0
 * @size 0x1B0
 * @unknownret
 */
void ManualImgLoad(void);

/**
 * @mangled ManualImgEnter__Fv
 * @address 0x233780
 * @size 0x310
 * @unknownret
 */
void ManualImgEnter(void);

/**
 * @mangled DrawPrevNextCursor__Fv
 * @address 0x233A90
 * @size 0x150
 * @unknownret
 */
void DrawPrevNextCursor(void);

/**
 * @mangled DrawManualMsg__Fv
 * @address 0x233BE0
 * @size 0x1F0
 * @unknownret
 */
void DrawManualMsg(void);

/**
 * @mangled InitMenuManual__FPiP1
 * @address 0x233DD0
 * @size 0x130
 * @unknownret
 */
void InitMenuManual(int *, void /* CW back-ref target unresolved */ *);

/**
 * @mangled SetManualMsgBuffer__Fv
 * @address 0x233F00
 * @size 0x590
 * @unknownret
 */
void SetManualMsgBuffer(void);

/**
 * @mangled ExitManualMenu__Fv
 * @address 0x234490
 * @size 0x90
 * @unknownret
 */
void ExitManualMenu(void);

/**
 * @mangled GetNowManualMenuMode__Fv
 * @address 0x234520
 * @size 0x10
 * @unknownret
 */
void GetNowManualMenuMode(void);

/**
 * @mangled MenuManualKey__Fv
 * @address 0x234530
 * @size 0x7A0
 * @unknownret
 */
void MenuManualKey(void);

/**
 * @mangled MenuManualDraw__Fv
 * @address 0x234CD0
 * @size 0x310
 * @unknownret
 */
void MenuManualDraw(void);

/**
 * @mangled BuildMenuCompVolume__Fcc
 * @address 0x234FE0
 * @size 0x70
 * @unknownret
 */
void BuildMenuCompVolume(char, char);

/**
 * @mangled BuildMenuCompVolume__Fss
 * @address 0x235050
 * @size 0x70
 * @unknownret
 */
void BuildMenuCompVolume(short, short);

/**
 * @mangled CompareBuildUpModelData2__FP11WEAPON_HAVEP11WEAPON_HAVE
 * @address 0x2350C0
 * @size 0x150
 * @unknownret
 */
void CompareBuildUpModelData2(WEAPON_HAVE *, WEAPON_HAVE *);

/**
 * @mangled IsLastWeapon__Fi
 * @address 0x235210
 * @size 0xB0
 * @unknownret
 */
void IsLastWeapon(int);

/**
 * @mangled IsNotBuildUpWeapon__Fi
 * @address 0x2352C0
 * @size 0x60
 * @unknownret
 */
void IsNotBuildUpWeapon(int);

/**
 * @mangled SetWeaponBuildValue__FP11WEAPON_HAVEi
 * @address 0x235320
 * @size 0x80
 * @unknownret
 */
void SetWeaponBuildValue(WEAPON_HAVE *, int);

/**
 * @mangled EnableBuildUpModelSpecial__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE
 * @address 0x2353A0
 * @size 0xE0
 * @unknownret
 */
void EnableBuildUpModelSpecial(WEP_BUILDUP_INFO *, WEAPON_HAVE *);

/**
 * @mangled EnableBuildUpModel__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE
 * @address 0x235480
 * @size 0x1D0
 * @unknownret
 */
void EnableBuildUpModel(WEP_BUILDUP_INFO *, WEAPON_HAVE *);
