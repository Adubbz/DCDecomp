#include <sys/wait.h>

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iterator>
#include <sstream>
#include <string>
#include <vector>

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
                const std::string &hooks, const std::string &size = "--width 320 --height 240") {
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
    std::string command = "'" + executable.string() + "' --headless " + size + " " + hooks + " --frames " + std::to_string(frames) +
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

struct Image {
    uint32_t             width = 0;
    uint32_t             height = 0;
    std::vector<uint8_t> rgb;

    float Luma(uint32_t x, uint32_t y) const {
        const uint8_t *p = &rgb[(static_cast<size_t>(y) * width + x) * 3];
        return 0.299f * p[0] + 0.587f * p[1] + 0.114f * p[2];
    }
};

uint32_t BigEndian(const uint8_t *p) {
    return static_cast<uint32_t>(p[0]) << 24 | static_cast<uint32_t>(p[1]) << 16 | static_cast<uint32_t>(p[2]) << 8 | p[3];
}

// gfx::WritePng's output only: 8-bit RGB, stored deflate blocks, filter 0 on every row.
bool ReadScreenshot(const fs::path &path, Image &image) {
    std::ifstream        file(path, std::ios::binary);
    std::vector<uint8_t> png((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    std::vector<uint8_t> zlib;
    for (size_t pos = 8; pos + 12 <= png.size();) {
        uint32_t       length = BigEndian(&png[pos]);
        const uint8_t *type = &png[pos + 4];
        if (std::equal(type, type + 4, "IHDR")) {
            image.width = BigEndian(type + 4);
            image.height = BigEndian(type + 8);
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
    size_t row = static_cast<size_t>(image.width) * 3;
    if (image.width == 0 || raw.size() != (row + 1) * image.height) {
        return false;
    }
    image.rgb.clear();
    for (uint32_t y = 0; y < image.height; y++) {
        const uint8_t *line = &raw[y * (row + 1) + 1];
        image.rgb.insert(image.rgb.end(), line, line + row);
    }
    return true;
}

// The developer menu's routes leave the save alone; the pipeline cache one leaves is the next's.
constexpr const char *kDeveloperMenu = "0 pad2 l1 r1 l2 r2\n1 pad2\n";

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

// The developer menu's second row: Norune (e01). Its parts are .pts definitions decoded into host
// records, and the town runs with the executable and its arenas above 4 GiB.
DC_TEST(integration_real_data_town_e01) {
    fs::path data = RealData();
    Run      run = RunScripted("town", data,
                               std::string(kDeveloperMenu) + "10 down\n12\n20 circle\n22\n100 0 128 128 128\n140\n",
                               200, "");
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
                               600, "");
    DC_CHECK(run.status == kExitOk);
    DC_CHECK(run.output.find("map build success!!") != std::string::npos);
    DC_CHECK(run.output.find("SND_INF= bgm5.txt") != std::string::npos);
    DC_CHECK(run.output.find("not implemented on PC") == std::string::npos);
    DC_CHECK(fs::file_size(run.screenshot) > 0);
}

// The title's background after the attract movie: clouds of textured spheres inside a sky dome,
// smeared upwards into smoke by the frame grab blended back at 112/128 every frame. Above the
// logo (logical rows 0-79) that is all there is. Broken, the dome's near half covered the clouds
// and the trail decayed with the grab's alpha: a flat navy at luma 5. Two runs one frame apart
// show the smoke moving without flicker.
DC_TEST(integration_real_data_title_smoke) {
    fs::path    data = RealData();
    Image       frames[2];
    for (int i = 0; i < 2; i++) {
        Run run = RunScripted(i == 0 ? "smoke_a" : "smoke_b", data, "0\n", 300 + i, "--jump title --fast-load",
                              "--width 640 --height 480");
        DC_CHECK(run.status == kExitOk);
        DC_CHECK(ReadScreenshot(run.screenshot, frames[i]));
        DC_CHECK(frames[i].width == 640 && frames[i].height == 480);
    }

    double sum = 0.0;
    double squares = 0.0;
    double change = 0.0;
    int    saturated = 0;
    int    count = 0;
    for (uint32_t y = 0; y < 80; y++) {
        for (uint32_t x = 0; x < 640; x++) {
            float luma = frames[0].Luma(x, y);
            sum += luma;
            squares += luma * luma;
            change += std::abs(luma - frames[1].Luma(x, y));
            saturated += luma > 250.0f;
            count++;
        }
    }
    double mean = sum / count;
    double deviation = std::sqrt(squares / count - mean * mean);
    change /= count;
    if (std::getenv("DC_SMOKE_VERBOSE") != nullptr) {
        std::fprintf(stderr, "smoke: mean %.1f deviation %.1f change %.2f saturated %d\n", mean, deviation, change,
                     saturated);
    }
    DC_CHECK(mean > 25.0 && mean < 120.0);
    DC_CHECK(deviation > 10.0);
    DC_CHECK(saturated < count / 100);
    DC_CHECK(change > 0.1 && change < 8.0);
}
