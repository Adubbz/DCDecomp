#include "editmenu.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "battlemenu.hpp"
#include "clsmes.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "edit.hpp"
#include "editpartsinfo.hpp"
#include "frame.hpp"
#include "gamepad.hpp"
#include "memcard.hpp"
#include "menu_draw.hpp"
#include "menu_manual.hpp"
#include "menu_misc.hpp"
#include "menu_save.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"

extern "C" int abs(int);

/** The state the edit menu is in. */
extern int EditSwitch;

/** The frame count of the edit menu's current transition. */
extern int EdEffectCt;

/** The selection on the edit menu's analyze page. */
extern s16 AnalyzeSelect;

/** The speed-up the analyze bar draws with, set to 2 while any input is held. */
extern s16 ButtonAdd;

/** The edit menu icon's movement: 1 while CalMoveFromMenuIcon runs, 2 while CalMoveToMenuIcon runs, 0 for none. */
extern s16 EdMenuEffectFlag;

/** The frame count of the edit menu icon's movement. */
extern float EdMenuEffectCt;

/** Whether the edit menu's second window is to be made. */
extern s16 MakeWin2Flag;

extern CDataAlloc2<1> EdMenuBuffer;

/** The edit menu's eased cursor position and current icon selection. */
struct EDIT_MENU_CURSOR {
    float x;      /**< Cursor's current screen x, eased toward its target. */
    float y;      /**< Cursor's current screen y, eased toward its target. */
    s8 selection; /**< Index of the selected icon. */
};

/** The edit menu's cursor. */
extern EDIT_MENU_CURSOR EdCur;

/** Resting screen position of each edit menu icon, one x/y pair per icon. */
extern float MenuIconPos[6][2];

/** The icon shown at each edit menu slot. */
extern s8 EditMenuIconID[6];

/** Whether the edit menu's page textures have finished reading. */
extern int EdMenuTextureReadEndFlag;

/** How bright the edit menu's message windows draw while it closes. */
extern s16 EdMenuRGB;

/** The texture the analysis page's headings come from. */
extern CTexture *Analyze;

/** The texture the analysis page's panels, bars and digits come from. */
extern CTexture *AnaBar;

/** How far the analysis page's scrolling background has moved. */
extern s16 AnalyzeBackBlockCnt;

/** How far each of the analysis page's three bars has filled, in screen columns. */
extern float AnalyzeFill[3];

/** The texture the menu's plain frame comes from. */
extern CTexture *StayTex;

/** Texture block containing the edit menu's main page textures. */
extern int EdMenuTextureBlock;

/** Texture block containing the edit menu's first extra texture set. */
extern int EdMenuExTextureBlock;

/** Texture block containing the edit menu's second extra texture set. */
extern int EdMenuExTextureBlock1;

/** Texture block containing the edit menu's third extra texture set. */
extern int EdMenuExTextureBlock2;

#include "editloop.hpp"
#include "mainselect.hpp"
#include "menuitemstep.hpp"

extern u_long128 *EdMenuWorkBuf;
extern s16 EdMenuHelpWinAlpha;
extern int EdMenuMesNo2;
extern int EdMenuMesMake2;
extern float WindowPos[2];
extern float EditMenuWinW;
extern float EditMenuWinH;
extern CTexture *PerBoardTex;

/**
 * Returns the number of edit menu icons, one fewer until the manual is available.
 *
 * @mangled GetEditMenuMax__Fv
 * @address 0x2102E0
 * @size 0x3C
 */
static int GetEditMenuMax();

/**
 * Draws one edit menu icon at its resting position.
 *
 * @mangled DrawMenuIcon__Fi
 * @address 0x210320
 * @size 0xC4
 */
static void DrawMenuIcon(int);

/**
 * Writes the screen position of one edit menu icon.
 *
 * @mangled GetEditMenuIconPos__FiPi
 * @address 0x2103F0
 * @size 0xFC
 */
static void GetEditMenuIconPos(int, int *);

/**
 * Draws the edit menu icons at their current positions.
 *
 * @mangled DrawMoveMenuIcon__Fv
 * @address 0x2104F0
 * @size 0x1B4
 */
static void DrawMoveMenuIcon();

/**
 * Moves the edit menu icons one step away from their resting positions and reports when they have arrived.
 *
 * @mangled CalMoveFromMenuIcon__Fv
 * @address 0x2106B0
 * @size 0x240
 */
static int CalMoveFromMenuIcon();

/**
 * Moves the edit menu icons one step back to their resting positions and reports when they have arrived.
 *
 * @mangled CalMoveToMenuIcon__Fv
 * @address 0x2108F0
 * @size 0x1C0
 */
static int CalMoveToMenuIcon();

/**
 * Releases the edit menu's textures and returns the pad to normal mode.
 *
 * @mangled EditMenuExit__Fv
 * @address 0x210DA0
 * @size 0x8C
 */
static void EditMenuExit();

/**
 * Returns the help-window draw flag it is given, or 0 while the edit menu is in
 * state 3, 9 or 0x10 and the Atra event flag is set.
 *
 * @mangled GetDrawHelpWindow__Fi
 * @address 0x210E30
 * @size 0x64
 */
static int GetDrawHelpWindow(int);

/**
 * Draws the edit menu's opening and enters its page textures once they have been read.
 *
 * @mangled EditMenuStart__Fv
 * @address 0x2112C0
 * @size 0x4BC
 */
static int EditMenuStart();

/**
 * Draws the edit menu's icon selection.
 *
 * @mangled EditMenuSelectDraw__Fv
 * @address 0x211780
 * @size 0x22C
 */
static void EditMenuSelectDraw();

/**
 * Handles pad input in the edit menu's icon selection and returns the result.
 *
 * @mangled EditMenuSelect__Fv
 * @address 0x2119B0
 * @size 0x38C
 */
static int EditMenuSelect();

/**
 * Draws the edit menu while it closes.
 *
 * @mangled EditMenuToExitDraw__Fv
 * @address 0x211D40
 * @size 0x20
 */
static void EditMenuToExitDraw();

