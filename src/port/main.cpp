#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <filesystem>
#include <string>
#include <string_view>
#include <system_error>
#include <vector>

#include "audio/mixer.hpp"
#include "battle_globals.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "exitcodes.hpp"
#include "gameloop.hpp"
#include "gamemode.hpp"
#include "gfx/gfx.hpp"
#include "langset.hpp"
#include "menu_save.hpp"
#include "mglib.hpp"
#include "nowload.hpp"
#include "platform/audio.hpp"
#include "platform/clock.hpp"
#include "platform/config.hpp"
#include "platform/input.hpp"
#include "platform/input_script.hpp"
#include "platform/memory.hpp"
#include "platform/paths.hpp"
#include "platform/window.hpp"
#include "snd.hpp"
#include "title/opening.hpp"
#include "title/rushmovi.hpp"
#include "title/title.hpp"

int  EditInit(void *param);
int  EditLoop();
void SndInit();

namespace fs = std::filesystem;

namespace {

struct Options {
    bool         headless = false;
    bool         high_arenas = false;
    bool         offscreen = false;
    std::int64_t frames = -1;
    const char  *screenshot = nullptr;
    const char  *input = nullptr;
    int          width = 0;
    int          height = 0;
    int          display_per_tick = 0;
};

[[noreturn]] void Usage(const char *program) {
    std::fprintf(stderr,
                 "usage: %s [--data DIR] [--save DIR] [--headless] [--frames N] [--screenshot PATH]\n"
                 "          [--input FILE] [--width W] [--height H] [--offscreen] [--high-arenas]\n"
                 "          [--display-per-tick N]\n"
                 "  --data DIR         the extracted game data (default: DC_DATA, then ./data, then data/\n"
                 "                     beside the executable)\n"
                 "  --save DIR         saves, config.ini and the pipeline cache (default: DC_SAVE, then\n"
                 "                     ./save, then save/ beside the executable)\n"
                 "  --headless         render offscreen (SDL offscreen driver, VK_EXT_headless_surface),\n"
                 "                     no audio device, the game clock unbounded\n"
                 "  --offscreen        --headless without a Vulkan surface: render to an image only (what\n"
                 "                     --headless does when there is no VK_EXT_headless_surface)\n"
                 "  --frames N         stop after N frames of the game's main loop\n"
                 "  --screenshot PATH  write the last frame to PATH as a PNG on exit\n"
                 "  --input FILE       drive pad 1 from a script (default: DC_INPUT); see docs/PC.md\n"
                 "  --width, --height  window size in pixels (default: config.ini, then 1280x960)\n"
                 "  --high-arenas      map the arenas above 4 GiB, as macOS must (DC_HIGH_ARENAS=1)\n"
                 "  --display-per-tick N  headless: also render N interpolated display frames per tick\n",
                 program);
    std::exit(kExitUsage);
}

Options ParseOptions(int argc, const char **argv) {
    Options options;
    for (int i = 1; i < argc; i++) {
        std::string_view arg = argv[i];
        auto             value = [&]() {
            if (i + 1 >= argc) {
                Usage(argv[0]);
            }
            return argv[++i];
        };
        auto number = [&]() {
            char *end = nullptr;
            long  result = std::strtol(value(), &end, 10);
            if (end == nullptr || *end != '\0' || result < 0) {
                Usage(argv[0]);
            }
            return result;
        };
        if (arg == "--headless") {
            options.headless = true;
        } else if (arg == "--offscreen") {
            options.headless = true;
            options.offscreen = true;
        } else if (arg == "--high-arenas") {
            options.high_arenas = true;
        } else if (arg == "--frames") {
            options.frames = number();
        } else if (arg == "--screenshot") {
            options.screenshot = value();
        } else if (arg == "--input") {
            options.input = value();
        } else if (arg == "--width") {
            options.width = static_cast<int>(number());
        } else if (arg == "--height") {
            options.height = static_cast<int>(number());
        } else if (arg == "--display-per-tick") {
            options.display_per_tick = static_cast<int>(number());
        } else {
            Usage(argv[0]);
        }
    }
    return options;
}

// InitCDFile stops on the same conditions, but checking first gives the one-line message and its
// own exit status before a window or a Vulkan device exists.
void RequireData() {
    const fs::path &root = PathsDataRoot();
    std::error_code error;
    const char     *why = nullptr;
    if (!fs::is_directory(root, error)) {
        why = "is not a directory";
    } else {
        why = "is empty";
        auto options = fs::directory_options::follow_directory_symlink |
                       fs::directory_options::skip_permission_denied;
        for (fs::recursive_directory_iterator it(root, options, error), end; !error && it != end;
             it.increment(error)) {
            std::error_code entry_error;
            if (it->is_regular_file(entry_error)) {
                why = nullptr;
                break;
            }
        }
    }
    if (why != nullptr) {
        std::fprintf(stderr,
                     "no game data: %s %s; extract the disc with `dcdata extract <disc image> %s` "
                     "or pass --data <dir>\n",
                     root.c_str(), why, root.c_str());
        std::exit(kExitNoData);
    }
}

void PumpHost() {
    if (!WindowPollEvents()) {
        GameRequestStop();
    }
    InputPoll();
    InputScriptApply(GameFrameCount());
}

void LoadInputScript(const char *path) {
    if (path == nullptr) {
        path = std::getenv("DC_INPUT");
    }
    if (path == nullptr || *path == '\0') {
        return;
    }
    InputScript script;
    std::string error;
    if (!InputScriptLoad(path, script, error)) {
        std::fprintf(stderr, "bad input script: %s\n", error.c_str());
        std::exit(kExitUsage);
    }
    InputScriptInstall(std::move(script));
}

void RenderAudio(void *, float *out, int frames) {
    audio::DefaultMixer().Render(out, frames);
}

void ReportShaderProgress(uint32_t done, uint32_t total) {
    static uint32_t    reported = 0;
    constexpr uint32_t kSteps = 4;
    if (total == 0) {
        return;
    }
    uint32_t step = done * kSteps / total;
    if (done == 0 || step > reported) {
        reported = step;
        std::fprintf(stderr, "compiling shaders %u/%u\n", done, total);
    }
}

gfx::PresentMode PresentMode(ConfigPresentMode mode) {
    switch (mode) {
        case ConfigPresentMode::Mailbox:
            return gfx::PresentMode::Mailbox;
        case ConfigPresentMode::Immediate:
            return gfx::PresentMode::Immediate;
        default:
            return gfx::PresentMode::Fifo;
    }
}

// DC_PRESENT_STATS=1: what the ticks drew and what rendering them cost.
void ReportPresentStats() {
    const char *setting = std::getenv("DC_PRESENT_STATS");
    if (setting == nullptr || *setting == '\0' || *setting == '0') {
        return;
    }
    GamePresentStats stats = GamePresentStatistics();
    if (stats.ticks == 0) {
        return;
    }
    double ticks = static_cast<double>(stats.ticks);
    std::fprintf(stderr,
                 "present: %llu ticks, per tick %.1f mesh draws (%.1f keyed), %.1f 2D draws, %.1f stateful, "
                 "at most %llu draws; canonical %.2f ms per tick; %llu display frames, %.2f ms each\n",
                 static_cast<unsigned long long>(stats.ticks), static_cast<double>(stats.mesh_draws) / ticks,
                 static_cast<double>(stats.keyed_mesh_draws) / ticks, static_cast<double>(stats.draws_2d) / ticks,
                 static_cast<double>(stats.stateful) / ticks, static_cast<unsigned long long>(stats.max_draws),
                 stats.canonical_seconds * 1000.0 / ticks, static_cast<unsigned long long>(stats.display_frames),
                 stats.display_frames ? stats.display_seconds * 1000.0 / static_cast<double>(stats.display_frames)
                                      : 0.0);
}

int Screenshot(const char *path) {
    std::vector<uint8_t> pixels;
    uint32_t             width = 0;
    uint32_t             height = 0;
    if (!gfx::ReadbackFrame(pixels, width, height) || !gfx::WritePng(path, pixels.data(), width, height)) {
        std::fprintf(stderr, "cannot write the screenshot to %s\n", path);
        return kExitFailure;
    }
    return kExitOk;
}

} // namespace

