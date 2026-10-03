#include <sys/wait.h>

#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <sstream>
#include <string>

#include "exitcodes.hpp"
#include "test.hpp"

// darkcloud on the real PAL data (DC_DATA, as `dcdata extract` writes it), driven by an input
// script. Skipped without the data, which CI does not have.

namespace fs = std::filesystem;

namespace {

struct Run {
    int         status = -1;
    std::string output;
    fs::path    screenshot;
};

fs::path RealData() {
    const char *data = std::getenv("DC_DATA");
    if (data == nullptr || *data == '\0') {
        DC_SKIP("DC_DATA is not set");
    }
    if (!fs::is_regular_file(fs::path(data) / "data.hd2")) {
        DC_SKIP("DC_DATA holds no extracted data.hd2");
    }
    return data;
}

Run RunScripted(const char *name, const fs::path &data, const std::string &script, int frames,
                const std::string &extra = "", fs::path save = {}) {
    fs::path dir = fs::temp_directory_path() / (std::string("dc_real_") + name);
    fs::remove_all(dir);
    fs::create_directories(dir);
    if (save.empty()) {
        save = dir / "save";
    }
    fs::create_directories(save);
    std::ofstream(dir / "input.txt") << script;
    fs::path    executable = fs::read_symlink("/proc/self/exe").parent_path() / "darkcloud";
    fs::path    log = dir / "output.txt";
    Run         run;
    run.screenshot = dir / (std::string(name) + ".png");
    std::string command = "'" + executable.string() + "' --headless --frames " + std::to_string(frames) +
                          " " + extra + " --screenshot '" + run.screenshot.string() + "' --data '" +
                          data.string() + "' --save '" + save.string() + "' --input '" +
                          (dir / "input.txt").string() + "' > '" + log.string() + "' 2>&1";
    int raw = std::system(command.c_str());
    run.status = WIFEXITED(raw) ? WEXITSTATUS(raw) : 128 + WTERMSIG(raw);
    std::ifstream     file(log);
    std::stringstream text;
    text << file.rdbuf();
    run.output = text.str();
    if (std::getenv("DC_SMOKE_VERBOSE") != nullptr) {
        std::fprintf(stderr, "status %d\n%s", run.status, run.output.c_str());
    }
    return run;
}

// The developer menu's routes leave the save alone; sharing one keeps the pipeline cache warm.
fs::path SharedSave() { return fs::temp_directory_path() / "dc_real_shared_save"; }

constexpr const char *kDeveloperMenu = "0 pad2 l1 r1 l2 r2\n1 pad2\n";
constexpr const char *kSmallWindow = "--width 320 --height 240";

} // namespace

// Language select and memory check with Cross, Start through the attract movie, Start twice on the
// title logo: the title menu.
DC_TEST(integration_real_data_reaches_the_title_menu) {
    fs::path data = RealData();
    Run      run = RunScripted("title", data,
                               "0\n70 cross\n75\n90 cross\n95\n200 start\n205\n480 start\n485\n520 start\n"
                               "525\n",
                               560);
    DC_CHECK(run.status == kExitOk);
    DC_CHECK(run.output.find("SND_INF= title.txt") != std::string::npos);
    DC_CHECK(run.output.find("not implemented on PC") == std::string::npos);
    DC_CHECK(fs::file_size(run.screenshot) > 0);
}

// Pad 2's four shoulder buttons through the warm-up open the developer menu; its fifth row is the
// dungeon loader.
DC_TEST(integration_real_data_developer_menu_opens_the_dungeon_loader) {
    fs::path data = RealData();
    Run      run = RunScripted("loader", data,
                               "0 pad2 l1 r1 l2 r2\n1 pad2\n10 down\n12\n14 down\n16\n18 down\n20\n"
                               "22 down\n24\n"
                               "30 circle\n32\n",
                               45);
    DC_CHECK(run.status == kExitOk);
    DC_CHECK(run.output.find("not implemented on PC") == std::string::npos);
    DC_CHECK(fs::file_size(run.screenshot) > 0);
}

// The developer menu's second row: Norune (e01). Its parts are .pts definitions decoded into host
// records, and the town runs with the executable and its arenas above 4 GiB.
DC_TEST(integration_real_data_town_e01) {
    fs::path data = RealData();
    Run      run = RunScripted("town", data,
                               std::string(kDeveloperMenu) + "10 down\n12\n20 circle\n22\n100 0 128 128 128\n140\n",
                               200, kSmallWindow, SharedSave());
    DC_CHECK(run.status == kExitOk);
    DC_CHECK(run.output.find("SND_INF= bgm1.txt") != std::string::npos);
    DC_CHECK(run.output.find("not implemented on PC") == std::string::npos);
    DC_CHECK(fs::file_size(run.screenshot) > 0);
}

// The dungeon loader's first dungeon, floor 1 through its card, then walking and an attack: the
// floor's map build, DunMoveChara's collision walk over NowDngMap and the floor's event script.
DC_TEST(integration_real_data_dungeon_play) {
    fs::path data = RealData();
    Run      run = RunScripted("dungeon", data,
                               std::string(kDeveloperMenu) +
                                   "10 down\n12\n14 down\n16\n18 down\n20\n22 down\n24\n30 circle\n32\n"
                                   "40 circle\n42\n100 cross\n102\n250 128 0 128 128\n420 cross\n"
                                   "424 128 0 128 128\n520 128 128 0 128\n560\n",
                               600, kSmallWindow, SharedSave());
    DC_CHECK(run.status == kExitOk);
    DC_CHECK(run.output.find("map build success!!") != std::string::npos);
    DC_CHECK(run.output.find("SND_INF= bgm5.txt") != std::string::npos);
    DC_CHECK(run.output.find("not implemented on PC") == std::string::npos);
    DC_CHECK(fs::file_size(run.screenshot) > 0);
}
