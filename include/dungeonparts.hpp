#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CFrame;
struct MAPPARTS;

/**
 * @file
 * Declares one part of a dungeon floor and the operations on it.
 */

/**
 * Names each map part that a dungeon floor is built from.
 *
 * A floor holds one part definition per number, in the order the dungeon's
 * configuration file declares them, and a grid cell names the part it draws by
 * its number. A group of four covers the four directions a part can face, in
 * the order north, east, south, west.
 */
// clang-format off
enum MapPartsNo {
    MAP_PARTS_NONE = -1, /**< The cell draws no part. */

    MAP_PARTS_ROAD_STRAIGHT = 0, /**< Corridor that runs straight through. */
    MAP_PARTS_ROAD_CORNER   = 1, /**< Corridor that turns a corner. */
    MAP_PARTS_ROAD_CROSS    = 2, /**< Corridor that meets three others. */
    MAP_PARTS_ROAD_TEE      = 3, /**< Corridor that meets two others. */
    MAP_PARTS_ROAD_DEAD_END = 4, /**< Corridor that stops. */

    MAP_PARTS_ROOM_WALL_NORTH = 5,
    MAP_PARTS_ROOM_WALL_EAST  = 6,
    MAP_PARTS_ROOM_WALL_SOUTH = 7,
    MAP_PARTS_ROOM_WALL_WEST  = 8,

    MAP_PARTS_ROOM_DOOR_NORTH = 9, /**< Room wall that a corridor opens into. */
    MAP_PARTS_ROOM_DOOR_EAST  = 10,
    MAP_PARTS_ROOM_DOOR_SOUTH = 11,
    MAP_PARTS_ROOM_DOOR_WEST  = 12,

    MAP_PARTS_ROOM_CORNER_NORTH_WEST = 13,
    MAP_PARTS_ROOM_CORNER_NORTH_EAST = 14,
    MAP_PARTS_ROOM_CORNER_SOUTH_EAST = 15,
    MAP_PARTS_ROOM_CORNER_SOUTH_WEST = 16,

    MAP_PARTS_ROOM_FLOOR = 17, /**< Open floor inside a room. */

    MAP_PARTS_DIVIDE_END_NORTH = 18, /**< End of a wall that divides a room. */
    MAP_PARTS_DIVIDE_END_EAST  = 19,
    MAP_PARTS_DIVIDE_END_SOUTH = 20,
    MAP_PARTS_DIVIDE_END_WEST  = 21,

    MAP_PARTS_DIVIDE_DOOR_NORTH = 22, /**< Door through a wall that divides a room. */
    MAP_PARTS_DIVIDE_DOOR_EAST  = 23,
    MAP_PARTS_DIVIDE_DOOR_SOUTH = 24,
    MAP_PARTS_DIVIDE_DOOR_WEST  = 25,

    MAP_PARTS_DIVIDE_WALL_NORTH = 26, /**< Wall that divides a room. */
    MAP_PARTS_DIVIDE_WALL_EAST  = 27,
    MAP_PARTS_DIVIDE_WALL_SOUTH = 28,
    MAP_PARTS_DIVIDE_WALL_WEST  = 29,

    MAP_PARTS_STAIR_DOWN = 30, /**< Stair that the player comes in by. */
    MAP_PARTS_STAIR_UP   = 31, /**< Stair that the player leaves by, which the gate key opens. */

    MAP_PARTS_HEAL_SPRING_NORTH = 32, /**< Spring that heals the party. */
    MAP_PARTS_HEAL_SPRING_EAST  = 33,
    MAP_PARTS_HEAL_SPRING_SOUTH = 34,
    MAP_PARTS_HEAL_SPRING_WEST  = 35,

    MAP_PARTS_ROOM_GATE_NORTH = 36, /**< Door that closes the room a floor links to. */
    MAP_PARTS_ROOM_GATE_EAST  = 37,
    MAP_PARTS_ROOM_GATE_SOUTH = 38,
    MAP_PARTS_ROOM_GATE_WEST  = 39,

