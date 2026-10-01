#include <cstdio>
#include <cstdlib>
#include <string_view>
#include <vector>

#include "battle_globals.hpp"
#include "dataread.hpp"
#include "dun/gameloop.hpp"
#include "gamemode.hpp"
#include "gfx/gfx.hpp"
#include "langset.hpp"
#include "menu_save.hpp"
#include "mglib.hpp"
#include "nowload.hpp"
#include "platform/window.hpp"
#include "snd.hpp"
#include "title/opening.hpp"
#include "title/rushmovi.hpp"
#include "title/title.hpp"

int  EditInit(void *param);
int  EditLoop();
void SndInit();

namespace {

[[noreturn]] void Usage(const char *program) {
    std::fprintf(stderr,
                 "usage: %s [--headless] [--frames N] [--screenshot PATH] [--width W] [--height H]\n"
                 "  --headless         render offscreen (SDL offscreen driver, VK_EXT_headless_surface)\n"
                 "  --frames N         exit after N frames\n"
                 "  --screenshot PATH  write the last frame to PATH as a PNG on exit\n"
                 "  --width, --height  window size in pixels\n",
                 program);
    std::exit(2);
}

} // namespace

int main(int argc, const char **argv, const char **envp) {
    WindowConfig window;
    long         frames = -1;
    const char  *screenshot = nullptr;
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
            window.headless = true;
        } else if (arg == "--frames") {
            frames = number();
        } else if (arg == "--screenshot") {
            screenshot = value();
        } else if (arg == "--width") {
            window.width = static_cast<int>(number());
        } else if (arg == "--height") {
            window.height = static_cast<int>(number());
        } else {
            Usage(argv[0]);
        }
    }

    WindowInit(window);
    gfx::RendererInit(WindowHandle(), gfx::RendererConfig{});
    for (long frame = 0; (frames < 0 || frame < frames) && WindowPollEvents(); frame++) {
        MGBeginFrame();
        MGEndFrame();
    }

    int status = 0;
    if (screenshot != nullptr) {
        std::vector<uint8_t> pixels;
        uint32_t             width = 0;
        uint32_t             height = 0;
        if (!gfx::ReadbackFrame(pixels, width, height) || !gfx::WritePng(screenshot, pixels.data(), width, height)) {
            std::fprintf(stderr, "cannot write the screenshot to %s\n", screenshot);
            status = 1;
        }
    }
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
