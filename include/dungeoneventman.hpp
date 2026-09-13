#pragma once

#include "common.h"

#include "dungeoneventdata.hpp"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CDungeonMap;
class CFrame;

/**
 * Records what one dungeon event slot is doing.
 */
struct DUNGEON_EVENT_SLOT {
    s8 unk_00;
    u8 unk_01[0xF];
    CFrame *unk_10;
    CFrame *unk_14;
    u8 unk_18[0x4];
    s32 unk_1C;
    s32 unk_20;
    u8 unk_24[0x10];
    s32 unk_34;
    u8 unk_38[0x4];
    s32 unk_3C;
};

STATIC_ASSERT(sizeof(DUNGEON_EVENT_SLOT) == 0x40);

/**
 * Owns the definition slots and runtime records for dungeon events.
 */
class CDungeonEventMan {
public:
    DUNGEON_EVENT_SLOT slot[64]; /**< What each event slot is doing. */
    CDungeonEventData event[96]; /**< What each placed event is doing. */

    /**
     * Returns a used event slot whose parts identifier matches the requested value.
     *
     * @mangled SearchPartsID__16CDungeonEventManFii
     * @address 0x1CC8F0
     * @size 0x50
     */
    DUNGEON_EVENT_SLOT *SearchPartsID(int, int);

    /**
     * Returns the first unused event slot.
     *
     * @mangled SearchSlot__16CDungeonEventManFv
     * @address 0x1CC940
     * @size 0x50
     */
    DUNGEON_EVENT_SLOT *SearchSlot(void);

    /**
     * Enables or disables every runtime event for a requested script number.
     *
     * @mangled SearchDataSwitch__16CDungeonEventManFii
     * @address 0x1CC990
     * @size 0xD0
     */
    void SearchDataSwitch(int, int);

    /**
     * Releases the hold flag for runtime events with a requested script number.
     *
     * @mangled SearchItemEventHold__16CDungeonEventManFi
     * @address 0x1CCA60
     * @size 0x70
     */
    void SearchItemEventHold(int);

    /**
     * Counts unused runtime event records.
     *
     * @mangled GetDataNum__16CDungeonEventManFv
     * @address 0x1CCAD0
     * @size 0x60
     */
    int GetDataNum(void);

    /**
     * Returns the first unused runtime event record.
     *
     * @mangled SearchDataSlot__16CDungeonEventManFv
     * @address 0x1CCB30
     * @size 0x70
     */
    CDungeonEventData *SearchDataSlot(void);

    /**
     * Returns this runtime event when one of its configured collision owners reaches it.
     *
     * @mangled CheckCollisionDataHit__16CDungeonEventManFi
     * @address 0x1CCBA0
     * @size 0x130
     */
    CDungeonEventData *CheckCollisionDataHit(int);

    /**
     * Finds a runnable event at a position or through its configured collision owners.
     *
     * @mangled SearchDataSlotPos__16CDungeonEventManFPf
     * @address 0x1CCCD0
     * @size 0x110
     */
    CDungeonEventData *SearchDataSlotPos(float *);

    /**
     * Finds a runnable event near a position after flattening small height differences.
     *
     * @mangled SearchDataSlotPos2__16CDungeonEventManFPf
     * @address 0x1CCDE0
     * @size 0x160
     */
    CDungeonEventData *SearchDataSlotPos2(float *);

    /**
     * Builds the runtime event records for a dungeon map.
     *
     * @mangled SetupEvent__16CDungeonEventManFP11CDungeonMapi
     * @address 0x1CCF40
     * @size 0x480
     */
    void SetupEvent(CDungeonMap *, int);
};

STATIC_ASSERT(sizeof(CDungeonEventMan) == 0x2800);
