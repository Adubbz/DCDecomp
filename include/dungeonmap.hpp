#pragma once

#include "common.h"

#include <libvu0.h>

#include "character.hpp"
#include "collision.hpp"
#include "dungeonparts.hpp"
#include "fireomni.hpp"
#include "water.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CBoxVu0;
class CCPoly;
class CCamera;
class CCameraFollow;
class CDataAlloc2_1_;
class CFrame;
class CFrameVu1;

/**
 * @file
 * Declares the dungeon map and the objects that it holds.
 */

/**
 * Describes one cell of the 20 x 20 dungeon floor grid.
 */
struct MAPPARTS {
    s32 parts_no;  /**< MapPartsNo of the part that the cell draws. */
    s32 direction; /**< Rotation that the map part uses. */
    float unk_08;
    s32 unk_0C;
};

typedef MAPPARTS MAP_CELL;

/**
 * Describes the position and the extent of one room, in grid cells.
 */
struct ROOM_INFO {
    s32 x;      /**< Grid column of the left edge. */
    s32 y;      /**< Grid row of the top edge. */
    s32 width;  /**< Width in grid cells. */
    s32 height; /**< Height in grid cells. */
};

/**
 * Describes one treasure box, or one mimic that looks like a treasure box.
 */
struct TREASURE_BOX {
    s32 used; /**< 1 if the slot is in use. */
    u8 unk_04[12];
    sceVu0FVECTOR pos; /**< World position of the box. */
    s32 item_no;       /**< Identifier of the item inside the box. */
    s32 unk_24;
    s32 kind;        /**< 0 for a large box, 1 for a small box. */
    float lid_angle; /**< Degrees the lid has swung open. */
    s32 unk_30;
    u8 unk_34[12];
};

/**
 * Describes one atla ball that the player can collect.
 */
struct ATRA_BOLL {
    float pos[4]; /**< World position of the ball. */
    s32 atra_no;  /**< Identifier of the atla inside the ball. */
    s32 used;     /**< 1 if the slot is in use. */
    float phase;  /**< Angle that makes the ball move up and down. */
    s32 unk_1C;
};

/**
 * Describes one trap circle that a trap left on the floor.
 */
struct MAP_TRAP_CIRCLE {
    float pos[4]; /**< World position of the circle. */
    s32 state;    /**< 0 for a free slot, 1 while the circle waits, 2 while the circle fades. */
    s32 kind;     /**< Identifier of the trap that the circle shows. */
    float timer;  /**< Time that passed since the circle started to fade. */
    s32 unk_1C;
};

/**
 * Records whether one special linked-room result is active.
 */
struct ROOM_LINK_RESULT {
    s32 used; /**< 1 after the linked-room item and door are placed. */
    s32 unk_04;
    u8 unk_08[16];
};

/**
 * Marks one place on the floor that starts an event when the player comes near.
 */
struct DUNGEON_EVENT {
    s32 unk_00;
    s32 unk_04;
    s32 kind; /**< -1 for a free slot, 2 for a treasure box, 3 for an atla ball, 8 for a mimic. */
    s32 unk_0C;
    float pos[4]; /**< World position that the event uses. */
    s32 unk_20;
    float radius; /**< Distance at which the event starts. */
    s32 index;    /**< Index of the object that the event belongs to. */
    s32 unk_2C;
    u8 unk_30[32];
};

/**
 * Describes one non-player character that walks in the dungeon.
 */
struct MAP_NPC_MODEL {
    CCharacter chara; /**< Draws and moves the character. */
    float pos[4];     /**< World position of the character. */
    float unk_11C0[4];
    s32 parts_no;          /**< Index of the map part that the character stands on. */
    s32 used;              /**< 1 if the slot is in use. */
    s32 unk_11D8;          /**< 0 to hide the character. */
    s32 unk_11DC;          /**< -1 to stop the character from taking a step. */
    float draw_pos[16][4]; /**< Position of each copy of the character to draw. */
    s32 draw_param[16];    /**< Parameter of each copy of the character to draw. */
    s32 draw_num;          /**< Number of copies of the character to draw. */
    u8 unk_1324[12];
};

/**
 * Builds, steps and draws one dungeon floor, and everything that stands on it.
 */
