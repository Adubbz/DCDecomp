#pragma once

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <numbers>
#include <span>
#include <vector>

#include "../audio/hdbank.hpp"
#include "../audio/vag.hpp"

namespace audio_fixture {

class Writer {
public:
    std::vector<std::uint8_t> bytes;

    std::size_t Size() const { return bytes.size(); }

    void U8(int v) { bytes.push_back(static_cast<std::uint8_t>(v)); }

    void U16(int v) {
        U8(v & 0xFF);
        U8((v >> 8) & 0xFF);
    }

    void U32(std::uint32_t v) {
        U16(v & 0xFFFF);
        U16(v >> 16);
    }

    void Patch32(std::size_t at, std::uint32_t v) {
        for (int i = 0; i < 4; i++) {
            bytes[at + i] = static_cast<std::uint8_t>(v >> (i * 8));
        }
    }

    void Pad(std::size_t alignment) {
        while (bytes.size() % alignment) {
            U8(0);
        }
    }

    std::size_t Chunk(std::uint32_t type) {
        const std::size_t at = Size();
        U32(audio::kChunkCreator);
        U32(type);
        U32(0);
        return at;
    }

    void EndChunk(std::size_t at) { Patch32(at + 8, static_cast<std::uint32_t>(Size() - at)); }

    void Append(std::span<const std::uint8_t> data) { bytes.insert(bytes.end(), data.begin(), data.end()); }
};

// A reference SPU ADPCM encoder: per block, the filter and shift with the least error.
inline std::vector<std::uint8_t> EncodeVag(std::span<const std::int16_t> pcm, bool loop) {
    std::vector<std::uint8_t> out;
    const std::size_t         blocks = (pcm.size() + 27) / 28;
    int                       hist[2] = {0, 0};
    for (std::size_t b = 0; b < blocks; b++) {
        std::int16_t source[28] = {};
        for (int i = 0; i < 28 && b * 28 + i < pcm.size(); i++) {
            source[i] = pcm[b * 28 + i];
        }
        long long    best_error = -1;
        std::uint8_t best[16] = {};
        int          best_hist[2] = {0, 0};
        for (int filter = 0; filter < 5; filter++) {
            for (int shift = 0; shift <= 12; shift++) {
                std::uint8_t block[16] = {};
                block[0] = static_cast<std::uint8_t>((filter << 4) | shift);
                int       h[2] = {hist[0], hist[1]};
                long long error = 0;
                for (int i = 0; i < 28; i++) {
                    const int predicted = (h[0] * audio::kVagFilter[filter][0] + h[1] * audio::kVagFilter[filter][1] + 32) >> 6;
                    const int scale = 1 << (12 - shift);
                    int       nibble = static_cast<int>(std::lround(double(source[i] - predicted) / scale));
                    nibble = std::clamp(nibble, -8, 7);
                    int decoded = (static_cast<std::int16_t>((nibble & 0xF) << 12) >> shift) + predicted;
                    decoded = std::clamp(decoded, -32768, 32767);
                    error += (long long) (decoded - source[i]) * (decoded - source[i]);
                    h[1] = h[0];
                    h[0] = decoded;
                    block[2 + i / 2] |= static_cast<std::uint8_t>((nibble & 0xF) << ((i & 1) * 4));
                }
                if (best_error < 0 || error < best_error) {
                    best_error = error;
                    std::copy(block, block + 16, best);
                    best_hist[0] = h[0];
                    best_hist[1] = h[1];
                }
            }
        }
        hist[0] = best_hist[0];
        hist[1] = best_hist[1];
        if (loop) {
            best[1] = audio::kVagLoopRepeat;
            if (b == 0) {
                best[1] |= audio::kVagLoopStart;
            }
        }
        if (b + 1 == blocks) {
            best[1] |= audio::kVagLoopEnd;
        }
        out.insert(out.end(), best, best + 16);
    }
    return out;
}

inline std::vector<std::int16_t> Sine(double frequency, int rate, int samples, double amplitude) {
    std::vector<std::int16_t> pcm(samples);
    for (int i = 0; i < samples; i++) {
        pcm[i] = static_cast<std::int16_t>(std::lround(amplitude * 32767.0 * std::sin(2.0 * std::numbers::pi * frequency * i / rate)));
    }
    return pcm;
}

struct SampleSpec {
    int           base_note = 60;
    int           volume = 127;
    int           pan = 64;
    std::uint16_t adsr1 = 0x00FF;
    std::uint16_t adsr2 = 0x1FCA;
    int           rate = 44100;
    int           key_low = 0;
    int           key_high = 127;
};

struct Bank {
    std::vector<std::uint8_t> hd;
    std::vector<std::uint8_t> bd;
};

// One program, one full-range split, one sample set, one sample: a looping 441 Hz sine at
// 44.1 kHz that sounds at 441 Hz on note 60. Programs below program_index are left unused.
inline Bank BuildBank(int program_index = 0, SampleSpec spec = {}) {
    Bank bank;
    bank.bd.assign(16, 0);
    const auto sine = Sine(441.0, spec.rate, 700, 0.5);
    const auto vag = EncodeVag(sine, true);
    bank.bd.insert(bank.bd.end(), vag.begin(), vag.end());

    Writer            w;
    const std::size_t vers = w.Chunk(audio::kChunkVers);
    w.U16(0);
    w.U8(3);
    w.U8(1);
    w.EndChunk(vers);

    const std::size_t head = w.Chunk(audio::kChunkHead);
    for (int i = 0; i < 13; i++) {
        w.U32(0);
    }
    w.EndChunk(head);
    w.Patch32(head + 0x10, static_cast<std::uint32_t>(bank.bd.size()));
    w.Patch32(head + 0x24, audio::kUnused);

    const std::size_t prog = w.Chunk(audio::kChunkProg);
    w.Patch32(head + 0x14, static_cast<std::uint32_t>(prog));
    w.U32(program_index);
    for (int i = 0; i < program_index; i++) {
        w.U32(audio::kUnused);
    }
    w.U32(static_cast<std::uint32_t>(w.Size() - prog + 4));
    const std::size_t param = w.Size();
    w.U32(0x24);
    w.U8(1);
    w.U8(0x14);
    w.U8(127);
    w.U8(64);
    w.U8(0);
    w.U8(0);
    while (w.Size() < param + 0x24) {
        w.U8(0);
    }
    w.U16(0);
    w.U8(spec.key_low);
    w.U8(0);
    w.U8(spec.key_high);
    w.U8(0);
    w.U16(2);
    w.U16(2);
    for (int i = 0; i < 6; i++) {
        w.U8(0);
    }
    w.U8(127);
    w.U8(64);
    w.U8(0);
    w.U8(0);
    w.EndChunk(prog);
    w.Pad(4);

    const std::size_t sset = w.Chunk(audio::kChunkSset);
    w.Patch32(head + 0x18, static_cast<std::uint32_t>(sset));
    w.U32(0);
    w.U32(0x14);
    w.U8(0);
    w.U8(0);
    w.U8(127);
    w.U8(1);
    w.U16(0);
    w.EndChunk(sset);
    w.Pad(4);

    const std::size_t smpl = w.Chunk(audio::kChunkSmpl);
    w.Patch32(head + 0x1C, static_cast<std::uint32_t>(smpl));
    w.U32(0);
    w.U32(0x14);
    const std::size_t sample = w.Size();
    w.U16(0);
    w.U8(0);
    w.U8(0);
    w.U8(127);
    for (int i = 0; i < 6; i++) {
        w.U8(0);
    }
    w.U8(spec.base_note);
    w.U8(0);
    w.U8(spec.pan);
    w.U8(0);
    w.U8(0);
    w.U8(spec.volume);
    w.U8(0);
    w.U16(spec.adsr1);
    w.U16(spec.adsr2);
    while (w.Size() < sample + 0x2A) {
        w.U8(0);
    }
    w.EndChunk(smpl);
    w.Pad(4);

    const std::size_t vagi = w.Chunk(audio::kChunkVagi);
    w.Patch32(head + 0x20, static_cast<std::uint32_t>(vagi));
    w.U32(0);
    w.U32(0x14);
    w.U32(16);
    w.U16(spec.rate);
    w.U8(1);
    w.U8(0);
    w.EndChunk(vagi);

    w.Patch32(head + 0x0C, static_cast<std::uint32_t>(w.Size()));
    bank.hd = std::move(w.bytes);
    return bank;
}

// An SQ file around one song of raw track events.
inline std::vector<std::uint8_t> BuildSq(std::span<const std::uint8_t> events, int division = 480) {
    Writer            w;
    const std::size_t vers = w.Chunk(audio::kChunkVers);
    w.U16(0);
    w.U8(3);
    w.U8(1);
    w.EndChunk(vers);
    const std::size_t sequ = w.Chunk(audio::kChunkSequ);
    for (int i = 0; i < 5; i++) {
        w.U32(audio::kUnused);
    }
    w.EndChunk(sequ);
    const std::size_t midi = w.Chunk(audio::kChunkMidi);
    w.U32(0);
    w.U32(0x14);
    w.U32(6);
    w.U16(division);
    w.Append(events);
    w.EndChunk(midi);
    return std::move(w.bytes);
}

inline void VarLen(std::vector<std::uint8_t> &out, std::uint32_t value) {
    std::uint8_t bytes[4];
    int          n = 0;
    do {
        bytes[n++] = value & 0x7F;
        value >>= 7;
    } while (value != 0);
    while (n > 0) {
        n--;
        out.push_back(static_cast<std::uint8_t>(bytes[n] | (n > 0 ? 0x80 : 0)));
    }
}

class Track {
public:
    std::vector<std::uint8_t> events;

