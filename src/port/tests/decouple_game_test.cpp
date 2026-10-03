// SDL's headers name parameters A and B, which libgraph.h defines as macros: SDL goes first.
#include <SDL3/SDL.h>

#include <chrono>

#include "draw3d_fixture.hpp"
#include "framevu1.hpp"
#include "gameloop.hpp"
#include "platform/config.hpp"
#include "visual.hpp"

using namespace dc::test;

namespace {

// A 20 x 10 quad at depth 100 hung on a frame: centred on the frame's x, it covers 320 + 8 x
// +- 80 logical pixels.
struct Model {
    Model() {
        MdtBuilder builder;
        builder.Quad(-10.0f, -5.0f, 10.0f, 5.0f, 100.0f, builder.Material({1.0f, 1.0f, 1.0f, 1.0f}));
        image = builder.Build();
        visual.CreateVUdataFromMDT(block, image.data(), 0, 0);
        visual.vu_data_buffer[0] = visual.vu_data;
        visual.vu_data_buffer[1] = visual.vu_data;
        visual.SetMDTDataAddress(image.data());
        frame.SetVisual(&visual);
        frame.attr.cull_enable = false;
    }

    void Tick(float x, float z = 0.0f) {
        sceVu0FVECTOR position = {x, 0.0f, z, 1.0f};
        frame.SetPosition(position);
        MGBeginFrame();
        MGDraw(&frame);
        MGEndFrame();
    }

    std::vector<u_int> image;
    alignas(64) unsigned int block[64] = {};
    CVisualMDTVu1 visual;
    CFrameVu1     frame;
};

bool LitAt(GfxFixture &fixture, uint32_t x) {
    return fixture.PixelNear(x, 240, 0x80, 0x80, 0x80) && fixture.PixelNear(x - 100, 240, 0, 0, 0) &&
           fixture.PixelNear(x + 100, 240, 0, 0, 0);
}

std::chrono::steady_clock::time_point Later() {
    return std::chrono::steady_clock::now() + std::chrono::hours(1);
}

struct PresentScope {
    explicit PresentScope(const GamePresentSettings &settings) { GameSetPresentSettings(settings); }

    ~PresentScope() { GameSetPresentSettings({}); }
};

} // namespace

// MGBeginFrame records the tick and MGEndFrame renders and presents it: headless, each tick shows
// its canonical image, where the model is.
DC_TEST(decouple_game_tick_records_and_presents) {
    Draw3DFixture fixture;
    Model         model;
    MGBeginFrame();
    DC_CHECK(gfx::Recording() && gfx::InFrame());
    MGDraw(&model.frame);
    MGEndFrame();
    DC_CHECK(!gfx::Recording() && !gfx::InFrame());
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
    DC_CHECK(LitAt(fixture, 320));
    GamePresentStats stats = GamePresentStatistics();
    DC_CHECK(stats.ticks == 1 && stats.mesh_draws == 1 && stats.keyed_mesh_draws == 1);
}

// A frame drawn at x -20 then +20 shows halfway in a display frame at alpha 0.5; the first tick
// after a cut (a mode's first) does not interpolate.
DC_TEST(decouple_game_frame_interpolates) {
    Draw3DFixture fixture;
    Model         model;
    model.Tick(-20.0f);
    model.Tick(20.0f);
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
    DC_CHECK(LitAt(fixture, 480));
    DC_CHECK(GamePresentBetweenTicks(0.5, Later()));
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
    DC_CHECK(LitAt(fixture, 320));

    // A camera that moves the other way cancels the model's motion on screen.
    sceVu0FMATRIX view;
    sceVu0UnitMatrix(view);
    view[3][0] = -20.0f;
    sceVu0FVECTOR eye = {20.0f, 0.0f, 0.0f, 0.0f};
    MGSetViewMatrix(view, eye);
    model.Tick(40.0f);
    DC_CHECK(GamePresentBetweenTicks(0.5, Later()));
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
    DC_CHECK(LitAt(fixture, 480));

    // After a cut the tick is shown as it is.
    model.Tick(-20.0f);
    MGPortCutInterpolation();
    model.Tick(20.0f);
    DC_CHECK(GamePresentBetweenTicks(0.5, Later()));
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
    DC_CHECK(LitAt(fixture, 320));

    // So is a jump past the teleport distance, here 900 units further away, where a unit is 0.8
    // pixels: -250 to 250 would pass 320 halfway.
    sceVu0UnitMatrix(view);
    eye[0] = 0.0f;
    MGSetViewMatrix(view, eye);
    model.Tick(-250.0f, 900.0f);
    model.Tick(-250.0f, 900.0f);
    model.Tick(250.0f, 900.0f);
    DC_CHECK(GamePresentBetweenTicks(0.5, Later()));
    DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
    DC_CHECK(fixture.PixelNear(520, 240, 0x80, 0x80, 0x80) && fixture.PixelNear(320, 240, 0, 0, 0));
}