/**
 * Runs the edit menu's closing and reports when it is finished.
 *
 * @mangled EditMenuToExit__Fv
 * @address 0x211D60
 * @size 0x144
 */
static int EditMenuToExit();

/**
 * Draws the Atla selection page.
 *
 * @mangled AtoraSelectDraw__Fv
 * @address 0x211EB0
 * @size 0x90
 */
static void AtoraSelectDraw();

/**
 * Runs the Atla selection page and returns the result.
 *
 * @mangled AtoraSelect__Fv
 * @address 0x211F40
 * @size 0x188
 */
static int AtoraSelect();

/**
 * Draws the Atla move state, which has nothing to draw.
 *
 * @mangled AtoraMoveDraw__Fv
 * @address 0x2120D0
 * @size 0x8
 */
static void AtoraMoveDraw();

/**
 * Leaves the edit menu for the Atla move and returns the result.
 *
 * @mangled AtoraMove__Fv
 * @address 0x2120E0
 * @size 0x30
 */
static int AtoraMove();

/**
 * Draws the background panels of the analysis page.
 *
 * @mangled AnalyzeBackDraw__Fii
 * @address 0x212110
 * @size 0x15C
 */
static void AnalyzeBackDraw(int, int);

/**
 * Returns the analysis page's completion percentage, capped at 100.
 *
 * @mangled AnalyzeRequestPer__Fv
 * @address 0x212270
 * @size 0xAC
 */
static float AnalyzeRequestPer();

/**
 * Draws the analysis page's bars and reports whether the fill has reached its target.
 *
 * @mangled AnalyzeBarDraw__Fv
 * @address 0x212320
 * @size 0x69C
 */
static int AnalyzeBarDraw();

/**
 * Draws the transition into the analysis page.
 *
 * @mangled ToAnalyzeEditDraw__Fv
 * @address 0x2129C0
 * @size 0x348
 */
static void ToAnalyzeEditDraw();

/**
 * Speeds up the transition into the analysis page while any input is held.
 *
 * @mangled ToAnalyzeEdit__Fv
 * @address 0x212D10
 * @size 0x44
 */
static void ToAnalyzeEdit();

/**
 * Draws the analysis page.
 *
 * @mangled AnalyzeEditDraw__Fv
 * @address 0x212D60
 * @size 0x1C0
 */
static void AnalyzeEditDraw();

/**
 * Leaves the analysis page when a 0x60 pad button is pressed, and returns 0.
 *
 * @mangled AnalyzeEdit__Fv
 * @address 0x212F20
 * @size 0x54
 */
static int AnalyzeEdit();

/**
 * Draws the transition out of the analysis page.
 *
 * @mangled FromAnalyzeEditDraw__Fv
 * @address 0x212F80
 * @size 0x50
 */
static void FromAnalyzeEditDraw();

/**
 * Advances the transition out of the analysis page.
 *
 * @mangled FromAnalyzeEdit__Fv
 * @address 0x212FD0
 * @size 0xA8
 */
static void FromAnalyzeEdit();

/**
 * Draws the edit menu's save page.
 *
 * @mangled EditSaveDraw__Fv
 * @address 0x213080
 * @size 0x74
 */
static void EditSaveDraw();

/**
 * Handles pad input on the edit menu's save page.
 *
 * @mangled EditSaveKey__Fv
 * @address 0x213100
 * @size 0xDC
 */
static void EditSaveKey();

/**
 * Draws the edit menu's option page.
 *
 * @mangled OptionDraw__Fv
 * @address 0x2131E0
 * @size 0x6C
 */
static void OptionDraw();

/**
 * Handles pad input on the edit menu's option page.
 *
 * @mangled EdOptionSelect__Fv
 * @address 0x213250
 * @size 0xF4
 */
static void EdOptionSelect();

/**
 * Handles pad input on the edit menu's manual page.
 *
 * @mangled EdMenuManualKey__Fv
 * @address 0x213350
 * @size 0xF8
 */
static int EdMenuManualKey();

/**
 * Draws the edit menu's manual page.
 *
 * @mangled EdMenuManualDraw__Fv
 * @address 0x213450
 * @size 0x6C
 */
static void EdMenuManualDraw();
int GetNumHowManyItemsHave(int item) {
    COM_ITEM_INFO *info = GetCommonItemInfo(item);
    if (info == NULL) {
        return 0;
    }
    CDngStatusData *dungeon_status = SaveData->GetDngStatus();
    if (dungeon_status == NULL) {
        return 0;
    }
    int count = 0;
    switch (info->kind) {
        case ITEMKIND_WEAPON: {
            WEAPON_DATA *weapon = GetWeaponData(item);
            if (weapon != NULL) {
                int i;
                s8 owner = weapon->owner;
                WEAPON_HAVE *weapons = dungeon_status->chara_weapons[owner];
                for (i = 0; i < 10; i++) {
                    if (item == weapons[i].item_no) {
                        count++;
                    }
                }
            }
            break;
        }
    }
    return count;
}
static int GetEditMenuMax() {
    int max = 6;
    if (GetGameFlagForManualMenu() == 0) {
        max--;
    }
    return max;
}

/**
 * Draws the selected edit menu icon at its resting position.
 */
static void DrawMenuIcon(int slot) {
    MENU_ICON_INFO *info = GetMenuIconInfo(EditMenuIconID[slot]);

    DrawMainMenuIcon((int) (MenuIconPos[slot][0] - 6.0f), (int) (MenuIconPos[slot][1] - 4.0f),
                     info->id, 1, 0x80, 0x80);
}
static void GetEditMenuIconPos(int slot, int *position) {
    u8 six[6] = {0x50, 0x60, 0x70, 0x80, 0x80, 0x70};
    u8 five[5] = {0x50, 0x60, 0x70, 0x80, 0x70};
    u8 x[6] = {0x50, 0x60, 0x70, 0x80, 0x80, 0x70};
    int icon_max = GetEditMenuMax();

    if (icon_max == 5) {
        for (int i = 0; i < icon_max; i++) {
            x[i] = five[i];
        }
    }
    if (icon_max == 6) {
        for (int i = 0; i < icon_max; i++) {
            x[i] = six[i];
        }
    }
    position[0] = x[slot];
    position[1] = slot * 40 + 0x4A;
}

