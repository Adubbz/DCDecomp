#pragma once

#include "common.h"

class CDngMessageMan {
public:
    s32 unk_00;
    s32 unk_04;
    s32 unk_08;
    s32 unk_0C;
    s32 unk_10;
    s32 unk_14;
    s32 unk_18;
    s32 unk_1C;
    s32 unk_20;
    s32 unk_24;

    /**
     * Selects the warning for the current dungeon restriction zone and
     * resets its display timer.
     *
     * @mangled LimmitZone__14CDngMessageManFv
     * @address 0x1B5B90
     * @size 0xA0
     */
    void LimmitZone(void);

    /**
     * Starts or clears the warnings for a character's remaining water.
     *
     * @mangled SetStatus_Dry__14CDngMessageManFfff
     * @address 0x1B5C30
     * @size 0x110
     */
    void SetStatus_Dry(float, float, float);

    /**
     * Queues one rotating dungeon message when the display is idle.
     *
     * @mangled SetSteevMes__14CDngMessageManFi
     * @address 0x1B5D40
     * @size 0x50
     */
    void SetSteevMes(int);
};
