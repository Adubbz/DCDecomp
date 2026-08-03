#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CDungeonMap;


class CDungeonEventMan {
public:
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