/**
 * Draws each edit menu icon at its current position.
 */
static void DrawMoveMenuIcon() {
    int y_offset;
    int brightness;
    int icon_max;
    int i;
    int icon;
    int x_offset;

    icon_max = GetEditMenuMax();
    for (i = 0; i < icon_max; i++) {
        if (EditSwitch == 2) {
            brightness = 0x80;
        }
        if (EditSwitch >= 9 && EditSwitch < 0x10) {
            brightness = 0x80 - EdEffectCt * 8;
        }
        if (EditSwitch >= 0x10 && EditSwitch < 0x16) {
            brightness = EdEffectCt * 8;
        }
        if (brightness < 0) {
            brightness = 0;
        }
        if (brightness > 0x80) {
            brightness = 0x80;
        }

        icon = EditMenuIconID[i];
        GetMenuIconInfo(icon);

        int selected;

        y_offset = 0;
        x_offset = 0;
        selected = 0;
        if (i == EdCur.selection) {
            x_offset = 6;
            y_offset = 2;
            brightness = 0x80;
            selected = 1;
        }
        DrawMainMenuIcon((int) (MenuIconPos[i][0] - x_offset),
                         (int) (MenuIconPos[i][1] - y_offset), icon, selected, 0x80, brightness);
    }
}
#ifdef NON_MATCHING
/** The screen position an icon animates to when it leaves for its own page. */
struct EDIT_MENU_ICON_TARGET {
    s16 x;
    s16 y;
};

static int CalMoveFromMenuIcon() {
    static const EDIT_MENU_ICON_TARGET panel_target[6] = {
        {0x50, 0x34}, {0x50, 0x34}, {0x50, 0x20}, {0x5E, 0x1E}, {0x50, 0x34}, {0x50, 0x34},
    };
    static const s16 offscreen_x = -250;
    int icon_max = GetEditMenuMax();
    int arrived_count = 0;

    for (int i = 0; i < icon_max; i++) {
        int arrived_axes = 0;
        s16 target_x;
        s16 target_y;

        if (i == EditSwitch - 9) {
            target_x = panel_target[i].x;
            target_y = panel_target[i].y;
        } else {
            target_x = offscreen_x;
            target_y = (s16) MenuIconPos[i][1];
        }

        float delta_x = (float) target_x - MenuIconPos[i][0];
        MenuIconPos[i][0] += delta_x / 4.0f;
        if (abs((int) delta_x) < 4.0f) {
            MenuIconPos[i][0] = target_x;
            arrived_axes++;
        }

        float delta_y = (float) target_y - MenuIconPos[i][1];
        MenuIconPos[i][1] += delta_y / 4.0f;
        if (abs((int) delta_y) < 4.0f) {
            MenuIconPos[i][1] = target_y;
            arrived_axes++;
        }

        if (arrived_axes >= 2) {
            arrived_count++;
        }
    }
    return arrived_count >= icon_max;
}
#else
INCLUDE_ASM("asm/nonmatchings/editmenu", CalMoveFromMenuIcon__Fv);
#endif
/**
 * Moves the edit menu icons back to their resting positions.
 */
static int CalMoveToMenuIcon() {
    int done = 0;
    int arrived_count = 0;
    int icon_max = GetEditMenuMax();

    for (int i = 0; i < icon_max; i++) {
        int arrived_axes = 0;
        int target[2];

        GetEditMenuIconPos(i, target);

        float delta_x = (float) target[0] - MenuIconPos[i][0];
        MenuIconPos[i][0] += delta_x / 4.0f;
        if (abs((int) delta_x) < 2.0f) {
            MenuIconPos[i][0] = target[0];
            arrived_axes++;
        }

        float delta_y = (float) target[1] - MenuIconPos[i][1];
        MenuIconPos[i][1] += delta_y / 4.0f;
        if (abs((int) delta_y) < 2.0f) {
            MenuIconPos[i][1] = target[1];
            arrived_axes++;
        }

        if (arrived_axes >= 2) {
            arrived_count++;
        }
    }
    if (arrived_count >= icon_max) {
        done = 1;
    }
    return done;
}
void EditMenuInit(int *texture_blocks, int atora) {
    StartReadBG();
    u_long128 *buffer = (u_long128 *) (EdMenuBuffer.base + EdMenuBuffer.used * 16);
    EdMenuWorkBuf = buffer + (LoadFileBGMenuData("emenu.pak", buffer) >> 4) + 1;
    EdMenuWorkBuf = MenuCalcBufAlignment(EdMenuWorkBuf);
    EdMenuTextureReadEndFlag = 0;
    EdMenuTextureBlock = texture_blocks[0];
    EdMenuExTextureBlock = texture_blocks[1];
    EdMenuExTextureBlock1 = texture_blocks[2];
    EdMenuExTextureBlock2 = texture_blocks[3];
    StayTex = TexManager.GetTexture("stayframe", -1);
    GamePad.MenuModeOn(0x78);
    GamePad.SetAutoRepeat(0xF000, 0x1E, 9);
    CommonMenuMes2.mes_made = -1;
    CommonMenuMes3.mes_made = -1;
    MakeWin2Flag = 1;
    EdMenuMesMake2 = 1;
    EdMenuMesNo2 = 0x15;
    EdMenuHelpWinAlpha = 0;
    EdEffectCt = 0;
    CursorVibeCnt = 0;
    EdMenuEffectFlag = 0;
    EdMenuEffectCt = 0;
    ItemVolumeStep.CheckItemVolume();
    if (atora != 0) {
        EdMenuTextureReadEndFlag = 1;
        EdMenuRGB = 0x40;
        MenuIconPos[0][0] = 80.0f;
        MenuIconPos[0][1] = 52.0f;
        int blocks[2] = {0, 0};
        blocks[0] = EdMenuTextureBlock;
        blocks[1] = EdMenuExTextureBlock;
        InitMenuAtora1(2, NowEditMap, blocks, EdMenuWorkBuf);
        InitMenuAtoraSelect(NowEditMap);
        EditSwitch = 3;
        CommonMenuMes2.edge_alpha = 0x80;
        CommonMenuMes3.edge_alpha = 0x80;
        return;
    }
    CommonMenuMes2.edge_alpha = 0;
    CommonMenuMes3.edge_alpha = 0;
    EdCur.selection = 0;
    EditSwitch = 1;
    EdMenuRGB = 0x80;
    WindowPos[1] = 325.0f;
    GetMainMenuRightHelpWinLangOffset(WindowPos[0], WindowPos[1], EditMenuWinW, EditMenuWinH);
    EdCur.x = 48.0f;
    EdCur.y = 76.0f;
    s16 start_x[6] = {-0xC0, -0xB0, -0xA0, -0x90, -0x80, -0x80};
    for (int i = 0; i < GetEditMenuMax(); i++) {
        MenuIconPos[i][0] = start_x[i];
        MenuIconPos[i][1] = i * 40 + 0x4A;
    }
}
static void EditMenuExit() {
    int blocks[5] = {0, 0, 0, 0, -1};

    blocks[0] = EdMenuTextureBlock;
    blocks[1] = EdMenuExTextureBlock;
    blocks[2] = EdMenuExTextureBlock1;
    blocks[3] = EdMenuExTextureBlock2;
    MenuTextureDelete(blocks);
    TexManager.CleanUpTextureList();
    GamePad.AutoRepeatOff();
    GamePad.MenuModeOff();
}

