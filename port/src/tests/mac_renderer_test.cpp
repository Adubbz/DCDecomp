#include <SDL3/SDL.h>

#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <optional>
#include <span>
#include <string>
#include <vector>

#include "gfx/requirements.hpp"
#include "gfx_fixture.hpp"
#include "platform/window.hpp"
#include "test.hpp"

// The renderer's paths for Vulkan on Metal, forced on lavapipe: fans drawn as lists, one stencil
// mask pair for both faces, no surface, and the device check of a 1.3 device.

using namespace dc::test;

namespace {

constexpr std::array<uint8_t, 4> kBlack = {0, 0, 0, 0x80};
constexpr std::array<uint8_t, 4> kNeutral = {0x80, 0x80, 0x80, 0x80};

std::vector<gfx::Vertex2D> Fan(float cx, float cy, float radius, int segments, std::array<uint8_t, 4> center,
                               std::array<uint8_t, 4> rim) {
    std::vector<gfx::Vertex2D> fan = {Vertex(cx, cy, 0.5f, 0.5f, center)};
    for (int i = 0; i <= segments; i++) {
        float angle = static_cast<float>(i) * 6.2831853f / static_cast<float>(segments);
        fan.push_back(Vertex(cx + radius * std::cos(angle), cy + radius * std::sin(angle),
                             0.5f + 0.5f * std::cos(angle), 0.5f + 0.5f * std::sin(angle), rim));
    }
    return fan;
}

// clsmes.cpp's message windows are fans: flat, gouraud, textured, blended, and one that is not
// convex around its first vertex.
std::vector<uint8_t> DrawFans(const GfxOptions &options) {
    GfxFixture         fixture(640, 480, 1.0f, options);
    gfx::TextureHandle texture = gfx::CreateTexture({2, 2});
    uint32_t           texels[4] = {Rgba(255, 0, 0), Rgba(0, 255, 0), Rgba(0, 0, 255), Rgba(255, 255, 255)};
    DC_CHECK(gfx::UpdateTexture(texture, 0, 0, 0, 2, 2, texels));
    fixture.Frame(kBlack, [&] {
        gfx::Draw2D(gfx::Primitive::TriangleFan, Fan(120, 120, 100, 7, {255, 255, 0, 0x80}, {255, 255, 0, 0x80}), {},
                    gfx::DrawState{});
        gfx::Draw2D(gfx::Primitive::TriangleFan, Fan(360, 120, 110, 33, {255, 255, 255, 0x80}, {0, 0, 200, 0x80}),
                    {}, gfx::DrawState{});
        gfx::TextureBinding binding;
        binding.texture = texture;
        auto textured = Fan(120, 350, 100, 12, kNeutral, kNeutral);
        for (gfx::Vertex2D &vertex : textured) {
            vertex.u *= 2.0f;
            vertex.v *= 2.0f;
        }
        gfx::Draw2D(gfx::Primitive::TriangleFan, textured, binding, gfx::DrawState{});
        gfx::DrawState blend;
        blend.blend = true;
        blend.alpha = {0, 1, 0, 1, 0x80};
        gfx::Draw2D(gfx::Primitive::TriangleFan, Fan(200, 200, 150, 9, {0, 255, 255, 0x40}, {255, 0, 255, 0x60}), {},
                    blend);
        std::vector<gfx::Vertex2D> star = {Vertex(500, 360, 0, 0, {255, 128, 0, 0x80})};
        for (int i = 0; i <= 10; i++) {
            float radius = i % 2 ? 40.0f : 110.0f;
            float angle = static_cast<float>(i) * 6.2831853f / 10.0f;
            star.push_back(Vertex(500 + radius * std::cos(angle), 360 + radius * std::sin(angle), 0, 0,
                                  {static_cast<uint8_t>(i * 25), 64, 255, 0x80}));
        }
        gfx::Draw2D(gfx::Primitive::TriangleFan, star, {}, gfx::DrawState{});
        // Fewer than three vertices draw nothing either way.
        gfx::Draw2D(gfx::Primitive::TriangleFan, std::span(star).first(2), {}, gfx::DrawState{});
    });
    DC_CHECK(gfx::ActiveRendererFeatures().triangle_fans == options.triangle_fans);
    DC_CHECK(fixture.PixelNear(40, 120, 255, 255, 0));
    return fixture.pixels;
}

// Frames that use every path the main target feeds: depth readback, a snapshot, the previous
// frame sampled, a render target, and a resize.
struct FrameSet {
    std::vector<std::vector<uint8_t>> frames;
    std::vector<float>                depths;
    std::vector<uint8_t>              snapshot;
    uint32_t                          resized_width = 0;
    uint32_t                          resized_height = 0;
};

FrameSet DrawFrames(bool offscreen) {
    FrameSet   set;
    GfxFixture fixture(800, 600, 1.0f, GfxOptions{.offscreen = offscreen});
    DC_CHECK(gfx::ActiveRendererFeatures().offscreen == offscreen);
    gfx::TextureHandle snapshot = gfx::CreateRenderTarget(64, 48, true);
    gfx::TextureHandle target = gfx::CreateRenderTarget(160, 120, true);

    fixture.Frame(kBlack, [&] {
        gfx::DrawState state;
        state.depth_test = gfx::DepthTest::GEqual;
        state.depth_write = true;
        gfx::Draw2D(gfx::Primitive::Quads, Quad(100, 100, 200, 200, {255, 0, 0, 0x80}, 0, 0, 0, 0, 0.75f), {}, state);
        gfx::Draw2D(gfx::Primitive::Quads, Quad(200, 100, 200, 200, {0, 255, 0, 0x80}, 0, 0, 0, 0, 0.25f), {}, state);
        DC_CHECK(gfx::SnapshotFrame(snapshot));
        gfx::Draw2D(gfx::Primitive::Quads, Quad(0, 0, 640, 60, {0, 0, 255, 0x80}), {}, gfx::DrawState{});
        gfx::ReadDepth(0, 120, 120, 8, 8);
        gfx::ReadDepth(1, 350, 150, 8, 8);
        gfx::ReadDepth(2, 10, 400, 8, 8);
    });
    set.frames.push_back(fixture.pixels);
    for (uint32_t id = 0; id < 3; id++) {
        set.depths.push_back(gfx::DepthResult(id).value_or(-1.0f));
    }
    uint32_t width;
    uint32_t height;
    DC_CHECK(gfx::ReadbackTexture(snapshot, set.snapshot, width, height));

    fixture.Frame(kBlack, [&] {
        gfx::SetRenderTarget(target);
        uint8_t grey[4] = {90, 90, 90, 0x80};
        gfx::Clear(true, grey, true, 0.0f);
        gfx::Draw2D(gfx::Primitive::Quads, Quad(20, 20, 60, 40, {255, 255, 255, 0x80}), {}, gfx::DrawState{});
        gfx::SetRenderTarget(gfx::kMainTarget);
        gfx::TextureBinding previous;
        previous.texture = gfx::kPreviousFrame;
        previous.filter = gfx::Filter::Nearest;
        gfx::Draw2D(gfx::Primitive::Quads, Quad(0, 0, 640, 480, kNeutral, 0, 0, 640, 480), previous, gfx::DrawState{});
        gfx::TextureBinding inner;
        inner.texture = target;
        gfx::Draw2D(gfx::Primitive::Quads, Quad(400, 300, 160, 120, kNeutral, 0, 0, 160, 120), inner,
                    gfx::DrawState{});
    });
    set.frames.push_back(fixture.pixels);
    DC_CHECK(fixture.PixelNear(150, 30 * 1.25, 0, 0, 255));
    DC_CHECK(fixture.PixelNear(550, 425, 255, 255, 255));

    SDL_SetWindowSize(WindowHandle(), 640, 400);
    SDL_SyncWindow(WindowHandle());
    WindowPollEvents();
    gfx::RendererResize();
    fixture.Frame({10, 20, 30, 0x80}, [&] {
        gfx::Draw2D(gfx::Primitive::Quads, Quad(0, 0, 320, 240, {200, 100, 50, 0x80}), {}, gfx::DrawState{});
    });
    set.frames.push_back(fixture.pixels);
    set.resized_width = fixture.width;
    set.resized_height = fixture.height;
    return set;
}

// A device with everything the renderer uses, as a 1.3 driver on Metal might report it.
gfx::detail::DeviceCaps FullCaps() {
    gfx::detail::DeviceCaps caps;
    caps.api_version = VK_API_VERSION_1_3;
    caps.features.dualSrcBlend = VK_TRUE;
    caps.features.shaderClipDistance = VK_TRUE;
    caps.features.shaderSampledImageArrayDynamicIndexing = VK_TRUE;
    caps.features12.descriptorBindingPartiallyBound = VK_TRUE;
    caps.features12.descriptorBindingSampledImageUpdateAfterBind = VK_TRUE;
    caps.features12.descriptorBindingUpdateUnusedWhilePending = VK_TRUE;
    caps.properties12.maxPerStageDescriptorUpdateAfterBindSampledImages = 500000;
    caps.properties12.maxDescriptorSetUpdateAfterBindSampledImages = 500000;
    caps.properties12.maxPerStageUpdateAfterBindResources = 500000;
    caps.features13.dynamicRendering = VK_TRUE;
    caps.features13.synchronization2 = VK_TRUE;
    caps.limits.maxPushConstantsSize = 128;
    caps.extensions = {VK_KHR_SWAPCHAIN_EXTENSION_NAME, VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME};
    caps.portability_subset = true;
    caps.portability_properties.minVertexInputBindingStrideAlignment = 4;
    caps.depth_stencil_format = true;
    caps.graphics_queue = true;
    return caps;
}

bool Mentions(const std::vector<std::string> &missing, const char *what) {
    return std::ranges::any_of(missing, [&](const std::string &item) { return item.find(what) != std::string::npos; });
}

} // namespace

