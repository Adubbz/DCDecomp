#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 553

#include "menu_draw.hpp"

#include <cstring>

#include "itemdata.hpp"
#include "menu_inventory.hpp"

INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeySaveCheck__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeySaveDecide__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeySave__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyEndSave__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyLoadDecide__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyLoad__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyArart__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyNewDirSelect__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyNewDir__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyFormat__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyUnFormat__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyDifVersion__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyDelete__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyCopy__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyAfterEnding__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeySaveDecideEnding__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeySaveEnding__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyEndSaveEnding__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetSaveMenuMsgNo__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3066);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3068);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3069);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3070);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3080);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3081);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3082);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuTextureEnter__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3094);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3095);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuEffectFadeOut__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetSaveBoardAlphaInfo__FiiRiRii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawSaveBoard__FP13SAVEDATA_INFOPP8CTextureiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawNewFileTemplete__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitExistData__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3336);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3413);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveEnableCheck__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitEventItemSelect__FiPiP9ITEM_PACKiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3427);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3428);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3429);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3430);
INCLUDE_ASM("asm/nonmatchings/menu_draw", EventItemSelectExit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", EventItemSelectLoop__FPi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", EventItemSelectKey__FPi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3548);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3549);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3550);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3551);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3552);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3553);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3554);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawEventAndFishMenuBoard__FP8CTextureiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", EventItemSelectDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawEventItemBoard__FiiiiiP8CTexture);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PlayerAllItemCheck__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetAddAttachItem__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", TransWepNo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", TransWepNoNewToOld__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3735);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_3736);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PlusAttachmentVolume__FP11ATTACH_LISTP11ATTACH_LISTf);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetWeaponAttachStatusUp__FP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SetWeaponAttachStatus__FP11WEAPON_HAVE);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_638__3);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_639__4);
INCLUDE_ASM("asm/nonmatchings/menu_draw", WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SetAttachMentValue__FiisP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetAttachVolumeForMsg__FP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitDunEnterMenu__Fiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_762__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_763__3);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_764__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_765__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_776__3);
INCLUDE_ASM("asm/nonmatchings/menu_draw", ExitDunEnterMenu__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DunEnterMenuLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DunEnterMenuKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_843__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_844);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_845);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_846);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_847);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DunEnterDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DunEnterBoardWaku__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DunEnterBoard__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawEnemyNum__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawGetAtoraNumBoard__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawDunNumberClip__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawDunEnterBack__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1255__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1301);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawDunEnterFloorName__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", StartQuickChange__FP1iPii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1348__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1349);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1350__3);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CharaChangeLoop__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1373);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1374);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1375);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CharaChangeKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CharaChangeDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DngActItemModelReadStart__FP1);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1663);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1664__2);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DngActItemModelBuild__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DngActiveItemTextureCopy__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1728__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1841);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_2044);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_2045);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_2046);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_2047);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_2048);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_2049);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_2050);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_2051);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DngActiveWeaponTextureCopy__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetWeaponMsgNo__FP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetWeaponMsgNo2__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawWepAttach__FiiP11WEAPON_HAVEii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetAtraTipNowHave__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetDispVolumeForFloat__Ff);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitItemPolygonView__FiP1);
INCLUDE_ASM("asm/nonmatchings/menu_draw", EnterItemPolygonView__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", LocalDrawItemPolygonView__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawItemPolygonView__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", ConvDebugSelectToExcelListNo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DebugItemGetKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DebugItemGetDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawItemDataView__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_2140__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_553);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_554__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_555);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_556);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_557);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_558);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_559);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMenuTextureDir__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMenuLangFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNowSelectLanguage__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetPathReadDifferntLang__FPc);
INCLUDE_ASM("asm/nonmatchings/menu_draw", LoadFileBGMenuData__FPcP1);
INCLUDE_ASM("asm/nonmatchings/menu_draw", LoadFileMenuData__FPcPUi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", BtlMenuBufferSet__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", MenuCalcBufAlignment__FP1);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetAtoraMaxVillage__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNowMapTransAtraMap__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", MenuWorldTrans__FP7CCamera);
INCLUDE_ASM("asm/nonmatchings/menu_draw", MenuPolygonDraw__FiPFv_v);
INCLUDE_ASM("asm/nonmatchings/menu_draw", Get3DPosTo2DPos__FP6CFramePi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMenuCommonFontW__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMenuCommonPutXY__FP6ClsMesi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitMenuMesSet__FiPs);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenuClsMes__FP6ClsMesii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", ComMenuSePlay__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/menu_draw", MenuTextureReload__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", MenuTextureDelete__FPi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_728__6);
INCLUDE_ASM("asm/nonmatchings/menu_draw", AllFillBoxForMenu__FUcUcUcUc);
INCLUDE_ASM("asm/nonmatchings/menu_draw", AllFadeForMenu__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", FrameImageDraw__Fii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_764__3);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenuSideGradation__FR8CRect_i_P6spRGBAP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawDontSetItemMark__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawIconParts__Fiiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawAttachNumberOrWeapon__Fiiiiiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_852__4);
INCLUDE_ASM("asm/nonmatchings/menu_draw", FadeTexX__FiiiiPci);
INCLUDE_ASM("asm/nonmatchings/menu_draw", RetCTex__FsRiRi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", MenuTextureClip__FRiRiRiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNumberKeta__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMenuIconInfo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMainMenuIcon__Fiiiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_981);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenuVibeItem__Fiiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_994__2);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMainMenuRightHelpWinLangOffset__FRfRfRfRf);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMainMenuRightHelpMsgLangOffset__FRiRi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitHaveData__FP9IHAVEITEM);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitHaveWep__FP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitHaveAttach__FP11ATTACH_LIST);

void MenuDataSwap(s16 *first, s16 *second) {
    s16 temp;

    if ((first == NULL) || (second == NULL)) {
        return;
    }

    temp = *first;
    *first = *second;
    *second = temp;
}

void MenuDataSwap(int *first, int *second) {
    int temp;

    if ((first == NULL) || (second == NULL)) {
        return;
    }

    temp = *first;
    *first = *second;
    *second = temp;
}

void MenuDataSwap(WEAPON_HAVE *first, WEAPON_HAVE *second) {
    WEAPON_HAVE temp;

    if ((first == NULL) || (second == NULL)) {
        return;
    }

    memcpy(&temp, first, sizeof(WEAPON_HAVE));
    memcpy(first, second, sizeof(WEAPON_HAVE));
    memcpy(second, &temp, sizeof(WEAPON_HAVE));
}

void MenuDataSwap(ATTACH_LIST *first, ATTACH_LIST *second) {
    ATTACH_LIST temp;

    if ((first == NULL) || (second == NULL)) {
        return;
    }

    memcpy(&temp, first, sizeof(ATTACH_LIST));
    memcpy(first, second, sizeof(ATTACH_LIST));
    memcpy(second, &temp, sizeof(ATTACH_LIST));
}

INCLUDE_ASM("asm/nonmatchings/menu_draw", SetMenuTrushMark__FP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DeleteMenuTrushMark__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_1073);
INCLUDE_ASM("asm/nonmatchings/menu_draw", BoardModeChangeKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardLimmitCheck__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardKeySub__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardItemPush__FP9IHAVEITEMi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardWeaponPush__FP9IHAVEITEMi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardAttachPush__FP9IHAVEITEMi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardItemGetorSwap__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardItemCancel__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalRetMax__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawPersonalBoard__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawNowEquipWeaponMark__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CommonIconDraw__Fiiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardDrawWaku__FiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardOptionDraw__FiiiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardTagDraw__FiiiP8CTextureii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardMaxDraw__FiiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawPersonalBoardBase__FiiiiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawPerBoardDraw__FiiiiiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CommonTrushDraw__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", IsEnableTrushThrow__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CommonMoneyBoardDraw__Fiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SearchBoardNowPosItemExist__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetBoardSpace__FiPi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SwapItem__FP9ITEM_PACKii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CompItem__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SeitonItemBoardSub__FP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SeitonItemBoard__FP9ITEM_PACK);

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

INCLUDE_ASM("asm/nonmatchings/menu_draw", CompAttach__FP11ATTACH_LISTP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SeitonAttachBoardSub__FP11ATTACH_LIST__2);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SeitonAttachBoard__FP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/menu_draw", WhatIsKindofItem__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", WhoIsWeaponEquip__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetWeaponHoleNum__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNowWeaponAttachNum__FP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetWeaponMaxExp__FP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNowItemNum__FsP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DeleteItemAfterUseItem__FsP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNowModeMaxNum__FiPi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", WepDataListToHaveCopy__FiP11WEAPON_HAVE);
INCLUDE_ASM("asm/nonmatchings/menu_draw", AttachDataListToHaveCopy__FiP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/menu_draw", ItemDataToHaveCopy__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", LIT_2113__2);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawFullSizePicture__FP8CTextureiii);
