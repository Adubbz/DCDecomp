#include <sys/wait.h>

#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <future>
#include <iterator>
#include <string>

#include "exitcodes.hpp"
#include "test.hpp"

// The keyboard and mouse on the real PAL data (DC_DATA), through the input script's key and mouse
// tokens: each run is set against the same route on pad buttons, whose screenshot it must match
// byte for byte, and against the route without the press under test, which it must not. Skipped
// without the data.

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

// The screenshot's bytes, or empty if the run failed.
// Runs start where they need to (the --jump and --fast-load test hooks), live beside the test
// executable and share one save directory, so the pipeline cache is compiled once.
std::string Run(const std::string &name, const fs::path &data, const std::string &script, int frames,
                const std::string &jump) {
    fs::path build = fs::read_symlink("/proc/self/exe").parent_path();
    fs::path dir = build / "real_data" / ("input_" + name);
    fs::path save = build / "real_data" / "save";
    fs::remove_all(dir);
    fs::create_directories(dir);
    fs::create_directories(save);
    std::ofstream(dir / "input.txt") << script;
    fs::path    executable = build / "darkcloud";
    fs::path    screenshot = dir / "frame.png";
    std::string command = "'" + executable.string() + "' --headless --width 320 --height 240 --fast-load --jump " + jump + " --frames " +
                          std::to_string(frames) +
                          " --screenshot '" + screenshot.string() + "' --data '" + data.string() +
                          "' --save '" + save.string() + "' --input '" +
                          (dir / "input.txt").string() + "' > '" + (dir / "output.txt").string() + "' 2>&1";
    int raw = std::system(command.c_str());
    if (!WIFEXITED(raw) || WEXITSTATUS(raw) != kExitOk) {
        std::fprintf(stderr, "%s: darkcloud failed (%d); see %s\n", name.c_str(), raw, dir.c_str());
        return {};
    }
    std::ifstream file(screenshot, std::ios::binary);
    return {std::istreambuf_iterator<char>(file), std::istreambuf_iterator<char>()};
}

void CheckSameAsPadAndMoved(const char *name, const std::string &keys, const std::string &pad,
                            const std::string &unmoved, int frames, const char *jump) {
    fs::path data = RealData();
    auto     launch = [&](std::string suffix, const std::string &script) {
        return std::async(std::launch::async, Run, std::string(name) + suffix, data, script, frames,
                              std::string(jump));
    };
    auto        keyboard = launch("_keys", keys);
    auto        buttons = launch("_pad", pad);
    auto        still = launch("_still", unmoved);
    std::string keyboard_frame = keyboard.get();
    std::string pad_frame = buttons.get();
    std::string still_frame = still.get();
    DC_CHECK(!keyboard_frame.empty() && !pad_frame.empty() && !still_frame.empty());
    DC_CHECK(keyboard_frame == pad_frame);
    DC_CHECK(keyboard_frame != still_frame);
}

const char kDebugMode[] = "0\n";

} // namespace

// The developer menu reads only the d-pad and never the left stick, so S presses down; F (circle)
// enters the fifth row, the dungeon loader, where Mouse1 (cross) picks the first dungeon.
DC_TEST(integration_real_data_keyboard_drives_the_developer_menu) {
    std::string keys = std::string(kDebugMode) + "2 key:s\n4\n6 key:S\n8\n10 key:s\n12\n14 key:s\n16\n";
    std::string pad = std::string(kDebugMode) + "2 down\n4\n6 down\n8\n10 down\n12\n14 down\n16\n";
    CheckSameAsPadAndMoved("devmenu", keys + "20 key:f\n22\n30 mouse1\n32\n",
                           pad + "20 circle\n22\n30 cross\n32\n", keys, 60, "menu");
}

// Return (start) twice through the title logo; on the title menu, which runs MenuModeOn(120), S
// deflects the left stick fully and the game's own conversion moves the cursor to CONTINUE.
DC_TEST(integration_real_data_keyboard_and_mouse_reach_and_move_the_title_menu) {
    std::string boot_keys = "0\n100 key:return\n105\n140 key:return\n145\n";
    std::string boot_pad = "0\n100 start\n105\n140 start\n145\n";
    CheckSameAsPadAndMoved("title", boot_keys + "220 key:s\n230\n", boot_pad + "220 down\n230\n", boot_keys,
                           260, "title");
}
