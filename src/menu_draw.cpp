#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 553

#include "menu_draw.hpp"

#include <libvu0.h>

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "camera.hpp"
#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "editatra.hpp"
#include "gamepad.hpp"
#include "itemdata.hpp"
#include "mainitemmodel.hpp"
#include "mainselect.hpp"
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

/** The personal inventory board the menu is working on. */
extern PERSONAL_BOARD *PerBoardPt;

/** Marks, one per item pack slot, of the items the menu offers to throw away. */
extern s8 MenuTrushMark[100];

/** Screen rectangle the menus draw full-screen pictures into. */
extern CRect_i_ MenuDispRc;

INCLUDE_RODATA("asm/nonmatchings/menu_draw", @553);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @554__2);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @555);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @556);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @557);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @558);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @559);
char *GetMenuTextureDir(void) {
    return AllMenuTextureDir;
}

int GetMenuLangFlag(void) {
    return LanguageCode;
}

char *GetNowSelectLanguage(int language) {
    if ((language < 0) || (language >= 7)) {
        language = 0;
    }
    return ComMenuContryName[language];
}

void GetPathReadDifferntLang(char *path) {
    strcpy(path, GetMenuTextureDir());
    strcat(path, GetNowSelectLanguage(GetMenuLangFlag()));
}

int LoadFileBGMenuData(char *name, u_long128 *buffer) {
    int size;

    if ((name == NULL) || (buffer == NULL)) {
        return -1;
    }
    GetPathReadDifferntLang(MenuGrobalDir);
    strcat(MenuGrobalDir, name);
    LoadFileBG(MenuGrobalDir, buffer, &size);
    return size;
}

int LoadFileMenuData(char *name, unsigned int *buffer) {
    int size;

    GetPathReadDifferntLang(MenuGrobalDir);
    strcat(MenuGrobalDir, name);
    LoadFile(MenuGrobalDir, buffer, &size);
    return size;
}
/** Allocator of the edit menu's work memory, which the battle menus also load into. */
extern CDataAlloc2<1> EdMenuBuffer;

u_long128 *BtlMenuBufferSet(int mode) {
    u_long128 *buffer;

    switch (mode) {
        case 0:
            buffer = (u_long128 *) read_buffer;
            break;
        case 1:
            buffer = (u_long128 *) (EdMenuBuffer.base + EdMenuBuffer.used * 0x10);
    }
    return buffer;
}

u_long128 *MenuCalcBufAlignment(u_long128 *buffer) {
    int offset = (int) buffer;
    int remainder = offset & 0x3F;
    if ((offset < 0) && (remainder != 0)) {
        remainder -= 0x40;
    }
    if (remainder != 0) {
        offset = ((offset >> 6) + 1) << 6;
    }
    return (u_long128 *) offset;
}
int GetAtoraMaxVillage(void) {
    int max_village = 3;
    int village;

    for (village = 4; village >= 0; village--) {
        if (SaveData->VisitMap(village, 0) || SaveData->QuestDungeon(village, 0)) {
            max_village = village + 3;
            break;
        }
    }
    if (SaveData->QuestDungeon(5, 0)) {
        max_village = 8;
    }
    if ((max_village < 3) || (max_village > 8)) {
        max_village = 8;
    }
    return max_village;
}
#ifdef NON_MATCHING
int GetNowMapTransAtraMap(int mapNo) {
    s16 mapToVillage[35] = {
        1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 4, 3, 4, 5, 5,
        5, 3, 1, 4, 4, 4, 4, 1, 3, 2, 3, 4, 5, 2, 5,
        4, 3, 2, 2, 2,
    };
    int village = 0;

    if (mapNo < 5) {
        village = mapNo;
    } else if (mapNo >= 0xB && mapNo < 0x29) {
        village = mapToVillage[mapNo - 0xB];
    } else if (mapNo >= 0xC8) {
        village = mapNo - 0xC8;
    }

    if (GetAtoraMaxVillage() - 3 < village) {
        village = GetAtoraMaxVillage() - 3;
    }

    return village;
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNowMapTransAtraMap__Fi);
#endif
void MenuWorldTrans(CCamera *camera) {
    sceVu0FMATRIX cameraMatrix;
    sceVu0FVECTOR eyePos;
    sceVu0FMATRIX viewMatrix;
    sceVu0FMATRIX unitMatrix;

    MGSetProjection(800.0f);
    camera->GetCameraMatrix(cameraMatrix);
    camera->Step(1);
    camera->GetPos(eyePos);
    sceVu0UnitMatrix(unitMatrix);
    sceVu0MulMatrix(viewMatrix, unitMatrix, cameraMatrix);
    MGSetViewMatrix(viewMatrix, eyePos);
}
#ifdef NON_MATCHING
#include <libvu0.h>

