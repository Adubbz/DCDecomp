#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 553

#include "menu_draw.hpp"

#include <libvu0.h>

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "battlemenu.hpp"
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
#include "menu_dungeon.hpp"
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

/** Item kind the item board sort places first. */
extern int sort_top_type__2;

/** Rank of each item kind in the item board sort, rebuilt before each sort pass. */
extern int sort_table__2[9];

/** Rank of each attachment kind in the attachment board sort. */
extern int asort_table__2[5];

/** Attachment kind the attachment board sort places first. */
extern int asort_top_type__2;

/** Icon sheet of the consumable items. */
extern CTexture *ItemIcon;

/** Icon sheet of the weapons. */
extern CTexture *WepIcon;

/** Texture of the personal inventory board. */
extern CTexture *PerBoardTex;

/** Texture block the item menu's weapon icons load into. */
extern int ItemMenuWeaponIconReadBlock;

/** Camera the menu draws 3D models under. */
extern CCamera MenuCamera;

/**
 * Draws the mark over an item that cannot be set.
 *
 * @mangled DrawDontSetItemMark__Fiiiii
 * @address 0x22D4C0
 * @size 0xDC
 */
static void DrawDontSetItemMark(int, int, int, int, int);

/**
 * Draws the equipped-weapon marker on a personal-board entry.
 *
 * @mangled DrawNowEquipWeaponMark__Fiiiii
 * @address 0x0022F9D0
 * @size 0x100
 */
static void DrawNowEquipWeaponMark(int x, int y, int top, int bottom, int alpha);

/**
 * Draws the base layers of a personal inventory board.
 *
 * @mangled DrawPersonalBoardBase__FiiiiiP8CTexturei
 * @address 0x00230C00
 * @size 0x1C0
 */
