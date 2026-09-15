#pragma once

#include "common.h"

class CMenuIconAutoGet {
public:
    /**
     * @mangled IsMoveIcon__16CMenuIconAutoGetFv
     * @address 0x2380B0
     * @size 0x40
     * @unknownret
     */
    void IsMoveIcon(void);

    /**
     * @mangled IsSameItem__16CMenuIconAutoGetFi
     * @address 0x2380F0
     * @size 0x40
     * @unknownret
     */
    void IsSameItem(int);

    /**
     * @mangled GetMoveIconGole__16CMenuIconAutoGetFii
     * @address 0x238130
     * @size 0x4C
     * @unknownret
     */
    void GetMoveIconGole(int, int);

    /**
     * @mangled GetSpace__16CMenuIconAutoGetFv
     * @address 0x238180
     * @size 0x48
     * @unknownret
     */
    void GetSpace(void);

    /**
     * @mangled IconAutoMove__16CMenuIconAutoGetFv
     * @address 0x2381D0
     * @size 0x18C
     * @unknownret
     */
    void IconAutoMove(void);

    /**
     * @mangled IconMoveTarSet__16CMenuIconAutoGetFiiiiff
     * @address 0x238360
     * @size 0x24
     * @unknownret
     */
    void IconMoveTarSet(int, int, int, int, float, float);

    /**
     * @mangled IconAutoMoveDraw__16CMenuIconAutoGetFv
     * @address 0x238390
     * @size 0xBC
     * @unknownret
     */
    void IconAutoMoveDraw(void);
};