static int GetDrawHelpWindow(int draw) {
    if ((EditSwitch == 9 || EditSwitch == 3 || EditSwitch == 0x10) && GetMenuAtraEventFlag()) {
        draw = 0;
    }
    return draw;
}

int EditMenuLoop() {
    int result;

    ReadBG();
    result = 0;
    switch (EditSwitch) {
        case 2:
            result = EditMenuSelect();
            break;
        case 11:
            ToAnalyzeEdit();
            break;
        case 4:
            result = AtoraMove();
            break;
        case 5:
            result = AnalyzeEdit();
            break;
        case 3:
        case 9:
        case 16:
            result = AtoraSelect();
            break;
        case 18:
            FromAnalyzeEdit();
            break;
        case 6:
        case 12:
        case 19:
            EditSaveKey();
            break;
        case 7:
        case 13:
        case 20:
            EdOptionSelect();
            break;
        case 8:
        case 14:
        case 21:
            EdMenuManualKey();
            break;
        case 15:
            result = EditMenuToExit();
            break;
    }
    EditMenuDraw();
    return result;
}
#ifdef NON_MATCHING
void EditMenuDraw() {
    int text_x;
    int text_y;

    MenuTextureReload(EdMenuTextureBlock);
    setbilinear(0);
    FrameImageDraw(EdMenuRGB, 0x80);
    switch (EditSwitch) {
        case 1:
            EditMenuStart();
            break;
        case 2:
            EditMenuSelectDraw();
            break;
        case 11:
            ToAnalyzeEditDraw();
            break;
        case 4:
            AtoraMoveDraw();
            break;
        case 5:
            AnalyzeEditDraw();
            break;
        case 18:
            FromAnalyzeEditDraw();
            break;
        case 3:
        case 9:
        case 16:
            AtoraSelectDraw();
            break;
        case 6:
        case 12:
        case 19:
            EditSaveDraw();
            break;
        case 7:
        case 13:
        case 20:
            OptionDraw();
            break;
        case 8:
        case 14:
        case 21:
            EdMenuManualDraw();
            break;
        case 15:
            EditMenuToExitDraw();
            break;
    }
    CursorVibeCnt++;
    if (CursorVibeCnt >= 3.4906585f) {
        CursorVibeCnt = 0;
    }
    MenuTextureReload(CommonMenuMes2.tex_block);
    GetMainMenuRightHelpMsgLangOffset(text_x, text_y);
    GetMainMenuRightHelpWinLangOffset(WindowPos[0], WindowPos[1], EditMenuWinW, EditMenuWinH);
    CommonMenuMes2.text_x = (int) (WindowPos[0] + text_x);
    CommonMenuMes2.text_y = (int) (WindowPos[1] + text_y);
    if (EdMenuTextureReadEndFlag != 0) {
        if (EditSwitch != 15) {
            EdMenuHelpWinAlpha += 8;
            if (EdMenuHelpWinAlpha > 0x80) {
                EdMenuHelpWinAlpha = 0x80;
            }
            CommonMenuMes2.edge_alpha += 8;
            if (CommonMenuMes2.edge_alpha > 0x80) {
                CommonMenuMes2.edge_alpha = 0x80;
            }
        } else {
            EdMenuHelpWinAlpha -= 8;
            if (EdMenuHelpWinAlpha < 0) {
                EdMenuHelpWinAlpha = 0;
            }
            CommonMenuMes2.edge_alpha = EdMenuHelpWinAlpha;
        }
        if (GetDrawHelpWindow(MakeWin2Flag) != 0) {
            int x = (int) WindowPos[0];
            MenuHelpWinDraw(x, (int) WindowPos[1], EditMenuWinW, EditMenuWinH, EdMenuHelpWinAlpha);
            if (EdMenuMesMake2 != 0) {
                EdMenuMesMake2 = CommonMenuMes2.MakeMesWin(EdMenuMesNo2);
            }
            CommonMenuMes2.Step();
            CommonMenuMes2.DrawMesWin();
        }
    }
    setbilinear(1);
}
#else
INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuDraw__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/editmenu", @573__2);
#ifdef NON_MATCHING
static int EditMenuStart() {
    u8 six[6] = {0x50, 0x60, 0x70, 0x80, 0x80, 0x70};
    u8 five[5] = {0x50, 0x60, 0x70, 0x80, 0x70};
    int icon_max = GetEditMenuMax();
    u8 x[6] = {0x50, 0x60, 0x70, 0x80, 0x80, 0x70};
    int brightness;

    if (icon_max == 5) {
        for (int i = 0; i < icon_max; i++) {
            x[i] = five[i];
        }
    }
    if (icon_max == 6) {
        for (int i = 0; i < icon_max; i++) {
            x[i] = six[i];
        }
    }
    for (int i = 0; i < icon_max; i++) {
        MenuIconPos[i][0] += ((float) x[i] - MenuIconPos[i][0]) / 4.0f;
    }
    if (EdMenuRGB > 0x40) {
        EdMenuRGB -= 4;
    }
    brightness = EdEffectCt * 7;
    if (brightness > 0x80) {
        brightness = 0x80;
    }
    for (int i = 0; i < GetEditMenuMax(); i++) {
        int y_offset = 0;
        int x_offset = 0;
        s8 icon = EditMenuIconID[i];
        GetMenuIconInfo(icon);
        int selected = 0;
        if (i == EdCur.selection) {
            x_offset = 8;
            y_offset = 2;
            brightness = 0x80;
            selected = 1;
        }
        int draw_x = (int) (MenuIconPos[i][0] - x_offset);
        DrawMainMenuIcon(draw_x, (int) (MenuIconPos[i][1] - y_offset), icon, selected, 0x80, brightness);
    }
    if (ReadBGSync() == 0 && EdMenuTextureReadEndFlag == 0) {
        LOADTEXTURE_INFO2 texture = {0};
        int blocks[5] = {0, 0, 0, 0, 0};
        texture.block_no = EdMenuTextureBlock;
        BG_READ_INFO *file = GetReadBGFile(0);
        texture.name = (char *) GetPackFile((u_int *) file->buffer, "editmenu.img", NULL);
        blocks[0] = EdMenuTextureBlock;
        blocks[1] = EdMenuExTextureBlock;
        blocks[2] = EdMenuExTextureBlock1;
        blocks[3] = EdMenuExTextureBlock2;
        MenuTextureDelete(blocks);
        TexManager.CleanUpTextureList();
        TexManager.LoadTextureBlockEX(-1, &texture);
        Analyze = TexManager.GetTexture("analyzeB", EdMenuTextureBlock);
        AnaBar = TexManager.GetTexture("anabar", EdMenuTextureBlock);
        PerBoardTex = TexManager.GetTexture("perbrd", EdMenuTextureBlock);
        VillageName = TexManager.GetTexture("vilname", -1);
        VillageBar = TexManager.GetTexture("viltag", -1);
        GetAtraMsgReadBuf = (s16 *) GetPackFile((u_int *) file->buffer, "atrames.bin", NULL);
        InitMenuMesSet(0, (s16 *) GetPackFile((u_int *) file->buffer, "allmenu.mes", NULL));
        EdMenuTextureReadEndFlag = 1;
    }
    EdEffectCt++;
    if (EdEffectCt > 16 && EdMenuTextureReadEndFlag != 0) {
        EditSwitch = 2;
        EdCur.selection = 0;
        EdEffectCt = 0;
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuStart__Fv);
#endif
INCLUDE_RODATA("asm/nonmatchings/editmenu", @583);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @584__2);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @585__2);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @586__2);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @587__2);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @588__2);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @589__3);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @590__3);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @650__5);

