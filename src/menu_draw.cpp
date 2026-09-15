#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 553

#include "menu_draw.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "camera.hpp"
#include "clsmes.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "editatra.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "mainitemmodel.hpp"
#include "memcard.hpp"
#include "memorycardaccess.hpp"
#include "menu_inventory.hpp"
#include "menuitemstep.hpp"
#include "mglib.hpp"
#include "rect.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"
#include "userstatus.hpp"

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

void GetPathReadDifferntLang(char *path) {
    strcpy(path, GetMenuTextureDir());
    strcat(path, GetNowSelectLanguage(GetMenuLangFlag()));
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
    AllFillBoxForMenu(0, 0, 0, (unsigned char) alpha);
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

void InitHaveData(IHAVEITEM *item) {
    memset(item, -1, 0x14U);
}

void InitHaveWep(WEAPON_HAVE *weapon) {
    memset(weapon, 0, 0xF8U);
    weapon->item_no = -1;
}

void InitHaveAttach(ATTACH_LIST *attachment) {
    memset(attachment, 0, 0x20U);
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

int WhoIsWeaponEquip(int weapon_no) {
    COM_ITEM_INFO *info;
    WEAPON_DATA *data;

    info = GetCommonItemInfo(weapon_no);
    if (info == NULL) {
        return -1;
    }
    if (info->kind != 2) {
        return -1;
    }
    data = GetWeaponDataInfo((s32) info->index);
    if (data != NULL) {
        return (s8) data->owner;
    }
    return -1;
}

int GetWeaponHoleNum(int item) {
    COM_ITEM_INFO *info = GetCommonItemInfo(item);
    if (info == NULL) {
        return 0;
    }
    if (info->kind != 2) {
        return 0;
    }
    WEAPON_DATA *data = GetWeaponData(item);
    if (data == NULL) {
        return 0;
    }
    int count = 0;
    for (int i = 0; i <= 5; i++) {
        if (data->hole[i] > 0) {
            count++;
        }
    }
    return count;
}

int GetNowWeaponAttachNum(WEAPON_HAVE *weapon) {
    int count = 0;
    if (weapon == NULL) {
        return 0;
    }
    WEAPON_DATA *data = GetWeaponData(weapon->item_no);
    if (data != NULL) {
        for (int i = 0; i < 6; i++) {
            if (data->hole[i] > 0 && weapon->attach[i].item_no >= 0x51) {
                count++;
            }
        }
    }
    return count;
}

int GetWeaponMaxExp(WEAPON_HAVE *weapon) {
    if (weapon == NULL) {
        return 0;
    }
    WEAPON_DATA *data = GetWeaponData(weapon->item_no);
    if (data == NULL) {
        return 1;
    }
    int experience = *(s8 *) &data->exp_base;
    for (int i = 0; i < weapon->unk_02; i++) {
        experience += data->exp_per_level;
    }
    if (experience > 999) {
        experience = 999;
    }
    if (experience <= 0) {
        experience = 99;
    }
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
