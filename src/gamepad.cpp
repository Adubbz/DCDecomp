#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000
#pragma name_counter 179

#include "gamepad.hpp"

#include <cstdio>

#include "sce/libgraph.h"
#include "sce/libpad.h"

CGamePad GamePad;

unsigned char pad_dma_buf[1024] __attribute__((aligned(64)));
unsigned char pad_dma_buf2[1024] __attribute__((aligned(64)));

void CGamePad::Init()
{
    key_lock = 0;
    key_lock2 = 0;
    vibration_enabled = 1;
    while (sceGsSyncV(0) == 0) {
    }
    scePadInit(0);
    unk_130[1] = 0;
    unk_130[2] = 0;
    unk_130[3] = 0;
    unk_130[4] = 0;
    int i;
    for (i = 0; i < 2; i++) {
        pad[i].input.status.phase = 0;
        pad[i].input.status.button = 0;
        pad[i].input.status.right_y = 0;
        pad[i].input.status.right_x = 0;
        pad[i].input.status.left_y = 0;
        pad[i].input.status.left_x = 0;
        for (int j = 0; j < 6; j++) {
            pad[i].actuator.vibration[j] = 0;
            pad[i].actuator.vibration_timer[i] = 0;
        }
        axis_threshold[i] = 0;
        repeat[i].enabled = 0;
        repeat[i].active = 0;
        for (int j = 0; j < 32; j++) {
            repeat[i].counter[j] = 0;
            repeat[i].repeat_delay[j] = 0;
            repeat[i].initial_delay[j] = 0;
        }
    }
    if (!scePadPortOpen(0, 0, pad_dma_buf)) {
        printf("ERROR: scePadPortOpen\n");
        return;
    }
    sceGsSyncV(0);
    sceGsSyncV(0);
    sceGsSyncV(0);
    sceGsSyncV(0);
    if (!scePadPortOpen(1, 0, pad_dma_buf2)) {
        printf("ERROR: scePadPortOpen\n");
        return;
    }
    sceGsSyncV(0);
    sceGsSyncV(0);
    sceGsSyncV(0);
    sceGsSyncV(0);
}
#define PAD_STATIC_COUNTER_1(name) static const int name = 0;
#define PAD_STATIC_COUNTER_2(name) PAD_STATIC_COUNTER_1(name##0) PAD_STATIC_COUNTER_1(name##1)
#define PAD_STATIC_COUNTER_4(name) PAD_STATIC_COUNTER_2(name##0) PAD_STATIC_COUNTER_2(name##1)
#define PAD_STATIC_COUNTER_8(name) PAD_STATIC_COUNTER_4(name##0) PAD_STATIC_COUNTER_4(name##1)
#define PAD_STATIC_COUNTER_16(name) PAD_STATIC_COUNTER_8(name##0) PAD_STATIC_COUNTER_8(name##1)
#define PAD_STATIC_COUNTER_32(name) PAD_STATIC_COUNTER_16(name##0) PAD_STATIC_COUNTER_16(name##1)
#define PAD_STATIC_COUNTER_64(name) PAD_STATIC_COUNTER_32(name##0) PAD_STATIC_COUNTER_32(name##1)
#define PAD_STATIC_COUNTER_128(name) PAD_STATIC_COUNTER_64(name##0) PAD_STATIC_COUNTER_64(name##1)

