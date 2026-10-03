#include "audio.hpp"

#include <SDL3/SDL.h>

#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>

#include "audio/wav.hpp"
#include "clock.hpp"

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

// DC_AUDIO_WAV=<path>: the mixer is pulled on the game thread as the clock ticks, so N ticks write
// N / tick rate seconds whatever the run's real speed; a headless run records exactly what it
// would have played.
struct WavCapture {
    audio::WavWriter writer;
    int              rate = 0;
    std::int64_t     last_tick = 0;
    double           owed = 0.0;
};

WavCapture g_wav;

void CaptureTicks() {
    const std::int64_t tick = ClockTickCount();
    if (tick > g_wav.last_tick) {
        g_wav.owed += static_cast<double>(tick - g_wav.last_tick) * g_wav.rate / ClockTickRate();
    }
    g_wav.last_tick = tick;
    auto frames = static_cast<int>(g_wav.owed);
    g_wav.owed -= frames;
    while (frames > 0) {
        const int count = std::min(frames, kChunkFrames);
        g_render(g_user, g_chunk.data(), count);
        g_wav.writer.Append(g_chunk.data(), count);
        frames -= count;
    }
}

bool StartCapture(const char *path, int rate) {
    if (!g_wav.writer.Open(path, rate)) {
        std::fprintf(stderr, "audio: cannot write %s\n", path);
        return false;
    }
    g_wav.rate = rate;
    g_wav.last_tick = ClockTickCount();
    g_wav.owed = 0.0;
    ClockAddPumpHook(CaptureTicks);
    return true;
}

} // namespace

bool AudioOutputStart(int rate, AudioRenderFn render, void *user) {
    if (AudioOutputRunning()) {
        return true;
    }
    g_render = render;
    g_user = user;
    g_chunk.assign(kChunkFrames * 2, 0.0f);
    if (const char *path = std::getenv("DC_AUDIO_WAV"); path != nullptr && *path != '\0') {
        return StartCapture(path, rate);
    }
    if (const char *setting = std::getenv("DC_AUDIO"); setting != nullptr && std::strcmp(setting, "off") == 0) {
        return false;
    }
    if (!SDL_InitSubSystem(SDL_INIT_AUDIO)) {
        std::fprintf(stderr, "audio: no audio subsystem: %s\n", SDL_GetError());
        return false;
    }
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
    if (g_wav.writer.IsOpen()) {
        ClockRemovePumpHook(CaptureTicks);
        g_wav.writer.Close();
    }
    if (g_stream == nullptr) {
        return;
    }
    SDL_DestroyAudioStream(g_stream);
    g_stream = nullptr;
    SDL_QuitSubSystem(SDL_INIT_AUDIO);
}

bool AudioOutputRunning() {
    return g_stream != nullptr || g_wav.writer.IsOpen();
}
