#pragma once

#include "common.h"

#include "menu_draw.hpp"

/**
 * Holds the save menu's current step and the arguments its steps pass to
 * each other.
 */
struct SAVE_MENU_STATE {
    s32 unk_0;
    s32 key_no;        /**< Index of the step run next, into SaveMenuFunc. */
    s32 return_key_no; /**< Step to go back to once a card operation finishes, or -1. */
    s32 file_no;       /**< Save slot the current step works on. */
    s32 unk_10;
    s8 result; /**< How the screen ended: 0 while it runs, 1 after a load, 2 otherwise. */
    u8 unk_15[3];
    s32 loaded; /**< Whether a save file has been loaded. */
    s32 unk_1C;
    s32 unk_20;
    u8 unk_24[4];
    s32 unk_28;
    s32 block_no;      /**< Texture block the save board's textures load into. */
    s32 texture_ready; /**< Whether the save board's textures have been entered. */
};

STATIC_ASSERT(sizeof(SAVE_MENU_STATE) == 0x34);

/** Current step of the save menu and the arguments it carries between steps. */
extern SAVE_MENU_STATE SaveMenu;

/**
 * Holds the state of the event item selection menu.
 */
struct MINI_MENU_INFO {
    s16 unk_0;
    u8 unk_2[2];
    s16 unk_4;
    s16 unk_6;
    s32 unk_8;
    s32 unk_C[13];
    s32 unk_40;
    s8 unk_44;
    s8 unk_45;
    u8 unk_46[2];
    s32 unk_48;
    s16 unk_4C;
    u8 unk_4E[2];
    s32 unk_50;
};

STATIC_ASSERT(sizeof(MINI_MENU_INFO) == 0x54);

/**
 * Checks the memory card before a save and picks the save menu's next step.
 *
 * @mangled SaveMenuKeySaveCheck__Fv
 * @address 0x221730
 * @size 0x168
 */
int SaveMenuKeySaveCheck(void);

/**
 * Handles the save menu's prompt to confirm a save.
 *
 * @mangled SaveMenuKeySaveDecide__Fv
 * @address 0x2218A0
 * @size 0xE0
 */
int SaveMenuKeySaveDecide(void);

/**
 * Steps the save menu while the game is written to the memory card.
 *
 * @mangled SaveMenuKeySave__Fv
 * @address 0x221980
 * @size 0x130
 */
int SaveMenuKeySave(void);

/**
 * Waits for a button press once a save has finished.
 *
 * @mangled SaveMenuKeyEndSave__Fv
 * @address 0x221AB0
 * @size 0x74
 */
int SaveMenuKeyEndSave(void);

/**
 * Handles the save menu's prompt to confirm a load.
 *
 * @mangled SaveMenuKeyLoadDecide__Fv
 * @address 0x221B30
 * @size 0x100
 */
int SaveMenuKeyLoadDecide(void);

/**
 * Steps the save menu while a save is read from the memory card.
 *
 * @mangled SaveMenuKeyLoad__Fv
 * @address 0x221C30
 * @size 0xDC
 */
int SaveMenuKeyLoad(void);

/**
 * Waits for a button press while the save menu shows an alert.
 *
 * @mangled SaveMenuKeyArart__Fv
 * @address 0x221D10
 * @size 0x128
 */
int SaveMenuKeyArart(void);

/**
 * Handles the save menu's prompt to create new save data.
 *
 * @mangled SaveMenuKeyNewDirSelect__Fv
 * @address 0x221E40
 * @size 0xC8
 */
int SaveMenuKeyNewDirSelect(void);

/**
 * Steps the save menu while new save data is created on the memory card.
 *
 * @mangled SaveMenuKeyNewDir__Fv
 * @address 0x221F10
 * @size 0x108
 */
int SaveMenuKeyNewDir(void);

/**
 * Handles the save menu's memory card format step.
 *
 * @mangled SaveMenuKeyFormat__Fv
 * @address 0x222020
 * @size 0x150
 */
int SaveMenuKeyFormat(void);

/**
 * Steps the save menu when the memory card is not formatted.
 *
 * @mangled SaveMenuKeyUnFormat__Fv
 * @address 0x222170
 * @size 0x78
 */
int SaveMenuKeyUnFormat(void);

/**
 * Waits for a button press when the save data is of a different version.
 *
 * @mangled SaveMenuKeyDifVersion__Fv
 * @address 0x2221F0
 * @size 0x5C
 */
int SaveMenuKeyDifVersion(void);

/**
 * Steps the delete choice of the save menu.
 *
 * @mangled SaveMenuKeyDelete__Fv
 * @address 0x222250
 * @size 0xC
 */
s32 SaveMenuKeyDelete(void);

/**
 * Steps the copy choice of the save menu.
 *
 * @mangled SaveMenuKeyCopy__Fv
 * @address 0x222260
 * @size 0xC
 */
s32 SaveMenuKeyCopy(void);

/**
 * Handles key input on the save menu offered after the ending.
 *
 * @mangled SaveMenuKeyAfterEnding__Fv
 * @address 0x222270
 * @size 0x7C
 */
int SaveMenuKeyAfterEnding(void);

/**
 * Handles the prompt to confirm a save after the ending.
 *
 * @mangled SaveMenuKeySaveDecideEnding__Fv
 * @address 0x2222F0
 * @size 0x7C
 */
int SaveMenuKeySaveDecideEnding(void);

/**
 * Steps the save menu while saving after the ending.
 *
 * @mangled SaveMenuKeySaveEnding__Fv
 * @address 0x222370
 * @size 0x3C
 */
