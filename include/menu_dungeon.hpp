#pragma once

#include "common.h"

#include "menu_draw.hpp"

/**
 * Adds one attachment's values into another, scaled by a factor.
 *
 * @mangled PlusAttachmentVolume__FP11ATTACH_LISTP11ATTACH_LISTf
 * @address 0x225810
 * @size 0x158
 */
void PlusAttachmentVolume(ATTACH_LIST *, ATTACH_LIST *, float);

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
 * Restores the pad and textures when the dungeon entrance menu closes.
 *
 * @mangled ExitDunEnterMenu__Fv
 * @address 0x226520
 * @size 0x70
 */
void ExitDunEnterMenu(void);

/**
 * Runs one frame of the dungeon entrance menu, and returns its result once it closes.
 *
 * @mangled DunEnterMenuLoop__Fv
 * @address 0x226590
 * @size 0x8C
 */
int DunEnterMenuLoop(void);

/**
 * Handles key input on the dungeon entrance menu.
 *
 * @mangled DunEnterMenuKey__Fv
 * @address 0x226620
 * @size 0x6EC
 */
int DunEnterMenuKey(void);

/**
 * Draws the dungeon entrance menu.
 *
 * @mangled DunEnterDraw__Fv
 * @address 0x226D10
 * @size 0x538
 */
void DunEnterDraw(void);

/**
 * Draws the frame of the dungeon entrance board.
 *
 * @mangled DunEnterBoardWaku__Fiii
 * @address 0x227250
 * @size 0x4AC
 */
void DunEnterBoardWaku(int, int, int);

/**
 * Draws the dungeon entry board.
 *
 * @mangled DunEnterBoard__Fiii
 * @address 0x227700
 * @size 0x7C0
 */
void DunEnterBoard(int, int, int);

/**
 * Draws a number right to left, one digit at a time, clipped to the board.
 *
 * @mangled DrawEnemyNum__Fiiiiii
 * @address 0x227EC0
 * @size 0x154
 */
void DrawEnemyNum(int, int, int, int, int, int);

/**
 * Draws the collected Atla count on the dungeon entrance board.
 *
 * @mangled DrawGetAtoraNumBoard__Fiiiiii
 * @address 0x228020
 * @size 0x248
 */
void DrawGetAtoraNumBoard(int, int, int, int, int, int);

/**
 * Draws one digit of the dungeon board's numbers, clipped to the board.
 *
 * @mangled DrawDunNumberClip__Fiiiiii
 * @address 0x228270
 * @size 0xDC
 */
void DrawDunNumberClip(int, int, int, int, int, int);

/**
 * Draws the dungeon entry screen's background and its darkening box.
 *
 * @mangled DrawDunEnterBack__Fi
 * @address 0x228350
 * @size 0x9C
 */
void DrawDunEnterBack(int);

/**
 * Draws the floor's name and number on the dungeon entry board.
 *
 * @mangled DrawDunEnterFloorName__Fiiiiii
 * @address 0x2283F0
 * @size 0x290
 */
void DrawDunEnterFloorName(int, int, int, int, int, int);

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
 * Sets up the item preview's model and textures once they have been read.
 *
 * @mangled EnterItemPolygonView__Fv
 * @address 0x22AD20
 * @size 0x21C
 */
int EnterItemPolygonView(void);

/**
 * Turns and scales the item model under pad control, then draws it.
 *
 * @mangled LocalDrawItemPolygonView__Fv
 * @address 0x22AF40
 * @size 0x26C
 */
void LocalDrawItemPolygonView(void);

/**
 * Draws the item preview model.
 *
 * @mangled DrawItemPolygonView__Fv
 * @address 0x22B1B0
 * @size 0x38
 */
void DrawItemPolygonView(void);

/**
 * Maps a debug item selection to its spreadsheet item number.
 *
 * @mangled ConvDebugSelectToExcelListNo__Fi
 * @address 0x22B1F0
 * @size 0x4C
 */
int ConvDebugSelectToExcelListNo(int selection);

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

/**
 * Draws the debug overlay listing an item's data.
 *
 * @mangled DrawItemDataView__Fi
 * @address 0x22B7C0
 * @size 0x230
 */
void DrawItemDataView(int);
