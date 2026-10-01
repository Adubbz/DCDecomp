#include "audio.hpp"

#include <SDL3/SDL.h>

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>

namespace {

constexpr int kChunkFrames = 1024;

SDL_AudioStream   *g_stream = nullptr;
AudioRenderFn      g_render = nullptr;
void              *g_user = nullptr;
std::vector<float> g_chunk;

void SDLCALL Feed(void *, SDL_AudioStream *stream, int additional_amount, int) {
    int frames = additional_amount / static_cast<int>(sizeof(float) * 2);
    while (frames > 0) {
        const int count = std::min(frames, kChunkFrames);
        g_render(g_user, g_chunk.data(), count);
        SDL_PutAudioStreamData(stream, g_chunk.data(), count * static_cast<int>(sizeof(float) * 2));
        frames -= count;
    }
}

} // namespace

bool AudioOutputStart(int rate, AudioRenderFn render, void *user) {
    if (g_stream != nullptr) {
        return true;
    }
    if (const char *setting = std::getenv("DC_AUDIO"); setting != nullptr && std::strcmp(setting, "off") == 0) {
        return false;
    }
    if (!SDL_InitSubSystem(SDL_INIT_AUDIO)) {
        std::fprintf(stderr, "audio: no audio subsystem: %s\n", SDL_GetError());
        return false;
    }
    g_render = render;
    g_user = user;
    g_chunk.assign(kChunkFrames * 2, 0.0f);
    const SDL_AudioSpec spec{SDL_AUDIO_F32, 2, rate};
    g_stream = SDL_OpenAudioDeviceStream(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, &spec, Feed, nullptr);
    if (g_stream == nullptr) {
        std::fprintf(stderr, "audio: no playback device: %s\n", SDL_GetError());
        SDL_QuitSubSystem(SDL_INIT_AUDIO);
        return false;
    }
    SDL_ResumeAudioStreamDevice(g_stream);
    return true;
}

void AudioOutputStop() {
    if (g_stream == nullptr) {
        return;
    }
    SDL_DestroyAudioStream(g_stream);
    g_stream = nullptr;
    SDL_QuitSubSystem(SDL_INIT_AUDIO);
}

bool AudioOutputRunning() {
    return g_stream != nullptr;
}
