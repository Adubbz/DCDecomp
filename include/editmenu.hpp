#pragma once

#include "common.h"

class CTexture;

/**
 * State that the edit menu keeps between frames.
 */
struct EDIT_MENU_STATUS {
    s32 mode;  /**< What the menu is doing; -1 while it is closed. */
    s32 parts; /**< Plot of the part the player picked, or -1. */
    u8  unk_08[8];
    s32 event_no; /**< Event the menu asks the loop to run. */
    u8  unk_14[8];
};

STATIC_ASSERT(sizeof(EDIT_MENU_STATUS) == 0x1C);

/**
 * The edit menu's eased cursor position and current icon selection.
 */
struct EDIT_MENU_CURSOR {
    float x;         /**< Cursor's current screen x, eased toward its target. */
    float y;         /**< Cursor's current screen y, eased toward its target. */
    s8    selection; /**< Index of the selected icon. */
};

STATIC_ASSERT(sizeof(EDIT_MENU_CURSOR) == 0xC);

/**
 * The edit menu's state.
 */
extern EDIT_MENU_STATUS EditMenuStatus;

/**
 * Returns how many of an item the party is carrying.
 *
 * @mangled GetNumHowManyItemsHave__Fi
 * @address 0x2101D0
 * @size 0x104
 */
int GetNumHowManyItemsHave(int item);

/**
 * Loads the edit menu's data and textures and sets up its windows, pad and cursor.
 *
 * @mangled EditMenuInit__FPii
 * @address 0x210AB0
 * @size 0x2E4
 */
void EditMenuInit(int *texture_blocks, int start_at_atora);

/**
 * Runs one frame of the edit menu for its current state and returns the result.
 *
 * @mangled EditMenuLoop__Fv
 * @address 0x210EA0
 * @size 0x110
 */
int EditMenuLoop();

/**
 * Draws the edit menu for its current state.
 *
 * @mangled EditMenuDraw__Fv
 * @address 0x210FB0
 * @size 0x304
 */
void EditMenuDraw();

/**
 * Resting screen position of each edit menu icon, one x/y pair per icon.
 */
extern float MenuIconPos[6][2];

/**
 * The edit menu's cursor.
 */
extern EDIT_MENU_CURSOR EdCur;

/**
 * How far each of the analysis page's three bars has filled, in screen columns.
 */
extern float AnalyzeFill[3];

/**
 * The icon shown at each edit menu slot.
 */
extern s8 EditMenuIconID[6];

/**
 * The texture the analysis page's headings come from.
 */
extern CTexture *Analyze;

/**
 * The texture the analysis page's panels, bars and digits come from.
 */
extern CTexture *AnaBar;

/**
 * Whether the edit menu's page textures have finished reading.
 */
extern int EdMenuTextureReadEndFlag;

/**
 * Texture block containing the edit menu's main page textures.
 */
extern int EdMenuTextureBlock;

/**
 * Work buffer the edit menu reads its files into.
 */
extern u_long128 *EdMenuWorkBuf;

/**
 * Texture block containing the edit menu's first extra texture set.
 */
extern int EdMenuExTextureBlock;

/**
 * Texture block containing the edit menu's second extra texture set.
 */
extern int EdMenuExTextureBlock1;

/**
 * Texture block containing the edit menu's third extra texture set.
 */
extern int EdMenuExTextureBlock2;

/**
 * The state the edit menu is in.
 */
extern int EditSwitch;

/**
 * How bright the edit menu's message windows draw while it closes.
 */
extern s16 EdMenuRGB;

/**
 * The frame count of the edit menu's current transition.
 */
extern int EdEffectCt;

/**
 * Opacity of the edit menu's help window.
 */
extern s16 EdMenuHelpWinAlpha;

/**
 * The selection on the edit menu's analyze page.
 */
extern s16 AnalyzeSelect;

/**
 * Message the edit menu's second window shows.
 */
extern int EdMenuMesNo2;

/**
 * Whether the edit menu's second window's message is to be made.
 */
extern int EdMenuMesMake2;

/**
 * The speed-up the analyze bar draws with, set to 2 while any input is held.
 */
extern s16 ButtonAdd;

/**
 * How far the analysis page's scrolling background has moved.
 */
extern s16 AnalyzeBackBlockCnt;

/**
 * The edit menu icon's movement: 1 while CalMoveFromMenuIcon runs, 2 while CalMoveToMenuIcon runs, 0 for none.
 */
extern s16 EdMenuEffectFlag;

/**
 * The frame count of the edit menu icon's movement.
 */
extern float EdMenuEffectCt;

/**
 * Screen position of the edit menu's help window.
 */
extern float WindowPos[2];

/**
 * Width of the edit menu's help window.
 */
extern float EditMenuWinW;

/**
 * Height of the edit menu's help window.
 */
extern float EditMenuWinH;

/**
 * Whether the edit menu's second window is to be made.
 */
extern s16 MakeWin2Flag;
