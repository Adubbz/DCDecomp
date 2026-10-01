#include "config.hpp"

#include <algorithm>
#include <cctype>
#include <charconv>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <sstream>

namespace {

Config g_config;

std::string_view Trim(std::string_view text) {
    constexpr std::string_view kSpace = " \t\r\n";
    std::size_t                first  = text.find_first_not_of(kSpace);
    if (first == std::string_view::npos) {
        return {};
    }
    return text.substr(first, text.find_last_not_of(kSpace) - first + 1);
}

std::string Lower(std::string_view text) {
    std::string lower(text);
    std::ranges::transform(lower, lower.begin(), [](unsigned char c) { return static_cast<char>(std::tolower(c)); });
    return lower;
}

template <class T>
bool ParseNumber(std::string_view text, T &out) {
    T value{};
    auto [end, error] = std::from_chars(text.data(), text.data() + text.size(), value);
    if (error != std::errc{} || end != text.data() + text.size()) {
        return false;
    }
    out = value;
    return true;
}

bool ParseBool(std::string_view text, bool &out) {
    std::string value = Lower(text);
    if (value == "1" || value == "true" || value == "on" || value == "yes") {
        out = true;
        return true;
    }
    if (value == "0" || value == "false" || value == "off" || value == "no") {
        out = false;
        return true;
    }
    return false;
}

bool ParsePresentMode(std::string_view text, ConfigPresentMode &out) {
    std::string value = Lower(text);
    if (value == "fifo") {
        out = ConfigPresentMode::Fifo;
    } else if (value == "mailbox") {
        out = ConfigPresentMode::Mailbox;
    } else if (value == "immediate") {
        out = ConfigPresentMode::Immediate;
    } else {
        return false;
    }
    return true;
}

std::vector<std::string> SplitList(std::string_view text) {
    std::vector<std::string> items;
    while (!text.empty()) {
        std::size_t      comma = text.find(',');
        std::string_view item  = Trim(text.substr(0, comma));
        if (!item.empty()) {
            items.emplace_back(item);
        }
        if (comma == std::string_view::npos) {
            break;
        }
        text.remove_prefix(comma + 1);
    }
    return items;
}

bool Apply(Config &config, std::string_view section, std::string_view key, std::string_view value) {
    std::string name = Lower(section) + "." + Lower(key);
    if (Lower(section) == "input") {
        config.key_bindings.push_back({Lower(key), SplitList(value)});
        return true;
    }
    if (name == "game.tick_rate") {
        double rate = 0.0;
        if (!ParseNumber(value, rate) || !(rate > 0.0) || !std::isfinite(rate)) {
            return false;
        }
        config.tick_rate = rate;
        return true;
    }
    if (name == "video.present_mode") {
        return ParsePresentMode(value, config.present_mode);
    }
    if (name == "video.vsync") {
        bool vsync = true;
        if (!ParseBool(value, vsync)) {
            return false;
        }
        config.present_mode = vsync ? ConfigPresentMode::Fifo : ConfigPresentMode::Immediate;
        return true;
    }
    if (name == "video.width" || name == "video.height") {
        int size = 0;
        if (!ParseNumber(value, size) || size <= 0) {
            return false;
        }
        (name == "video.width" ? config.window_width : config.window_height) = size;
        return true;
    }
    if (name == "video.fullscreen") {
        return ParseBool(value, config.fullscreen);
    }
    if (name == "audio.master_volume") {
        float volume = 0.0f;
        if (!ParseNumber(value, volume) || !std::isfinite(volume)) {
            return false;
        }
        config.master_volume = std::clamp(volume, 0.0f, 1.0f);
        return true;
    }
    return false;
}

} // namespace

std::filesystem::path SaveRootPath() {
    const char *root = std::getenv("DC_SAVE");
    if (root != nullptr && root[0] != '\0') {
        return root;
    }
    return "save";
}

const Config &ConfigGet() {
    return g_config;
}

Config ConfigParse(std::string_view text) {
    Config      config;
    std::string section;
    int         line_no = 0;
    while (!text.empty()) {
        std::size_t      end  = text.find('\n');
        std::string_view line = Trim(text.substr(0, end));
        text.remove_prefix(end == std::string_view::npos ? text.size() : end + 1);
        ++line_no;
        if (line.empty() || line[0] == ';' || line[0] == '#') {
            continue;
        }
        if (line.front() == '[' && line.back() == ']') {
            section = Trim(line.substr(1, line.size() - 2));
            continue;
        }
        std::size_t equals = line.find('=');
        if (equals == std::string_view::npos) {
            std::fprintf(stderr, "config.ini:%d: expected key = value\n", line_no);
            continue;
        }
        std::string_view key   = Trim(line.substr(0, equals));
        std::string_view value = Trim(line.substr(equals + 1));
        if (!Apply(config, section, key, value)) {
            std::fprintf(stderr, "config.ini:%d: ignoring [%s] %.*s = %.*s\n", line_no, section.c_str(),
                         static_cast<int>(key.size()), key.data(), static_cast<int>(value.size()), value.data());
        }
    }
    return config;
}

bool ConfigLoad() {
    std::ifstream file(SaveRootPath() / "config.ini", std::ios::binary);
    if (!file) {
        g_config = Config{};
        return false;
    }
    std::ostringstream text;
    text << file.rdbuf();
    g_config = ConfigParse(text.str());
    return true;
}