    MAP_PARTS_URA_ENTRANCE_NORTH = 40, /**< Way in and out of the back floor. */
    MAP_PARTS_URA_ENTRANCE_EAST  = 41,
    MAP_PARTS_URA_ENTRANCE_SOUTH = 42,
    MAP_PARTS_URA_ENTRANCE_WEST  = 43,

    MAP_PARTS_URA_ROAD = 44, /**< Corridor of the back floor. */

    MAP_PARTS_PILLAR_1 = 45, /**< Pillar that stands in a room. */
    MAP_PARTS_PILLAR_2 = 46,

    /* Two more sets of room door, which the floor builder does not select. */
    MAP_PARTS_ROOM_DOOR_B_NORTH = 47,
    MAP_PARTS_ROOM_DOOR_B_EAST  = 48,
    MAP_PARTS_ROOM_DOOR_B_SOUTH = 49,
    MAP_PARTS_ROOM_DOOR_B_WEST  = 50,
    MAP_PARTS_ROOM_DOOR_C_NORTH = 51,
    MAP_PARTS_ROOM_DOOR_C_EAST  = 52,
    MAP_PARTS_ROOM_DOOR_C_SOUTH = 53,
    MAP_PARTS_ROOM_DOOR_C_WEST  = 54,

    MAP_PARTS_KEY_DOOR_XIAO_NORTH = 55, /**< Room door that only Xiao opens. */
    MAP_PARTS_KEY_DOOR_XIAO_EAST  = 56,
    MAP_PARTS_KEY_DOOR_XIAO_SOUTH = 57,
    MAP_PARTS_KEY_DOOR_XIAO_WEST  = 58,

    MAP_PARTS_KEY_XIAO = 59, /**< The second part that only Xiao opens. */

    MAP_PARTS_KEY_DOOR_GORO_NORTH = 60, /**< Room door that only Goro opens. */
    MAP_PARTS_KEY_DOOR_GORO_EAST  = 61,
    MAP_PARTS_KEY_DOOR_GORO_SOUTH = 62,
    MAP_PARTS_KEY_DOOR_GORO_WEST  = 63,

    MAP_PARTS_KEY_DOOR_RUBY_NORTH = 64, /**< Room door that only Ruby opens. */
    MAP_PARTS_KEY_DOOR_RUBY_EAST  = 65,
    MAP_PARTS_KEY_DOOR_RUBY_SOUTH = 66,
    MAP_PARTS_KEY_DOOR_RUBY_WEST  = 67,

    MAP_PARTS_KEY_UNGAGA = 68, /**< The part that only Ungaga opens. */
    MAP_PARTS_KEY_OSMOND = 69, /**< The part that only Osmond opens. */
};
// clang-format on

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
    CFrame *unk_004;
    s16 unk_008;
    s16 unk_00A;
    s32 unk_00C;
    s16 unk_010;
    s16 fire_num; /**< Number of points of the part that show a fire. */
    u8 unk_014[12];
    float fire_pos[6][4]; /**< Position of each point of the part that shows a fire. */
    s8 fire_param[16];    /**< Parameter of the fire at each point. */
    PARTS_WATER water;
    float pos[4];  /**< World position of the part. */
    s16 direction; /**< Rotation that the part uses. */
    s16 unk_102;
    u8 unk_104[12];
    float unk_110[4];
    u8 unk_120[80];
    float unk_170;
    s32 unk_174[5];
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

/**
 * Selects one item preset for a treasure box on a floor.
 *
 * @mangled PresetSmallItemNo_Get__Fiiii
 * @address 0x1BFEF0
 * @size 0x4D0
 */
int PresetSmallItemNo_Get(int map_no, int floor_no, int special, int small);

/**
 * Selects a random open world position in a rectangular group of cells.
 *
 * @mangled SearchiDoPutArea__FP8MAPPARTSiiiiPf
 * @address 0x1C03C0
 * @size 0x580
 * @unknownret
 */
void SearchiDoPutArea(MAPPARTS *cells, int x, int y, int width, int height, float *pos);

/**
 * Selects the atla identifiers that appear on a floor.
 *
 * @mangled BtAtraFloorCyoice__FiiPi
 * @address 0x1C0D20
 * @size 0x2A0
 */
int BtAtraFloorCyoice(int map_no, int floor_no, int *atra_no);
