#include <SDL3/SDL.h>

#include "gfx_fixture.hpp"

using namespace dc::test;

namespace {

constexpr std::array<uint8_t, 4> kBlack = {0, 0, 0, 0x80};

void Fill(float x, float y, float w, float h, std::array<uint8_t, 4> color, const gfx::DrawState &state, float z = 0.0f) {
    auto quad = Quad(x, y, w, h, color, 0, 0, 0, 0, z);
    gfx::Draw2D(gfx::Primitive::Quads, quad, {}, state);
}

gfx::DrawState StencilWrite(uint8_t reference) {
    gfx::DrawState state;
    state.stencil_test = true;
    state.stencil_front.compare = gfx::CompareOp::Always;
    state.stencil_front.pass = gfx::StencilOp::Replace;
    state.stencil_front.reference = reference;
    state.stencil_back = state.stencil_front;
    state.color_write_mask = 0;
    return state;
}

gfx::DrawState StencilEqual(uint8_t reference) {
    gfx::DrawState state;
    state.stencil_test = true;
    state.stencil_front.compare = gfx::CompareOp::Equal;
    state.stencil_front.reference = reference;
    state.stencil_back = state.stencil_front;
    return state;
}

// A mask drawn with colour writes off marks the stencil only; a cover drawn with an equal test
// lands only there; ClearStencil over a rect resets just that rect.
void CheckStencil(GfxFixture &fixture) {
    fixture.Frame(kBlack, [] {
        gfx::ClearStencil(0);
        Fill(100, 100, 200, 100, {255, 255, 255, 0x80}, StencilWrite(1));
        Fill(0, 0, 640, 480, {255, 0, 0, 0x80}, StencilEqual(1));
        gfx::LogicalRect rect = {400, 300, 100, 100};
        gfx::ClearStencil(2, &rect);
        Fill(0, 0, 640, 480, {0, 255, 0, 0x80}, StencilEqual(2));
    });
    DC_CHECK(fixture.PixelNear(150, 150, 255, 0, 0));
    DC_CHECK(fixture.PixelNear(50, 150, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(350, 150, 0, 0, 0));
    DC_CHECK(fixture.PixelNear(450, 350, 0, 255, 0));
    DC_CHECK(fixture.PixelNear(390, 350, 0, 0, 0));

    // A frame's stencil starts where the last one left it unless cleared; the clear here resets it.
    fixture.Frame(kBlack, [] {
        gfx::ClearStencil(0);
        Fill(0, 0, 640, 480, {255, 0, 0, 0x80}, StencilEqual(1));
    });
    DC_CHECK(fixture.PixelNear(150, 150, 0, 0, 0));
}

} // namespace

DC_TEST(gfx_stencil_clear_and_test) {
    GfxFixture fixture;
    CheckStencil(fixture);
}

// Without the dynamic mask the colourless pipelines are precompiled alongside the rest.
DC_TEST(gfx_color_write_mask_variants) {
    uint32_t dynamic_count = 0;
    {
        GfxFixture fixture;
        dynamic_count = gfx::PipelineCount();
    }
    GfxFixture fixture(640, 480, 1.0f, false);
    DC_CHECK(gfx::PipelineCount() == dynamic_count + 18);
    CheckStencil(fixture);
}

// Draws into a shared-depth target test against what the main target drew: the left half of the
// frame holds depth 0.5, so a quad at 0.25 tested GEQUAL lands in the right half only.
static void CheckSharedDepth(GfxFixture &fixture, gfx::TextureHandle target) {
    std::optional<gfx::TextureInfo> info = gfx::GetTextureInfo(target);
    DC_CHECK(info && info->shares_main_depth && info->width == 640 && info->height == 480);
    DC_CHECK(info->pixel_width == fixture.width && info->pixel_height == fixture.height);
    gfx::LogicalMapping main = gfx::GetLogicalMapping(gfx::kMainTarget);
    gfx::LogicalMapping mapping = gfx::GetLogicalMapping(target);
    DC_CHECK(main.scale_x == mapping.scale_x && main.offset_x == mapping.offset_x &&
             main.offset_y == mapping.offset_y);

    fixture.Frame(kBlack, [&] {
        gfx::DrawState write;
        write.depth_test = gfx::DepthTest::Always;
        write.depth_write = true;
        Fill(0, 0, 320, 480, {0, 0, 255, 0x80}, write, 0.5f);
        gfx::SetRenderTarget(target);
        uint8_t black[4] = {0, 0, 0, 0x80};
        gfx::Clear(true, black, false, 0.0f);
        gfx::DrawState test;
        test.depth_test = gfx::DepthTest::GEqual;
        Fill(0, 0, 640, 480, {255, 255, 255, 0x80}, test, 0.25f);
        gfx::SetRenderTarget(gfx::kMainTarget);
        // Sampled back in logical texels, the target lines up with the frame.
        gfx::TextureBinding binding;
        binding.texture = target;
        binding.filter = gfx::Filter::Nearest;
        gfx::DrawState add;
        add.blend = true;
        add.alpha = {0, 2, 2, 1, 0x80};
        auto quad = Quad(0, 0, 640, 480, {0x80, 0x80, 0x80, 0x80}, 0, 0, 640, 480);
        gfx::Draw2D(gfx::Primitive::Quads, quad, binding, add);
    });
    float x0 = mapping.offset_x;
    float y = mapping.offset_y + 240.0f * mapping.scale_y;
    DC_CHECK(fixture.PixelNear(static_cast<uint32_t>(x0 + 100 * mapping.scale_x), static_cast<uint32_t>(y), 0, 0, 255));
    DC_CHECK(fixture.PixelNear(static_cast<uint32_t>(x0 + 500 * mapping.scale_x), static_cast<uint32_t>(y), 255, 255, 255));
    DC_CHECK(fixture.PixelNear(static_cast<uint32_t>(x0 + 319 * mapping.scale_x), static_cast<uint32_t>(y), 0, 0, 255));
    DC_CHECK(fixture.PixelNear(static_cast<uint32_t>(x0 + 321 * mapping.scale_x), static_cast<uint32_t>(y), 255, 255, 255));
}

DC_TEST(gfx_shared_depth_target) {
    GfxFixture         fixture;
    gfx::TextureHandle target = gfx::NamedRenderTarget("shared", 640, 256, false, true);
    DC_CHECK(target != gfx::kNullTexture);
    DC_CHECK(gfx::NamedRenderTarget("shared", 100, 100, false, true) == target);
    fixture.Frame(kBlack, [] {});
    CheckSharedDepth(fixture, target);

    // The render scale leaves it alone; a resize carries it to the new main size and mapping.
    gfx::SetRenderScale(2.0f);
    DC_CHECK(gfx::GetTextureInfo(target)->pixel_width == 640);
    SDL_SetWindowSize(WindowHandle(), 960, 600);
    SDL_SyncWindow(WindowHandle());
    WindowPollEvents();
    gfx::RendererResize();
    fixture.Frame(kBlack, [] {});
    DC_CHECK(fixture.width == 960 && fixture.height == 600);
    CheckSharedDepth(fixture, target);

    // Asking for it without sharing replaces it with an ordinary target.
    gfx::TextureHandle plain = gfx::NamedRenderTarget("shared", 640, 256, false);
    DC_CHECK(plain != target && !gfx::GetTextureInfo(plain)->shares_main_depth);
    DC_CHECK(gfx::GetTextureInfo(plain)->height == 256);
    gfx::DestroyTexture(plain);
}
