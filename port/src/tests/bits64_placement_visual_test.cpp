#include <gtest/gtest.h>

#include "bits64_fixture.hpp"
#include "visual.hpp"

using dc::test::Arena;
using dc::test::End;
using dc::test::RetailRun;

// CreateVisual: three quadwords for a model or shadow visual and two for a plain one, each of which
// the host's pointers outgrow; the visual's packet block is carved straight behind it.
TEST(Bits64PlacementVisual, ModelVisualFitsItsRun) {
    Arena          arena(64);
    CVisualMDTVu1 *visual = new (RetailRun(arena, 3)) CVisualMDTVu1;

    EXPECT_GE(arena.Next(), End(visual));
}

TEST(Bits64PlacementVisual, ShadowVisualFitsItsRun) {
    Arena          arena(64);
    CVisualShadow *visual = new (RetailRun(arena, 3)) CVisualShadow;

    EXPECT_GE(arena.Next(), End(visual));
}

TEST(Bits64PlacementVisual, PlainVisualFitsItsRun) {
    Arena       arena(64);
    CVisualVu1 *visual = new (RetailRun(arena, 2)) CVisualVu1;

    EXPECT_GE(arena.Next(), End(visual));
}
