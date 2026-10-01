#pragma once

using AudioRenderFn = void (*)(void *user, float *out, int frames);

// Opens the default playback device as a float stereo stream at rate and pulls interleaved
// frames from render on SDL's audio thread. Returns false when there is no device, or when
// DC_AUDIO is "off"; the caller then simply has no output.
bool AudioOutputStart(int rate, AudioRenderFn render, void *user);

void AudioOutputStop();

bool AudioOutputRunning();