int main(int argc, const char **argv, const char **envp) {
    argc = PathsConsumeArgs(argc, argv);
    Options options = ParseOptions(argc, argv);
    if (options.high_arenas) {
        ArenaMemorySetHigh(true);
    }
    RequireData();
    LoadInputScript(options.input);

    ConfigLoad();
    const Config &config = ConfigGet();

    WindowConfig window;
    window.width = options.width > 0 ? options.width : config.window_width;
    window.height = options.height > 0 ? options.height : config.window_height;
    window.fullscreen = config.fullscreen;
    window.headless = options.headless;
    bool offscreen = options.offscreen || (options.headless && !gfx::HeadlessSurfaceAvailable());
    window.vulkan = !offscreen;
    WindowInit(window);
    InputInit();

    gfx::RendererConfig renderer;
    renderer.present_mode = PresentMode(config.present_mode);
    renderer.pipeline_cache = PathsSaveRoot() / "pipeline_cache.bin";
    renderer.progress = ReportShaderProgress;
    renderer.offscreen = offscreen;
    gfx::RendererInit(WindowHandle(), renderer);

    audio::DefaultMixer().SetMasterGain(config.master_volume);
    AudioOutputStart(audio::DefaultMixer().Rate(), RenderAudio, nullptr);

    ClockSetTickRate(config.tick_rate);
    ClockSetUnbounded(options.headless);
    ClockAddPumpHook(PumpHost);
    GameSetFrameBudget(options.frames);
    GameSetPresentSettings({.interpolation = config.interpolation,
                            .max_fps = config.max_fps,
                            .display_per_tick = options.display_per_tick});

    int status = RunGame(argc, const_cast<char **>(argv));
    if (status == kExitOk && options.screenshot != nullptr) {
        status = Screenshot(options.screenshot);
    }
    ReportPresentStats();

    ClockRemovePumpHook(PumpHost);
    AudioOutputStop();
    InputShutdown();
    gfx::RendererShutdown();
    WindowShutdown();
    return status;
}

