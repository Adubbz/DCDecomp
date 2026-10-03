#include "wav.hpp"

#include <algorithm>
#include <cmath>
#include <cstring>

namespace audio {

namespace {

void PutU32(std::uint8_t *at, std::uint32_t value) {
    for (int i = 0; i < 4; i++) {
        at[i] = static_cast<std::uint8_t>(value >> (8 * i));
    }
}

} // namespace

bool WavWriter::Open(const char *path, int rate) {
    Close();
    file_ = std::fopen(path, "wb");
    if (file_ == nullptr) {
        return false;
    }
    rate_ = rate;
    frames_ = 0;
    WriteHeader();
    return true;
}

void WavWriter::Append(const float *frames, int count) {
    if (file_ == nullptr || count <= 0) {
        return;
    }
    std::int16_t pcm[512];
    for (int done = 0; done < count * 2;) {
        const int n = std::min(count * 2 - done, 512);
        for (int i = 0; i < n; i++) {
            pcm[i] =
                static_cast<std::int16_t>(std::lround(std::clamp(frames[done + i], -1.0f, 1.0f) * 32767.0f));
        }
        std::fwrite(pcm, sizeof(std::int16_t), n, file_);
        done += n;
    }
    frames_ += count;
    WriteHeader();
    std::fflush(file_);
}

void WavWriter::Close() {
    if (file_ == nullptr) {
        return;
    }
    WriteHeader();
    std::fclose(file_);
    file_ = nullptr;
}

void WavWriter::WriteHeader() {
    std::uint8_t        header[44] = {};
    const std::uint32_t data = frames_ * 4;
    std::memcpy(header, "RIFF", 4);
    PutU32(header + 4, 36 + data);
    std::memcpy(header + 8, "WAVEfmt ", 8);
    PutU32(header + 16, 16);
    header[20] = 1;
    header[22] = 2;
    PutU32(header + 24, static_cast<std::uint32_t>(rate_));
    PutU32(header + 28, static_cast<std::uint32_t>(rate_) * 4);
    header[32] = 4;
    header[34] = 16;
    std::memcpy(header + 36, "data", 4);
    PutU32(header + 40, data);
    std::fseek(file_, 0, SEEK_SET);
    std::fwrite(header, 1, sizeof(header), file_);
    std::fseek(file_, 0, SEEK_END);
}

} // namespace audio
