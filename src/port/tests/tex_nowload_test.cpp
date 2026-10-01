// The fixture brings SDL, which must come ahead of libgraph.h and its one-letter macros.
// clang-format off
#include "tex_fixture.hpp"
// clang-format on

#include "language.h"

#include <unistd.h>

#include <filesystem>
#include <fstream>

#include "../platform/clock.hpp"
#include "../platform/paths.hpp"
#include "dataread.hpp"
#include "mainselect.hpp"
#include "nowload.hpp"

using namespace dc::test;
using namespace texfix;

namespace {

namespace fs = std::filesystem;

void Write(const fs::path &path, const Bytes &data) {
    fs::create_directories(path.parent_path());
    std::ofstream stream(path, std::ios::binary);
    stream.write(reinterpret_cast<const char *>(data.data()), static_cast<std::streamsize>(data.size()));
}

Bytes Solid(int width, int height, uint32_t gs) {
    Bytes texels;
    for (int i = 0; i < width * height; i++) {
        Append(texels, Rgba32({gs}));
    }
    return texels;
}

// A data root holding the map loading screen (a red 384x128 picture, the size retail draws) and
// the boot logos.
struct LoadingData {
    fs::path root = fs::temp_directory_path() / ("dc_tex_nowload_" + std::to_string(getpid()));

    LoadingData() {
        fs::remove_all(root);
        Write(root / "img" / "mt01.tm2", Tim2({TIM2_RGB32, 384, 128, {Solid(384, 128, Gs(255, 0, 0))}, {}, 0}));
        Bytes logo(448 * 64, 1);
        // PAL keeps every language but Japanese in img_<language>.
        Write(root / "img_1" / "title.img",
              Img({
                  {"SCElogo", Tim2({TIM2_IDTEX8, 448, 64, {logo}, Clut256({{1, Gs(0, 0, 255)}}), 256})},
                  {"L5logo",  Tim2({TIM2_RGB32, 128, 128, {Solid(128, 128, Gs(0, 255, 0))}, {}, 0})   }
        }));
        PathsSetDataRoot(root);
        InitCDFile();
        LanguageCode = LANG_JAPANESE;
        ClockSetUnbounded(true);
        ClockReset();
    }

    ~LoadingData() {
        ClockSetIdleHook(nullptr);
        ClockSetTickCallback(nullptr);
        PortReleaseOwner(PortTextureOwner::Loading);
        fs::remove_all(root);
    }
};

std::array<uint8_t, 4> Presented(int x, int y) {
    std::vector<uint8_t> pixels;
    uint32_t             width;
    uint32_t             height;
    DC_CHECK(gfx::ReadbackFrame(pixels, width, height));
    const uint8_t *p = &pixels[(static_cast<size_t>(y) * width + x) * 4];
    return {p[0], p[1], p[2], p[3]};
}

bool Near(std::array<uint8_t, 4> pixel, int r, int g, int b, int tolerance = 3) {
    bool near = std::abs(pixel[0] - r) <= tolerance && std::abs(pixel[1] - g) <= tolerance &&
                std::abs(pixel[2] - b) <= tolerance;
    if (!near) {
        std::fprintf(stderr, "presented %d,%d,%d, expected %d,%d,%d\n", pixel[0], pixel[1], pixel[2], r, g, b);
    }
    return near;
}

} // namespace