int SaveMenuKeySaveEnding(void);

/**
 * Waits for a button press once the save after the ending has finished.
 *
 * @mangled SaveMenuKeyEndSaveEnding__Fv
 * @address 0x2223B0
 * @size 0x58
 */
int SaveMenuKeyEndSaveEnding(void);

/**
 * Returns the message number the save menu shows for its current step.
 *
 * @mangled GetSaveMenuMsgNo__Fv
 * @address 0x222410
 * @size 0x230
 */
int GetSaveMenuMsgNo(void);

/**
 * Loads the save menu's textures, messages and memory card icon.
 *
 * @mangled SaveMenuTextureEnter__Fv
 * @address 0x222640
 * @size 0x2C4
 */
int SaveMenuTextureEnter(void);

/**
 * Tells whether the save menu's fade-out is running.
 *
 * @mangled SaveMenuEffectFadeOut__Fv
 * @address 0x222910
 * @size 0x28
 */
int SaveMenuEffectFadeOut(void);

/**
 * Computes the save board's alpha ramp at a position and at that position
 * offset by the second argument.
 *
 * @mangled GetSaveBoardAlphaInfo__FiiRiRii
 * @address 0x222940
 * @size 0x154
 */
void GetSaveBoardAlphaInfo(int x, int width, int &start_alpha, int &end_alpha, int alpha);

/**
 * Draws the board of one save slot with its save data summary.
 *
 * @mangled DrawSaveBoard__FP13SAVEDATA_INFOPP8CTextureiiii
 * @address 0x222AA0
 * @size 0x9B8
 */
void DrawSaveBoard(SAVEDATA_INFO *, CTexture **, int, int, int, int);

/**
 * Draws the board of a save slot that holds no save data.
 *
 * @mangled DrawNewFileTemplete__Fiii
 * @address 0x223460
 * @size 0x4DC
 */
void DrawNewFileTemplete(int, int, int);

/**
 * Starts memory card access and checks the card for existing save data.
 *
 * @mangled InitExistData__Fv
 * @address 0x223940
 * @size 0x174
 */
int InitExistData(void);

/**
 * Checks whether the memory card can take a save.
 *
 * @mangled SaveEnableCheck__Fv
 * @address 0x223AC0
 * @size 0x1A0
 */
int SaveEnableCheck(void);

/**
 * Opens the event item selection menu.
 *
 * @mangled InitEventItemSelect__FiPiP9ITEM_PACKiiii
 * @address 0x223C60
 * @size 0x478
 */
void InitEventItemSelect(int, int *, ITEM_PACK *, int, int, int, int);

/**
 * Frees the event item selection menu's textures and releases the pad.
 *
 * @mangled EventItemSelectExit__Fv
 * @address 0x2240E0
 * @size 0x5C
 */
void EventItemSelectExit(void);

/**
 * Runs one frame of the event item selection menu, and returns its result.
 *
 * @mangled EventItemSelectLoop__FPi
 * @address 0x224140
 * @size 0x11C
 */
int EventItemSelectLoop(int *);

/**
 * Handles pad input for the event item selection menu.
 *
 * @mangled EventItemSelectKey__FPi
 * @address 0x224260
 * @size 0x6A4
 */
int EventItemSelectKey(int *);

/**
 * Draws one vertical section of the board the event and fishing menus share.
 *
 * @mangled DrawEventAndFishMenuBoard_Ver__FP8CTexture8CRect_i_iiii
 * @address 0x224910
 * @size 0x148
 */
void DrawEventAndFishMenuBoard_Ver(CTexture *, CRect_i_, int, int, int, int);

/**
 * Draws the board the event and fishing menus share.
 *
 * @mangled DrawEventAndFishMenuBoard__FP8CTextureiiii
 * @address 0x224A60
 * @size 0x2E8
 */
void DrawEventAndFishMenuBoard(CTexture *, int, int, int, int);

/**
 * Draws the event item selection menu.
 *
 * @mangled EventItemSelectDraw__Fv
 * @address 0x224D50
 * @size 0x6C4
 */
void EventItemSelectDraw(void);

/**
 * Draws a section of the event item board, clipped to a range.
 *
 * @mangled DrawEventItemBoard__FiiiiiP8CTexture
 * @address 0x225420
 * @size 0x10C
 */
void DrawEventItemBoard(int, int, int, int, int, CTexture *);

/**
 * Tells whether the player holds an item, in the dungeon inventory or in storage.
 *
 * @mangled PlayerAllItemCheck__Fi
 * @address 0x225530
 * @size 0x9C
 */
int PlayerAllItemCheck(int item);

/**
 * Tells whether an item identifier is an additive attachment.
 *
 * @mangled GetAddAttachItem__Fi
 * @address 0x2255D0
 * @size 0x28
 */
s32 GetAddAttachItem(int);

/**
 * Converts a weapon item identifier into its position in the owner's weapon chain.
 *
 * @mangled TransWepNo__Fi
 * @address 0x225600
 * @size 0xE0
 */
int TransWepNo(int weapon_no);

/**
 * Converts a position in an owner's weapon chain back into the weapon's item identifier.
 *
 * @mangled TransWepNoNewToOld__Fi
 * @address 0x2256E0
 * @size 0x128
 */
int TransWepNoNewToOld(int weapon_no);

/**
 * Takes one hit off the weapon the player holds and gives back what broke:
 * 0 for nothing, 1 for the weapon, 2 for the one it fell back to.
 *
 * @mangled BattleSubWeaponDmg__Ffi
 * @address 0x1B5D90
 * @size 0x570
 */
int BattleSubWeaponDmg(float amount, int kind);
