#pragma once

#include "common.h"

class ClsMes;
class CTexture;

/**
 * Holds the manual screen's loading, selection, transition and message state.
 */
struct MANUAL_MENU_STATE {
    s16 common_texture_block; /**< Texture block containing the manual's common controls. */
    s16 image_texture_block;  /**< Texture block containing the first three page images. */
    s16 extra_texture_block;  /**< Texture block containing any remaining page images. */
    s16 messages_ready;       /**< Whether the manual message archive has been installed. */
    s16 images_ready;         /**< Whether the selected entry's images have been installed. */
    s16 selection_level;      /**< Selects categories (-2), entries (-1), or an open entry (0). */
    s16 mode;                 /**< Current manual screen transition and interaction mode. */
    s16 char_width;           /**< Width of one character in the menu's preloaded message font. */
    s32 category;             /**< Selected manual category. */
    s32 entry;                /**< Selected entry within the category. */
    s32 transition_frame;     /**< Frames elapsed in the current opening or closing transition. */
    s32 image_offset;         /**< Horizontal offset of the strip of page images. */
    s32 unk_20;
    s16 message_page;         /**< Page reached in the selected entry's explanatory message. */
    s16 image_page;           /**< Page image currently displayed. */
    s16 *common_message_buffer; /**< Message data restored while leaving an entry. */
    s16 *menu_message_buffer;   /**< Message data used by the category menu. */
    u_long128 *load_buffer;     /**< Aligned scratch buffer used for manual archives. */
};

STATIC_ASSERT(sizeof(MANUAL_MENU_STATE) == 0x34);

/** Number of page images in each manual entry. */
extern s8 ManualTgaNum[24];

/** State of the open manual screen. */
extern MANUAL_MENU_STATE ManualMenu;

/** Textures for the page images of the selected entry. */
extern CTexture *ManualMenuTex[6];

/** Message window used by the manual's category list. */
extern ClsMes *ManualMsg;

/**
 * Returns the image number for the current manual page and part.
 *
 * @mangled GetNowManualPartTgaNum__Fv
 * @address 0x00233520
 * @size 0x38
 */
s8 GetNowManualPartTgaNum();

/**
 * Reports whether the party has the item that unlocks the manual.
 *
 * @mangled GetGameFlagForManualMenu__Fv
 * @address 0x00233560
 * @size 0x64
 */
int GetGameFlagForManualMenu();

/**
 * Begins loading the image resources for the current manual page.
 *
 * @mangled ManualImgLoad__Fv
 * @address 0x002335D0
 * @size 0x1A8
 */
s16 ManualImgLoad();

/**
 * Installs a completed manual image load into the menu texture state.
 *
 * @mangled ManualImgEnter__Fv
 * @address 0x00233780
 * @size 0x308
 */
s16 ManualImgEnter();

/**
 * Draws the previous-page and next-page cursors for the manual.
 *
 * @mangled DrawPrevNextCursor__Fv
 * @address 0x00233A90
 * @size 0x14C
 */
void DrawPrevNextCursor();

/**
 * Draws the explanatory message for the current manual page.
 *
 * @mangled DrawManualMsg__Fv
 * @address 0x00233BE0
 * @size 0x1EC
 */
void DrawManualMsg();

/**
 * Initializes the manual menu from its placement data and load buffer.
 *
 * @mangled InitMenuManual__FPiP1
 * @address 0x00233DD0
 * @size 0x130
 */
void InitMenuManual(int *result, u_long128 *load_buffer);

/**
 * Builds the message buffer for the current manual entry.
 *
 * @mangled SetManualMsgBuffer__Fv
 * @address 0x00233F00
 * @size 0x588
 */
s16 SetManualMsgBuffer();

/**
 * Releases manual-menu state and restores the surrounding menu.
 *
 * @mangled ExitManualMenu__Fv
 * @address 0x00234490
 * @size 0x88
 */
void ExitManualMenu();

/**
 * Returns the manual menu's current mode.
 *
 * @mangled GetNowManualMenuMode__Fv
 * @address 0x00234520
 * @size 0x10
 */
int GetNowManualMenuMode();

/**
 * Processes manual-menu input and page transitions, and returns 1 on the
 * frame the manual closes.
 *
 * @mangled MenuManualKey__Fv
 * @address 0x00234530
 * @size 0x798
 */
int MenuManualKey();

/**
 * Draws the current manual page and its controls.
 *
 * @mangled MenuManualDraw__Fv
 * @address 0x00234CD0
 * @size 0x304
 */
void MenuManualDraw();
