#pragma once

#include "common.h"

class CTexture;

class CRandomItem {
public:
    CTexture *gold_texture; /**< Texture that a dropped pile of gold draws with. */
    u8 unk_004[0x28C];
    s32 unk_290[32];
    u8 unk_09[0x184];
    s32 unk_494[32];
    s32 unk_514[32];
    u8 unk_594[0x8C];

    /**
     * Draws the items lying on the floor.
     *
     * @mangled Draw__11CRandomItemFv
     * @address 0x1D6BE0
     * @size 0x1BC
     */
    void Draw(void);

    /**
     * Draws the corner-map marks of the items lying on the floor.
     *
     * @mangled MapSymbolDraw__11CRandomItemFv
     * @address 0x1D6DA0
     * @size 0x148
     */
    void MapSymbolDraw(void);

    /**
     * Raises the pickup event for an item the party has walked onto.
     *
     * @mangled checkEvent__11CRandomItemFv
     * @address 0x1D6EF0
     * @size 0x50
     */
    int checkEvent(void);

    /**
     * Drops items that ended up somewhere they may not lie.
     *
     * @mangled checkErr__11CRandomItemFv
     * @address 0x1D6F40
     * @size 0x60
     */
    int checkErr(void);

    /**
     * Reports which lying item the party is standing on.
     *
     * @mangled CheckPosition__11CRandomItemFv
     * @address 0x1D6FA0
     * @size 0x250
     */
    int CheckPosition(void);

    /**
     * Puts one item on the floor at a position.
     *
     * @mangled Set__11CRandomItemFPfiii
     * @address 0x1D71F0
     * @size 0xD8
     */
    void Set(float *, int, int, int);

    /**
     * Finds a free slot among the thirty-two lying items.
     *
     * @mangled CheckID__11CRandomItemFv
     * @address 0x1D72D0
     * @size 0x4C
     */
    void CheckID(void);

    /**
     * Reports whether one item number is already lying on the floor.
     *
     * @mangled CheckItemNo__11CRandomItemFi
     * @address 0x1D7320
     * @size 0x58
     * Tells whether an item already lies on the floor.
     */
    int CheckItemNo(int);

    /**
     * Advances the lying items' bob and sparkle by a frame.
     *
     * @mangled Step__11CRandomItemFv
     * @address 0x1D7380
     * @size 0x158
     */
    void Step(void);
};

STATIC_ASSERT(sizeof(CRandomItem) == 0x620);
