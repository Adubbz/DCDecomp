#pragma once

#include <filesystem>
#include <string>
#include <string_view>
#include <vector>

enum class ConfigPresentMode {
    Fifo,
    Mailbox,
    Immediate,
};

struct ConfigKeyBinding {
    std::string              action;
    std::vector<std::string> keys;
};

struct Config {
    double                        tick_rate     = 50.0;
    ConfigPresentMode             present_mode  = ConfigPresentMode::Fifo;
    int                           window_width  = 1280;
    int                           window_height = 960;
    bool                          fullscreen    = false;
    float                         master_volume = 1.0f;
    std::vector<ConfigKeyBinding> key_bindings;
};

// The directory saves, the memory cards and config.ini live in: DC_SAVE if
// set, otherwise save/ under the working directory.
std::filesystem::path SaveRootPath();

const Config &ConfigGet();

// Parses an ini text over the defaults. Unknown keys and bad values are
// reported on stderr and leave the default in place.
Config ConfigParse(std::string_view text);

// Loads <save root>/config.ini if it exists, otherwise keeps the defaults.
// Returns whether a file was read.
bool ConfigLoad();