class CDungeonMap {
public:
    s32 unk_0000;
    s32 unk_0004;
    s32 room_seen[16];     /**< 1 for each room that the player found. */
    CFireOmni fire;        /**< Draws the fire and the raster of every map part. */
    CWater water;          /**< Draws the water surface. */
    float draw_dist_scale; /**< Scale that the draw distance uses. */
    s32 unk_03B4;
    s32 unk_03B8;
    sceVu0FVECTOR dummy_pos[8]; /**< World position of each dummy model. */
    s32 dummy_model[8];         /**< Index into dummy_frame of each dummy model. */
    s32 dummy_num;              /**< Number of dummy models on the floor. */
    s32 unk_0464;
    s32 map_seed;             /**< Seed that the floor was built from. */
    CFrame *dummy_frame[3];   /**< Models that a dummy model can draw with. */
    CFrame *bg_model[6];      /**< Models that draw behind the floor. */
    CDungeonParts parts[72];  /**< Map parts that the floor is built from. */
    s32 mask[400];            /**< 1 for each grid cell that the mini map shows. */
    DUNGEON_EVENT events[48]; /**< Places that start an event. */
    MAP_CELL cells[400];      /**< 20 x 20 grid of the floor. */
    ROOM_INFO rooms[16];      /**< Position and extent of each room. */
    s32 room_num;             /**< Number of rooms on the floor. */
    TREASURE_BOX boxes[24];   /**< Treasure boxes that stand on the floor. */
    s32 box_num;              /**< Number of treasure boxes on the floor. */
    CFrame *model[7];         /**< Models that the boxes and the water use. */
    ATRA_BOLL atra[8];        /**< Atla balls that lie on the floor. */
    s32 atra_num;             /**< Number of atla balls on the floor. */
    CFrame *atra_model;       /**< Model that draws an atla ball. */
    CFrame *collision_model;  /**< Model that the collision of an atla ball uses. */
    s32 link_door_x;
    s32 link_door_y;
    float link_item_x;
    float link_item_y;
    ROOM_LINK_RESULT room_link[3];
    s32 room_link_3_used;
    u8 unk_BDE8[4];
    s32 unk_BDEC;
    MAP_NPC_MODEL npc[4];           /**< Characters that walk in the dungeon. */
    MAP_TRAP_CIRCLE trap_circle[3]; /**< Trap circles that lie on the floor. */

    /**
     * @mangled SetNPC__11CDungeonMapFiPUiiPfPfiiP14CDataAlloc2_1_
     * @address 0x1C1C00
     * @size 0x270
     * @unknownret
     */
    void SetNPC(int, unsigned int *, int, sceVu0FVECTOR, sceVu0FVECTOR, int, int, CDataAlloc2_1_ *);

    /**
     * Sets the number of copies to draw of every character to zero.
     *
     * @mangled ClearNPC_Cash__11CDungeonMapFv
     * @address 0x1C1E70
     * @size 0x40
     */
    void ClearNPC_Cash(void);

    /**
     * Adds one copy of a character to the list of copies to draw.
     *
     * @mangled ReservNPC_Draw__11CDungeonMapFifffi
     * @address 0x1C1EB0
     * @size 0xD0
     */
    void ReservNPC_Draw(int npc_no, float x, float y, float z, int param);

    /**
     * @mangled DrawNPCDraw__11CDungeonMapFv
     * @address 0x1C1F80
     * @size 0x270
     * @unknownret
     */
    void DrawNPCDraw(void);

    /**
     * Takes one step with every character that is active and visible.
     *
     * @mangled StepNPC__11CDungeonMapFv
     * @address 0x1C21F0
     * @size 0xC0
     * @unknownret
     */
    void StepNPC(void);

    /**
     * Starts a motion on a character.
     *
     * @mangled NPCSetMotion__11CDungeonMapFii
     * @address 0x1C22B0
     * @size 0x40
     */
    void NPCSetMotion(int npc_no, int motion_no);

    /**
     * Starts a motion on a character at a given speed.
     *
     * @mangled NPCSetMotion__11CDungeonMapFiifi
     * @address 0x1C22F0
     * @size 0x40
     */
    void NPCSetMotion(int npc_no, int motion_no, float speed, int unk);

    /**
     * Returns the frame with the given name from the map parts, or zero if no part holds it.
     *
     * @mangled GetFrameSearch__11CDungeonMapFPc
     * @address 0x1C2330
     * @size 0x90
     */
    CFrame *GetFrameSearch(char *name);

    /**
     * Draws every map part at the origin, and reserves a copy of each character
     * that stands on one.
     *
     * @mangled DrawMapFreeStyle__11CDungeonMapFv
     * @address 0x1C23C0
     * @size 0x100
     */
    void DrawMapFreeStyle(void);

    /**
     * @mangled DrawMapCalc__11CDungeonMapFi
     * @address 0x1C24C0
     * @size 0x1D0
     * @unknownret
     */
    void DrawMapCalc(int);

    /**
     * @mangled DrawMap__11CDungeonMapFP13CCameraFollowP9CFrameVu1
     * @address 0x1C2690
     * @size 0x930
     * @unknownret
     */
    void DrawMap(CCameraFollow *, CFrameVu1 *);

