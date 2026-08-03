#pragma once

#include "common.h"

class CDungeonParts {
public:
    /**
     * @mangled GetSearchFrame__13CDungeonPartsFPc
     * @address 0x1C1590
     * @size 0xE0
     * @unknownret
     */
    void GetSearchFrame(char *);

    /**
     * @mangled SetHealZone__13CDungeonPartsFPfff
     * @address 0x1C1670
     * @size 0x60
     * @unknownret
     */
    void SetHealZone(float *, float, float);

    /**
     * @mangled Draw__13CDungeonPartsFv
     * @address 0x1C16D0
     * @size 0x180
     * @unknownret
     */
    void Draw(void);

    /**
     * @mangled DrawCalc__13CDungeonPartsFiiii
     * @address 0x1C1850
     * @size 0x350
     * @unknownret
     */
    void DrawCalc(int, int, int, int);

    /**
     * @mangled initalize__13CDungeonPartsFv
     * @address 0x1C1BA0
     * @size 0x60
     * @unknownret
     */
    void initalize(void);
};
