#include "menu_draw.hpp"

#include <cstring>

#include "itemdata.hpp"

INCLUDE_ASM("main", SaveMenuKeySaveCheck__Fv);
INCLUDE_ASM("main", SaveMenuKeySaveDecide__Fv);
INCLUDE_ASM("main", SaveMenuKeySave__Fv);
INCLUDE_ASM("main", SaveMenuKeyEndSave__Fv);
INCLUDE_ASM("main", SaveMenuKeyLoadDecide__Fv);
INCLUDE_ASM("main", SaveMenuKeyLoad__Fv);
INCLUDE_ASM("main", SaveMenuKeyArart__Fv);
INCLUDE_ASM("main", SaveMenuKeyNewDirSelect__Fv);
INCLUDE_ASM("main", SaveMenuKeyNewDir__Fv);
INCLUDE_ASM("main", SaveMenuKeyFormat__Fv);
INCLUDE_ASM("main", SaveMenuKeyUnFormat__Fv);
INCLUDE_ASM("main", SaveMenuKeyDifVersion__Fv);
INCLUDE_ASM("main", SaveMenuKeyDelete__Fv);
INCLUDE_ASM("main", SaveMenuKeyCopy__Fv);
INCLUDE_ASM("main", SaveMenuKeyAfterEnding__Fv);
INCLUDE_ASM("main", SaveMenuKeySaveDecideEnding__Fv);
INCLUDE_ASM("main", SaveMenuKeySaveEnding__Fv);
INCLUDE_ASM("main", SaveMenuKeyEndSaveEnding__Fv);
INCLUDE_ASM("main", GetSaveMenuMsgNo__Fv);
INCLUDE_ASM("main", SaveMenuTextureEnter__Fv);
INCLUDE_ASM("main", SaveMenuEffectFadeOut__Fv);
INCLUDE_ASM("main", GetSaveBoardAlphaInfo__FiiRiRii);
INCLUDE_ASM("main", DrawSaveBoard__FP13SAVEDATA_INFOPP8CTextureiiii);
INCLUDE_ASM("main", DrawNewFileTemplete__Fiii);
INCLUDE_ASM("main", InitExistData__Fv);
INCLUDE_ASM("main", SaveEnableCheck__Fv);
INCLUDE_ASM("main", InitEventItemSelect__FiPiP9ITEM_PACKiiii);
INCLUDE_ASM("main", EventItemSelectExit__Fv);
INCLUDE_ASM("main", EventItemSelectLoop__FPi);
INCLUDE_ASM("main", EventItemSelectKey__FPi);
INCLUDE_ASM("main", DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii);
INCLUDE_ASM("main", DrawEventAndFishMenuBoard__FP8CTextureiiii);
INCLUDE_ASM("main", EventItemSelectDraw__Fv);
INCLUDE_ASM("main", DrawEventItemBoard__FiiiiiP8CTexture);
INCLUDE_ASM("main", PlayerAllItemCheck__Fi);
INCLUDE_ASM("main", GetAddAttachItem__Fi);
INCLUDE_ASM("main", TransWepNo__Fi);
INCLUDE_ASM("main", TransWepNoNewToOld__Fi);
INCLUDE_ASM("main", PlusAttachmentVolume__FP11ATTACH_LISTP11ATTACH_LISTf);
INCLUDE_ASM("main", GetWeaponAttachStatusUp__FP11WEAPON_HAVEi);
INCLUDE_ASM("main", SetWeaponAttachStatus__FP11WEAPON_HAVE);
INCLUDE_ASM("main", WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi);
INCLUDE_ASM("main", SetAttachMentValue__FiisP11ATTACH_LIST);
INCLUDE_ASM("main", GetAttachVolumeForMsg__FP11ATTACH_LIST);
INCLUDE_ASM("main", InitDunEnterMenu__Fiii);
INCLUDE_ASM("main", ExitDunEnterMenu__Fv);
INCLUDE_ASM("main", DunEnterMenuLoop__Fv);
INCLUDE_ASM("main", DunEnterMenuKey__Fv);
INCLUDE_ASM("main", DunEnterDraw__Fv);
INCLUDE_ASM("main", DunEnterBoardWaku__Fiii);
INCLUDE_ASM("main", DunEnterBoard__Fiii);
INCLUDE_ASM("main", DrawEnemyNum__Fiiiiii);
INCLUDE_ASM("main", DrawGetAtoraNumBoard__Fiiiiii);
INCLUDE_ASM("main", DrawDunNumberClip__Fiiiiii);
INCLUDE_ASM("main", DrawDunEnterBack__Fi);
INCLUDE_ASM("main", DrawDunEnterFloorName__Fiiiiii);
INCLUDE_ASM("main", StartQuickChange__FP1iPii);
INCLUDE_ASM("main", CharaChangeLoop__Fv);
INCLUDE_ASM("main", CharaChangeKey__Fv);
INCLUDE_ASM("main", CharaChangeDraw__Fv);
INCLUDE_ASM("main", DngActItemModelReadStart__FP1);
INCLUDE_ASM("main", DngActItemModelBuild__Fi);
INCLUDE_ASM("main", DngActiveItemTextureCopy__Fv);
INCLUDE_ASM("main", DngActiveWeaponTextureCopy__Fv);
INCLUDE_ASM("main", GetWeaponMsgNo__FP11WEAPON_HAVE);
INCLUDE_ASM("main", GetWeaponMsgNo2__Fi);
INCLUDE_ASM("main", DrawWepAttach__FiiP11WEAPON_HAVEii);
INCLUDE_ASM("main", GetAtraTipNowHave__Fii);
INCLUDE_ASM("main", GetDispVolumeForFloat__Ff);
INCLUDE_ASM("main", InitItemPolygonView__FiP1);
INCLUDE_ASM("main", EnterItemPolygonView__Fv);
INCLUDE_ASM("main", LocalDrawItemPolygonView__Fv);
INCLUDE_ASM("main", DrawItemPolygonView__Fv);
INCLUDE_ASM("main", ConvDebugSelectToExcelListNo__Fi);
INCLUDE_ASM("main", DebugItemGetKey__Fv);
INCLUDE_ASM("main", DebugItemGetDraw__Fv);
INCLUDE_ASM("main", DrawItemDataView__Fi);
INCLUDE_ASM("main", GetMenuTextureDir__Fv);
INCLUDE_ASM("main", GetMenuLangFlag__Fv);
INCLUDE_ASM("main", GetNowSelectLanguage__Fi);
INCLUDE_ASM("main", GetPathReadDifferntLang__FPc);
INCLUDE_ASM("main", LoadFileBGMenuData__FPcP1);
INCLUDE_ASM("main", LoadFileMenuData__FPcPUi);
INCLUDE_ASM("main", BtlMenuBufferSet__Fi);
INCLUDE_ASM("main", MenuCalcBufAlignment__FP1);
INCLUDE_ASM("main", GetAtoraMaxVillage__Fv);
INCLUDE_ASM("main", GetNowMapTransAtraMap__Fi);
INCLUDE_ASM("main", MenuWorldTrans__FP7CCamera);
INCLUDE_ASM("main", MenuPolygonDraw__FiPFv_v);
INCLUDE_ASM("main", Get3DPosTo2DPos__FP6CFramePi);
INCLUDE_ASM("main", GetMenuCommonFontW__Fii);
INCLUDE_ASM("main", GetMenuCommonPutXY__FP6ClsMesi);
INCLUDE_ASM("main", InitMenuMesSet__FiPs);
INCLUDE_ASM("main", DrawMenuClsMes__FP6ClsMesii);
INCLUDE_ASM("main", ComMenuSePlay__Fi);
INCLUDE_ASM("main", DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i);
INCLUDE_ASM("main", DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci);
INCLUDE_ASM("main", DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA);
INCLUDE_ASM("main", MenuTextureReload__Fi);
INCLUDE_ASM("main", MenuTextureDelete__FPi);
INCLUDE_ASM("main", AllFillBoxForMenu__FUcUcUcUc);
INCLUDE_ASM("main", AllFadeForMenu__Fi);
INCLUDE_ASM("main", FrameImageDraw__Fii);
INCLUDE_ASM("main", DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA);
INCLUDE_ASM("main", DrawMenuSideGradation__FR8CRect_i_P6spRGBAP6spRGBA);
INCLUDE_ASM("main", DrawDontSetItemMark__Fiiiii);
INCLUDE_ASM("main", DrawIconParts__Fiiiiiii);
INCLUDE_ASM("main", DrawAttachNumberOrWeapon__Fiiiiiiii);
INCLUDE_ASM("main", FadeTexX__FiiiiPci);
INCLUDE_ASM("main", RetCTex__FsRiRi);
INCLUDE_ASM("main", MenuTextureClip__FRiRiRiii);
INCLUDE_ASM("main", GetNumberKeta__Fi);
INCLUDE_ASM("main", GetMenuIconInfo__Fi);
INCLUDE_ASM("main", DrawMainMenuIcon__Fiiiiii);
INCLUDE_ASM("main", DrawMenuVibeItem__Fiiiii);
INCLUDE_ASM("main", GetMainMenuRightHelpWinLangOffset__FRfRfRfRf);
INCLUDE_ASM("main", GetMainMenuRightHelpMsgLangOffset__FRiRi);
INCLUDE_ASM("main", InitHaveData__FP9IHAVEITEM);
INCLUDE_ASM("main", InitHaveWep__FP11WEAPON_HAVE);
INCLUDE_ASM("main", InitHaveAttach__FP11ATTACH_LIST);

