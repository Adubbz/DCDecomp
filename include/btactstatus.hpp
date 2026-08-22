#pragma once

#include "common.h"

#include <libvu0.h>

/**
 * Defines what the player is doing in the dungeon this frame.
 */
struct BT_ACT_STATUS {
    s32 unk_000;
    s32 unk_004;
    s32 unk_008;
    s32 unk_00C;
    s32 action_on;   /**< Whether an action is running. */
    s32 action_no;   /**< Which action is running. */
    s32 action_step; /**< How far through the action the player is. */
    float unk_01C;
    s32 unk_020;
    s32 unk_024;
    s32 unk_028;
    s32 unk_02C;
    float unk_030;
    float unk_034;
    float unk_038;
    float unk_03C;
    s32 unk_040;
    float unk_044;
    float unk_048;
    s32 unk_04C;
    s32 unk_050;
    s32 unk_054;
    s32 unk_058;
    s32 unk_05C;
    s32 unk_060;
    s16 unk_064;
    s16 unk_066;
    s32 unk_068;
    s32 unk_06C;
    s32 unk_070;
    u8 unk_074[0xC];
    sceVu0FVECTOR unk_080;
    s16 unk_090;
    s16 unk_092;
    s16 unk_094;
    s16 unk_096;
    s32 unk_098;
    s32 unk_09C;
    s32 unk_0A0;
    s32 unk_0A4;
    u8 unk_0A8[0xC];
    float unk_0B4;
    float unk_0B8;
    float unk_0BC;
    sceVu0FVECTOR unk_0C0;
    u8 unk_0D0[0x10];
    s32 unk_0E0;
    s32 unk_0E4;
    s32 unk_0E8;
    s32 unk_0EC;
    s32 unk_0F0;
    float unk_0F4;
    s32 unk_0F8;
    s32 unk_0FC;
    sceVu0FVECTOR move_vector; /**< Specifies the way the player's action pushes them. */
    float move_power;          /**< Specifies how hard the player's action pushes them along. */
    float move_power_decay;    /**< Specifies how much move power one frame takes away. */
    float unk_118;
    float unk_11C;
    float unk_120;
    s32 unk_124;
    s32 unk_128;
    u8 unk_12C[0x18];
    s16 unk_144;
    s16 unk_146;
    s16 unk_148;
    s16 unk_14A;
    s16 unk_14C;
    s16 unk_14E;
};

STATIC_ASSERT(sizeof(BT_ACT_STATUS) == 0x150);

/* What the player is doing in the dungeon this frame. */
extern "C" BT_ACT_STATUS BtActStatus;
