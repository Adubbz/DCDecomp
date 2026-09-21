#pragma once

#include "common.h"

#include "menu_draw.hpp"

/**
 * State of the debug item menu, which hands out any item on request.
 */
struct ITEM_AUTO_GET {
    s32 selection;  /**< Entry the cursor stands on. */
    s32 page;       /**< Page of 64 entries the cursor is on. */
    s32 show_model; /**< Toggled by the key that previews the selected item's model. */
};

STATIC_ASSERT(sizeof(ITEM_AUTO_GET) == 0xC);

/**
 * Returns how much a weapon's attachments raise one of its values.
 *
 * @mangled GetWeaponAttachStatusUp__FP11WEAPON_HAVEi
 * @address 0x225970
 * @size 0x124
 */
int GetWeaponAttachStatusUp(WEAPON_HAVE *, int);

/**
 * Recomputes a held weapon's values from its attachments.
 *
 * @mangled SetWeaponAttachStatus__FP11WEAPON_HAVE
 * @address 0x225AA0
 * @size 0xB4
 */
void SetWeaponAttachStatus(WEAPON_HAVE *);

/**
 * Applies a weapon's attachments to its stats and writes the result into a
 * second weapon record.
 *
 * @mangled WeaponAllValueSet__FP11WEAPON_HAVEP11WEAPON_HAVEi
 * @address 0x225B60
 * @size 0x3E8
 */
void WeaponAllValueSet(WEAPON_HAVE *, WEAPON_HAVE *, int);

/**
 * Fills an attachment record from the attachment data table.
 *
 * @mangled SetAttachMentValue__FiisP11ATTACH_LIST
 * @address 0x225F50
 * @size 0x154
 */
int SetAttachMentValue(int, int, short, ATTACH_LIST *);

/**
 * Returns the stat value an attachment adds, for its message line.
 *
 * @mangled GetAttachVolumeForMsg__FP11ATTACH_LIST
 * @address 0x2260B0
 * @size 0x60
 */
int GetAttachVolumeForMsg(ATTACH_LIST *);

/**
 * Opens the dungeon entrance menu for a dungeon and floor.
 *
 * @mangled InitDunEnterMenu__Fiii
 * @address 0x226110
 * @size 0x408
 */
int InitDunEnterMenu(int texture_block, int dungeon, int requested_floor);

/**
 * Runs one frame of the dungeon entrance menu, and returns its result once it closes.
 *
 * @mangled DunEnterMenuLoop__Fv
 * @address 0x226590
 * @size 0x8C
 */
int DunEnterMenuLoop(void);

/**
 * Opens the character change menu.
 *
 * @mangled StartQuickChange__FP1iPii
 * @address 0x228680
 * @size 0x524
 */
void StartQuickChange(u_long128 *, int, int *, int);

/**
 * Runs one frame of the character change menu, and returns its result.
 *
 * @mangled CharaChangeLoop__Fv
 * @address 0x228BB0
 * @size 0x2DC
 */
int CharaChangeLoop(void);

/**
 * Handles key input on the character change menu.
 *
 * @mangled CharaChangeKey__Fv
 * @address 0x228E90
 * @size 0x8A8
 */
int CharaChangeKey(void);

/**
 * Draws the character change menu.
 *
 * @mangled CharaChangeDraw__Fv
 * @address 0x229740
 * @size 0xAC4
 */
void CharaChangeDraw(void);

/**
 * Starts reading the model of the active item.
 *
 * @mangled DngActItemModelReadStart__FP1
 * @address 0x22A210
 * @size 0x17C
 */
int DngActItemModelReadStart(u_long128 *buffer);

/**
 * Builds the active item's model once its file has been read.
 *
 * @mangled DngActItemModelBuild__Fi
 * @address 0x22A390
 * @size 0x20C
 */
int DngActItemModelBuild(int);

/**
 * @mangled DngActiveItemTextureCopy__Fv
 * @address 0x22A5A0
 * @size 0x104
 * @unknownret
 */
void DngActiveItemTextureCopy(void);

/**
 * @mangled DngActiveWeaponTextureCopy__Fv
 * @address 0x22A6B0
 * @size 0x130
 * @unknownret
 */
void DngActiveWeaponTextureCopy(void);

/**
 * Returns the message number of a held weapon's name.
 *
 * @mangled GetWeaponMsgNo__FP11WEAPON_HAVE
 * @address 0x22A7E0
 * @size 0x58
 */
s32 GetWeaponMsgNo(WEAPON_HAVE *);

/**
 * Returns the message number of an item's name.
 *
 * @mangled GetWeaponMsgNo2__Fi
 * @address 0x22A840
 * @size 0x38
 */
s16 GetWeaponMsgNo2(int);

/**
 * Draws the attachments set in a weapon's holes.
 *
 * @mangled DrawWepAttach__FiiP11WEAPON_HAVEii
 * @address 0x22A880
 * @size 0x1B4
 */
void DrawWepAttach(int, int, WEAPON_HAVE *, int, int);

/**
 * Tells whether the player has an Atla piece, held or placed.
 *
 * @mangled GetAtraTipNowHave__Fii
 * @address 0x22AA40
 * @size 0x17C
 */
int GetAtraTipNowHave(int, int);

/**
 * Converts a value into the whole number the menus display for it.
 *
 * @mangled GetDispVolumeForFloat__Ff
 * @address 0x22ABC0
 * @size 0x70
 */
int GetDispVolumeForFloat(float);

/**
 * Starts reading the model the item preview shows.
 *
 * @mangled InitItemPolygonView__FiP1
 * @address 0x22AC30
 * @size 0xF0
 */
int InitItemPolygonView(int item_no, u_long128 *buffer);

/**
 * Draws the item preview model.
 *
 * @mangled DrawItemPolygonView__Fv
 * @address 0x22B1B0
 * @size 0x38
 */
void DrawItemPolygonView(void);

/**
 * Handles key input on the debug item menu.
 *
 * @mangled DebugItemGetKey__Fv
 * @address 0x22B240
 * @size 0x370
 */
int DebugItemGetKey(void);

/**
 * Draws the debug item menu.
 *
 * @mangled DebugItemGetDraw__Fv
 * @address 0x22B5B0
 * @size 0x204
 */
void DebugItemGetDraw(void);