void MenuDataSwap(s16 *first, s16 *second) {
    s16 temp;

    if ((first == NULL) || (second == NULL)) {
        return;
    }

    temp    = *first;
    *first  = *second;
    *second = temp;
}

void MenuDataSwap(int *first, int *second) {
    int temp;

    if ((first == NULL) || (second == NULL)) {
        return;
    }

    temp    = *first;
    *first  = *second;
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

INCLUDE_ASM("main", SetMenuTrushMark__FP9ITEM_PACK);
INCLUDE_ASM("main", DeleteMenuTrushMark__Fv);
INCLUDE_ASM("main", InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii);
INCLUDE_ASM("main", BoardModeChangeKey__Fv);
INCLUDE_ASM("main", PersonalBoardLimmitCheck__Fv);
INCLUDE_ASM("main", PersonalBoardKeySub__Fv);
INCLUDE_ASM("main", PersonalBoardKey__Fv);
INCLUDE_ASM("main", PersonalBoardItemPush__FP9IHAVEITEMi);

INCLUDE_RODATA("main", LIT_3063);
INCLUDE_RODATA("main", LIT_3062);
INCLUDE_RODATA("main", LIT_3066);
INCLUDE_RODATA("main", LIT_3068);
INCLUDE_RODATA("main", LIT_3069);
INCLUDE_RODATA("main", LIT_3070);
INCLUDE_RODATA("main", LIT_3080);
INCLUDE_RODATA("main", LIT_3081);
INCLUDE_RODATA("main", LIT_3082);
INCLUDE_RODATA("main", LIT_3094);
INCLUDE_RODATA("main", LIT_3095);
INCLUDE_RODATA("main", LIT_3336);
INCLUDE_RODATA("main", LIT_3413);
INCLUDE_RODATA("main", LIT_3427);
INCLUDE_RODATA("main", LIT_3428);
INCLUDE_RODATA("main", LIT_3429);
INCLUDE_RODATA("main", LIT_3430);
INCLUDE_RODATA("main", LIT_3548);
INCLUDE_RODATA("main", LIT_3549);
INCLUDE_RODATA("main", LIT_3550);
INCLUDE_RODATA("main", LIT_3551);
INCLUDE_RODATA("main", LIT_3552);
INCLUDE_RODATA("main", LIT_3553);
INCLUDE_RODATA("main", LIT_3554);
INCLUDE_RODATA("main", LIT_3735);
INCLUDE_RODATA("main", LIT_3736);
INCLUDE_RODATA("main", LIT_638__3);
INCLUDE_RODATA("main", LIT_639__4);
INCLUDE_RODATA("main", LIT_762__2);
INCLUDE_RODATA("main", LIT_763__3);
INCLUDE_RODATA("main", LIT_764__2);
INCLUDE_RODATA("main", LIT_765__2);
INCLUDE_RODATA("main", LIT_776__3);
INCLUDE_RODATA("main", LIT_843__2);
INCLUDE_RODATA("main", LIT_844);
INCLUDE_RODATA("main", LIT_845);
INCLUDE_RODATA("main", LIT_846);
INCLUDE_RODATA("main", LIT_847);
INCLUDE_RODATA("main", LIT_1255__2);
INCLUDE_RODATA("main", LIT_1301);
INCLUDE_RODATA("main", LIT_1348__2);
INCLUDE_RODATA("main", LIT_1349);
INCLUDE_RODATA("main", LIT_1350__3);
INCLUDE_RODATA("main", LIT_1373);
INCLUDE_RODATA("main", LIT_1374);
INCLUDE_RODATA("main", LIT_1375);
INCLUDE_RODATA("main", LIT_1523__3);
INCLUDE_RODATA("main", LIT_1663);
INCLUDE_RODATA("main", LIT_1664__2);
INCLUDE_RODATA("main", LIT_1728__2);
INCLUDE_RODATA("main", LIT_1841);
INCLUDE_RODATA("main", LIT_2044);
INCLUDE_RODATA("main", LIT_2045);
INCLUDE_RODATA("main", LIT_2046);
INCLUDE_RODATA("main", LIT_2047);
INCLUDE_RODATA("main", LIT_2048);
INCLUDE_RODATA("main", LIT_2049);
INCLUDE_RODATA("main", LIT_2050);
INCLUDE_RODATA("main", LIT_2051);
INCLUDE_RODATA("main", LIT_2140__2);
INCLUDE_RODATA("main", LIT_553);
INCLUDE_RODATA("main", LIT_554__2);
INCLUDE_RODATA("main", LIT_555);
INCLUDE_RODATA("main", LIT_556);
INCLUDE_RODATA("main", LIT_557);
INCLUDE_RODATA("main", LIT_558);
INCLUDE_RODATA("main", LIT_559);
INCLUDE_RODATA("main", LIT_692__3);
INCLUDE_RODATA("main", LIT_728__6);
INCLUDE_RODATA("main", LIT_764__3);
INCLUDE_RODATA("main", LIT_852__4);
INCLUDE_RODATA("main", LIT_981);
INCLUDE_RODATA("main", LIT_994__2);
INCLUDE_RODATA("main", LIT_1073);
INCLUDE_RODATA("main", LIT_1300);