extern "C" {
void init_all__Fv() {
    init_all();
}

void initialize_data__Fv() {
    initialize_data();
}

void GlobalNameInit__Fv() {
    GlobalNameInit();
}

void InitReadBG__Fv() {
    InitReadBG();
}

void SndInit__Fv() {
    SndInit();
}

void LoadOverlay__Fi(int mode) {
    LoadOverlay(mode);
}

void MGSetRenderInfo__Ffff(float scale, float near_z, float far_z) {
    MGSetRenderInfo(scale, near_z, far_z);
}

void init_now_loading__Fi(int title_number) {
    init_now_loading(title_number);
}

void LoadSystemMessage__Fv() {
    LoadSystemMessage();
}

void SndInitialize__Fiiii(int unused0, int unused1, int unused2, int unused3) {
    SndInitialize(unused0, unused1, unused2, unused3);
}

int InitExistData__Fv() {
    return InitExistData();
}

void MapJump__Fii(int map_no, int event_no) {
    MapJump(map_no, event_no);
}

void EditInit__FPv(void *param) {
    EditInit(param);
}

void MenuInit__Fv(int mode) {
    MenuInit();
}

void MemCheckInit__Fv(int mode) {
    MemCheckInit();
}

void TrialEndInit__Fv(int mode) {
    TrialEndInit();
}

void InitSave__Fv(int mode) {
    InitSave();
}

void LangsetInit__Fv(int mode) {
    LangsetInit();
}

int check_now_loading__Fv() {
    return check_now_loading();
}

void MGInitVSyncCallBack__FPFi_i(int (*callback)(int)) {
    MGInitVSyncCallBack(callback);
}

void PlayTimeCount__Fi(int add) {
    PlayTimeCount(add);
}

void MGBeginFrame__Fv() {
    MGBeginFrame();
}

void SetEnv__FP13sceVif1Packet(sceVif1Packet *vif1_packet) {
    SetEnv(vif1_packet);
}

int EditLoop__Fv() {
    return EditLoop();
}

int MenuLoop__Fv() {
    return MenuLoop();
}

int MemCheckLoop__Fv() {
    return MemCheckLoop();
}

int TrialEndLoop__Fv() {
    return TrialEndLoop();
}

int LoopSave__Fv() {
    return LoopSave();
}

int LangsetLoop__Fv() {
    return LangsetLoop();
}

void MGEndFrame__Fv() {
    MGEndFrame();
}

int CheckTrialEnd__Fv() {
    return CheckTrialEnd();
}

int ReadBGSync__Fv() {
    return ReadBGSync();
}

void TrialStart__Fv() {
    TrialStart();
}

void func_01DAC1C0() {
    GameInit();
}

int func_01DAD980(int mode) {
    return GameLoop();
}

void func_01DAF1C0() {
    OpeningInit();
}

int func_01DAF970() {
    return OpeningLoop();
}

void func_01DC1420(int mode) {
    LoaderInit();
}

int func_01DC1510() {
    return LoaderLoop();
}

void func_01DC8C50() {
    RushInit();
}

int func_01DC8EB0() {
    return RushLoop();
}

void func_01DD1AB0(int inited) {
    TitleInit(inited);
}

int func_01DD2220() {
    return TitleLoop();
}
}
