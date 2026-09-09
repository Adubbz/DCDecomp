#pragma once

#include "common.h"

/**
 * Describes one projectile effect and the four phases it passes through.
 */
struct BT_SHOT_EFFECT {
    char model_name[16]; /**< Model file the effect draws with. */
    s32 unk_010;
    s32 unk_014;
    float speed[4];  /**< Distance the effect moves each step in each phase. */
    float radius[4]; /**< Radius of the effect's hit in each phase. */
    s32 life_time;   /**< Steps the effect lasts for. */
    s32 unk_03C;
    s32 unk_040;
    s32 unk_044;
    s32 unk_048;
    s16 motion[4]; /**< Motion the model plays in each phase, or -1. */
    s16 unk_054;
    u8 unk_056[2];
    float unk_058;
    s32 unk_05C;
    s32 sound[4]; /**< Sound effect each phase plays, or -1. */
};

STATIC_ASSERT(sizeof(BT_SHOT_EFFECT) == 0x70);
