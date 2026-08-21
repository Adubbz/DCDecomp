#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CDungeonMap;


/**
 * Records what one placed dungeon event is doing.
 */
struct DUNGEON_EVENT_STATE {
    s32 unk_00;
    u8 unk_04[0x2C];
    s32 unk_30;
    s32 unk_34;
    s32 unk_38;
    s32 unk_3C;
};

STATIC_ASSERT(sizeof(DUNGEON_EVENT_STATE) == 0x40);

/**
 * Records what one dungeon event slot is doing.
 */
struct DUNGEON_EVENT_SLOT {
    s8 unk_00;
    u8 unk_01[0x1B];
    s32 unk_1C;
    s32 unk_20;
    u8 unk_24[0x10];
    s32 unk_34;
    u8 unk_38[0x4];
    s32 unk_3C;
};

STATIC_ASSERT(sizeof(DUNGEON_EVENT_SLOT) == 0x40);

class CDungeonEventMan {
public:
    DUNGEON_EVENT_SLOT slot[64]; /**< What each event slot is doing. */
    DUNGEON_EVENT_STATE event[96]; /**< What each placed event is doing. */

    /**
     * @mangled SearchPartsID__16CDungeonEventManFii
     * @address 0x1CC8F0
     * @size 0x50
     * @unknownret
     */
    void SearchPartsID(int, int);

    /**
     * @mangled SearchSlot__16CDungeonEventManFv
     * @address 0x1CC940
     * @size 0x50
     * @unknownret
     */
    void SearchSlot(void);

    /**
     * @mangled SearchDataSwitch__16CDungeonEventManFii
     * @address 0x1CC990
     * @size 0xD0
     * @unknownret
     */
    void SearchDataSwitch(int, int);

    /**
     * @mangled SearchItemEventHold__16CDungeonEventManFi
     * @address 0x1CCA60
     * @size 0x70
     * @unknownret
     */
    void SearchItemEventHold(int);

    /**
     * @mangled GetDataNum__16CDungeonEventManFv
     * @address 0x1CCAD0
     * @size 0x60
     * @unknownret
     */
    void GetDataNum(void);

    /**
     * @mangled SearchDataSlot__16CDungeonEventManFv
     * @address 0x1CCB30
     * @size 0x70
     * @unknownret
     */
    void SearchDataSlot(void);

    /**
     * @mangled CheckCollisionDataHit__16CDungeonEventManFi
     * @address 0x1CCBA0
     * @size 0x130
     * @unknownret
     */
    void CheckCollisionDataHit(int);

    /**
     * @mangled SearchDataSlotPos__16CDungeonEventManFPf
     * @address 0x1CCCD0
     * @size 0x110
     * @unknownret
     */
    void SearchDataSlotPos(float *);

    /**
     * @mangled SearchDataSlotPos2__16CDungeonEventManFPf
     * @address 0x1CCDE0
     * @size 0x160
     * @unknownret
     */
    void SearchDataSlotPos2(float *);

    /**
     * @mangled SetupEvent__16CDungeonEventManFP11CDungeonMapi
     * @address 0x1CCF40
     * @size 0x480
     * @unknownret
     */
    void SetupEvent(CDungeonMap *, int);
};

STATIC_ASSERT(sizeof(CDungeonEventMan) == 0x2800);
