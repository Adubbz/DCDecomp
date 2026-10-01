#pragma once

struct SDL_Window;

void RendererInit(SDL_Window *window);

void RendererShutdown();

void RendererResize();

bool RendererBeginFrame();

void RendererEndFrame();

void RendererSetClearColor(int r, int g, int b);