/** Camera the menu draws 3D models under. */
extern CCamera MenuCamera;

void MenuPolygonDraw(int distance, void (*draw)(void)) {
    float refPos[4] = {0.0f, 0.0f, -45.0f, 1.0f};
    float eyePos[4] = {0.0f, 0.0f, 60.0f, 1.0f};
    float lightDir[4][4] = {
        {0.3f, 0.0f, 0.0f, 0.0f},
        {0.3f, 0.0f, 0.0f, 0.0f},
        {0.3f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
    };
    float lightColour[4][4] = {
        {96.0f, 96.0f, 96.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
    };
    float savedLightDir[4][4];
    float savedLightColour[4][4];
    float savedAmbient[4];
    float ambient[4] = {80.0f, 80.0f, 80.0f, 0.0f};
    float lightVector[4] = {0.3f, 1.0f, 0.3f, 0.0f};
    float lightNormal[4];

    MenuCamera.SetRef(refPos);
    MenuCamera.SetPos(eyePos);
    MGGetPLight(savedLightDir, savedLightColour);
    MGGetAmbient(savedAmbient);
    ambient[3] = (float) distance;
    sceVu0Normalize(lightNormal, lightVector);
    lightDir[0][0] = lightNormal[0];
    lightDir[1][0] = lightNormal[1];
    lightDir[2][0] = lightNormal[2];
    MGSetPLight(lightDir, lightColour);
    MGSetAmbient(ambient);
    draw();
    MGSetPLight(savedLightDir, savedLightColour);
    MGSetAmbient(savedAmbient);
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_draw", MenuPolygonDraw__FiPFv_v);
#endif
#ifdef NON_MATCHING
void Get3DPosTo2DPos(CFrame *frame, int *screen) {
    float origin[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    float world[4];
    int screenPos[2];

    frame->GetWorldPosition(world, origin);
    MGRotTransPers2D(screenPos, world, 0);
    screen[0] = screenPos[0];
    screen[1] = screenPos[1];
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_draw", Get3DPosTo2DPos__FP6CFramePi);
#endif
#ifdef NON_MATCHING
int GetMenuCommonFontW(int style, int fontSize) {
    u8 fontWidths[7] = {16, 11, 11, 11, 11, 11, 11};
    return fontWidths[style];
}
#else
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetMenuCommonFontW__Fii);
#endif
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

void DrawMenu2DSprite(CTexture *texture, CRect_i_ screen, CRect_i_ texel, int alpha) {
    set2DSprite(GetVif1Packet(), texture, screen, texel, alpha);
}

void DrawMenu2DSprite(CTexture *texture, CRect_i_ screen, CRect_i_ texel, unsigned char r, unsigned char g, unsigned char b, int alpha) {
    set2DSprite(GetVif1Packet(), texture, screen, texel, r, g, b, alpha);
}

void DrawMenu2DSprite(CTexture *texture, CRect_i_ screen, CRect_i_ texel, spRGBA *top_left, spRGBA *top_right, spRGBA *bottom_left, spRGBA *bottom_right) {
    set2DSprite(GetVif1Packet(), texture, screen, texel, top_left, top_right, bottom_left, bottom_right, 1);
}

void MenuTextureReload(int block) {
    TexManager.ReloadTexture(GetVif1Packet(), block);
}

void MenuTextureDelete(int *blocks) {
    for (int i = 0; blocks[i] != -1; i++) {
        TexManager.DeleteTextureBlock(blocks[i]);
        printf("delete block: %d\n", blocks[i]);
    }
}
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

void DeleteMenuTrushMark() {
    memset(MenuTrushMark, 0, sizeof(MenuTrushMark));
}
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

int PersonalRetMax(int board_mode) {
    int max = 0;

    switch (board_mode) {
        case 0:
            max = PerBoardPt->item_pack->num;
            break;
        case 1:
            max = 60;
            break;
        case 2:
            max = 40;
            break;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
            max = 120;
            break;
    }
    return max;
}

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

void DrawFullSizePicture(CTexture *texture, int x, int y, int alpha) {
    if (texture != NULL) {
        DrawMenu2DSprite(texture, CRect_i_(x, y, MenuDispRc.width, MenuDispRc.height), MenuDispRc, alpha);
    }
}
