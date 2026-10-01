#include "window.hpp"

#include <SDL3/SDL.h>

#include <cstdio>
#include <cstdlib>

#include "renderer.hpp"

namespace {

constexpr int kWindowWidth = 1280;
constexpr int kWindowHeight = 960;

SDL_Window *g_window = nullptr;

[[noreturn]] void Fatal(const char *what) {
    std::fprintf(stderr, "%s: %s\n", what, SDL_GetError());
    std::exit(1);
}

} // namespace

void WindowInit() {
    SDL_SetAppMetadata("Dark Cloud", nullptr, "dcdecomp.darkcloud");
    if (!SDL_Init(SDL_INIT_VIDEO)) {
        Fatal("SDL_Init");
    }

    g_window = SDL_CreateWindow("Dark Cloud", kWindowWidth, kWindowHeight, SDL_WINDOW_VULKAN | SDL_WINDOW_RESIZABLE | SDL_WINDOW_HIGH_PIXEL_DENSITY);
    if (g_window == nullptr) {
        Fatal("SDL_CreateWindow");
    }

    RendererInit(g_window);
}

void WindowShutdown() {
    RendererShutdown();
    SDL_DestroyWindow(g_window);
    g_window = nullptr;
    SDL_Quit();
}

bool WindowPollEvents() {
    bool      running = true;
    SDL_Event event;
    while (SDL_PollEvent(&event)) {
        switch (event.type) {
            case SDL_EVENT_QUIT:
            case SDL_EVENT_WINDOW_CLOSE_REQUESTED:
                running = false;
                break;
            case SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED:
                RendererResize();
                break;
            default:
                break;
        }
    }
    return running;
}