// The previous-frame trail drawn through the game's ticks is byte for byte the same whether each
// tick is displayed once or four times between canonical renders.
DC_TEST(decouple_game_display_rate_keeps_feedback) {
    Draw3DFixture fixture;
    Model         model;
    auto          run = [&](int displays) {
        PresentScope present({.display_per_tick = displays});
        for (int tick = 0; tick < 6; tick++) {
            sceVu0FVECTOR position = {-30.0f + 12.0f * static_cast<float>(tick), 0.0f, 0.0f, 1.0f};
            model.frame.SetPosition(position);
            MGBeginFrame();
            if (tick > 0) {
                gfx::TextureBinding binding;
                binding.texture = gfx::kPreviousFrame;
                gfx::DrawState state;
                state.blend = true;
                auto quad = Quad(0, 0, 640, 480, {0x80, 0x80, 0x80, 35}, 0, 0, 640, 480);
                gfx::Draw2D(gfx::Primitive::Quads, quad, binding, state);
            }
            MGDraw(&model.frame);
            MGEndFrame();
        }
        std::vector<uint8_t> pixels;
        DC_CHECK(gfx::ReadbackFrame(pixels, fixture.width, fixture.height));
        return pixels;
    };
    uint64_t             before = GamePresentStatistics().display_frames;
    std::vector<uint8_t> once = run(0);
    DC_CHECK(GamePresentStatistics().display_frames == before);
    std::vector<uint8_t> many = run(4);
    DC_CHECK(GamePresentStatistics().display_frames == before + 24);
    DC_CHECK(once == many);
}

// With a real clock the wait between ticks presents display frames; with interpolation off it
// presents each canonical image once, as the PS2 did.
DC_TEST(decouple_game_presents_between_ticks) {
    Draw3DFixture fixture;
    Model         model;
    ClockSetUnbounded(false);
    ClockSetTickRate(20.0);
    {
        PresentScope present({.interpolation = false});
        uint64_t     before = GamePresentStatistics().display_frames;
        model.Tick(-20.0f);
        model.Tick(20.0f);
        DC_CHECK(GamePresentStatistics().display_frames == before);
        DC_CHECK(gfx::ReadbackFrame(fixture.pixels, fixture.width, fixture.height));
        DC_CHECK(LitAt(fixture, 480));
    }
    {
        PresentScope present({.max_fps = 1000.0});
        uint64_t     before = GamePresentStatistics().display_frames;
        int          start = MGGetVSyncCount();
        model.Tick(-20.0f);
        model.Tick(20.0f);
        DC_CHECK(MGGetVSyncCount() >= start + 2);
        DC_CHECK(GamePresentStatistics().display_frames > before);
    }
    ClockSetTickRate(50.0);
    ClockSetUnbounded(true);
}

// ClockWaitNextTick runs its hook with the tick's elapsed fraction until the hook is done or the
// next tick is due, and not at all when unbounded.
DC_TEST(decouple_clock_wait_hook) {
    static std::vector<double> fractions;
    static int                 stop_after = 0;
    auto                       hook = [](double fraction, std::chrono::steady_clock::time_point) {
        fractions.push_back(fraction);
        return static_cast<int>(fractions.size()) < stop_after;
    };
    ClockSetUnbounded(false);
    ClockSetTickRate(20.0);
    ClockPump();
    std::int64_t start = ClockTickCount();
    stop_after = 3;
    ClockWaitNextTick(hook);
    ClockPump();
    DC_CHECK(ClockTickCount() >= start + 1);
    DC_CHECK(fractions.size() == 3);
    for (size_t i = 0; i < fractions.size(); i++) {
        DC_CHECK(fractions[i] >= 0.0 && fractions[i] < 1.0);
        DC_CHECK(i == 0 || fractions[i] >= fractions[i - 1]);
    }
    fractions.clear();
    stop_after = 1 << 30;
    ClockWaitNextTick(hook);
    DC_CHECK(!fractions.empty() && fractions.back() < 1.0);
    ClockSetUnbounded(true);
    fractions.clear();
    ClockWaitNextTick(hook);
    DC_CHECK(fractions.empty());
    DC_CHECK(ClockTickFraction() == 1.0);
    ClockSetUnbounded(false);
    ClockSetTickRate(50.0);
}

DC_TEST(decouple_config_video_keys) {
    Config config = ConfigParse("[video]\ninterpolation = off\nmax_fps = 144\npresent_mode = immediate\n");
    DC_CHECK(!config.interpolation);
    DC_CHECK(config.max_fps == 144.0);
    DC_CHECK(config.present_mode == ConfigPresentMode::Immediate);
    Config defaults = ConfigParse("[video]\nmax_fps = -1\ninterpolation = sometimes\n");
    DC_CHECK(defaults.interpolation && defaults.max_fps == 0.0);
}
