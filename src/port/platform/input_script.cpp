#include "input_script.hpp"

#include <algorithm>
#include <cctype>
#include <charconv>
#include <fstream>
#include <iterator>
#include <sstream>

namespace {

struct ButtonName {
    std::string_view name;
    std::uint16_t    bit;
};

constexpr ButtonName kButtonNames[] = {
    {"cross", kInputCross},   {"circle", kInputCircle}, {"square", kInputSquare}, {"triangle", kInputTriangle},
    {"start", kInputStart},   {"select", kInputSelect}, {"l1", kInputL1},         {"r1", kInputR1},
    {"l2", kInputL2},         {"r2", kInputR2},         {"l3", kInputL3},         {"r3", kInputR3},
    {"up", kInputUp},         {"down", kInputDown},     {"left", kInputLeft},     {"right", kInputRight},
};

InputScript g_script;
bool        g_active = false;

InputPadState Released() {
    InputPadState state;
    state.connected = true;
    return state;
}

template <class T>
bool ParseNumber(std::string_view token, T &value) {
    auto [end, error] = std::from_chars(token.data(), token.data() + token.size(), value);
    return error == std::errc() && end == token.data() + token.size();
}

std::vector<std::string_view> Tokens(std::string_view line) {
    std::vector<std::string_view> tokens;
    std::size_t                   at = 0;
    while (at < line.size()) {
        while (at < line.size() && (line[at] == ' ' || line[at] == '\t' || line[at] == '\r')) {
            ++at;
        }
        std::size_t start = at;
        while (at < line.size() && line[at] != ' ' && line[at] != '\t' && line[at] != '\r') {
            ++at;
        }
        if (at > start) {
            tokens.push_back(line.substr(start, at - start));
        }
    }
    return tokens;
}

bool ParseLine(std::string_view line, InputScriptStep &step, std::string &why) {
    std::vector<std::string_view> tokens = Tokens(line);
    if (!ParseNumber(tokens[0], step.frame) || step.frame < 0) {
        why = "the frame is not a non-negative number";
        return false;
    }
    step.state = Released();
    std::size_t i = 1;
    for (; i < tokens.size(); ++i) {
        unsigned axis = 0;
        if (ParseNumber(tokens[i], axis)) {
            break;
        }
        std::string lower(tokens[i]);
        std::ranges::transform(lower, lower.begin(), [](unsigned char c) { return std::tolower(c); });
        auto found = std::ranges::find(kButtonNames, std::string_view(lower), &ButtonName::name);
        if (found == std::end(kButtonNames)) {
            why = "unknown button \"" + std::string(tokens[i]) + "\"";
            return false;
        }
        step.state.buttons |= found->bit;
    }
    if (i == tokens.size()) {
        return true;
    }
    if (tokens.size() - i != 4) {
        why = "the sticks take four numbers (lx ly rx ry)";
        return false;
    }
    std::uint8_t *axes[] = {&step.state.left_x, &step.state.left_y, &step.state.right_x, &step.state.right_y};
    for (int axis = 0; axis < 4; ++axis) {
        unsigned value = 0;
        if (!ParseNumber(tokens[i + axis], value) || value > 255) {
            why = "a stick value is not 0 to 255";
            return false;
        }
        *axes[axis] = static_cast<std::uint8_t>(value);
    }
    return true;
}

} // namespace

bool InputScriptParse(std::string_view text, InputScript &script, std::string &error) {
    script.steps.clear();
    int number = 0;
    while (!text.empty()) {
        std::size_t      end = text.find('\n');
        std::string_view line = text.substr(0, end);
        text = end == std::string_view::npos ? std::string_view() : text.substr(end + 1);
        ++number;
        line = line.substr(0, line.find('#'));
        if (Tokens(line).empty()) {
            continue;
        }
        InputScriptStep step;
        std::string     why;
        if (!ParseLine(line, step, why)) {
            error = "line " + std::to_string(number) + ": " + why;
            return false;
        }
        if (!script.steps.empty() && step.frame < script.steps.back().frame) {
            error = "line " + std::to_string(number) + ": frames must not decrease";
            return false;
        }
        script.steps.push_back(step);
    }
    return true;
}

bool InputScriptLoad(const std::filesystem::path &path, InputScript &script, std::string &error) {
    std::ifstream file(path);
    if (!file) {
        error = "cannot read " + path.string();
        return false;
    }
    std::stringstream text;
    text << file.rdbuf();
    if (!InputScriptParse(text.str(), script, error)) {
        error = path.string() + ": " + error;
        return false;
    }
    return true;
}

InputPadState InputScriptStateAt(const InputScript &script, std::int64_t frame) {
    auto after = std::ranges::upper_bound(script.steps, frame, {}, &InputScriptStep::frame);
    if (after == script.steps.begin()) {
        return Released();
    }
    return std::prev(after)->state;
}

void InputScriptInstall(InputScript script) {
    g_script = std::move(script);
    g_active = !g_script.steps.empty();
    if (g_active) {
        InputScriptApply(0);
    } else {
        InputSetOverride(0, nullptr);
    }
}

void InputScriptApply(std::int64_t frame) {
    if (!g_active) {
        return;
    }
    InputPadState state = InputScriptStateAt(g_script, frame);
    InputSetOverride(0, &state);
}

bool InputScriptActive() {
    return g_active;
}
