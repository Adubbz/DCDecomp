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
    s16 unk_00;
    u8 unk_02[2];
    s16 unk_04;
    s16 unk_06;
    s32 unk_08;
    s32 unk_0C[13];
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
 * Runs one frame of the event item selection menu, and returns its result.
 *
 * @mangled EventItemSelectLoop__FPi
 * @address 0x224140
 * @size 0x11C
 */
int EventItemSelectLoop(int *);

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
