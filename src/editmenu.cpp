#include "editmenu.hpp"

#include <cstdio>
#include <cstdlib>
#include <cstring>

#include "battlemenu.hpp"
#include "dataalloc.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "edit.hpp"
#include "frame.hpp"
#include "gamepad.hpp"
#include "memcard.hpp"
#include "menu_draw.hpp"
#include "menu_manual.hpp"
#include "menu_misc.hpp"
#include "savedata.hpp"
#include "snd.hpp"
#include "texture.hpp"

#ifdef NON_MATCHING
extern "C" int abs(int);
#endif

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

extern int EditMenuStatus[7];
extern CDataAlloc2<1> EdMenuBuffer;

#ifdef NON_MATCHING
/** The edit menu's eased cursor position and current icon selection. */
struct EDIT_MENU_CURSOR {
    float x;      /**< Cursor's current screen x, eased toward its target. */
    float y;      /**< Cursor's current screen y, eased toward its target. */
    s8 selection; /**< Index of the selected icon. */
};

/** The edit menu's cursor. */
static EDIT_MENU_CURSOR EdCur;

/** Resting screen position of each edit menu icon, one x/y pair per icon. */
static float MenuIconPos[6][2];

/** The icon shown at each edit menu slot. */
static s8 EditMenuIconID[6];
#endif

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
#ifdef NON_MATCHING
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
    if (info->kind == ITEMKIND_WEAPON) {
        WEAPON_DATA *weapon = GetWeaponData(item);
        if (weapon != NULL) {
            for (int i = 0; i < 10; i++) {
                if (item == dungeon_status->chara_weapons[weapon->owner][i].item_no) {
                    count++;
                }
            }
        }
    }
    return count;
}
#else
INCLUDE_ASM("asm/nonmatchings/editmenu", GetNumHowManyItemsHave__Fi);
#endif
#ifdef NON_MATCHING
static int GetEditMenuMax() {
    int max = 6;
    if (GetGameFlagForManualMenu() == 0) {
        max = 5;
    }
    return max;
}
#else
INCLUDE_ASM("asm/nonmatchings/editmenu", GetEditMenuMax__Fv);
#endif
INCLUDE_ASM("asm/nonmatchings/editmenu", DrawMenuIcon__Fi);
INCLUDE_ASM("asm/nonmatchings/editmenu", GetEditMenuIconPos__FiPi);
#ifdef NON_MATCHING
static void DrawMoveMenuIcon() {
    int icon_max = GetEditMenuMax();
    int brightness;

    for (int i = 0; i < icon_max; i++) {
        if (EditSwitch == 2) {
            brightness = 0x80;
        }
        if (EditSwitch > 8 && EditSwitch < 0x10) {
            brightness = 0x80 - EdEffectCt * 8;
        }
        if (EditSwitch > 0xF && EditSwitch < 0x16) {
            brightness = EdEffectCt * 8;
        }
        if (brightness < 0) {
            brightness = 0;
        }
        if (brightness > 0x80) {
            brightness = 0x80;
        }

        s8 icon = EditMenuIconID[i];
        GetMenuIconInfo(icon);

        int x_offset = 0;
        int y_offset = 0;
        int selected = 0;
        if (i == EdCur.selection) {
            x_offset = 6;
            y_offset = 2;
            brightness = 0x80;
            selected = 1;
        }
        int x = (int) (MenuIconPos[i][0] - x_offset);
        int y = (int) (MenuIconPos[i][1] - y_offset);
        DrawMainMenuIcon(x, y, icon, selected, 0x80, brightness);
    }
}
#else
INCLUDE_ASM("asm/nonmatchings/editmenu", DrawMoveMenuIcon__Fv);
#endif
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
#ifdef NON_MATCHING
static int CalMoveToMenuIcon() {
    int icon_max = GetEditMenuMax();
    int arrived_count = 0;

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
    return arrived_count >= icon_max;
}
#else
INCLUDE_ASM("asm/nonmatchings/editmenu", CalMoveToMenuIcon__Fv);
#endif
INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuInit__FPii);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @464__3);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @465__2);
INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuExit__Fv);

static int GetDrawHelpWindow(int draw) {
    if ((EditSwitch == 9 || EditSwitch == 3 || EditSwitch == 0x10) && GetMenuAtraEventFlag()) {
        draw = 0;
    }
    return draw;
}

INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuLoop__Fv);
INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuDraw__Fv);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @573__2);
INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuStart__Fv);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @583);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @584__2);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @585__2);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @586__2);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @587__2);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @588__2);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @589__3);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @590__3);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @650__5);
INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuSelectDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuSelect__Fv);

static void EditMenuToExitDraw() {
    DrawMoveMenuIcon();
}

INCLUDE_ASM("asm/nonmatchings/editmenu", EditMenuToExit__Fv);
INCLUDE_ASM("asm/nonmatchings/editmenu", AtoraSelectDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/editmenu", AtoraSelect__Fv);

static void AtoraMoveDraw() {}

INCLUDE_ASM("asm/nonmatchings/editmenu", AtoraMove__Fv);
INCLUDE_ASM("asm/nonmatchings/editmenu", AnalyzeBackDraw__Fii);
INCLUDE_ASM("asm/nonmatchings/editmenu", AnalyzeRequestPer__Fv);
INCLUDE_ASM("asm/nonmatchings/editmenu", AnalyzeBarDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/editmenu", ToAnalyzeEditDraw__Fv);
INCLUDE_RODATA("asm/nonmatchings/editmenu", @894__3);

static void ToAnalyzeEdit() {
    if (GamePad.AllOn()) {
        ButtonAdd = 2;
        EdEffectCt += 4;
    }
}

INCLUDE_ASM("asm/nonmatchings/editmenu", AnalyzeEditDraw__Fv);

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

INCLUDE_ASM("asm/nonmatchings/editmenu", FromAnalyzeEdit__Fv);
INCLUDE_ASM("asm/nonmatchings/editmenu", EditSaveDraw__Fv);
INCLUDE_ASM("asm/nonmatchings/editmenu", EditSaveKey__Fv);
INCLUDE_ASM("asm/nonmatchings/editmenu", OptionDraw__Fv);

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

INCLUDE_ASM("asm/nonmatchings/editmenu", EdMenuManualDraw__Fv);
