#pragma once
#include "common.h"

/** One projectile/effect model's four-phase parameters. */
struct BT_SHOT_EFFECT {
    char model_name[16];
    s32 unk_010;
    s32 unk_014;
    float speed[4]; // 0x18: multiplied by the normalized direction
    float radius[4]; // 0x28: phase-indexed collision radius
    s32 life_time; // 0x38
    s32 unk_03C;
    s32 unk_040;
    s32 unk_044;
    s32 unk_048;
    s16 motion[4]; // 0x4C
    s16 unk_054;
    u8 unk_056[2];
    float unk_058;
    s32 unk_05C;
    s32 sound[4]; // 0x60: phase-indexed SndSePlay id, -1 means silent
};
STATIC_ASSERT(sizeof(BT_SHOT_EFFECT) == 0x70);
