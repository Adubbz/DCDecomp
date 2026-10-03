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
std::string Run(const std::string &name, const fs::path &data, const std::string &script, int frames) {
    fs::path dir = fs::temp_directory_path() / ("dc_real_input_" + name);
    fs::remove_all(dir);
    fs::create_directories(dir / "save");
    std::ofstream(dir / "input.txt") << script;
    fs::path    executable = fs::read_symlink("/proc/self/exe").parent_path() / "darkcloud";
    fs::path    screenshot = dir / "frame.png";
    std::string command = "'" + executable.string() + "' --headless --frames " + std::to_string(frames) +
                          " --screenshot '" + screenshot.string() + "' --data '" + data.string() +
                          "' --save '" + (dir / "save").string() + "' --input '" +
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
                            const std::string &unmoved, int frames) {
    fs::path data = RealData();
    auto     launch = [&](std::string suffix, const std::string &script) {
        return std::async(std::launch::async, Run, std::string(name) + suffix, data, script, frames);
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

const char kDebugMode[] = "0 pad2 l1 r1 l2 r2\n1 pad2\n";

} // namespace

// The developer menu reads only the d-pad and never the left stick, so S presses down; F (circle)
// enters the fifth row, the dungeon loader.
DC_TEST(integration_real_data_keyboard_drives_the_developer_menu) {
    std::string keys = std::string(kDebugMode) + "10 key:s\n12\n14 key:S\n16\n18 key:s\n20\n22 key:s\n24\n";
    std::string pad = std::string(kDebugMode) + "10 down\n12\n14 down\n16\n18 down\n20\n22 down\n24\n";
    CheckSameAsPadAndMoved("devmenu", keys + "30 key:f\n32\n", pad + "30 circle\n32\n", keys, 45);
}

// Mouse1 and Space (cross) through the language select and the memory check, Return (start) through
// the attract movie and the logo; on the title menu, which runs MenuModeOn(120), S deflects the
// left stick fully and the game's own conversion moves the cursor to CONTINUE.
DC_TEST(integration_real_data_keyboard_and_mouse_reach_and_move_the_title_menu) {
    std::string boot_keys = "0\n70 mouse1\n75\n90 key:space\n95\n200 key:return\n205\n480 key:return\n485\n";
    std::string boot_pad = "0\n70 cross\n75\n90 cross\n95\n200 start\n205\n480 start\n485\n";
    CheckSameAsPadAndMoved("title", boot_keys + "600 key:s\n610\n", boot_pad + "600 down\n610\n", boot_keys,
                           640);
}
