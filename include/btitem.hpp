#pragma once

/**
 * Puts one party member in the player's hands, loading them if need be.
 *
 * @mangled selectChrUnit__Fii
 * @address 0x1D1030
 * @size 0x368
 */
void selectChrUnit(int chara, int mode);

/**
 * Loads the icons for the active item slots.
 *
 * @mangled LoadActiveItemIcon__Fv
 * @address 0x1D13A0
 * @size 0x4C
 */
void LoadActiveItemIcon(void);

/**
 * Gives the player an attachment and opens its acquisition message.
 *
 * @mangled BtGetAttach_Init__Fii
 * @address 0x1D3A70
 * @size 0x90
 */
void BtGetAttach_Init(int dungeon, int item_no);
