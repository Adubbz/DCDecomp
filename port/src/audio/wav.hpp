#pragma once

#include <cstdint>
#include <cstdio>

namespace audio {

// 16-bit stereo PCM WAV, written as it comes. The header is rewritten after every append, so a
// process that ends without closing still leaves a valid file.
class WavWriter {
public:
    WavWriter() = default;
    WavWriter(const WavWriter &) = delete;
    WavWriter &operator=(const WavWriter &) = delete;

    ~WavWriter() { Close(); }

    bool Open(const char *path, int rate);

    bool IsOpen() const { return file_ != nullptr; }

    // Interleaved float stereo, clamped to [-1, 1].
    void Append(const float *frames, int count);

    void Close();

private:
    void WriteHeader();

    std::FILE    *file_ = nullptr;
    int           rate_ = 0;
    std::uint32_t frames_ = 0;
};

} // namespace audio