    /**
     * Draws the background models at the position of the camera.
     *
     * @mangled DrawBGModel__11CDungeonMapFP7CCamera
     * @address 0x1C2FC0
     * @size 0xA0
     * @unknownret
     */
    void DrawBGModel(CCamera *camera);

    /**
     * Draws every dummy model that the camera is near enough to.
     *
     * @mangled DrawDummyModel__11CDungeonMapFP7CCamera
     * @address 0x1C3060
     * @size 0x120
     */
    void DrawDummyModel(CCamera *camera);

    /**
     * @mangled DrawMiniMap__11CDungeonMapFPff
     * @address 0x1C3180
     * @size 0x840
     * @unknownret
     */
    void DrawMiniMap(float *, float);

    /**
     * Marks the cell at a position, and the room that holds it, as found.
     *
     * @mangled checkMask__11CDungeonMapFff
     * @address 0x1C39C0
     * @size 0x240
     * @unknownret
     */
    void checkMask(float x, float z);

    /**
     * Hides every cell of the mini map, then shows the cells that hold a stair.
     *
     * @mangled FlushCheckMask__11CDungeonMapFv
     * @address 0x1C3C00
     * @size 0xC0
     */
    void FlushCheckMask(void);

    /**
     * @mangled DrawFireFreeStyle__11CDungeonMapFP9CFrameVu1P13CCameraFollow
     * @address 0x1C3CC0
     * @size 0x400
     * @unknownret
     */
    void DrawFireFreeStyle(CFrameVu1 *, CCameraFollow *);

    /**
     * @mangled DrawFire__11CDungeonMapFP9CFrameVu1P13CCameraFollow
     * @address 0x1C40C0
     * @size 0x550
     * @unknownret
     */
    void DrawFire(CFrameVu1 *, CCameraFollow *);

    /**
     * @mangled DrawRaster__11CDungeonMapFP9CFrameVu1
     * @address 0x1C4610
     * @size 0x330
     * @unknownret
     */
    void DrawRaster(CFrameVu1 *);

    /**
     * @mangled DrawWater__11CDungeonMapFPfi
     * @address 0x1C4940
     * @size 0x4A0
     * @unknownret
     */
    void DrawWater(float *, int);

    /**
     * @mangled DrawItemBox__11CDungeonMapFPf
     * @address 0x1C4DE0
     * @size 0x320
     * @unknownret
     */
    void DrawItemBox(float *);

    /**
     * Draws every atla ball that the camera is near enough to, bobbing on the spot.
     *
     * @mangled DrawAtraBoll__11CDungeonMapFPf
     * @address 0x1C5100
     * @size 0x170
     */
    void DrawAtraBoll(float *pos);

    /**
     * Adds a collision polygon for every atla ball near the player, and returns
     * the new total.
     *
     * @mangled CreateCollision__11CDungeonMapFP6CCPoly7CBoxVu0i
     * @address 0x1C5270
     * @size 0x150
     */
    int CreateCollision(CCPoly *poly, CBoxVu0 box, int num);

    /**
     * Sets every trap circle slot to free.
     *
     * @mangled initTrapCircle__11CDungeonMapFv
     * @address 0x1C79B0
     * @size 0x40
     */
    void initTrapCircle(void);

    /**
     * Returns the trap circle that is nearer to a position than a distance, or zero if there is none.
     *
     * @mangled CheckTrapCircle__11CDungeonMapFPff
     * @address 0x1C79F0
     * @size 0xC0
     */
    float *CheckTrapCircle(float *pos, float dist);

    /**
     * Puts a trap circle of a random kind in the first free slot at a position.
     *
     * @mangled SetupTrapCircle__11CDungeonMapFPf
     * @address 0x1C7AB0
     * @size 0x120
     */
    void SetupTrapCircle(float *pos);

    /**
     * @mangled DrawTrapCircle__11CDungeonMapFv
     * @address 0x1C7BD0
     * @size 0x1B0
     * @unknownret
     */
    void DrawTrapCircle(void);

    /**
     * Starts the fade of the trap circle that the player stands on, and returns its position.
     *
     * @mangled DistTrapCircle__11CDungeonMapFv
     * @address 0x1C7D80
     * @size 0xE0
     */
    MAP_TRAP_CIRCLE *DistTrapCircle(void);

    /**
     * Moves every trap circle that fades one step further, and frees the ones that finished.
     *
     * @mangled StepTrapCircle__11CDungeonMapFv
     * @address 0x1C7E60
     * @size 0x80
     */
    void StepTrapCircle(void);

    /**
     * Returns 1 if no treasure box is nearer to a position than a distance.
     *
     * @mangled CheckTreasureBox__11CDungeonMapFPff
     * @address 0x1C7EE0
     * @size 0xC0
     */
    int CheckTreasureBox(float *pos, float dist);