DC_TEST(mac_renderer_fans_as_lists_match_fans) {
    std::vector<uint8_t> fans = DrawFans(GfxOptions{});
    std::vector<uint8_t> lists = DrawFans(GfxOptions{.triangle_fans = false});
    DC_CHECK(fans.size() == lists.size());
    DC_CHECK(fans == lists);
}

DC_TEST(mac_renderer_offscreen_matches_the_swapchain) {
    FrameSet swapchain = DrawFrames(false);
    FrameSet offscreen = DrawFrames(true);
    DC_CHECK(offscreen.frames.size() == swapchain.frames.size());
    for (size_t i = 0; i < offscreen.frames.size(); i++) {
        DC_CHECK(offscreen.frames[i] == swapchain.frames[i]);
    }
    DC_CHECK(offscreen.depths == swapchain.depths);
    DC_CHECK_NEAR(offscreen.depths[0], 0.75f, 1e-6f);
    DC_CHECK_NEAR(offscreen.depths[1], 0.25f, 1e-6f);
    DC_CHECK_NEAR(offscreen.depths[2], 0.0f, 1e-6f);
    DC_CHECK(offscreen.snapshot == swapchain.snapshot);
    DC_CHECK(offscreen.resized_width == 640 && offscreen.resized_height == 400);
    DC_CHECK(swapchain.resized_width == 640 && swapchain.resized_height == 400);
}