int pad_button_read(PAD_STATUS *status, int port, int slot)
{
    PAD_STATIC_COUNTER_128(pad_static_128_)
    PAD_STATIC_COUNTER_16(pad_static_16_)
    PAD_STATIC_COUNTER_4(pad_static_4_)
    PAD_STATIC_COUNTER_1(pad_static_1_)
    static short rpad;
    static char init;
#line 76
    unsigned char data[32];

    if (!init) {
        rpad = 0;
        init = 1;
    }
    int mode = 0;
    if (!scePadRead(port, slot, data)) {
        return 0;
    }
    if (data[0] == 0) {
        int button = ((data[2] << 8) | data[3]) ^ 0xffff;
        status->button = button & 0xffff;
        status->right_x = data[4];
        status->right_y = data[5];
        status->left_x = data[6];
        status->left_y = data[7];
        rpad = button;
        mode = data[1] >> 4;
    }
    return mode;
}
int read_pad(PAD_STATUS *status, int port, int slot)
{
    volatile int *phase = &status->phase;
    int *state = &status->state;
    int *mode_count = &status->mode_count;
    int *read_result = &status->read_result;
    int *previous_read_result = &status->previous_read_result;

    *state = scePadGetState(port, slot);
    if (*state == 0) {
        *phase = 0;
    }

    int valid = 0;
    switch (*phase) {
    case 0:
        if (*state == 6 || *state == 2) {
            int mode = scePadInfoMode(port, slot, 1, 0);
            if (mode != 0) {
                *mode_count = scePadInfoMode(port, slot, 2, 0);
                if (*mode_count > 0) {
                    mode = *mode_count;
                }
                switch (mode) {
                case 2: *phase = 99; break;
                case 3: *phase = 99; break;
                case 4: *phase = 40; break;
                case 5: *phase = 99; break;
                case 6: *phase = 99; break;
                case 7: *phase = 70; break;
                case 0x100: *phase = 99; break;
                case 0x300: *phase = 99; break;
                default: *phase = 99; break;
                }
            }
        }
        break;
    case 40:
        if (scePadInfoMode(port, slot, 2, 0) == 0) {
            *phase = 99;
            break;
        }
        (*phase)++;
        // Fall through.
    case 41:
        if (scePadSetMainMode(port, slot, 1, 3) == 1) {
            (*phase)++;
        }
        break;
    case 42:
        if (scePadGetState(port, slot) != 5) {
            *phase = 0;
        }
        break;
    case 70:
        if (scePadInfoAct(port, slot, -1, 0) == 0) {
            *phase = 99;
        }
        status->actuator[0] = 0;
        status->actuator[1] = 1;
        for (int i = 2; i < 6; i++) {
            status->actuator[i] = 255;
        }
        if (scePadSetActAlign(port, slot, status->actuator)) {
            (*phase)++;
        }
        break;
    case 71:
        if (scePadGetState(port, slot) != 5) {
            *phase = 99;
        }
        break;
    default:
        if (*state == 6 || *state == 2) {
            int result = pad_button_read(status, port, slot);
            *read_result = result;
            if (result != 0) {
                if (*previous_read_result != 0 &&
                    *read_result != *previous_read_result) {
                    *previous_read_result = 0;
                    *phase = 0;
                } else {
                    valid = 1;
                }
                *previous_read_result = *read_result;
            }
        }
        break;
    }

    if (!valid) {
        status->button = 0;
        status->left_y = 128;
        status->left_x = 128;
        status->right_y = 128;
        status->right_x = 128;
    }
    if (*read_result == 4) {
        status->left_y = 128;
        status->left_x = 128;
        status->right_y = 128;
        status->right_x = 128;
    }
    return 0;
}
void CGamePad::UpDate()
{
    static int cnt;
    static char init;
    if (!init) {
        cnt = 0;
        init = 1;
    }

    int value;
    int copy_count;
    int *destination;
    int *source;
    source = &pad[0].input.status.button;
    destination = &previous_pad[0].input.status.button;
    copy_count = 19;
    do {
        value = *source;
        source++;
        copy_count--;
        *destination = value;
        destination++;
    } while (copy_count > 0);
    read_pad(&pad[0].input.status, 0, 0);

    source = &pad[1].input.status.button;
    destination = &previous_pad[1].input.status.button;
    copy_count = 19;
    do {
        value = *source;
        source++;
        copy_count--;
        *destination = value;
        destination++;
    } while (copy_count > 0);
    read_pad(&pad[1].input.status, 1, 0);

    int i;
    for (i = 0; i < 2; i++) {
        int threshold = axis_threshold[i];
        if (threshold < 0) {
            threshold = 0;
        }
        if (threshold > 0) {
            if (threshold < GetLX()) pad[i].input.status.button |= 0x2000;
            if (GetLX() < -threshold) pad[i].input.status.button |= 0x8000;
            if (threshold < GetLY()) pad[i].input.status.button |= 0x4000;
            if (GetLY() < -threshold) pad[i].input.status.button |= 0x1000;
        }
    }

    int bit = 1;
    PAD_REPEAT *repeat_state = &repeat[0];
    for (i = 0; i < 32; i++, bit <<= 1) {
        if (repeat_state->enabled & bit) {
            if ((pad[0].input.status.button & repeat_state->enabled) & bit) {
                repeat_state->counter[i]++;
                if (repeat_state->counter[i] >= repeat_state->initial_delay[i]) {
                    repeat_state->active |= bit;
                }
            } else {
                repeat_state->counter[i] = 0;
                repeat_state->active &= ~bit;
            }
            if (repeat_state->counter[i] >= repeat_state->repeat_delay[i] &&
                (repeat_state->active & bit)) {
                pad[0].input.status.button &= ~bit;
                repeat_state->counter[i] = 0;
            }
        }
    }

    for (i = 0; i < 2; i++) {
        if ((pad[i].input.status.button & 0x1000) && (pad[i].input.status.button & 0x4000)) {
            pad[i].input.status.button &= ~0x5000;
        }
        if ((pad[i].input.status.button & 0x2000) && (pad[i].input.status.button & 0x8000)) {
            pad[i].input.status.button &= ~0xa000;
        }
    }

    key_lock2 = 1;
    pad[1].input.status.button = 0;
    pad[1].input.status.right_x = 128;
    pad[1].input.status.right_y = 128;
    pad[1].input.status.left_x = 128;
    pad[1].input.status.left_y = 128;
    if (key_lock2) {
        pad[1].input.status.button = 0;
        pad[1].input.status.right_x = 128;
        pad[1].input.status.right_y = 128;
        pad[1].input.status.left_x = 128;
        pad[1].input.status.left_y = 128;
    }
    cnt = !((bool)cnt);
}

