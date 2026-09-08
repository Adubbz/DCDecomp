#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 553

#include "menu_draw.hpp"

#include <cstring>

#include "camera.hpp"
#include "clsmes.hpp"
#include "itemdata.hpp"
#include "menu_inventory.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "snd.hpp"

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
s32 SaveMenuKeyDelete(void) {
    return 1;
}
s32 SaveMenuKeyCopy(void) {
    return 1;
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyAfterEnding__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeySaveDecideEnding__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeySaveEnding__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuKeyEndSaveEnding__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetSaveMenuMsgNo__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3066);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3068);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3069);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3070);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3080);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3081);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3082);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuTextureEnter__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3094);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3095);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveMenuEffectFadeOut__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetSaveBoardAlphaInfo__FiiRiRii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawSaveBoard__FP13SAVEDATA_INFOPP8CTextureiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawNewFileTemplete__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitExistData__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3336);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3413);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SaveEnableCheck__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitEventItemSelect__FiPiP9ITEM_PACKiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3427);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3428);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3429);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3430);
INCLUDE_ASM("asm/nonmatchings/menu_draw", EventItemSelectExit__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", EventItemSelectLoop__FPi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", EventItemSelectKey__FPi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3548);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3549);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3550);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3551);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3552);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3553);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3554);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawEventAndFishMenuBoard__FP8CTextureiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", EventItemSelectDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawEventItemBoard__FiiiiiP8CTexture);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PlayerAllItemCheck__Fi);
s32 GetAddAttachItem(s32 arg0) {
    s32 var_2;

    var_2 = 0;
    if ((arg0 >= 0x5B) && (arg0 < 0x5F)) {
        var_2 = 1;
    }
    return var_2;
}
int TransWepNo(int weapon_no) {
    s32 var_4;

    var_4 = weapon_no;
    if (var_4 > 0) {
        if ((var_4 > 0) && (var_4 < 0x15)) {
            var_4 += 0x100;
        } else if ((var_4 >= 0x15) && (var_4 < 0x21)) {
            var_4 += 0x116;
        } else if ((var_4 >= 0x21) && (var_4 < 0x2E)) {
            var_4 += 0x119;
        } else if ((var_4 >= 0x2E) && (var_4 < 0x3A)) {
            var_4 += 0x11D;
        } else if ((var_4 >= 0x3A) && (var_4 < 0x46)) {
            var_4 += 0x121;
        } else if ((var_4 >= 0x46) && (var_4 < 0x51)) {
            var_4 += 0x125;
        }
    }
    return var_4;
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", TransWepNoNewToOld__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3735);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @3736);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PlusAttachmentVolume__FP11ATTACH_LISTP11ATTACH_LISTf);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetWeaponAttachStatusUp__FP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SetWeaponAttachStatus__FP11WEAPON_HAVE);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @638__3);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @639__4);
INCLUDE_ASM("asm/nonmatchings/menu_draw", WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SetAttachMentValue__FiisP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetAttachVolumeForMsg__FP11ATTACH_LIST);
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitDunEnterMenu__Fiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @762__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @763__3);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @764__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @765__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @776__3);
INCLUDE_ASM("asm/nonmatchings/menu_draw", ExitDunEnterMenu__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DunEnterMenuLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DunEnterMenuKey__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @843__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @844);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @845);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @846);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @847);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DunEnterDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DunEnterBoardWaku__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DunEnterBoard__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawEnemyNum__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawGetAtoraNumBoard__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawDunNumberClip__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawDunEnterBack__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1255__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1301);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawDunEnterFloorName__Fiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", StartQuickChange__FP1iPii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1348__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1349);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1350__3);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CharaChangeLoop__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1373);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1374);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1375);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CharaChangeKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CharaChangeDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DngActItemModelReadStart__FP1);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1663);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1664__2);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DngActItemModelBuild__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DngActiveItemTextureCopy__Fv);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1728__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1841);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @2044);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @2045);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @2046);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @2047);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @2048);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @2049);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @2050);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @2051);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DngActiveWeaponTextureCopy__Fv);
s32 GetWeaponMsgNo(WEAPON_HAVE *arg0) {
    s16 temp_4;

    if (arg0 == NULL) {
        return 0;
    }
    temp_4 = arg0->item_no;
    if (temp_4 < 0x101) {
        return 0x3E7;
    }
    return GetCommonItemInfo((s32) temp_4)->msg + 0x64;
}
s16 GetWeaponMsgNo2(s32 arg0) {
    COM_ITEM_INFO *temp_2;

    temp_2 = GetCommonItemInfo(arg0);
    if (temp_2 != NULL) {
        return temp_2->msg;
    }
    return 0;
}
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
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @2140__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @553);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @554__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @555);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @556);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @557);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @558);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @559);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMenuTextureDir__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMenuLangFlag__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNowSelectLanguage__Fi);
void GetPathReadDifferntLang(s8 *arg0) {
    strcpy(arg0, GetMenuTextureDir());
    strcat(arg0, GetNowSelectLanguage(GetMenuLangFlag()));
}
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
void DrawMenuClsMes(ClsMes *message, int x, int y) {
    if (message != NULL) {
        message->text_x = x;
        message->text_y = y;
        message->Step();
        message->DrawMesWin();
    }
}
void ComMenuSePlay(int sound) {
    if (sound >= 0) {
        SndSePlay(sound, -1, 0);
    }
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_i);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_UcUcUci);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenu2DSprite__FP8CTexture8CRect_i_8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/menu_draw", MenuTextureReload__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", MenuTextureDelete__FPi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @728__6);
INCLUDE_ASM("asm/nonmatchings/menu_draw", AllFillBoxForMenu__FUcUcUcUc);
void AllFadeForMenu(int alpha) {
    AllFillBoxForMenu(0, 0, 0, (unsigned char)alpha);
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", FrameImageDraw__Fii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @764__3);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenuColorGradation__FR8CRect_i_P6spRGBAP6spRGBAP6spRGBAP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenuSideGradation__FR8CRect_i_P6spRGBAP6spRGBA);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawDontSetItemMark__Fiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawIconParts__Fiiiiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawAttachNumberOrWeapon__Fiiiiiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @852__4);
INCLUDE_ASM("asm/nonmatchings/menu_draw", FadeTexX__FiiiiPci);
INCLUDE_ASM("asm/nonmatchings/menu_draw", RetCTex__FsRiRi);
void MenuTextureClip(int &position, int &source, int &length, int minimum, int maximum) {
    if (position < minimum && position + length > minimum) {
        length = position + length - minimum;
        source += minimum - position;
        position = minimum;
    }
    if (position < maximum && position + length > maximum) {
        length = maximum - position;
    }
}
int GetNumberKeta(int value) {
    int digits = 1;
    while (value >= 10) {
        value /= 10;
        digits++;
    }
    return digits;
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMenuIconInfo__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMainMenuIcon__Fiiiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @981);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMenuVibeItem__Fiiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @994__2);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMainMenuRightHelpWinLangOffset__FRfRfRfRf);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMainMenuRightHelpMsgLangOffset__FRiRi);
void InitHaveData(IHAVEITEM *arg0) {
    memset(arg0, -1, 0x14U);
}
void InitHaveWep(WEAPON_HAVE *arg0) {
    memset(arg0, 0, 0xF8U);
    arg0->item_no = -1;
}
void InitHaveAttach(ATTACH_LIST *arg0) {
    memset(arg0, 0, 0x20U);
}

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
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1073);
INCLUDE_ASM("asm/nonmatchings/menu_draw", BoardModeChangeKey__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardLimmitCheck__Fv);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardKeySub__Fv);
void PersonalBoardKey() {
    BoardModeChangeKey();
    PersonalBoardLimmitCheck();
    PersonalBoardKeySub();
}
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
s8 WhoIsWeaponEquip(int weapon_no) {
    COM_ITEM_INFO *temp_2_2;
    WEAPON_DATA *temp_2;

    temp_2_2 = GetCommonItemInfo(weapon_no);
    if (temp_2_2 == NULL) {
        return -1;
    }
    if (temp_2_2->kind != 2) {
        return -1;
    }
    temp_2 = GetWeaponDataInfo((s32) temp_2_2->index);
    if (temp_2 != NULL) {
        return (s8) temp_2->owner;
    }
    return -1;
}
int GetWeaponHoleNum(int item) {
    COM_ITEM_INFO *info = GetCommonItemInfo(item);
    if (info == NULL) return 0;
    if (info->kind != 2) return 0;
    WEAPON_DATA *data = GetWeaponData(item);
    if (data == NULL) return 0;
    int count = 0;
    for (int i = 0; i <= 5; i++) {
        if (data->hole[i] > 0) count++;
    }
    return count;
}
int GetNowWeaponAttachNum(WEAPON_HAVE *weapon) {
    int count = 0;
    if (weapon == NULL) return 0;
    WEAPON_DATA *data = GetWeaponData(weapon->item_no);
    if (data != NULL) {
        for (int i = 0; i < 6; i++) {
            if (data->hole[i] > 0 && weapon->attach[i].item_no >= 0x51) count++;
        }
    }
    return count;
}
int GetWeaponMaxExp(WEAPON_HAVE *weapon) {
    if (weapon == NULL) return 0;
    WEAPON_DATA *data = GetWeaponData(weapon->item_no);
    if (data == NULL) return 1;
    // Retail reads the signed low byte here, despite exp_base's s16 storage.
    int experience = *(s8 *)&data->exp_base;
    for (int i = 0; i < weapon->unk_02; i++) {
        experience += data->exp_per_level;
    }
    if (experience > 999) experience = 999;
    if (experience <= 0) experience = 99;
    return experience;
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNowItemNum__FsP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DeleteItemAfterUseItem__FsP9ITEM_PACK);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNowModeMaxNum__FiPi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", WepDataListToHaveCopy__FiP11WEAPON_HAVE);
void AttachDataListToHaveCopy(int attachment_no, ATTACH_LIST *attachment) {
    if ((attachment_no < 0x51) || (attachment_no >= 0x84)) {
        return;
    }
    if (attachment != NULL) {
        memcpy(attachment, GetAttachData(attachment_no), 0x20U);
    }
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", ItemDataToHaveCopy__Fi);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @2113__2);
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawFullSizePicture__FP8CTextureiii);
