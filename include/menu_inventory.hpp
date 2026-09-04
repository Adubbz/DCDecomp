#pragma once

#include "common.h"

struct ATTACH_LIST;
class CTexture;
struct IHAVEITEM;
struct ITEM_PACK;
struct WEAPON_HAVE;

/**
 * Places or exchanges a weapon selected on the personal inventory board.
 *
 * @mangled PersonalBoardWeaponPush__FP9IHAVEITEMi
 * @address 0x0022F0A0
 * @size 0x350
 */
int PersonalBoardWeaponPush(IHAVEITEM *item, int board_pos);

/**
 * Places or exchanges an attachment selected on the personal inventory board.
 *
 * @mangled PersonalBoardAttachPush__FP9IHAVEITEMi
 * @address 0x0022F3F0
 * @size 0xD8
 */
int PersonalBoardAttachPush(IHAVEITEM *item, int board_pos);

/**
 * Gets or exchanges the item at the selected personal-board position.
 *
 * @mangled PersonalBoardItemGetorSwap__Fi
 * @address 0x0022F4D0
 * @size 0x7C
 */
int PersonalBoardItemGetorSwap(int board_pos);

/**
 * Cancels the current personal-board item operation.
 *
 * @mangled PersonalBoardItemCancel__Fv
 * @address 0x0022F550
 * @size 0x208
 */
void PersonalBoardItemCancel();

/**
 * Returns the maximum visible entry count for a personal-board mode.
 *
 * @mangled PersonalRetMax__Fi
 * @address 0x0022F760
 * @size 0x64
 */
int PersonalRetMax(int board_mode);

/**
 * Draws the entries in the active personal inventory board.
 *
 * @mangled DrawPersonalBoard__Fiiiii
 * @address 0x0022F7D0
 * @size 0x1FC
 */
void DrawPersonalBoard(int x, int y, int board_mode, int cursor_pos, int alpha);

/**
 * Draws the equipped-weapon marker on a personal-board entry.
 *
 * @mangled DrawNowEquipWeaponMark__Fiiiii
 * @address 0x0022F9D0
 * @size 0x100
 */
void DrawNowEquipWeaponMark(int x, int y, int weapon_no, int character_no, int alpha);

/**
 * Draws a common inventory icon with its quantity and state overlays.
 *
 * @mangled CommonIconDraw__Fiiiiiii
 * @address 0x0022FAD0
 * @size 0x4F0
 */
void CommonIconDraw(int x, int y, int item_no, int quantity, int state, int alpha, int scale);

/**
 * Draws the frame surrounding a personal inventory board.
 *
 * @mangled PersonalBoardDrawWaku__FiiP8CTexturei
 * @address 0x0022FFC0
 * @size 0x17C
 */
void PersonalBoardDrawWaku(int x, int y, CTexture *texture, int alpha);

/**
 * Draws the option area associated with a personal inventory board.
 *
 * @mangled PersonalBoardOptionDraw__FiiiiP8CTexturei
 * @address 0x00230140
 * @size 0xC8
 */
void PersonalBoardOptionDraw(int x, int y, int board_mode, int cursor_pos, CTexture *texture, int alpha);

/**
 * Draws the category tags associated with a personal inventory board.
 *
 * @mangled PersonalBoardTagDraw__FiiiP8CTextureii
 * @address 0x00230210
 * @size 0x50C
 */
void PersonalBoardTagDraw(int x, int y, int board_mode, CTexture *texture, int cursor_pos, int alpha);

/**
 * Draws and updates the personal-board scroll bar.
 *
 * @mangled PersonalBoardScrlBarDraw__FiiiRfUcP8CTexturei
 * @address 0x00230720
 * @size 0x294
 */
void PersonalBoardScrlBarDraw(int x, int y, int count, float &scroll, unsigned char visible_count, CTexture *texture, int alpha);

/**
 * Draws the personal-board maximum-capacity indicator.
 *
 * @mangled PersonalBoardMaxDraw__FiiiP8CTexturei
 * @address 0x002309C0
 * @size 0x238
 */
void PersonalBoardMaxDraw(int x, int y, int board_mode, CTexture *texture, int alpha);

/**
 * Draws the base layers of a personal inventory board.
 *
 * @mangled DrawPersonalBoardBase__FiiiiiP8CTexturei
 * @address 0x00230C00
 * @size 0x1C0
 */
void DrawPersonalBoardBase(int x, int y, int width, int height, int board_mode, CTexture *texture, int alpha);

/**
 * Draws one complete personal-board view.
 *
 * @mangled DrawPerBoardDraw__FiiiiiiP8CTexturei
 * @address 0x00230DC0
 * @size 0x298
 */
void DrawPerBoardDraw(int x, int y, int board_mode, int cursor_pos, int top_pos, int count, CTexture *texture, int alpha);

/**
 * Draws the common trash target used by inventory boards.
 *
 * @mangled CommonTrushDraw__Fiii
 * @address 0x00231060
 * @size 0x13C
 */
void CommonTrushDraw(int x, int y, int alpha);

/**
 * Tests whether the selected item may be thrown into the trash target.
 *
 * @mangled IsEnableTrushThrow__Fi
 * @address 0x002311A0
 * @size 0x1B4
 */
int IsEnableTrushThrow(int item_no);

/**
 * Draws the common money panel used by inventory menus.
 *
 * @mangled CommonMoneyBoardDraw__Fiiii
 * @address 0x00231360
 * @size 0x174
 */
void CommonMoneyBoardDraw(int x, int y, int money, int alpha);