    Track &Event(std::uint32_t delta, std::initializer_list<int> bytes) {
        VarLen(events, delta);
        for (int b : bytes) {
            events.push_back(static_cast<std::uint8_t>(b));
        }
        return *this;
    }

    Track &Tempo(std::uint32_t delta, std::uint32_t microseconds) {
        return Event(delta, {0xFF, 0x51, 0x03, int(microseconds >> 16) & 0xFF, int(microseconds >> 8) & 0xFF, int(microseconds) & 0xFF});
    }

    Track &End(std::uint32_t delta) { return Event(delta, {0xFF, 0x2F, 0x00}); }
};

// Estimated frequency of one channel of interleaved stereo, from zero crossings.
inline double Frequency(std::span<const float> stereo, int channel, int rate) {
    int   crossings = 0;
    float previous = stereo[channel];
    int   first = -1, last = -1;
    for (std::size_t i = 1; i < stereo.size() / 2; i++) {
        const float value = stereo[i * 2 + channel];
        if (previous < 0.0f && value >= 0.0f) {
            if (first < 0) {
                first = static_cast<int>(i);
            } else {
                crossings++;
            }
            last = static_cast<int>(i);
        }
        previous = value;
    }
    if (crossings == 0) {
        return 0.0;
    }
    return crossings * double(rate) / (last - first);
}

inline double Rms(std::span<const float> stereo, int channel) {
    double sum = 0.0;
    for (std::size_t i = 0; i < stereo.size() / 2; i++) {
        sum += double(stereo[i * 2 + channel]) * stereo[i * 2 + channel];
    }
    return std::sqrt(sum / std::max<std::size_t>(1, stereo.size() / 2));
}

// Power of one channel at one frequency relative to the channel's total power.
inline double Goertzel(std::span<const float> stereo, int channel, int rate, double frequency) {
    const double      omega = 2.0 * std::numbers::pi * frequency / rate;
    const double      coeff = 2.0 * std::cos(omega);
    double            s1 = 0.0, s2 = 0.0, total = 0.0;
    const std::size_t n = stereo.size() / 2;
    for (std::size_t i = 0; i < n; i++) {
        const double x = stereo[i * 2 + channel];
        const double s = x + coeff * s1 - s2;
        s2 = s1;
        s1 = s;
        total += x * x;
    }
    const double power = s1 * s1 + s2 * s2 - coeff * s1 * s2;
    return total > 0.0 ? 2.0 * power / (n * total) : 0.0;
}

} // namespace audio_fixture