static void DrawPersonalBoardBase(int x, int y, int top, int bottom, int count, CTexture *texture, int alpha);

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
int GetNowMapTransAtraMap(int mapNo) {
    int village = 0;
    s16 mapToVillage[35] = {
        1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 4, 3, 4, 5, 5,
        5, 3, 1, 4, 4, 4, 4, 1, 3, 2, 3, 4, 5, 2, 5,
        4, 3, 2, 2, 2,
    };

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
void MenuPolygonDraw(int distance, void (*draw)(void)) {
    float refPos[4] = {0.0f, 0.0f, -45.0f, 1.0f};
    float eyePos[4] = {0.0f, 0.0f, 60.0f, 1.0f};

    MenuCamera.SetRef(refPos);
    MenuCamera.SetPos(eyePos);

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
    float savedAmbient[4];
    float ambient[4];
    float savedLightDir[4][4];
    float savedLightColour[4][4];

    MGGetPLight(savedLightDir, savedLightColour);
    MGGetAmbient(savedAmbient);
    ambient[0] = ambient[1] = ambient[2] = 80.0f;
    ambient[3] = (float) distance;

    float lightVector[4] = {0.3f, 1.0f, 0.3f, 0.0f};
    float lightNormal[4];

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
void Get3DPosTo2DPos(CFrame *frame, int *screen) {
    float world[4];
    float origin[4] = {0.0f, 0.0f, 0.0f, 1.0f};
    int screenPos[4];

    frame->GetWorldPosition(world, origin);
    MGRotTransPers2D(screenPos, world, 0);
    screen[0] = screenPos[0];
    screen[1] = screenPos[1];
}
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

void AllFillBoxForMenu(unsigned char r, unsigned char g, unsigned char b, unsigned char alpha) {
    if (r < 0 || r > 0xFF) {
        r = 0x80;
    }
    if (g < 0 || g > 0xFF) {
        g = 0x80;
    }
    if (b < 0 || b > 0xFF) {
        b = 0x80;
    }
    if (alpha < 0 || alpha > 0xFF) {
        alpha = 0x80;
    }
    MGFillBox(CRect_i_(0, 0, 0x2800, 0x1C00), r, g, b, alpha);
}

void AllFadeForMenu(int alpha) {
    AllFillBoxForMenu(0, 0, 0, (unsigned char) alpha);
}

void FrameImageDraw(int brightness, int alpha) {
    sceGsTexa texa;
    CTexture *texture = TexManager.GetTexture("frame_image", -1);

    if (texture != NULL) {
        TexManager.ReloadTexture(GetVif1Packet(), texture->block);
        ((sceGsTex0 *) &texture->tex0)->bits.tcc = 0;
        texa = mgTexa;
        texa.AEM = 1;
        texa.TA0 = 0x80;
        MGSetGsTEXA(&texa);
        set2DSprite(GetVif1Packet(), texture, MenuDispRc, MenuDispRc, brightness, brightness, brightness, alpha);
        MGSetGsTEXA(NULL);
    }
}

void DrawMenuColorGradation(CRect_i_ &rect, spRGBA *top_left, spRGBA *top_right, spRGBA *bottom_left, spRGBA *bottom_right) {
    set2DSpriteC4(GetVif1Packet(), rect, top_left, top_right, bottom_left, bottom_right);
}

void DrawMenuSideGradation(CRect_i_ &rect, spRGBA *left, spRGBA *right) {
    set2DSpriteC4(GetVif1Packet(), rect, left, right, left, right);
}

static void DrawDontSetItemMark(int x, int y, int top, int bottom, int alpha) {
    int position;
    int length;
    int source;

    if (y < top - 31 || y > bottom - 1) {
        return;
    }
    position = y;
    length = 32;
    source = 0xC0;
    MenuTextureClip(position, source, length, top, bottom);
    DrawMenu2DSprite(PerBoardTex, CRect_i_(x, position, 32, length), CRect_i_(0x13C, source, 32, length), alpha);
}

void DrawIconParts(int item_no, int x, int y, int top, int bottom, int alpha, int number) {
    int position;
    int u;
    int v;
    int length;
    COM_ITEM_INFO *info;
    CTexture *texture;

    if (y < top - 31 || y > bottom - 1) {
        return;
    }
    position = y;
    info = GetCommonItemInfo(item_no);
    if (info != NULL && info->icon_index >= 0) {
        texture = RetCTex(item_no, u, v);
        if (texture != NULL) {
            length = 32;
            MenuTextureClip(position, v, length, top, bottom);
            CRect_i_ source(u, v, 32, length);
            set2DSprite(GetVif1Packet(), texture, CRect_i_(x + 2, position + 1, 32, length), source, 0, 0, 0, alpha * 0x50 >> 7);
            DrawMenu2DSprite(texture, CRect_i_(x, position, 32, length), source, alpha);
            DrawAttachNumberOrWeapon(x, y, top, bottom, item_no, number, alpha, 0);
        }
    }
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawAttachNumberOrWeapon__Fiiiiiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @852__4);
INCLUDE_ASM("asm/nonmatchings/menu_draw", FadeTexX__FiiiiPci);

CTexture *RetCTex(short item_no, int &u, int &v) {
    CTexture *texture;
    COM_ITEM_INFO *info = GetCommonItemInfo(item_no);

    if (info == NULL) {
        return NULL;
    }
    int icon = info->icon_index;
    if (icon < 0) {
        return NULL;
    }
    u = ((icon + 8) % 8) << 5;
    v = (icon >> 3) << 5;
    switch (info->kind) {
        case 1:
            texture = ItemIcon;
            break;
        case 0:
        case 2:
            texture = WepIcon;
            break;
    }
    return texture;
}

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

MENU_ICON_INFO *GetMenuIconInfo(int icon) {
    return &MenuIcon[GetMenuLangFlag()][icon];
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawMainMenuIcon__Fiiiiii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @981);

void DrawMenuVibeItem(int x, int y, int offset_x, int offset_y, int) {
    int item_x = x + offset_x;
    int item_y = y + offset_y;
    s16 item_no = PerBoardPt->unk_40;
    CRect_i_ shadow(0x80, 0x28, 0x20, 0x20);
    int u;
    int v;
    CTexture *texture = RetCTex(item_no, u, v);

    if (texture != NULL) {
        DrawObjectVibe(x + 4, y + 2, TexManager.GetTexture("StayTex", -1), shadow, 0, 0x50);
        CRect_i_ source(u, v, 0x20, 0x20);
        DrawObjectVibe(item_x + 4, item_y + 2, texture, source, 0, 0x50);
        DrawObjectVibe(item_x, item_y, texture, source, 0x80, 0x80);
        int number = GetAttachVolumeForMsg(&PerBoardPt->unk_13C);
        if (item_no == 0x5A) {
            number = PerBoardPt->unk_13C.unk_02;
        }
        DrawAttachNumberOrWeapon(item_x, item_y, 0, 0x280, item_no, number, 0x80, 1);
    }
}
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

void SetMenuTrushMark(ITEM_PACK *items) {
    int quick_count = 0;
    int i;
    int slot;

    for (i = 0; i < 3; i++) {
        quick_count += items->quick_item_qty[i];
    }
    for (slot = items->num - 1; slot >= 0; slot--) {
        if (items->item[slot] < ITEM_DUNGEON_START && quick_count > 0) {
            MenuTrushMark[slot] = 1;
            quick_count--;
        } else {
            MenuTrushMark[slot] = 0;
        }
    }
}

void DeleteMenuTrushMark() {
    memset(MenuTrushMark, 0, sizeof(MenuTrushMark));
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", InitPersonalBoardMode__FP11CUserStatusP14PERSONAL_BOARDii);
INCLUDE_RODATA("asm/nonmatchings/menu_draw", @1073);

int BoardModeChangeKey() {
    int board_mode = PerBoardPt->unk_04;

    if (GamePad.Down(5)) {
        switch (PerBoardPt->unk_00) {
            case 0:
                PerBoardPt->unk_04--;
                if (PerBoardPt->unk_04 < 0) {
                    PerBoardPt->unk_04 = 2;
                }
                break;
            case 2:
            case 1:
                break;
        }
    }
    if (GamePad.Down(10)) {
        switch (PerBoardPt->unk_00) {
            case 0:
                PerBoardPt->unk_04++;
                if (PerBoardPt->unk_04 > 2) {
                    PerBoardPt->unk_04 = 0;
                }
                break;
            case 2:
            case 1:
                break;
        }
    }
    if (board_mode != PerBoardPt->unk_04) {
        return 1;
    }
    return 0;
}
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

int PersonalBoardItemGetorSwap(int board_pos) {
    int result = 0;
    IHAVEITEM *item = (IHAVEITEM *) PerBoardPt->unk_30;

    switch (PerBoardPt->unk_04) {
        case 0:
            result = PersonalBoardItemPush(item, board_pos);
            break;
        case 1:
            result = PersonalBoardWeaponPush(item, board_pos);
            break;
        case 2:
            result = PersonalBoardAttachPush(item, board_pos);
            break;
    }
    return result;
}
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

void DrawPersonalBoard(int x, int y, int board_mode, int alpha, int) {
    int max = PersonalRetMax(board_mode);
    int top = y + 9;
    int bottom = top + 0xA0;
    int left = x + 0x13;
    int row_y = y - 0x11;
    int kind;

    row_y = row_y + 0x17 - PerBoardPt->unk_18 * 40;
    PerBoardPt->unk_10 += (row_y - PerBoardPt->unk_10) / 4.0f;
    row_y = PerBoardPt->unk_10;
    switch (PerBoardPt->unk_00) {
        case 2:
        case 0:
            MenuTextureReload(PerBoardTex->block);
            break;
    }
    kind = 0;
    switch (board_mode) {
        case 1:
            kind = 2;
            break;
    }
    DrawPerBoardDraw(kind, max, left, row_y, top, bottom, PerBoardTex, alpha);
    switch (PerBoardPt->unk_00) {
        case 2:
            MenuTextureReload(PerBoardTex->block);
            break;
        case 0:
            MenuTextureReload(ItemMenuWeaponIconReadBlock);
            break;
    }
    CommonIconDraw(board_mode, max, left + 2, row_y + 6, top, bottom, alpha);
    MenuTextureReload(PerBoardTex->block);
    PersonalBoardOptionDraw(board_mode, max, x, y, PerBoardTex, alpha);
}

static void DrawNowEquipWeaponMark(int x, int y, int top, int bottom, int alpha) {
    int position = y;
    int v = 0xC0;
    int length = 0x28;

    MenuTextureClip(position, v, length, top, bottom);
    if (position + length < top || bottom <= position) {
        return;
    }
    MenuTextureReload(PerBoardTex->block);
    DrawMenu2DSprite(PerBoardTex, CRect_i_(x, position, 0x28, length), CRect_i_(0x114, v, 0x28, length), alpha);
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", CommonIconDraw__Fiiiiiii);

void PersonalBoardDrawWaku(int x, int y, CTexture *texture, int alpha) {
    DrawMenu2DSprite(texture, CRect_i_(x, y + 1, 0x14, 0xBF), CRect_i_(0, 0, 0x14, 0xC0), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x + 0x14, y + 1, 0xC8, 0x13), CRect_i_(0x14, 0, 0xC8, 0x14), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x + 0xDC, y + 1, 0x24, 0xBF), CRect_i_(0xDC, 0, 0x24, 0xC0), alpha);
    DrawMenu2DSprite(texture, CRect_i_(x + 0x14, y + 0xA1, 0xC8, 0x1F), CRect_i_(0x14, 0xA0, 0xC8, 0x20), alpha);
}

void PersonalBoardOptionDraw(int board_mode, int count, int x, int y, CTexture *texture, int alpha) {
    PersonalBoardTagDraw(board_mode, x, y, texture, 0, alpha);
    PersonalBoardDrawWaku(x, y, texture, alpha);
    PersonalBoardScrlBarDraw(count, x, y, PerBoardPt->scroll, PerBoardPt->unk_18, texture, alpha);
    PersonalBoardMaxDraw(count, x, y, texture, alpha);
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardTagDraw__FiiiP8CTextureii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/menu_draw", PersonalBoardMaxDraw__FiiiP8CTexturei);

static void DrawPersonalBoardBase(int x, int y, int top, int bottom, int count, CTexture *texture, int alpha) {
    int v;
    int length;
    spRGBA upper;
    spRGBA lower;
    int step;
    int i;

    if (y < top - 39 || y > bottom - 1) {
        return;
    }
    v = 0x14;
    length = 0x28;
    MenuTextureClip(y, v, length, top, bottom);
    step = 9;
    upper.r = upper.g = upper.b = 0x80;
    lower.r = lower.g = lower.b = 0x80 - step;
    lower.a = alpha;
    upper.a = alpha;
    for (i = 0; i < count; i++) {
        set2DSprite(GetVif1Packet(), texture, CRect_i_(x, y, 0x28, length), CRect_i_(0x20, v, 0x28, length), &upper, &lower, &upper, &lower, 1);
        upper.r = upper.g = upper.b = lower.r;
        lower.r = lower.g = lower.b = lower.r - step;
        step--;
        x += 0x28;
    }
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", DrawPerBoardDraw__FiiiiiiP8CTexturei);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CommonTrushDraw__Fiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", IsEnableTrushThrow__Fi);
INCLUDE_ASM("asm/nonmatchings/menu_draw", CommonMoneyBoardDraw__Fiiii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", SearchBoardNowPosItemExist__Fii);
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetBoardSpace__FiPi);

void SwapItem(ITEM_PACK *items, int first_pos, int second_pos) {
    s16 item = items->item[first_pos];
    s16 vol = items->item_vol[first_pos];

    items->item[first_pos] = items->item[second_pos];
    items->item_vol[first_pos] = items->item_vol[second_pos];
    items->item[second_pos] = item;
    items->item_vol[second_pos] = vol;
}

int CompItem(int first_item_no, int second_item_no) {
    ITEM_DATA *first = GetItemData(first_item_no);
    ITEM_DATA *second = GetItemData(second_item_no);
    int first_rank = 0;
    int second_rank = 0;

    if (first != NULL) {
        first_rank = sort_table__2[first->sort_key];
    }
    if (second != NULL) {
        second_rank = sort_table__2[second->sort_key];
    }
    if (first_item_no < ITEM_DUNGEON_START) {
        first_rank = 9;
    }
    if (second_item_no < ITEM_DUNGEON_START) {
        second_rank = 9;
    }
    if (first_rank > second_rank) {
        return 1;
    }
    if (first_rank < second_rank) {
        return -1;
    }
    if (first_item_no > second_item_no) {
        return 1;
    }
    if (first_item_no < second_item_no) {
        return -1;
    }
    return 0;
}

int SeitonItemBoardSub(ITEM_PACK *items) {
    int i;
    int j;
    int type = sort_top_type__2;
    int swapped;

    for (i = 0; i < 9; i++) {
        sort_table__2[type] = i;
        type++;
        if (type >= 9) {
            type = 0;
        }
    }
    sort_table__2[0] = 9;
    swapped = 0;
    for (i = 0; i < items->num - 1; i++) {
        for (j = i + 1; j < items->num; j++) {
            if (CompItem(items->item[i], items->item[j]) > 0) {
                SwapItem(items, i, j);
                swapped = 1;
            }
        }
    }
    return swapped;
}

void SeitonItemBoard(ITEM_PACK *items) {
    if (items != NULL) {
        for (int i = 0; i < 9; i++) {
            if (SeitonItemBoardSub(items) != 0) {
                break;
            }
            sort_top_type__2++;
            if (sort_top_type__2 >= 9) {
                sort_top_type__2 = 1;
            }
        }
    }
}

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

int CompAttach(ATTACH_LIST *first, ATTACH_LIST *second) {
    int first_rank = asort_table__2[GetAttachKind(first->item_no)];
    int second_rank = asort_table__2[GetAttachKind(second->item_no)];

    if (first->item_no < ITEM_ATTACH_START) {
        first_rank = 5;
    }
    if (second->item_no < ITEM_ATTACH_START) {
        second_rank = 5;
    }
    if (first_rank > second_rank) {
        return 1;
    }
    if (first_rank < second_rank) {
        return -1;
    }
    if (first->item_no > second->item_no) {
        return 1;
    }
    if (first->item_no < second->item_no) {
        return -1;
    }
    return 0;
}

int SeitonAttachBoardSub(ATTACH_LIST *attachments) {
    int i;
    int j;
    int type = asort_top_type__2;
    int swapped;

    for (i = 0; i < 5; i++) {
        asort_table__2[type] = i;
        type++;
        if (type >= 5) {
            type = 0;
        }
    }
    asort_table__2[0] = 5;
    swapped = 0;
    for (i = 0; i < 39; i++) {
        for (j = i + 1; j < 40; j++) {
            if (CompAttach(&attachments[i], &attachments[j]) > 0) {
                MenuDataSwap(&attachments[i], &attachments[j]);
                swapped = 1;
            }
        }
    }
    return swapped;
}
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

int GetNowItemNum(short item_no, ITEM_PACK *items) {
    int count = 0;
    int i;
    int j;

    for (i = 0; i < items->num; i++) {
        if (items->item[i] == item_no) {
            count++;
        }
    }
    for (j = 0; j < 3; j++) {
        if (items->quick_item_slot[j] == item_no) {
            count += items->quick_item_qty[j];
        }
    }
    return count;
}

void DeleteItemAfterUseItem(short item_no, ITEM_PACK *items) {
    int deleted = 0;
    int i;

    for (i = 0; i < items->num; i++) {
        if (items->item[i] == item_no) {
            items->item[i] = -1;
            deleted = 1;
            break;
        }
    }
    if (deleted == 0) {
        for (i = 0; i < 3; i++) {
            if (items->quick_item_slot[i] == item_no) {
                items->quick_item_qty[i]--;
                if (items->quick_item_qty[i] <= 0) {
                    items->quick_item_slot[i] = -1;
                }
                break;
            }
        }
    }
}
INCLUDE_ASM("asm/nonmatchings/menu_draw", GetNowModeMaxNum__FiPi);

void WepDataListToHaveCopy(int weapon_no, WEAPON_HAVE *weapon) {
    WEAPON_DATA *data;
    int best;
    int best_value;
    int i;
    int j;

    if (weapon != NULL && weapon_no > 0) {
        if (weapon_no < 0x51) {
            weapon_no += 0x100;
        }
        data = GetWeaponData(weapon_no);
        memset(weapon, 0, sizeof(WEAPON_HAVE));
        weapon->item_no = weapon_no;
        weapon->attack = data->attack;
        weapon->endurance = data->endurance;
        weapon->speed = data->speed;
        weapon->magic = data->magic;
        weapon->durability = data->durability;
        weapon->durability_f = weapon->durability;
        best = 5;
        best_value = 0;
        for (i = 0; i < 5; i++) {
            weapon->elem[i] = data->elem[i];
            if (weapon->elem[i] > best_value) {
                best_value = weapon->elem[i];
                best = i;
            }
        }
        weapon->best_elem = best;
        for (j = 0; j < 10; j++) {
            weapon->vs_monster[j] = data->vs_monster[j];
        }
        weapon->flags = data->flags;
        if (IsDefaultWeapon(weapon->item_no) < 0) {
            int chance = rand() % 1000;
            if (chance < 1000) {
                if (chance < 10) {
                    weapon->flags |= WEAPONFLAG_DURABLE;
                }
                if (chance > 989) {
                    weapon->flags |= WEAPONFLAG_FRAGILE;
                }
            }
        }
    }
}

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