/**
 * Returns whether an item occupies a specified board position.
 *
 * @mangled SearchBoardNowPosItemExist__Fii
 * @address 0x002314E0
 * @size 0xE0
 */
s16 SearchBoardNowPosItemExist(int board_mode, int board_pos);

/**
 * Finds an available inventory-board slot for an item kind.
 *
 * @mangled GetBoardSpace__FiPi
 * @address 0x002315C0
 * @size 0x200
 */
int GetBoardSpace(int item_no, int *board_pos);

/**
 * Exchanges two entries in an item pack.
 *
 * @mangled SwapItem__FP9ITEM_PACKii
 * @address 0x002317C0
 * @size 0x38
 */
void SwapItem(ITEM_PACK *items, int first_pos, int second_pos);

/**
 * Compares two item identifiers in inventory sort order.
 *
 * @mangled CompItem__Fii
 * @address 0x00231800
 * @size 0x11C
 */
int CompItem(int first_item_no, int second_item_no);

/**
 * Performs one sorting pass over an item board.
 *
 * @mangled SeitonItemBoardSub__FP9ITEM_PACK
 * @address 0x00231920
 * @size 0x11C
 */
int SeitonItemBoardSub(ITEM_PACK *items);

/**
 * Sorts all entries in an item board.
 *
 * @mangled SeitonItemBoard__FP9ITEM_PACK
 * @address 0x00231A40
 * @size 0x88
 */
void SeitonItemBoard(ITEM_PACK *items);

/**
 * Compares two attachment records in inventory sort order.
 *
 * @mangled CompAttach__FP11ATTACH_LISTP11ATTACH_LIST
 * @address 0x00231B70
 * @size 0xFC
 */
int CompAttach(ATTACH_LIST *first, ATTACH_LIST *second);

/**
 * Performs one sorting pass over an attachment board.
 *
 * @mangled SeitonAttachBoardSub__FP11ATTACH_LIST__2
 * @address 0x00231C70
 * @size 0x11C
 */
int SeitonAttachBoardSub(ATTACH_LIST *attachments);

/**
 * Sorts all entries in an attachment board.
 *
 * @mangled SeitonAttachBoard__FP11ATTACH_LIST
 * @address 0x00231D90
 * @size 0x90
 */
void SeitonAttachBoard(ATTACH_LIST *attachments);

/**
 * Returns the inventory category containing an item identifier.
 *
 * @mangled WhatIsKindofItem__Fi
 * @address 0x00231E20
 * @size 0x64
 */
int WhatIsKindofItem(int item_no);

/**
 * Returns the character currently equipping a weapon identifier.
 *
 * @mangled WhoIsWeaponEquip__Fi
 * @address 0x00231E90
 * @size 0x74
 */
s8 WhoIsWeaponEquip(int weapon_no);

/**
 * Returns the number of attachment holes on a weapon definition.
 *
 * @mangled GetWeaponHoleNum__Fi
 * @address 0x00231F10
 * @size 0xB4
 */
int GetWeaponHoleNum(int weapon_no);

/**
 * Returns the number of occupied attachment holes on a held weapon.
 *
 * @mangled GetNowWeaponAttachNum__FP11WEAPON_HAVE
 * @address 0x00231FD0
 * @size 0xA4
 */
int GetNowWeaponAttachNum(WEAPON_HAVE *weapon);

/**
 * Returns the maximum experience level encoded by a held weapon.
 *
 * @mangled GetWeaponMaxExp__FP11WEAPON_HAVE
 * @address 0x00232080
 * @size 0xA4
 */
s8 GetWeaponMaxExp(WEAPON_HAVE *weapon);

/**
 * Counts the requested item in an item pack.
 *
 * @mangled GetNowItemNum__FsP9ITEM_PACK
 * @address 0x00232130
 * @size 0x8C
 */
void GetNowItemNum(short item_no, ITEM_PACK *items);

/**
 * Removes one used item from an item pack.
 *
 * @mangled DeleteItemAfterUseItem__FsP9ITEM_PACK
 * @address 0x002321C0
 * @size 0xCC
 */
void DeleteItemAfterUseItem(short item_no, ITEM_PACK *items);

/**
 * Returns the maximum entry count for an inventory-board mode.
 *
 * @mangled GetNowModeMaxNum__FiPi
 * @address 0x00232290
 * @size 0x1FC
 */
int GetNowModeMaxNum(int board_mode, int *maximum);

/**
 * Initializes a held-weapon record from its weapon definition.
 *
 * @mangled WepDataListToHaveCopy__FiP11WEAPON_HAVE
 * @address 0x00232490
 * @size 0x1B4
 */
void WepDataListToHaveCopy(int weapon_no, WEAPON_HAVE *weapon);

/**
 * Initializes an attachment record from its attachment definition.
 *
 * @mangled AttachDataListToHaveCopy__FiP11ATTACH_LIST
 * @address 0x00232650
 * @size 0x68
 */
void AttachDataListToHaveCopy(int attachment_no, ATTACH_LIST *attachment);

/**
 * Returns the initial quantity or volume for an item definition.
 *
 * @mangled ItemDataToHaveCopy__Fi
 * @address 0x002326C0
 * @size 0x104
 */
s16 ItemDataToHaveCopy(int item_no);

/**
 * Draws a texture across the complete menu display rectangle.
 *
 * @mangled DrawFullSizePicture__FP8CTextureiii
 * @address 0x002327D0
 * @size 0x54
 */
void DrawFullSizePicture(CTexture *texture, int picture_no, int alpha, int blend_mode);
