#pragma once

#include "common.h"

// Forward declarations for the types these declarations name. The skeleton
// headers are generated from the retail symbol table, which knows the type
// names but not where they live.
class CDungeonEvent;


class CDungeonEventData {
public:
    /**
     * @mangled Set__17CDungeonEventDataFP13CDungeonEvent
     * @address 0x1CC820
     * @size 0x60
     * @unknownret
     */
    void Set(CDungeonEvent *);

    /**
     * @mangled CheckSwitch__17CDungeonEventDataFv
     * @address 0x1CC880
     * @size 0x50
     * @unknownret
     */
    void CheckSwitch(void);

    /**
     * @mangled Stop__17CDungeonEventDataFv
     * @address 0x1CC8D0
     * @size 0x10
     * @unknownret
     */
    void Stop(void);

    /**
     * @mangled Start__17CDungeonEventDataFv
     * @address 0x1CC8E0
     * @size 0x10
     * @unknownret
     */
    void Start(void);
};