    /**
     * Returns 1 if no atla ball is nearer to a position than a distance.
     *
     * @mangled CheckAtra__11CDungeonMapFPff
     * @address 0x1C7FA0
     * @size 0xE0
     */
    int CheckAtra(float *pos, float dist);

    /**
     * @mangled SetAtraBoll__11CDungeonMapFPfi
     * @address 0x1C8080
     * @size 0x1C0
     * @unknownret
     */
    void SetAtraBoll(float *, int);

    /**
     * @mangled SetTreasureBox__11CDungeonMapFPfiii
     * @address 0x1C8240
     * @size 0x300
     */
    int SetTreasureBox(float *, int, int, int);

    /**
     * @mangled buildEventData__11CDungeonMapFiii
     * @address 0x1C8540
     * @size 0x680
     * @unknownret
     */
    void buildEventData(int, int, int);

    /**
     * @mangled SetMimicEvent__11CDungeonMapFfffii
     * @address 0x1C8BC0
     * @size 0x290
     * @unknownret
     */
    void SetMimicEvent(float, float, float, int, int);

    /**
     * Frees every mimic event, and the treasure box that each one shows.
     *
     * @mangled RsetMimicEvent__11CDungeonMapFv
     * @address 0x1C8E50
     * @size 0x80
     */
    void RsetMimicEvent(void);

    /**
     * Returns the event that the player stands in, or -1 if the player stands in none.
     *
     * @mangled GetActiveIvent__11CDungeonMapFP9CFrameVu1
     * @address 0x1C8ED0
     * @size 0x150
     */
    int GetActiveIvent(CFrameVu1 *frame);

    /**
     * @mangled buildDummyModel__11CDungeonMapFv
     * @address 0x1C9020
     * @size 0x5B0
     * @unknownret
     */
    void buildDummyModel(void);

    /**
     * @mangled GetRoomLinkInfo__11CDungeonMapFv
     * @address 0x1C95D0
     * @size 0xC70
     * @unknownret
     */
    void GetRoomLinkInfo(void);

    /**
     * Puts the part that closes the right edge of the grid in every row.
     *
     * @mangled SetUnderLoad__11CDungeonMapFv
     * @address 0x1CA240
     * @size 0x50
     */
    void SetUnderLoad(void);

    /**
     * @mangled CreatPartsList__11CDungeonMapFPiiii
     * @address 0x1CA290
     * @size 0x1F0
     */
    int CreatPartsList(int *, int, int, int);

    /**
     * @mangled BuildCharaSpecialParts__11CDungeonMapFv
     * @address 0x1CA480
     * @size 0xDB0
     * @unknownret
     */
    void BuildCharaSpecialParts(void);

    /**
     * @mangled SetCharaDoor__11CDungeonMapFi
     * @address 0x1CB230
     * @size 0x440
     */
    int SetCharaDoor(int);

    /**
     * Builds a floor: places the rooms, joins them with corridors, fills the
     * grid with map parts and picks the set of parts that the floor draws with.
     *
     * @mangled buildRandomMap__11CDungeonMapFii
     * @address 0x1CB670
     * @size 0xA80
     */
    void buildRandomMap(int, int);

    /**
     * @mangled initSubmap__11CDungeonMapFP14CDataAlloc2_1_
     * @address 0x1CC0F0
     * @size 0x3A0
     * @unknownret
     */
    void initSubmap(CDataAlloc2_1_ *);

    /**
     * @mangled initalize__11CDungeonMapFv
     * @address 0x1CC490
     * @size 0x390
     * @unknownret
     */
    void initalize(void);
};

/**
 * Turns the grid that the builder worked on into the map parts that draw it.
 *
 * @mangled mapPartsFilter__Fv
 * @address 0x1C5550
 * @size 0xBE0
 */
void mapPartsFilter(void);

STATIC_ASSERT(sizeof(MAP_CELL) == 0x10);
STATIC_ASSERT(sizeof(ROOM_INFO) == 0x10);
STATIC_ASSERT(sizeof(TREASURE_BOX) == 0x40);
STATIC_ASSERT(sizeof(ATRA_BOLL) == 0x20);
STATIC_ASSERT(sizeof(MAP_TRAP_CIRCLE) == 0x20);
STATIC_ASSERT(sizeof(ROOM_LINK_RESULT) == 0x18);
STATIC_ASSERT(sizeof(DUNGEON_EVENT) == 0x50);
STATIC_ASSERT(sizeof(MAP_NPC_MODEL) == 0x1330);
STATIC_ASSERT(sizeof(CDungeonMap) == 0x10B10);
