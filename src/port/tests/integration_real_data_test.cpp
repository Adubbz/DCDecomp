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

// Runs live beside the test executable, so builds do not share them, and share one save directory,
// so the pipeline cache is compiled once.
Run RunScripted(const char *name, const fs::path &data, const std::string &script, int frames,
                const std::string &hooks) {
    fs::path build = fs::read_symlink("/proc/self/exe").parent_path();
    fs::path dir = build / "real_data" / name;
    fs::path save = build / "real_data" / "save";
    fs::remove_all(dir);
    fs::create_directories(dir);
    fs::create_directories(save);
    std::ofstream(dir / "input.txt") << script;
    fs::path executable = build / "darkcloud";
    fs::path log = dir / "output.txt";
    Run      run;
    run.screenshot = dir / (std::string(name) + ".png");
    std::string command = "'" + executable.string() + "' --headless --width 320 --height 240 " + hooks + " --frames " + std::to_string(frames) +
                          " --screenshot '" + run.screenshot.string() + "' --data '" + data.string() +
                          "' --save '" + save.string() + "' --input '" +
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

} // namespace

// Straight into the title (the --jump test hook), Start twice on the logo: the title menu.
DC_TEST(integration_real_data_reaches_the_title_menu) {
    fs::path data = RealData();
    Run      run = RunScripted("title", data, "0\n100 start\n105\n140 start\n145\n", 180, "--jump title --fast-load");
    DC_CHECK(run.status == kExitOk);
    DC_CHECK(run.output.find("SND_INF= title.txt") != std::string::npos);
    DC_CHECK(run.output.find("not implemented on PC") == std::string::npos);
    DC_CHECK(fs::file_size(run.screenshot) > 0);
}

// The developer menu (--jump menu, as pad 2's shoulder buttons through the warm-up would open it):
// its fifth row is the dungeon loader.
DC_TEST(integration_real_data_developer_menu_opens_the_dungeon_loader) {
    fs::path data = RealData();
    Run      run = RunScripted("loader", data,
                               "0\n2 down\n4\n6 down\n8\n10 down\n12\n14 down\n16\n20 circle\n22\n", 35,
                               "--jump menu --fast-load");
    DC_CHECK(run.status == kExitOk);
    DC_CHECK(run.output.find("not implemented on PC") == std::string::npos);
    DC_CHECK(fs::file_size(run.screenshot) > 0);
}
