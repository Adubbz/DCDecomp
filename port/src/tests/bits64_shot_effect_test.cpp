#include <gtest/gtest.h>

#include <memory>

#include "bt_shot_effect.hpp"
#include "gameutil.hpp"
#include "shot_effect.hpp"

// The slot models are CSHOT_EFFECT's own chara array, wherever a 64-bit CCharacter puts it, not
// the PS2's byte offset into the object.
TEST(Bits64ShotEffect, EndReachesSlotModel) {
    auto effect = std::make_unique<CSHOT_EFFECT>();
    for (int slot = 0; slot < 8; slot++) {
        effect->active[slot] = 0;
        effect->phase[slot] = 0;
    }

    BT_SHOT_EFFECT data{};
    data.motion[2] = 1;
    MOTION_INFO info[2]{};
    info[1].start = 12;

    effect->effect_data = &data;
    effect->active[3] = 1;
    effect->chara[3].motion_type.motion_info = info;
    effect->chara[3].motion_type.state.time = 0.0f;
    effect->EndEffect();

    EXPECT_EQ(effect->phase[3], 2);
    EXPECT_EQ(effect->chara[3].motion_type.state.time, 12.0f);
    EXPECT_EQ(effect->chara[3].motion_no, 1);
    EXPECT_EQ(effect->chara[3].motion_flags, 6);
    EXPECT_EQ(effect->chara[2].motion_no, 0);
    EXPECT_EQ(effect->chara[4].motion_no, 0);
}
