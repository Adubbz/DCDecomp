#include <gtest/gtest.h>

#include <cstring>

#include "character.hpp"
#include "gameutil.hpp"

// A character builds each motion set beyond the first inside a MotionParam, cast to a
// tagMOTION_TYPE and cleared to the size of one (chararead's MOTION and SHADOW_MOTION). Host pointers
// put a set's frame_info and motion_info past the PS2's 0x80 bytes, so storage of that size would
// hold them in the next set's storage, which loading that set clears; opening a treasure box plays
// a set that has another loaded after it.
static_assert(sizeof(MotionParam) >= sizeof(tagMOTION_TYPE), "a motion set must fit its storage");

TEST(Bits64MotionStorage, HoldsAWholeSet) {
    static MotionParam   storage[2];
    static tagFRAME_INF  frames[1];
    static MOTION_INFO   info[1];
    static sceVu0FMATRIX bones[1];

    auto *first = reinterpret_cast<tagMOTION_TYPE *>(storage[0].storage);
    std::memset(first, 0, sizeof(tagMOTION_TYPE));
    first->frame_info = frames;
    first->motion_info = info;

    auto *second = reinterpret_cast<tagMOTION_TYPE *>(storage[1].storage);
    std::memset(second, 0, sizeof(tagMOTION_TYPE));
    second->base_matrices = bones;

    EXPECT_EQ(first->frame_info, frames);
    EXPECT_EQ(first->motion_info, info);
    EXPECT_EQ(second->base_matrices, bones);
}