#undef PAD_STATIC_COUNTER_128
#undef PAD_STATIC_COUNTER_64
#undef PAD_STATIC_COUNTER_32
#undef PAD_STATIC_COUNTER_16
#undef PAD_STATIC_COUNTER_8
#undef PAD_STATIC_COUNTER_4
#undef PAD_STATIC_COUNTER_2
#undef PAD_STATIC_COUNTER_1

void CGamePad::Step()
{
    for (int i = 0; i < 2; i++) {
        if (!vibration_enabled) {
            pad[i].input.status.vibration[0] = 0;
            pad[i].input.status.vibration[1] = 0;
        }
        if (pad[i].input.status.vibration_timer[0] > 0) {
            pad[i].input.status.vibration_timer[0]--;
        } else {
            pad[i].input.status.vibration_timer[0] = 0;
            pad[i].input.status.vibration[0] = 0;
        }
        if (pad[i].input.status.vibration_timer[1] > 0) {
            pad[i].input.status.vibration_timer[1]--;
        } else {
            pad[i].input.status.vibration_timer[1] = 0;
            pad[i].input.status.vibration[1] = 0;
        }
    }
    scePadSetActDirect(0, 0, pad[0].input.status.vibration);
}
int AxisCalibration(int axis)
{
    int zero;
    int calibrated = axis - 128;
    zero = 0;
    if (calibrated < 50 && calibrated > -50) {
        calibrated = zero;
    } else if (calibrated > zero) {
        calibrated = ((calibrated - 49) << 7) / 78;
    } else {
        calibrated = ((calibrated + 50) << 7) / 78;
    }
    return calibrated;
}
int CGamePad::GetRX()
{
    return AxisCalibration(pad[0].input.status.right_x);
}

int CGamePad::GetRY()
{
    return AxisCalibration(pad[0].input.status.right_y);
}

int CGamePad::GetLX()
{
    return AxisCalibration(pad[0].input.status.left_x);
}

int CGamePad::GetLY()
{
    return AxisCalibration(pad[0].input.status.left_y);
}

int CGamePad::GetRX2()
{
    return AxisCalibration(pad[1].input.status.right_x);
}

int CGamePad::GetRY2()
{
    return AxisCalibration(pad[1].input.status.right_y);
}

int CGamePad::GetLX2()
{
    return AxisCalibration(pad[1].input.status.left_x);
}

int CGamePad::GetLY2()
{
    return AxisCalibration(pad[1].input.status.left_y);
}

