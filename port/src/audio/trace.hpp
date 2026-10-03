#pragma once

namespace audio {

// DC_AUDIO_TRACE=1: one line on stderr for every driver call and every sequence event, so a run
// can be compared with what the game asked for.
bool TraceEnabled();

[[gnu::format(printf, 1, 2)]] void Trace(const char *format, ...);

} // namespace audio
