#pragma once

#include "common.h"

class CTexture;

class CRandomItem {
public:
    CTexture *gold_texture; /**< Texture that a dropped pile of gold draws with. */
    u8 unk_004[0x28C];
    s32 unk_290[32];
    u8 unk_310[0x184];
    s32 unk_494[32];
    s32 unk_514[32];
    u8 unk_594[0x8C];

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
     */
    int CheckPosition(void);

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

STATIC_ASSERT(sizeof(CRandomItem) == 0x620);
