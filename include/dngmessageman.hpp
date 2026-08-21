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
     * @mangled LimmitZone__14CDngMessageManFv
     * @address 0x1B5B90
     * @size 0xA0
     * @unknownret
     */
    void LimmitZone(void);

    /**
     * @mangled SetStatus_Dry__14CDngMessageManFfff
     * @address 0x1B5C30
     * @size 0x110
     * @unknownret
     */
    void SetStatus_Dry(float, float, float);

    /**
     * @mangled SetSteevMes__14CDngMessageManFi
     * @address 0x1B5D40
     * @size 0x50
     * @unknownret
     */
    void SetSteevMes(int);
};
