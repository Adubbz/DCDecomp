#include "weapon_buildup.hpp"

#include "itemdata.hpp"

INCLUDE_ASM("main", PersonalBoardWeaponPush__FP9IHAVEITEMi);
INCLUDE_ASM("main", PersonalBoardAttachPush__FP9IHAVEITEMi);
INCLUDE_ASM("main", PersonalBoardItemGetorSwap__Fi);
INCLUDE_ASM("main", PersonalBoardItemCancel__Fv);
INCLUDE_ASM("main", PersonalRetMax__Fi);
INCLUDE_ASM("main", DrawPersonalBoard__Fiiiii);
INCLUDE_ASM("main", DrawNowEquipWeaponMark__Fiiiii);
INCLUDE_ASM("main", CommonIconDraw__Fiiiiiii);
INCLUDE_ASM("main", PersonalBoardDrawWaku__FiiP8CTexturei);
INCLUDE_ASM("main", PersonalBoardOptionDraw__FiiiiP8CTexturei);
INCLUDE_ASM("main", PersonalBoardTagDraw__FiiiP8CTextureii);
INCLUDE_ASM("main", PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei);
INCLUDE_ASM("main", PersonalBoardMaxDraw__FiiiP8CTexturei);
INCLUDE_ASM("main", DrawPersonalBoardBase__FiiiiiP8CTexturei);
INCLUDE_ASM("main", DrawPerBoardDraw__FiiiiiiP8CTexturei);
INCLUDE_ASM("main", CommonTrushDraw__Fiii);
INCLUDE_ASM("main", IsEnableTrushThrow__Fi);
INCLUDE_ASM("main", CommonMoneyBoardDraw__Fiiii);
INCLUDE_ASM("main", SearchBoardNowPosItemExist__Fii);
INCLUDE_ASM("main", GetBoardSpace__FiPi);
INCLUDE_ASM("main", SwapItem__FP9ITEM_PACKii);
INCLUDE_ASM("main", CompItem__Fii);
INCLUDE_ASM("main", SeitonItemBoardSub__FP9ITEM_PACK);
INCLUDE_ASM("main", SeitonItemBoard__FP9ITEM_PACK);

int GetAttachKind(int item_no) {
    if ((item_no >= ITEM_ATTACH_START) && (item_no < ITEM_ATTACH_ATTACK)) {
        return ATTACHKIND_ELEMENT;
    }

    if ((item_no >= ITEM_ATTACH_ATTACK) && (item_no < ITEM_ATTACH_AMETHYST)) {
        return ATTACHKIND_STAT;
    }

    if ((item_no >= ITEM_ATTACH_AMETHYST) && (item_no < 110)) {
        return ATTACHKIND_GEM;
    }

    if ((item_no >= ITEM_ATTACH_DINOSLAYER) && (item_no < 122)) {
        return ATTACHKIND_SLAYER;
    }

    return ATTACHKIND_OTHER;
}

