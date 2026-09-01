#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 453

#include "weapon_buildup.hpp"

#include "itemdata.hpp"

INCLUDE_ASM("asm/nonmatchings/weapon_buildup", PersonalBoardWeaponPush__FP9IHAVEITEMi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", PersonalBoardAttachPush__FP9IHAVEITEMi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", PersonalBoardItemGetorSwap__Fi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", PersonalBoardItemCancel__Fv);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", PersonalRetMax__Fi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", DrawPersonalBoard__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", DrawNowEquipWeaponMark__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", CommonIconDraw__Fiiiiiii);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", PersonalBoardDrawWaku__FiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", PersonalBoardOptionDraw__FiiiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", PersonalBoardTagDraw__FiiiP8CTextureii);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", PersonalBoardMaxDraw__FiiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", DrawPersonalBoardBase__FiiiiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", DrawPerBoardDraw__FiiiiiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", CommonTrushDraw__Fiii);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", IsEnableTrushThrow__Fi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", CommonMoneyBoardDraw__Fiiii);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", SearchBoardNowPosItemExist__Fii);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", GetBoardSpace__FiPi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", SwapItem__FP9ITEM_PACKii);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", CompItem__Fii);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", SeitonItemBoardSub__FP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", SeitonItemBoard__FP9ITEM_PACK);

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

INCLUDE_ASM("asm/nonmatchings/weapon_buildup", CompAttach__FP11ATTACH_LISTP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", SeitonAttachBoardSub__FP11ATTACH_LIST__2);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", SeitonAttachBoard__FP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", WhatIsKindofItem__Fi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", WhoIsWeaponEquip__Fi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", GetWeaponHoleNum__Fi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", GetNowWeaponAttachNum__FP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", GetWeaponMaxExp__FP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", GetNowItemNum__FsP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", DeleteItemAfterUseItem__FsP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", GetNowModeMaxNum__FiPi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", WepDataListToHaveCopy__FiP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", AttachDataListToHaveCopy__FiP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", ItemDataToHaveCopy__Fi);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_2113__2);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_354__3);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", DrawFullSizePicture__FP8CTextureiii);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", EastKingTextureEnter__Fv);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_371__4);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", EastKingMsgDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", GetPrevEastKingSndVol__Fv);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", InitEastKingEvent__FiPiP1);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_398__2);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", EastKingEventKey__Fv);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", EastKingEventDraw__Fv);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_453);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_454);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", GetNowManualPartTgaNum__Fv);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", GetGameFlagForManualMenu__Fv);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", ManualImgLoad__Fv);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_479__2);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_480__2);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_489__2);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_496__5);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_497__5);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_498__5);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_499__4);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", ManualImgEnter__Fv);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_505__3);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", DrawPrevNextCursor__Fv);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_535);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", DrawManualMsg__Fv);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", InitMenuManual__FPiP1);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_559__2);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", SetManualMsgBuffer__Fv);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_606__5);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", ExitManualMenu__Fv);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", GetNowManualMenuMode__Fv);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", MenuManualKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_841__2);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_842__2);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_843__3);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_844__2);
INCLUDE_RODATA("asm/nonmatchings/weapon_buildup", LIT_845__2);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", MenuManualDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", BuildMenuCompVolume__Fcc);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", BuildMenuCompVolume__Fss);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", CompareBuildUpModelData2__FP11WEAPON_HAVEP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", IsLastWeapon__Fi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", IsNotBuildUpWeapon__Fi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", SetWeaponBuildValue__FP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", EnableBuildUpModelSpecial__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/weapon_buildup", EnableBuildUpModel__FP16WEP_BUILDUP_INFOP11WEAPON_HAVE);

