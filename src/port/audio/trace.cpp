#include "trace.hpp"

#include <cstdarg>
#include <cstdio>
#include <cstdlib>

namespace audio {

bool TraceEnabled() {
    static const bool enabled = [] {
        const char *setting = std::getenv("DC_AUDIO_TRACE");
        return setting != nullptr && *setting != '\0' && *setting != '0';
    }();
    return enabled;
}

void Trace(const char *format, ...) {
    if (!TraceEnabled()) {
        return;
    }
    char    line[256];
    va_list args;
    va_start(args, format);
    std::vsnprintf(line, sizeof(line), format, args);
    va_end(args);
    std::fprintf(stderr, "audio: %s\n", line);
}

} // namespace audio
