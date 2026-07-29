#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CDungeonMap;


class CDungeonEventMan {
public:
    /* ?ret */ void SearchPartsID(int, int); // @ 0x1CC8F0 (0x50 bytes) -- mangled: SearchPartsID__16CDungeonEventManFii
    /* ?ret */ void SearchSlot(void); // @ 0x1CC940 (0x50 bytes) -- mangled: SearchSlot__16CDungeonEventManFv
    /* ?ret */ void SearchDataSwitch(int, int); // @ 0x1CC990 (0xD0 bytes) -- mangled: SearchDataSwitch__16CDungeonEventManFii
    /* ?ret */ void SearchItemEventHold(int); // @ 0x1CCA60 (0x70 bytes) -- mangled: SearchItemEventHold__16CDungeonEventManFi
    /* ?ret */ void GetDataNum(void); // @ 0x1CCAD0 (0x60 bytes) -- mangled: GetDataNum__16CDungeonEventManFv
    /* ?ret */ void SearchDataSlot(void); // @ 0x1CCB30 (0x70 bytes) -- mangled: SearchDataSlot__16CDungeonEventManFv
    /* ?ret */ void CheckCollisionDataHit(int); // @ 0x1CCBA0 (0x130 bytes) -- mangled: CheckCollisionDataHit__16CDungeonEventManFi
    /* ?ret */ void SearchDataSlotPos(float *); // @ 0x1CCCD0 (0x110 bytes) -- mangled: SearchDataSlotPos__16CDungeonEventManFPf
    /* ?ret */ void SearchDataSlotPos2(float *); // @ 0x1CCDE0 (0x160 bytes) -- mangled: SearchDataSlotPos2__16CDungeonEventManFPf
    /* ?ret */ void SetupEvent(CDungeonMap *, int); // @ 0x1CCF40 (0x480 bytes) -- mangled: SetupEvent__16CDungeonEventManFP11CDungeonMapi
};
