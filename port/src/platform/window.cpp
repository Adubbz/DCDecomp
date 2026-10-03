#include "window.hpp"

#include <SDL3/SDL.h>

#include <cstdio>
#include <cstdlib>
#include <vector>

#include "gfx/gfx.hpp"

namespace {

SDL_Window                              *g_window = nullptr;
std::vector<void (*)(const SDL_Event &)> g_hooks;

[[noreturn]] void Fatal(const char *what) {
    std::fprintf(stderr, "%s: %s\n", what, SDL_GetError());
    std::exit(1);
}

} // namespace

void WindowInit(const WindowConfig &config) {
    SDL_SetAppMetadata("Dark Cloud", nullptr, "dcdecomp.darkcloud");
    if (config.headless) {
        SDL_SetHint(SDL_HINT_VIDEO_DRIVER, "offscreen");
        SDL_SetHint(SDL_HINT_AUDIO_DRIVER, "dummy");
    }
    if (!SDL_Init(SDL_INIT_VIDEO)) {
        Fatal("SDL_Init");
    }
    // SDL3 backs a Vulkan window on macOS with a CAMetalLayer (VK_EXT_metal_surface) by itself.
    SDL_WindowFlags flags = SDL_WINDOW_RESIZABLE | SDL_WINDOW_HIGH_PIXEL_DENSITY;
    if (config.vulkan) {
        flags |= SDL_WINDOW_VULKAN;
    }
    if (config.fullscreen && !config.headless) {
        flags |= SDL_WINDOW_FULLSCREEN;
    }
    g_window = SDL_CreateWindow("Dark Cloud", config.width, config.height, flags);
    if (g_window == nullptr) {
        Fatal("SDL_CreateWindow");
    }
}

void WindowShutdown() {
    SDL_DestroyWindow(g_window);
    g_window = nullptr;
    g_hooks.clear();
    SDL_Quit();
}

SDL_Window *WindowHandle() { return g_window; }

bool WindowPollEvents() {
    bool      running = true;
    SDL_Event event;
    while (SDL_PollEvent(&event)) {
        for (auto hook : g_hooks) {
            hook(event);
        }
        switch (event.type) {
            case SDL_EVENT_QUIT:
            case SDL_EVENT_WINDOW_CLOSE_REQUESTED:
                running = false;
                break;
            case SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED:
                gfx::RendererResize();
                break;
            default:
                break;
        }
    }
    return running;
}

void WindowAddEventHook(void (*hook)(const SDL_Event &event)) { g_hooks.push_back(hook); }