// The shadow-volume pattern: front faces increment, back faces decrement, one reference and mask.
DC_TEST(mac_renderer_shared_stencil_masks_match_separate) {
    std::vector<uint8_t> results[2];
    for (bool separate : {true, false}) {
        GfxFixture fixture(640, 480, 1.0f, GfxOptions{.separate_stencil_masks = separate});
        DC_CHECK(gfx::ActiveRendererFeatures().separate_stencil_masks == separate);
        fixture.Frame(kBlack, [&] {
            gfx::ClearStencil(0);
            gfx::DrawState count;
            count.stencil_test = true;
            count.color_write_mask = 0;
            count.stencil_front = {gfx::CompareOp::Always, gfx::StencilOp::Keep, gfx::StencilOp::IncrementWrap,
                                   gfx::StencilOp::Keep, 1, 0xFF, 0xFF};
            count.stencil_back = count.stencil_front;
            count.stencil_back.pass = gfx::StencilOp::DecrementWrap;
            auto front = Quad(100, 100, 300, 200, kNeutral);
            gfx::Draw2D(gfx::Primitive::Quads, front, {}, count);
            gfx::Draw2D(gfx::Primitive::Quads, Quad(200, 150, 300, 200, kNeutral), {}, count);
            std::array<gfx::Vertex2D, 4> back = {front[0], front[3], front[2], front[1]};
            gfx::Draw2D(gfx::Primitive::Quads, back, {}, count);

            gfx::DrawState show;
            show.stencil_test = true;
            show.stencil_front = {gfx::CompareOp::NotEqual, gfx::StencilOp::Keep, gfx::StencilOp::Keep,
                                  gfx::StencilOp::Keep, 0, 0xFF, 0};
            show.stencil_back = show.stencil_front;
            gfx::Draw2D(gfx::Primitive::Quads, Quad(0, 0, 640, 480, {255, 255, 255, 0x80}), {}, show);
        });
        DC_CHECK(fixture.PixelNear(150, 120, 0, 0, 0));
        DC_CHECK(fixture.PixelNear(450, 300, 255, 255, 255));
        results[separate ? 0 : 1] = fixture.pixels;
    }
    DC_CHECK(results[0] == results[1]);
}

