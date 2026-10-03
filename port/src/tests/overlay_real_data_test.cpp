#include <sys/wait.h>

#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <future>
#include <iterator>
#include <sstream>
#include <string>

#include "exitcodes.hpp"
#include "test.hpp"

// The FPS counter on the real PAL data (DC_DATA): a run with --show-fps presents every frame with the
// counter over it, and its --screenshot is byte for byte the run's without. Skipped without the data.

namespace fs = std::filesystem;

namespace {

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

struct Run {
    int         status = -1;
    std::string output;
    std::string png;
};

// The route of integration_real_data_developer_menu_opens_the_dungeon_loader, offscreen as a window
// without a surface would draw it; DC_PRESENT_STATS reports what the counter said last.
Run DungeonLoader(const std::string &name, const fs::path &data, const std::string &extra) {
    fs::path build = fs::read_symlink("/proc/self/exe").parent_path();
    fs::path dir = build / "real_data" / name;
    fs::path save = build / "real_data" / "save";
    fs::remove_all(dir);
    fs::create_directories(dir);
    fs::create_directories(save);
    std::ofstream(dir / "input.txt") << "0\n2 down\n4\n6 down\n8\n10 down\n12\n14 down\n16\n20 circle\n22\n";
    fs::path    log = dir / "output.txt";
    fs::path    screenshot = dir / "frame.png";
    std::string command = "DC_PRESENT_STATS=1 '" + (build / "darkcloud").string() +
                          "' --offscreen --width 320 --height 240 --jump menu --fast-load --frames 35 " +
                          extra + " --screenshot '" + screenshot.string() + "' --data '" + data.string() +
                          "' --save '" + save.string() + "' --input '" + (dir / "input.txt").string() +
                          "' > '" + log.string() + "' 2>&1";
    int raw = std::system(command.c_str());
    Run run;
    run.status = WIFEXITED(raw) ? WEXITSTATUS(raw) : 128 + WTERMSIG(raw);
    std::ifstream     text_file(log);
    std::stringstream text;
    text << text_file.rdbuf();
    run.output = text.str();
    std::ifstream png(screenshot, std::ios::binary);
    run.png.assign(std::istreambuf_iterator<char>(png), std::istreambuf_iterator<char>());
    return run;
}

} // namespace

DC_TEST(integration_real_data_fps_counter_leaves_the_screenshot_alone) {
    fs::path data = RealData();
    auto     counted = std::async(std::launch::async, DungeonLoader, "fps_on", data, "--show-fps");
    auto     plain = std::async(std::launch::async, DungeonLoader, "fps_off", data, "");
    Run      on = counted.get();
    Run      off = plain.get();
    DC_CHECK(on.status == kExitOk && off.status == kExitOk);
    DC_CHECK(on.output.find("fps counter: FPS ") != std::string::npos);
    DC_CHECK(off.output.find("fps counter:") == std::string::npos);
    DC_CHECK(!on.png.empty() && on.png == off.png);
}
