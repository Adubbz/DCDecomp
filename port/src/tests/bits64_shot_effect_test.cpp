#include <memory>

#include "bt_shot_effect.hpp"
#include "gameutil.hpp"
#include "shot_effect.hpp"
#include "test.hpp"

// The slot models are CSHOT_EFFECT's own chara array, wherever a 64-bit CCharacter puts it, not
// the PS2's byte offset into the object.
DC_TEST(bits64_shot_effect_end_reaches_slot_model) {
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

    DC_CHECK(effect->phase[3] == 2);
    DC_CHECK(effect->chara[3].motion_type.state.time == 12.0f);
    DC_CHECK(effect->chara[3].motion_no == 1);
    DC_CHECK(effect->chara[3].motion_flags == 6);
    DC_CHECK(effect->chara[2].motion_no == 0);
    DC_CHECK(effect->chara[4].motion_no == 0);
}
