#pragma once

#include <SDL3/SDL.h>

void RendererInit(SDL_Window *window);

void RendererShutdown();

void RendererResize();

bool RendererBeginFrame();

void RendererEndFrame();

void RendererSetClearColor(int r, int g, int b);
