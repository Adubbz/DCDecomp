#pragma once

#include "common.h"

#include <libvu0.h>

/**
 * Names one event that a dungeon floor lays out, as the floor's event file
 * declares it.
 */
class CDungeonEvent {
public:
    u8 unk_00[0x18];
    float radius; /**< Distance at which the event starts. */
    u8 unk_1C[0x4];
    s32 script_no; /**< Script that the event runs, or -1 where it runs none. */
    s32 fade;      /**< 1 where the event fades the picture out before it runs. */
    s32 unk_28;
    s32 chara_no; /**< Character that has to start the event, or -1 for any. */
    s32 unk_30;
    s32 unk_34;
    s32 unk_38; /**< Passed on as the memory the script runs out of. */
    u8 unk_3C[0x4];
};

STATIC_ASSERT(sizeof(CDungeonEvent) == 0x40);

/**
 * Records what one event of the floor is doing.
 */
class CDungeonEventData {
public:
    CDungeonEvent *event; /**< Event that the floor laid out, or zero for a free slot. */
    u8 unk_04[0xC];
    sceVu0FVECTOR pos; /**< World position that the event plays at. */
    sceVu0FVECTOR dir; /**< Way that the event faces. */
    s32 unk_30;
    s32 unk_34;
    s32 unk_38;
    s32 chara_done; /**< Character that has already run the event, or -1 for none. */

    /**
     * Initializes this runtime slot from a dungeon event definition.
     *
     * @mangled Set__17CDungeonEventDataFP13CDungeonEvent
     * @address 0x1CC820
     * @size 0x5C
     */
    void Set(CDungeonEvent *);

    /**
     * Reports whether this event slot is enabled and ready to run.
     *
     * @mangled CheckSwitch__17CDungeonEventDataFv
     * @address 0x1CC880
     * @size 0x48
     */
    int CheckSwitch(void);

    /**
     * Disables this event slot.
     *
     * @mangled Stop__17CDungeonEventDataFv
     * @address 0x1CC8D0
     * @size 0xC
     */
    void Stop(void);

    /**
     * Enables this event slot.
     *
     * @mangled Start__17CDungeonEventDataFv
     * @address 0x1CC8E0
     * @size 0x10
     */
    void Start(void);
};

STATIC_ASSERT(sizeof(CDungeonEventData) == 0x40);