DC_TEST(tex_nowload_fades_in_holds_and_ends) {
    TexEnv      env;
    LoadingData data;
    init_now_loading(0);
    DC_CHECK(end_flag == 0 && check_now_loading_vsync_end() == 1);
    PortTextureRef ref = PortTextureFromCTexture(&nl_tex);
    DC_CHECK(ref.valid && ref.width == 384 && ref.height == 128);

    // Twenty vertical syncs of nothing before the picture starts to fade in.
    for (int i = 0; i < 10; i++) {
        DC_CHECK(check_now_loading() == 0);
    }
    DC_CHECK(Near(Presented(320, 224), 0, 0, 0));

    std::int64_t before = ClockTickCount();
    wait_now_loading_vsync();
    DC_CHECK(ClockTickCount() == before + 1);

    int pumps = 11;
    while (col_cnt < 64.0f) {
        DC_CHECK(check_now_loading() == 0);
        pumps++;
    }
    // The sprite drawn on the tick that reached 64 still carried 63: 0x80 grey times 63/128 alpha.
    DC_CHECK(pumps == 20 + 64);
    DC_CHECK(Near(Presented(320, 224), 255 * 63 / 128, 0, 0));
    DC_CHECK(Near(Presented(128 + 2, 160 + 2), 255 * 63 / 128, 0, 0));
    DC_CHECK(Near(Presented(126, 224), 0, 0, 0));
    DC_CHECK(Near(Presented(320, 160 + 128 + 2), 0, 0, 0));

    while (col_add > 0.0f) {
        DC_CHECK(check_now_loading() == 0);
        pumps++;
    }
    DC_CHECK(Near(Presented(320, 224), 255, 0, 0));

    while (check_now_loading() == 0) {
        pumps++;
        DC_CHECK(pumps < 1000);
    }
    // 20 idle, 129 up, 120 held, 129 down, give or take the turns.
    DC_CHECK(pumps > 380 && pumps < 410);
    DC_CHECK(end_flag == 1);

    // Finished: waits return at once and pumps present nothing more.
    before = ClockTickCount();
    wait_now_loading_vsync();
    DC_CHECK(ClockTickCount() == before);
    env.gfx.Frame({0, 0, 255, 0x80}, [] {});
    ClockPump();
    DC_CHECK(Near(Presented(320, 224), 0, 0, 255));
}

DC_TEST(tex_nowload_never_presents_inside_an_open_frame) {
    TexEnv      env;
    LoadingData data;
    init_now_loading(0);
    while (col_cnt < 100.0f) {
        check_now_loading();
    }
    DC_CHECK(gfx::BeginFrame());
    const uint8_t green[4] = {0, 255, 0, 0x80};
    gfx::Clear(true, green, true, 0.0f);
    std::int64_t before = ClockTickCount();
    wait_now_loading_vsync();
    ClockPump();
    DC_CHECK(ClockTickCount() == before + 2);
    gfx::EndFrame();
    DC_CHECK(Near(Presented(320, 224), 0, 255, 0));
    DC_CHECK(gfx::ValidationMessageCount() == 0);
}

DC_TEST(tex_nowload_boot_logos) {
    TexEnv      env;
    LoadingData data;
    LanguageCode = LANG_ENGLISH_US;
    init_now_loading(0x321);
    DC_CHECK(end_flag == 0);
    DC_CHECK(PortTextureFromCTexture(&nl_tex).valid && PortTextureFromCTexture(&nl_tex2).valid);

    while (!(logo_count == 0 && col_add < 0.0f)) {
        DC_CHECK(check_now_loading() == 0);
    }
    // The SCE logo, 448x64 at (96, 192), at full strength through its CLUT.
    DC_CHECK(Near(Presented(320, 224), 0, 0, 255));
    DC_CHECK(Near(Presented(320, 150), 0, 0, 0));

    while (!(logo_count == 1 && col_add < 0.0f)) {
        DC_CHECK(check_now_loading() == 0);
    }
    DC_CHECK(Near(Presented(320, 224), 0, 255, 0));
    DC_CHECK(Near(Presented(250, 224), 0, 0, 0));

    int pumps = 0;
    while (check_now_loading() == 0) {
        DC_CHECK(++pumps < 1000);
    }
    DC_CHECK(logo_count == 2);
}

DC_TEST(tex_nowload_off_and_missing_screens) {
    TexEnv      env;
    LoadingData data;
    now_loading_off();
    init_now_loading(0);
    DC_CHECK(end_flag == 1 && check_now_loading() == 1);
    // A map without a picture shows nothing and does not hold the game.
    init_now_loading(42);
    DC_CHECK(end_flag == 1);
    init_now_loading(0);
    DC_CHECK(end_flag == 0);
}
