#pragma once

#include "common.h"

/**
 * Accumulates elapsed play time and applies it to time-sensitive inventory items.
 */
class CMenuItemStep {
public:
    s32 frame;          /**< Frames accumulated toward the next inventory-volume step. */
    s32 unk_04;
    s16 unk_08;
    s16 unk_0A;
    s16 enabled;        /**< Enables periodic inventory-volume accumulation. */
    s16 unk_0E;
    s16 unk_10[4];
    s16 unk_18[4];
    s16 unk_20[4];
    s32 pending_volume; /**< Inventory-volume steps waiting to be applied. */

    /**
     * Resets item-volume timing and per-character state.
     *
     * @mangled Initialize__13CMenuItemStepFv
     * @address 0x235650
     * @size 0x7C
     */
    void Initialize(void);

    /**
     * Accumulates one frame toward the next inventory-volume step.
     *
     * @mangled LoopStep__13CMenuItemStepFi
     * @address 0x2356D0
     * @size 0x4C
     */
    void LoopStep(int interval);

    /**
     * Applies pending volume loss to time-sensitive inventory items.
     *
     * @mangled CheckItemVolume__13CMenuItemStepFv
     * @address 0x235720
     * @size 0x2EC
     */
    void CheckItemVolume(void);
};

STATIC_ASSERT(sizeof(CMenuItemStep) == 0x2C);
