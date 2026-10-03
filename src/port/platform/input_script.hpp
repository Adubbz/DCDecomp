#pragma once

#include <cstdint>
#include <filesystem>
#include <string>
#include <string_view>
#include <vector>

#include "input.hpp"

// Scripted input for pad 1, for headless runs. Each line is
//
//     <frame> [button ...] [lx ly rx ry]
//
// and holds those buttons (and sticks, centred when omitted) from that frame of the game's main
// loop until the next line's frame. `#` starts a comment. Before the first line the pad is held
// released.

struct InputScriptStep {
    std::int64_t  frame = 0;
    InputPadState state;
};

struct InputScript {
    std::vector<InputScriptStep> steps;
};

// Parses a script. On failure returns false and sets error to "line N: why".
bool InputScriptParse(std::string_view text, InputScript &script, std::string &error);

bool InputScriptLoad(const std::filesystem::path &path, InputScript &script, std::string &error);

// The state the script holds at frame.
InputPadState InputScriptStateAt(const InputScript &script, std::int64_t frame);

// Installs script as pad 1's override; InputScriptApply then moves it to a frame. An empty script
// uninstalls.
void InputScriptInstall(InputScript script);

void InputScriptApply(std::int64_t frame);

bool InputScriptActive();
