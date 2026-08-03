#pragma once

#include "common.h"

class CRandomItem {
public:
    /**
     * @mangled Draw__11CRandomItemFv
     * @address 0x1D6BE0
     * @size 0xF4
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled MapSymbolDraw__11CRandomItemFv
     * @address 0x1D6DA0
     * @size 0x150
     * @unknownret
     */
    void MapSymbolDraw(void);

    /**
     * @mangled checkEvent__11CRandomItemFv
     * @address 0x1D6EF0
     * @size 0x50
     * @unknownret
     */
    void checkEvent(void);

    /**
     * @mangled checkErr__11CRandomItemFv
     * @address 0x1D6F40
     * @size 0x60
     * @unknownret
     */
    void checkErr(void);

    /**
     * @mangled CheckPosition__11CRandomItemFv
     * @address 0x1D6FA0
     * @size 0x250
     * @unknownret
     */
    void CheckPosition(void);

    /**
     * @mangled Set__11CRandomItemFPfiii
     * @address 0x1D71F0
     * @size 0xE0
     * @unknownret
     */
    void Set(float *, int, int, int);

    /**
     * @mangled CheckID__11CRandomItemFv
     * @address 0x1D72D0
     * @size 0x50
     * @unknownret
     */
    void CheckID(void);

    /**
     * @mangled CheckItemNo__11CRandomItemFi
     * @address 0x1D7320
     * @size 0x60
     * @unknownret
     */
    void CheckItemNo(int);

    /**
     * @mangled Step__11CRandomItemFv
     * @address 0x1D7380
     * @size 0x160
     * @unknownret
     */
    void Step(void);
};
