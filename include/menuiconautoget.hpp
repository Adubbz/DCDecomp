#pragma once

#include "common.h"

class CMenuIconAutoGet {
public:
    /**
     * Reports whether an icon is still flying to its slot.
     *
     * @mangled IsMoveIcon__16CMenuIconAutoGetFv
     * @address 0x2380B0
     * @size 0x40
     */
    void IsMoveIcon(void);

    /**
     * Reports whether an item is already flying to a slot.
     *
     * @mangled IsSameItem__16CMenuIconAutoGetFi
     * @address 0x2380F0
     * @size 0x40
     */
    void IsSameItem(int);

    /**
     * Gives the screen position an icon is to fly to.
     *
     * @mangled GetMoveIconGole__16CMenuIconAutoGetFii
     * @address 0x238130
     * @size 0x4C
     */
    void GetMoveIconGole(int, int);

    /**
     * Gives a free slot among the three flying icons.
     *
     * @mangled GetSpace__16CMenuIconAutoGetFv
     * @address 0x238180
     * @size 0x48
     */
    void GetSpace(void);

    /**
     * Advances the flying icons and puts what lands into the inventory.
     *
     * @mangled IconAutoMove__16CMenuIconAutoGetFv
     * @address 0x2381D0
     * @size 0x18C
     */
    void IconAutoMove(void);

    /**
     * Starts one icon flying from a position to a slot.
     *
     * @mangled IconMoveTarSet__16CMenuIconAutoGetFiiiiff
     * @address 0x238360
     * @size 0x24
     */
    void IconMoveTarSet(int, int, int, int, float, float);

    /**
     * Draws the icons part-way through their flight.
     *
     * @mangled IconAutoMoveDraw__16CMenuIconAutoGetFv
     * @address 0x238390
     * @size 0xBC
     */
    void IconAutoMoveDraw(void);
};
