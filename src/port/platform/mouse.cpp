#include "mouse.hpp"

#include <SDL3/SDL.h>

#include <algorithm>
#include <vector>

#include "window.hpp"

namespace {

bool             g_capture_enabled = true;
std::vector<int> g_release_keys = {SDL_SCANCODE_ESCAPE};
bool             g_captured = false;
std::uint32_t    g_buttons = 0;
// The click that recaptures is swallowed, and so is its release.
std::uint32_t g_swallowed = 0;
float         g_dx = 0.0f;
float         g_dy = 0.0f;

void SetCaptured(bool captured) {
    g_captured = captured;
    if (SDL_Window *window = WindowHandle()) {
        SDL_SetWindowRelativeMouseMode(window, captured);
    }
}

bool Live() { return g_captured || !g_capture_enabled; }

bool Fullscreen() {
    SDL_Window *window = WindowHandle();
    return window != nullptr && (SDL_GetWindowFlags(window) & SDL_WINDOW_FULLSCREEN) != 0;
}

// Mouse1 to Mouse5 as games name them: SDL numbers the middle button 2 and the right one 3.
std::uint32_t ButtonBit(Uint8 button) {
    switch (button) {
        case SDL_BUTTON_LEFT:
            return 1u << 0;
        case SDL_BUTTON_RIGHT:
            return 1u << 1;
        case SDL_BUTTON_MIDDLE:
            return 1u << 2;
        case SDL_BUTTON_X1:
            return 1u << 3;
        case SDL_BUTTON_X2:
            return 1u << 4;
        default:
            return 0;
    }
}

} // namespace

void MouseConfigure(bool capture, std::span<const int> release_scancodes) {
    g_capture_enabled = capture;
    g_release_keys.assign(release_scancodes.begin(), release_scancodes.end());
    if (!capture && g_captured) {
        SetCaptured(false);
    }
}

void MouseStart() {
    SDL_Window *window = WindowHandle();
    if (g_capture_enabled && window != nullptr &&
        (SDL_GetWindowFlags(window) & SDL_WINDOW_INPUT_FOCUS) != 0) {
        SetCaptured(true);
    }
}

void MouseStop() {
    if (g_captured) {
        SetCaptured(false);
    }
    g_buttons = 0;
    g_swallowed = 0;
    g_dx = 0.0f;
    g_dy = 0.0f;
}

bool MouseHandleEvent(const SDL_Event &event) {
    switch (event.type) {
        case SDL_EVENT_WINDOW_FOCUS_LOST:
            if (g_captured) {
                SetCaptured(false);
            }
            g_buttons = 0;
            g_dx = 0.0f;
            g_dy = 0.0f;
            return false;
        case SDL_EVENT_MOUSE_MOTION:
            if (Live()) {
                g_dx += event.motion.xrel;
                g_dy += event.motion.yrel;
            }
            return false;
        case SDL_EVENT_MOUSE_BUTTON_DOWN:
            if (!Live()) {
                SetCaptured(true);
                g_swallowed |= ButtonBit(event.button.button);
                return true;
            }
            g_buttons |= ButtonBit(event.button.button);
            return false;
        case SDL_EVENT_MOUSE_BUTTON_UP: {
            std::uint32_t bit = ButtonBit(event.button.button);
            g_buttons &= ~bit;
            bool swallowed = (g_swallowed & bit) != 0;
            g_swallowed &= ~bit;
            return swallowed;
        }
        case SDL_EVENT_KEY_DOWN:
            if (g_captured && !event.key.repeat && !Fullscreen() &&
                std::ranges::contains(g_release_keys, static_cast<int>(event.key.scancode))) {
                SetCaptured(false);
                g_buttons = 0;
                g_dx = 0.0f;
                g_dy = 0.0f;
                return true;
            }
            return false;
        default:
            return false;
    }
}

bool MouseCaptured() { return g_captured; }

std::uint32_t MouseButtons() { return g_buttons; }

void MouseTakeMotion(float &dx, float &dy) {
    dx = g_dx;
    dy = g_dy;
    g_dx = 0.0f;
    g_dy = 0.0f;
}
