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

// options go on the command line; pipeline_cache, when named, seeds the run's save directory so a
// second run skips compiling the pipelines.
Run RunScripted(const char *name, const fs::path &data, const std::string &script, int frames,
                const std::string &options = "", const fs::path &pipeline_cache = {}) {
    fs::path dir = fs::temp_directory_path() / (std::string("dc_real_") + name);
    fs::remove_all(dir);
    fs::create_directories(dir / "save");
    std::error_code ignored;
    if (!pipeline_cache.empty()) {
        fs::copy_file(pipeline_cache, dir / "save" / "pipeline_cache.bin", ignored);
    }
    std::ofstream(dir / "input.txt") << script;
    fs::path    executable = fs::read_symlink("/proc/self/exe").parent_path() / "darkcloud";
    fs::path    log = dir / "output.txt";
    Run         run;
    run.screenshot = dir / (std::string(name) + ".png");
    std::string command = "'" + executable.string() + "' --headless " + options + " --frames " + std::to_string(frames) +
                          " --screenshot '" + run.screenshot.string() + "' --data '" + data.string() +
                          "' --save '" + (dir / "save").string() + "' --input '" +
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

// The title's background after the attract movie: clouds of textured spheres inside a sky dome,
// smeared upwards into smoke by the frame grab blended back at 112/128 every frame. Above the
// logo (logical rows 0-79) that is all there is. Broken, the dome's near half covered the clouds
// and the trail decayed with the grab's alpha: a flat navy at luma 5. Two runs one frame apart
// show the smoke moving without flicker.
DC_TEST(integration_real_data_title_smoke) {
    fs::path    data = RealData();
    std::string script = "0\n70 cross\n75\n90 cross\n95\n200 start\n205\n";
    Image       frames[2];
    fs::path    cache;
    for (int i = 0; i < 2; i++) {
        Run run = RunScripted(i == 0 ? "smoke_a" : "smoke_b", data, script, 600 + i, "--width 640 --height 480", cache);
        DC_CHECK(run.status == kExitOk);
        DC_CHECK(ReadScreenshot(run.screenshot, frames[i]));
        DC_CHECK(frames[i].width == 640 && frames[i].height == 480);
        cache = run.screenshot.parent_path() / "save" / "pipeline_cache.bin";
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