INCLUDE_ASM("main", CompAttach__FP11ATTACH_LISTP11ATTACH_LIST);
INCLUDE_ASM("main", SeitonAttachBoardSub__FP11ATTACH_LIST__2);
INCLUDE_ASM("main", SeitonAttachBoard__FP11ATTACH_LIST);
INCLUDE_ASM("main", WhatIsKindofItem__Fi);
INCLUDE_ASM("main", WhoIsWeaponEquip__Fi);
INCLUDE_ASM("main", GetWeaponHoleNum__Fi);
INCLUDE_ASM("main", GetNowWeaponAttachNum__FP11WEAPON_HAVE);
INCLUDE_ASM("main", GetWeaponMaxExp__FP11WEAPON_HAVE);
INCLUDE_ASM("main", GetNowItemNum__FsP9ITEM_PACK);
INCLUDE_ASM("main", DeleteItemAfterUseItem__FsP9ITEM_PACK);
INCLUDE_ASM("main", GetNowModeMaxNum__FiPi);
INCLUDE_ASM("main", WepDataListToHaveCopy__FiP11WEAPON_HAVE);
INCLUDE_ASM("main", AttachDataListToHaveCopy__FiP11ATTACH_LIST);
INCLUDE_ASM("main", ItemDataToHaveCopy__Fi);
INCLUDE_ASM("main", DrawFullSizePicture__FP8CTextureiii);
INCLUDE_ASM("main", EastKingTextureEnter__Fv);
INCLUDE_ASM("main", EastKingMsgDraw__Fv);
INCLUDE_ASM("main", GetPrevEastKingSndVol__Fv);
INCLUDE_ASM("main", InitEastKingEvent__FiPiP1);
INCLUDE_ASM("main", EastKingEventKey__Fv);
INCLUDE_ASM("main", EastKingEventDraw__Fv);
INCLUDE_ASM("main", GetNowManualPartTgaNum__Fv);
INCLUDE_ASM("main", GetGameFlagForManualMenu__Fv);
INCLUDE_ASM("main", ManualImgLoad__Fv);
INCLUDE_ASM("main", ManualImgEnter__Fv);
INCLUDE_ASM("main", DrawPrevNextCursor__Fv);
INCLUDE_ASM("main", DrawManualMsg__Fv);
INCLUDE_ASM("main", InitMenuManual__FPiP1);
INCLUDE_ASM("main", SetManualMsgBuffer__Fv);
INCLUDE_ASM("main", ExitManualMenu__Fv);
INCLUDE_ASM("main", GetNowManualMenuMode__Fv);
INCLUDE_ASM("main", MenuManualKey__Fv);
INCLUDE_ASM("main", MenuManualDraw__Fv);
INCLUDE_ASM("main", BuildMenuCompVolume__Fcc);
INCLUDE_ASM("main", BuildMenuCompVolume__Fss);
INCLUDE_ASM("main", CompareBuildUpModelData2__FP11WEAPON_HAVEP11WEAPON_HAVE);
INCLUDE_ASM("main", IsLastWeapon__Fi);
INCLUDE_ASM("main", IsNotBuildUpWeapon__Fi);
INCLUDE_ASM("main", SetWeaponBuildValue__FP11WEAPON_HAVEi);
INCLUDE_ASM("main", EnableBuildUpModelSpecial__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE);
INCLUDE_ASM("main", EnableBuildUpModel__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE);

INCLUDE_RODATA("main", LIT_1416__2);
INCLUDE_RODATA("main", LIT_1559__2);
INCLUDE_RODATA("main", LIT_2113__2);
INCLUDE_RODATA("main", LIT_354__3);
INCLUDE_RODATA("main", LIT_371__4);
INCLUDE_RODATA("main", LIT_398__2);
INCLUDE_RODATA("main", LIT_453);
INCLUDE_RODATA("main", LIT_454);
INCLUDE_RODATA("main", LIT_479__2);
INCLUDE_RODATA("main", LIT_480__2);
INCLUDE_RODATA("main", LIT_489__2);
INCLUDE_RODATA("main", LIT_496__5);
INCLUDE_RODATA("main", LIT_497__5);
INCLUDE_RODATA("main", LIT_498__5);
INCLUDE_RODATA("main", LIT_499__4);
INCLUDE_RODATA("main", LIT_505__3);
INCLUDE_RODATA("main", LIT_535);
INCLUDE_RODATA("main", LIT_559__2);
INCLUDE_RODATA("main", LIT_606__5);
INCLUDE_RODATA("main", LIT_736__3);
INCLUDE_RODATA("main", LIT_841__2);
INCLUDE_RODATA("main", LIT_842__2);
INCLUDE_RODATA("main", LIT_843__3);
INCLUDE_RODATA("main", LIT_844__2);
INCLUDE_RODATA("main", LIT_845__2);
INCLUDE_RODATA("main", LIT_857);
INCLUDE_RODATA("main", LIT_858);
INCLUDE_RODATA("main", LIT_949__2);