int CGamePad::AllOn()
{
    return pad[1].input.status.button | pad[0].input.status.button | GetRX() | GetRY() |
           GetLX() | GetLY() | GetRX2() | GetRY2() | GetLX2() | GetLY2();
}

void CGamePad::CancelAutoRepeat(int mask)
{
    int i;
    int bit = 1;
    PAD_REPEAT *auto_repeat = &repeat[0];
    for (i = 0; i < 32; i++, bit <<= 1) {
        if (mask & bit) {
            auto_repeat->enabled &= ~bit;
            auto_repeat->active &= ~bit;
            auto_repeat->counter[i] = 0;
            auto_repeat->initial_delay[i] = 0;
            auto_repeat->repeat_delay[i] = 0;
        }
    }
}
void CGamePad::SetAutoRepeat(int mask, int initial_delay, int repeat_delay) {
    int i;
    int bit = 1;
    PAD_REPEAT *auto_repeat = &repeat[0];
    for (i = 0; i < 32; i++, bit <<= 1) {
        if (!(auto_repeat->enabled & bit) && (mask & bit)) {
            auto_repeat->enabled |= bit;
            auto_repeat->active &= ~bit;
            auto_repeat->counter[i] = 0;
            auto_repeat->initial_delay[i] = initial_delay;
            auto_repeat->repeat_delay[i] = repeat_delay;
        }
    }
}

void CGamePad::KeyLock(int mask) {
    key_lock = mask;
}

void CGamePad::KeyLock2(int mask) {
    key_lock2 = mask;
}

int CGamePad::GetPadOn() {
    if (key_lock) {
        return 0;
    }
    return pad[0].input.status.button;
}

int CGamePad::GetPadDown() {
    if (key_lock) {
        return 0;
    }
    return pad[0].input.status.button & ~previous_pad[0].input.status.button;
}

int CGamePad::GetPadUp() {
    if (key_lock) {
        return 0;
    }
    return ~pad[0].input.status.button & previous_pad[0].input.status.button;
}

float CGamePad::GetRXf() {
    return (float)GetRX() / 128.0f;
}

float CGamePad::GetRYf() {
    return (float)GetRY() / 128.0f;
}

float CGamePad::GetLXf() {
    return (float)GetLX() / 128.0f;
}

float CGamePad::GetLYf() {
    return (float)GetLY() / 128.0f;
}

float CGamePad::GetLXf2() {
    return (float)GetLX2() / 128.0f;
}

float CGamePad::GetLYf2() {
    return (float)GetLY2() / 128.0f;
}

int CGamePad::On(int mask) {
    if (key_lock) {
        return 0;
    }
    return (pad[0].input.status.button & mask) != 0;
}

int CGamePad::On2(int mask) {
    if (key_lock) {
        return 0;
    }
    return (pad[1].input.status.button & mask) != 0;
}

int CGamePad::Down(int mask) {
    if (key_lock) {
        return 0;
    }
    return (mask & (pad[0].input.status.button & ~previous_pad[0].input.status.button)) != 0;
}

int CGamePad::Down2(int mask) {
    if (key_lock) {
        return 0;
    }
    return (mask & (pad[1].input.status.button & ~previous_pad[1].input.status.button)) != 0;
}

void CGamePad::AutoRepeatOff() {
    CancelAutoRepeat(-1);
}

void CGamePad::MenuModeOn(int mask) {
    axis_threshold[0] = mask;
}

void CGamePad::MenuModeOff() {
    axis_threshold[0] = 0;
}

void CGamePad::SetVibration(int motor, int intensity, int duration) {
    if (!vibration_enabled) {
        return;
    }
    if (motor < 0 || motor >= 2 || duration < 0 || duration > 1200) {
        return;
    }

    pad[0].input.status.vibration_timer[motor] = duration;
    if (motor == 0) {
        intensity = intensity != 0;
    }
    pad[0].input.status.vibration[motor] = intensity;
}

void CGamePad::VibrationEnable(int enable) {
    vibration_enabled = enable;
}

void CGamePad::StopVibration() {
    SetVibration(0, 0, 0);
    SetVibration(1, 0, 0);
    Step();
}