DC_TEST(mac_renderer_device_requirements) {
    using gfx::detail::MissingRequirements;
    gfx::detail::DeviceCaps caps = FullCaps();
    DC_CHECK(MissingRequirements(caps, false).empty());
    DC_CHECK(gfx::detail::PortabilityWorkarounds(caps).size() == 2);

    gfx::detail::DeviceCaps v14 = caps;
    v14.api_version = VK_API_VERSION_1_4;
    DC_CHECK(MissingRequirements(v14, false).empty());

    gfx::detail::DeviceCaps v12 = caps;
    v12.api_version = VK_API_VERSION_1_2;
    std::vector<std::string> missing = MissingRequirements(v12, false);
    DC_CHECK(missing.size() == 1 && Mentions(missing, "Vulkan 1.3 (it has 1.2)"));

    gfx::detail::DeviceCaps no_dual = caps;
    no_dual.features.dualSrcBlend = VK_FALSE;
    no_dual.features13.synchronization2 = VK_FALSE;
    missing = MissingRequirements(no_dual, false);
    DC_CHECK(missing.size() == 2 && Mentions(missing, "dualSrcBlend") && Mentions(missing, "synchronization2"));

    gfx::detail::DeviceCaps small = caps;
    small.properties12.maxPerStageDescriptorUpdateAfterBindSampledImages = 4096;
    DC_CHECK(Mentions(MissingRequirements(small, false), "8192 update-after-bind sampled images"));

    gfx::detail::DeviceCaps headless = caps;
    headless.extensions = {};
    DC_CHECK(Mentions(MissingRequirements(headless, false), VK_KHR_SWAPCHAIN_EXTENSION_NAME));
    headless.portability_subset = false;
    DC_CHECK(MissingRequirements(headless, true).empty());

    gfx::detail::DeviceCaps strides = caps;
    strides.portability_properties.minVertexInputBindingStrideAlignment = 8;
    DC_CHECK(Mentions(MissingRequirements(strides, false), "minVertexInputBindingStrideAlignment"));

    gfx::detail::DeviceCaps depth = caps;
    depth.depth_stencil_format = false;
    depth.features12.descriptorBindingPartiallyBound = VK_FALSE;
    missing = MissingRequirements(depth, false);
    DC_CHECK(missing.size() == 2 && Mentions(missing, "D24_UNORM_S8_UINT") &&
             Mentions(missing, "descriptorBindingPartiallyBound"));

    caps.portability.triangleFans = VK_TRUE;
    caps.portability.separateStencilMaskRef = VK_TRUE;
    DC_CHECK(gfx::detail::PortabilityWorkarounds(caps).empty());
}

// lavapipe is a 1.4 device; what the check makes of it is what selection made of it.
DC_TEST(mac_renderer_selects_the_test_device) {
    GfxFixture            fixture;
    gfx::RendererFeatures features = gfx::ActiveRendererFeatures();
    DC_CHECK(features.api_version >= VK_API_VERSION_1_3);
    DC_CHECK(features.triangle_fans && features.separate_stencil_masks);
}