/**
 * Draws the edit menu page and its selected icon.
 */
static void EditMenuSelectDraw() {
    DrawMoveMenuIcon();

    int icon_max = GetEditMenuMax();
    s8 selection = EdCur.selection;
    float slot = selection;
    float x = 48.0f + 16.0f * slot;
    if (icon_max == 6) {
        if (selection == icon_max - 2) {
            x -= 16.0f;
        }
        if (selection == icon_max - 1) {
            x -= 48.0f;
        }
    }
    if (icon_max == 5 && selection == icon_max - 1) {
        x -= 32.0f;
    }
    float y = 76.0f + 40.0f * selection;

    EdCur.x += (x - EdCur.x) / 4.0f;
    EdCur.y += (y - EdCur.y) / 3.0f;

    MENU_ICON_INFO *info = GetMenuIconInfo(EditMenuIconID[EdCur.selection]);
    int width = info->unk_1C + 0x4A;
    DrawMenuWaku(x + 18.0f, y - 15.0f, width, 0x28, 0, StayTex, 0x80);
    DrawMenuObjectVibe((int) EdCur.x, (int) EdCur.y, 1, 0x40);

    CommonMenuMes2.stay_frame = 0;
    if (CommonMenuMes2.mes_made != info->unk_24) {
        CommonMenuMes2.MakeMesWin(info->unk_24);
    }
}
#ifdef NON_MATCHING
static int EditMenuSelect() {
    int icon_max = GetEditMenuMax();
    s8 previous = EdCur.selection;

    if (GamePad.Down(0x9000) != 0) {
        EdCur.selection--;
        if (EdCur.selection < 0) {
            EdCur.selection = icon_max - 1;
        }
    }
    if (GamePad.Down(0x6000) != 0) {
        EdCur.selection++;
        if (EdCur.selection - 1 >= icon_max - 1) {
            EdCur.selection = 0;
        }
    }
    if (previous != EdCur.selection) {
        ComMenuSePlay(0);
    }
    if (GamePad.Down(0x20) != 0) {
        ComMenuSePlay(2);
        EditSwitch = 15;
        EdEffectCt = 0;
    } else if (GamePad.Down(0x40) != 0) {
        int next[6] = {9, 10, 11, 12, 13, 14};
        EditSwitch = next[EdCur.selection];
        ComMenuSePlay(1);
        EdEffectCt = 0;
        CommonMenuMes2.mes_made = -1;
        u_long128 *work = EdMenuWorkBuf;
        switch (EditSwitch) {
            case 9: {
                int blocks[2] = {0, 0};
                blocks[0] = EdMenuTextureBlock;
                blocks[1] = EdMenuExTextureBlock;
                int area = GetNowMapTransAtraMap(MapNo);
                if (area < 0 || area >= 5) {
                    area = 0;
                }
                printf("now atra load area = %d\n", area);
                InitMenuAtora1(2, NowEditMap, blocks, work);
                InitMenuAtoraSelect(NowEditMap);
                EdMenuEffectFlag = 1;
                EdMenuEffectCt = 0;
                EdMenuMesMake2 = 1;
                break;
            }
            case 10:
                EditSwitch = 4;
                break;
            case 11:
                CommonMenuAtoraInfo = &EditPartsInfo;
                if (CommonMenuAtoraInfo == NULL) {
                    CommonMenuAtoraInfo->Load(0, SaveData, 1);
                }
                EdEffectCt = 1;
                for (int i = 0; i < 3; i++) {
                    AnalyzeFill[i] = 0.0f;
                }
                ButtonAdd = 0;
                AnalyzeBackBlockCnt = 0;
                AnalyzeSelect = 0;
                MakeWin2Flag = 0;
                break;
            case 12:
                MakeWin2Flag = 0;
                EdMenuEffectFlag = 1;
                EdMenuMesMake2 = 1;
                InitMenuSave(1, EdMenuExTextureBlock, work);
                break;
            case 13:
                EdMenuMesMake2 = 1;
                EdMenuEffectFlag = 1;
                InitMenuOption(1, EdMenuExTextureBlock, work);
                break;
            case 14: {
                MakeWin2Flag = 0;
                EdMenuEffectFlag = 1;
                int blocks[3] = {0, 0, 0};
                blocks[0] = EdMenuExTextureBlock1;
                blocks[1] = EdMenuExTextureBlock;
                blocks[2] = EdMenuExTextureBlock2;
                InitMenuManual(blocks, work);
                break;
            }
        }
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuSelect__Fv);
#endif

static void EditMenuToExitDraw() {
    DrawMoveMenuIcon();
}

/**
 * Moves the edit menu offscreen while closing its message windows.
 */
static int EditMenuToExit() {
    EdMenuRGB += 3;
    if (EdMenuRGB > 0x80) {
        EdMenuRGB = 0x80;
    }

    CommonMenuMes2.edge_alpha -= 9;
    if (CommonMenuMes2.edge_alpha < 0) {
        CommonMenuMes2.edge_alpha = 0;
    }
    CommonMenuMes3.edge_alpha -= 9;
    if (CommonMenuMes3.edge_alpha < 0) {
        CommonMenuMes3.edge_alpha = 0;
    }

    for (int i = 0; i < GetEditMenuMax(); i++) {
        MenuIconPos[i][0] += (-220.0f - MenuIconPos[i][0]) / 4.0f;
    }

    EdEffectCt++;
    if (EdEffectCt > 0x15) {
        EdEffectCt = 0;
        EditMenuStatus.mode = -1;
        EditMenuStatus.parts = -1;
        EditMenuExit();
        return 1;
    }
    return 0;
}

/**
 * Draws the Atora selection page and its moving icons.
 */
static void AtoraSelectDraw() {
    if (EdMenuTextureReadEndFlag == 0 && ReadBGSync() == 0) {
        EdMenuTextureReadEndFlag = 1;
    }
    DrawMenuAtoraSelect();
    switch (EdMenuEffectFlag) {
        case 1:
        case 2:
            DrawMoveMenuIcon();
            break;
        default:
            if (GetMenuAtraEventFlag() == 0) {
                DrawMoveMenuIcon();
            }
            break;
    }
}

/**
 * Processes input and transitions on the Atora selection page.
 */
static int AtoraSelect() {
    int result = 0;

    switch (EdMenuEffectFlag) {
        case 1:
            if (CalMoveFromMenuIcon()) {
                EditSwitch = 3;
                EdMenuEffectFlag = 0;
                EdMenuEffectCt = 0.0f;
            }
            break;
        case 2:
            if (CalMoveToMenuIcon()) {
                EditSwitch = 2;
                EdCur.selection = 0;
                EdCur.x = EdCur.selection * 16 + 0x30;
                EdCur.y = EdCur.selection * 40 + 0x4C;
            }
            break;
        default:
            switch (MenuAtoraSelectKey()) {
                case 0x6E:
                case 10:
                    result = 1;
                    break;
                case 0x64:
                    EditSwitch = 0x10;
                    EdMenuEffectFlag = 2;
                    EdMenuEffectCt = 0.0f;
                    break;
                case 0:
                    break;
            }
            break;
    }

    if (EdMenuEffectFlag != 0) {
        EdMenuEffectCt += 1.0f;
        EdEffectCt++;
    } else {
        EdMenuEffectCt = 0.0f;
        EdEffectCt = 0;
    }
    return result;
}

static void AtoraMoveDraw() {}

/**
 * Closes the edit menu and selects the Atora page.
 */
static int AtoraMove() {
    EditMenuExit();
    EditMenuStatus.mode = 3;
    return 1;
}

/**
 * Draws the scrolling background panels on the analysis page.
 */
static void AnalyzeBackDraw(int alpha, int brightness) {
    AnalyzeBackBlockCnt++;
    if (AnalyzeBackBlockCnt >= 0x10E) {
        AnalyzeBackBlockCnt = 0;
    }

    int x = AnalyzeBackBlockCnt / 5 - 0x36;
    int y = 0x3C;
    for (int column = 0; column < 0xD; column++, x += 0x36, y = 0x3C) {
        for (int row = 0; row < 5; row++, y += 0x36) {
            int bottom = 0x36;
            int top = 0;
            if (y < 0x50) {
                top = 0x50 - y;
            }
            if (y + 0x36 > 0x11C) {
                bottom = 0x11C - y;
            }
            DrawMenu2DSprite(AnaBar, CRect_i_(x, y + top, 0x36, bottom - top),
                             CRect_i_(0x36, top, 0x36, bottom - top), brightness, brightness,
                             brightness, alpha);
        }
    }
}

/**
 * Returns the percentage of requested parts that have been collected.
 */
static float AnalyzeRequestPer() {
    CEditPartsInfo *info = CommonMenuAtoraInfo;
    float total = (float) info->parts_max;
    if (total < 1.0f) {
        return 100.0f;
    }

    float done = 0.0f;
    for (int i = 0; i < 24; i++) {
        if (info->request[i] != 0) {
            done += 1.0f;
        }
    }

    float percent = 100.0f * done / total;
    if (percent >= 100.0f) {
        percent = 100.0f;
    }
    return percent;
}
#ifdef NON_MATCHING
static int AnalyzeBarDraw() {
    float parts_total = 0.0f;
    float parts_complete = 0.0f;
    float elements_total = 0.0f;
    int elements_done = 0;
    int parts_done = 0;
    float per[3];
    float target[3];

    for (int i = 0; i < 24; i++) {
        EDITPARTS_INFO *info = CommonMenuAtoraInfo->GetPartsInfo(i);
        if (info != NULL && info->stock > 0) {
            parts_total += 1.0f;
            if (info->unk_08 != 0) {
                parts_done++;
                if (CommonMenuAtoraInfo->CheckComplete(i) != 0) {
                    parts_complete += 1.0f;
                }
            }
            for (int j = 0; j < 6 && info->elements[j].id >= 0; j++) {
                elements_total += 1.0f;
                if (info->elements[j].enabled != 0) {
                    elements_done++;
                }
            }
        }
    }
    s16 *elements = (s16 *) SaveData->GetElemData(NowEditMap);
    for (int i = 0; i < 128; i++) {
        if (elements[i] >= 0) {
            elements_done++;
        }
    }
    int total = (int) (parts_total + elements_total);
    if (total <= 0) {
        per[0] = 0.0f;
    } else {
        per[0] = 100.0f * (float) (parts_done + elements_done) / (float) total;
    }
    if ((int) parts_total <= 0) {
        per[1] = 0.0f;
    } else {
        per[1] = 100.0f * parts_complete / parts_total;
    }
    per[2] = AnalyzeRequestPer();
    for (int i = 0; i < 3; i++) {
        target[i] = 144.0f * per[i] / 100.0f;
        if (!(target[i] <= 144.0f)) {
            target[i] = 144.0f;
        }
    }
    int filled = 0;
    int x = -0x3D;
    for (int i = 0; i < 3; i++) {
        x += 0xB5;
        if (i != filled) {
            break;
        }
        AnalyzeFill[i] += 2.0f + 2.0f * ButtonAdd;
        float goal = target[i];
        if (goal < AnalyzeFill[i]) {
            AnalyzeFill[i] = goal;
        }
        float fill = AnalyzeFill[i];
        float cap = 0.08f * fill;
        if (cap > 8.0f) {
            cap = 8.0f;
        }
        int top = (int) (286.0f - fill);
        DrawMenu2DSprite(AnaBar, CRect_i_(x, top, 0x36, (int) fill), CRect_i_(0, i * 16 + 8, 0x36, 7), 0x80);
        DrawMenu2DSprite(AnaBar, CRect_i_(x, top, 0x36, (int) cap), CRect_i_(0, i * 16, 0x36, 8), 0x80);
        float shade = 0.1f * AnalyzeFill[i];
        if (!(AnalyzeFill[i] <= 0.0f)) {
            DrawMenu2DSprite(AnaBar, CRect_i_(x + 0x36, (int) (top + shade), 10, (int) ((float) (0x11C - top) - shade)),
                             CRect_i_(0x56, 0x36, 10, 9), 0x80);
        }
        int number = (int) (100.0f * AnalyzeFill[i] / 144.0f);
        if (per[i] < (float) number) {
            number = (int) per[i];
        }
        int digit_x = x + 0x1B;
        for (int digits = GetNumberKeta(number); digits != 0; digits--) {
            int digit = number % 10;
            int u = digit * 13;
            int v = 0x6F;
            if (digit >= 9) {
                u = 0;
                v = 0x5E;
            }
            DrawMenu2DSprite(AnaBar, CRect_i_(digit_x, top - 0x1E, 0x10, 0x18), CRect_i_(u, v, 13, 0x11), 0x8C);
            number /= 10;
            digit_x -= 13;
        }
        DrawMenu2DSprite(AnaBar, CRect_i_(x + 0x28, top - 0x1E, 0xF, 0x13), CRect_i_(13, 0x5E, 13, 0x11), 0x80);
        if (0.4f * goal <= AnalyzeFill[i]) {
            filled++;
        }
    }
    if (AnalyzeFill[2] == target[2]) {
        return 1;
    }
    return 0;
}
#else
INCLUDE_ASM("asm/nonmatchings/editmenu", AnalyzeBarDraw__Fv);
#endif
#ifdef NON_MATCHING
static void ToAnalyzeEditDraw() {
    MenuTextureReload(EdMenuTextureBlock);
    for (int i = 0; i < 3; i++) {
        DrawMenu2DSprite(Analyze, CRect_i_(i * 0xB5 + 0x56, 0x136, 0x7E, 0x50), CRect_i_(0x80, i * 0x50, 0x7E, 0x50),
                         0x80);
    }
    float left = (float) (0x280 - EdEffectCt * 16);
    int right = (int) (80.0f + left);
    if (left < 0.0f) {
        left = 0.0f;
    }
    int width = (int) ((float) right - left);
    if (width < 0) {
        width = 0;
    }
    FadeTexX((int) left, width, 0x280, 0, "frame_image", 0);
    DrawMoveMenuIcon();
    int alpha = EdEffectCt * 4;
    if (alpha > 0x80) {
        alpha = 0x80;
    }
    int bright = EdEffectCt + 16;
    if (bright > 0x40) {
        bright = 0x40;
    }
    AnalyzeBackDraw(alpha, bright);
    int done = 0;
    float bar = (float) (EdEffectCt * 20);
    if (bar > 640.0f) {
        bar = 640.0f;
    }
    if (bar > 560.0f) {
        done = AnalyzeBarDraw();
    }
    if (bar > 640.0f) {
        bar = 640.0f;
    }
    DrawMenu2DSprite(AnaBar, CRect_i_(0, 0x11C, (int) bar, 0x18), CRect_i_(0, 0x36, 0x20, 0x18), 0x80);
    for (int x = 0x75; (float) x < bar; x += 0xB5) {
        int w = (int) (bar - (float) x);
        if (w > 0x3C) {
            w = 0x3C;
        }
        DrawMenu2DSprite(AnaBar, CRect_i_(x, 0x11C, w, 0xF), CRect_i_(0x20, 0x36, 0x36, 0xF), 0x80);
    }
    CalMoveFromMenuIcon();
    EdEffectCt++;
    if (done == 1) {
        EdEffectCt = 0;
        AnalyzeSelect = 0;
        EditSwitch = 5;
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/editmenu", ToAnalyzeEditDraw__Fv);
#endif

static void ToAnalyzeEdit() {
    if (GamePad.AllOn()) {
        ButtonAdd = 2;
        EdEffectCt += 4;
    }
}

/**
 * Draws the panels and progress bars on the analysis page.
 */
static void AnalyzeEditDraw() {
    DrawMenuIcon(2);
    AnalyzeBackDraw(0x80, 0x40);

    for (int i = 0; i < 3; i++) {
        DrawMenu2DSprite(Analyze, CRect_i_(i * 0xB5 + 0x56, 0x136, 0x7E, 0x50),
                         CRect_i_(0x80, i * 0x50, 0x7E, 0x50), 0x80);
    }
    AnalyzeBarDraw();
    DrawMenu2DSprite(AnaBar, CRect_i_(0, 0x11C, 0x280, 0x18), CRect_i_(0, 0x36, 0x20, 0x18), 0x80);

    int x = 0x75;
    int i = 0;
    while (x < 0x280) {
        int width = 0x280 - x;
        if (width > 0x3C) {
            width = 0x3C;
        }
        if (AnalyzeFill[i] > 0.0f) {
            DrawMenu2DSprite(AnaBar, CRect_i_(x, 0x11C, width, 0xF),
                             CRect_i_(0x20, 0x36, 0x36, 0xF), 0x80);
        }
        i++;
        x += 0xB5;
    }
}

static int AnalyzeEdit() {
    if (GamePad.Down(0x60)) {
        ComMenuSePlay(2);
        EditSwitch = 0x12;
        AnalyzeSelect = 2;
    }
    return 0;
}

static void FromAnalyzeEditDraw() {
    int alpha;

    DrawMoveMenuIcon();
    alpha = 0x80 - EdEffectCt * 10;
    if (alpha < 0) {
        alpha = 0;
    }
    AnalyzeBackDraw(alpha, 0x40);
}

/**
 * Returns the cursor to the edit menu after analysis.
 */
static void FromAnalyzeEdit() {
    CalMoveToMenuIcon();
    EdEffectCt++;
    if (EdEffectCt >= 0x10) {
        EdEffectCt = 0;
        MakeWin2Flag = 1;
        EdCur.selection = 2;
        EdCur.x = EdCur.selection * 16 + 0x30;
        EdCur.y = EdCur.selection * 40 + 0x4C;
        EditSwitch = 2;
    }
}

/**
 * Draws the save page and its selected icon.
 */
static void EditSaveDraw() {
    DrawMenuSave("frame_image");
    setbilinear(0);
    switch (EdMenuEffectFlag) {
        case 1:
        case 2:
            DrawMoveMenuIcon();
            break;
        default:
            DrawMenuIcon(3);
            break;
    }
}

static void EditSaveKey() {
    int arrived;

    switch (EdMenuEffectFlag) {
        case 1:
            arrived = CalMoveFromMenuIcon();
            if (arrived) {
                EdMenuEffectFlag = 0;
                EdMenuEffectCt = 0.0f;
            }
            break;
        case 2:
            arrived = CalMoveToMenuIcon();
            break;
    }
    if (EdMenuEffectFlag != 0) {
        EdMenuEffectCt += 1.0f;
    } else {
        EdMenuEffectCt = 0.0f;
    }
    MenuSaveKey();
    if (SaveMenuEffectFadeOut()) {
        EdMenuEffectFlag = 2;
        if (arrived) {
            EdEffectCt = 0;
            EditSwitch = 2;
            MakeWin2Flag = 1;
        }
    }
}

/**
 * Draws the options page and its selected icon.
 */
static void OptionDraw() {
    DrawMenuOption();
    setbilinear(0);
    switch (EdMenuEffectFlag) {
        case 1:
        case 2:
            DrawMoveMenuIcon();
            break;
        default:
            DrawMenuIcon(4);
            break;
    }
}

static void EdOptionSelect() {
    int arrived = 0;
    int key;

    switch (EdMenuEffectFlag) {
        case 1:
            arrived = CalMoveFromMenuIcon();
            if (arrived) {
                EdMenuEffectFlag = 0;
                EdMenuEffectCt = 0.0f;
            }
            break;
        case 2:
            arrived = CalMoveToMenuIcon();
            break;
    }
    if (EdMenuEffectFlag != 0) {
        EdMenuEffectCt += 1.0f;
    } else {
        EdMenuEffectCt = 0.0f;
    }
    key = MenuOptionKey();
    if (OptionMenuFadeOutStart()) {
        EdMenuEffectFlag = 2;
        if (arrived && key) {
            EdEffectCt = 0;
            EditSwitch = 2;
            MakeWin2Flag = 1;
        }
    }
}

static int EdMenuManualKey() {
    int arrived = 0;
    int key;

    switch (EdMenuEffectFlag) {
        case 1:
            arrived = CalMoveFromMenuIcon();
            if (arrived) {
                EdMenuEffectFlag = 0;
                EdMenuEffectCt = 0.0f;
            }
            break;
        case 2:
            arrived = CalMoveToMenuIcon();
            break;
    }
    if (EdMenuEffectFlag != 0) {
        EdMenuEffectCt += 1.0f;
    } else {
        EdMenuEffectCt = 0.0f;
    }
    key = MenuManualKey();
    if (GetNowManualMenuMode() == 1) {
        EdMenuEffectFlag = 2;
        if (arrived && key) {
            EdEffectCt = 0;
            EditSwitch = 2;
            MakeWin2Flag = 1;
        }
    }
    return 0;
}

/**
 * Draws the manual page and its selected icon.
 */
static void EdMenuManualDraw() {
    MenuManualDraw();
    setbilinear(0);
    switch (EdMenuEffectFlag) {
        case 1:
        case 2:
            DrawMoveMenuIcon();
            break;
        default:
            DrawMenuIcon(5);
            break;
    }
}
