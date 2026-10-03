#include <sys/wait.h>

#include <algorithm>
#include <cstdint>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iterator>
#include <sstream>
#include <string>
#include <vector>

#include "exitcodes.hpp"
#include "test.hpp"

// The debug key on the real PAL data (DC_DATA): held through the warm-up it boots into the developer
// menu, as pad 2's shoulder buttons do; without it the game starts at the language select, and a
// press there turns DebugMode on without leaving it. Skipped without the data.

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
    int                  status = -1;
    std::string          output;
    std::vector<uint8_t> png;
};

// Shares the real-data cases' save directory, so the pipeline cache is compiled once.
Run Boot(const char *name, const fs::path &data, const std::string &script, int frames) {
    fs::path build = fs::read_symlink("/proc/self/exe").parent_path();
    fs::path dir = build / "real_data" / name;
    fs::path save = build / "real_data" / "save";
    fs::remove_all(dir);
    fs::create_directories(dir);
    fs::create_directories(save);
    std::ofstream(dir / "input.txt") << script;
    fs::path    log = dir / "output.txt";
    fs::path    screenshot = dir / "frame.png";
    std::string command = "'" + (build / "darkcloud").string() + "' --headless --width 320 --height 240 --fast-load" +
                          " --frames " + std::to_string(frames) + " --screenshot '" + screenshot.string() +
                          "' --data '" + data.string() + "' --save '" + save.string() + "' --input '" +
                          (dir / "input.txt").string() + "' > '" + log.string() + "' 2>&1";
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

uint32_t BigEndian(const uint8_t *p) {
    return static_cast<uint32_t>(p[0]) << 24 | static_cast<uint32_t>(p[1]) << 16 | static_cast<uint32_t>(p[2]) << 8 | p[3];
}

// The mean RGB of gfx::WritePng's output (8-bit RGB, stored deflate blocks, filter 0).
bool MeanColor(const std::vector<uint8_t> &png, double mean[3]) {
    std::vector<uint8_t> zlib;
    uint32_t             width = 0;
    uint32_t             height = 0;
    for (size_t pos = 8; pos + 12 <= png.size();) {
        uint32_t       length = BigEndian(&png[pos]);
        const uint8_t *type = &png[pos + 4];
        if (std::equal(type, type + 4, "IHDR")) {
            width = BigEndian(type + 4);
            height = BigEndian(type + 8);
        } else if (std::equal(type, type + 4, "IDAT")) {
            zlib.insert(zlib.end(), type + 4, type + 4 + length);
        }
        pos += 12 + length;
    }
    std::vector<uint8_t> raw;
    for (size_t at = 2; at + 5 <= zlib.size();) {
        bool   last = zlib[at] & 1;
        size_t len = zlib[at + 1] | zlib[at + 2] << 8;
        raw.insert(raw.end(), zlib.begin() + static_cast<std::ptrdiff_t>(at + 5),
                   zlib.begin() + static_cast<std::ptrdiff_t>(at + 5 + len));
        at += 5 + len;
        if (last) {
            break;
        }
    }
    size_t row = static_cast<size_t>(width) * 3;
    if (width == 0 || raw.size() != (row + 1) * height) {
        return false;
    }
    double sum[3] = {};
    for (uint32_t y = 0; y < height; y++) {
        for (uint32_t x = 0; x < width; x++) {
            for (int c = 0; c < 3; c++) {
                sum[c] += raw[y * (row + 1) + 1 + x * 3 + c];
            }
        }
    }
    for (int c = 0; c < 3; c++) {
        mean[c] = sum[c] / (static_cast<double>(width) * height);
    }
    return true;
}

} // namespace

// MenuInit clears to (0, 0, 128): the developer menu is a blue screen with the debug font on it.
DC_TEST(integration_real_data_debug_key_at_boot_opens_the_developer_menu) {
    fs::path data = RealData();
    Run      run = Boot("debug_key_boot", data, "0 key:grave\n1\n", 5);
    DC_CHECK(run.status == kExitOk);
    DC_CHECK(run.output.find("debug mode on: the developer menu") != std::string::npos);
    double mean[3];
    DC_CHECK(MeanColor(run.png, mean));
    DC_CHECK(mean[2] > 100.0 && mean[0] < 30.0 && mean[1] < 30.0);
}

// Without the key: retail's start, the language select (dark, no blue field). A press there sets
// DebugMode, which only changes where later mode results lead, so the screen stays.
DC_TEST(integration_real_data_no_debug_key_reaches_the_language_select) {
    fs::path data = RealData();
    Run      run = Boot("debug_key_none", data, "0\n3 key:grave\n4\n", 6);
    DC_CHECK(run.status == kExitOk);
    DC_CHECK(run.output.find("the developer menu") == std::string::npos);
    DC_CHECK(run.output.find("debug mode on\n") != std::string::npos);
    double mean[3];
    DC_CHECK(MeanColor(run.png, mean));
    DC_CHECK(mean[2] < 60.0);
}
