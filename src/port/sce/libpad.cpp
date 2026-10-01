#include <libpad.h>

#include <array>
#include <cstring>

#include "../platform/input.hpp"

namespace {

// Controller ID byte of a DualShock 2 in analog mode: terminal type 7 in the
// high nibble (what pad_button_read keeps as the mode), the payload length in
// halfwords in the low one.
constexpr unsigned char kDualShockId = 0x73;
constexpr int           kTerminalId = kDualShockId >> 4;
constexpr int           kReadLength = 2 + (kDualShockId & 0x0F) * 2;
constexpr int           kActuatorCount = 2;
constexpr int           kReadBufferSize = 32;

std::array<bool, kInputPadCount> g_open;

bool Ready(int port) {
    return port >= 0 && port < kInputPadCount && g_open[port] && InputGetPad(port).connected;
}

} // namespace

int scePadInit(int mode) {
    g_open = {};
    return 1;
}

int scePadPortOpen(int port, int slot, void *buffer) {
    if (port < 0 || port >= kInputPadCount) {
        return 0;
    }
    g_open[port] = true;
    return 1;
}

int scePadRead(int port, int slot, unsigned char *data) {
    if (!Ready(port)) {
        return 0;
    }
    const InputPadState &pad = InputGetPad(port);
    std::uint16_t        active = static_cast<std::uint16_t>(~pad.buttons);
    std::memset(data, 0, kReadBufferSize);
    data[0] = 0;
    data[1] = kDualShockId;
    data[2] = static_cast<unsigned char>(active >> 8);
    data[3] = static_cast<unsigned char>(active);
    data[4] = pad.right_x;
    data[5] = pad.right_y;
    data[6] = pad.left_x;
    data[7] = pad.left_y;
    return kReadLength;
}

int scePadGetState(int port, int slot) {
    return Ready(port) ? scePadStateStable : scePadStateDiscon;
}

int scePadInfoMode(int port, int slot, int info, int index) {
    if (!Ready(port)) {
        return 0;
    }
    return info == InfoModeCurID ? kTerminalId : 0;
}

int scePadSetMainMode(int port, int slot, int mode, int lock) {
    return Ready(port) ? 1 : 0;
}

int scePadInfoAct(int port, int slot, int actuator, int command) {
    if (!Ready(port)) {
        return 0;
    }
    if (actuator < 0) {
        return kActuatorCount;
    }
    return actuator < kActuatorCount ? 1 : 0;
}

int scePadSetActAlign(int port, int slot, unsigned char *alignment) {
    return Ready(port) ? 1 : 0;
}

int scePadSetActDirect(int port, int slot, unsigned char *values) {
    if (port < 0 || port >= kInputPadCount || !g_open[port]) {
        return 0;
    }
    InputSetRumble(port, {values[0] != 0, values[1]});
    return 1;
}
