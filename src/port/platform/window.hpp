#pragma once

struct SDL_Window;
union SDL_Event;

struct WindowConfig {
    int  width = 1280;
    int  height = 960;
    bool headless = false;
    bool fullscreen = false;
    // False for a renderer without a surface (gfx::RendererConfig::offscreen): SDL then loads no
    // Vulkan library and asks for no surface extension.
    bool vulkan = true;
};

// Starts SDL's video subsystem and opens the window. Headless uses SDL's offscreen driver, which
// gives Vulkan a VK_EXT_headless_surface, and SDL's dummy audio driver, which consumes the mix at
// the device rate without a device.
void        WindowInit(const WindowConfig &config);
void        WindowShutdown();
SDL_Window *WindowHandle();
// Pumps events; false once the window is asked to close. A pixel-size change reaches the renderer.
bool WindowPollEvents();
// Sees every event WindowPollEvents pumps, before the window handles it.
void WindowAddEventHook(void (*hook)(const SDL_Event &event));
