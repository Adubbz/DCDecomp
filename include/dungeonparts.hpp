#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;

/**
 * @file
 * Declares one part of a dungeon floor and the operations on it.
 */

/**
 * Describes the water surface that one map part shows.
 */
struct PARTS_WATER {
    s32 used; /**< 1 if the part shows water. */
    u8 unk_04[12];
    float vertex[4][4]; /**< Four corners of the water surface. */
    u8 red;             /**< Red part of the colour of the water. */
    u8 unk_51[3];
    u8 green; /**< Green part of the colour of the water. */
    u8 unk_55[3];
    u8 blue; /**< Blue part of the colour of the water. */
    u8 unk_59[3];
    s32 has_fall; /**< 1 if the part shows a waterfall. */
};

/**
 * Draws one part of a dungeon floor.
 */
class CDungeonParts {
public:
    s16 unk_000;
    s16 unk_002;
    s32 unk_004;
    s16 unk_008;
    s16 unk_00A;
    s32 unk_00C;
    s16 unk_010;
    s16 unk_012;
    u8 unk_014[124];
    PARTS_WATER water;
    float pos[4];  /**< World position of the part. */
    s16 direction; /**< Rotation that the part uses. */
    s16 unk_102;
    u8 unk_104[108];
    s32 unk_170[6];
    u8 unk_188[32];
    s32 unk_1A8;
    s32 unk_1AC;
    CFrame *frame[6]; /**< Models that draw the part; a free slot has zero in the first. */
    u8 unk_1C8[8];

public:
    /**
     * Returns the frame with the given name, or zero if the part does not hold it.
     *
     * @mangled GetSearchFrame__13CDungeonPartsFPc
     * @address 0x1C1590
     * @size 0xE0
     */
    CFrame *GetSearchFrame(char *name);

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

STATIC_ASSERT(sizeof(PARTS_WATER) == 0x60);
STATIC_ASSERT(sizeof(CDungeonParts) == 0x1D0);
