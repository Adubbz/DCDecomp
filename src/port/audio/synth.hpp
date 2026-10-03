#pragma once

#include <array>
#include <cstdint>

#include "vag.hpp"

namespace audio {

// The SPU2 runs its envelopes and its pitch reference at 48 kHz whatever the output rate.
constexpr int    kSpuRate = 48000;
constexpr double kSpuMaxPitch = 0x3FFF / 4096.0;
constexpr int    kCores = 2;
constexpr int    kCoreVoices = 24;
constexpr int    kVoices = kCores * kCoreVoices;
constexpr int    kEnvelopeMax = 0x7FFF;

enum VoiceMix : std::uint8_t {
    kMixDryLeft = 0x01,
    kMixDryRight = 0x02,
    kMixWetLeft = 0x04,
    kMixWetRight = 0x08,
    kMixAll = 0x0F,
};

// The SPU2 ADSR as the hardware runs it: per-tick level steps whose size and period come from a
// 5-bit shift and 2-bit step, with exponential modes scaling by level.
class Envelope {
public:
    enum class Phase : std::uint8_t {
        Off,
        Attack,
        Decay,
        Sustain,
        Release,
    };

    void KeyOn(std::uint16_t adsr1, std::uint16_t adsr2);

    void KeyOff();

    void Kill() {
        phase_ = Phase::Off;
        level_ = 0;
    }

    void Tick();

    int Level() const { return level_; }

    Phase CurrentPhase() const { return phase_; }

    int SustainLevel() const { return ((adsr1_ & 0x0F) + 1) * 0x800; }

private:
    void Step(int shift, int step, bool exponential, bool decrease);

    std::uint16_t adsr1_ = 0;
    std::uint16_t adsr2_ = 0;
    int           level_ = 0;
    int           counter_ = 0;
    Phase         phase_ = Phase::Off;
};

struct Voice {
    bool active = false;

    // Who owns the voice, so the sequencer and the effect messages can find it again.
    int  port = -1;
    int  channel = -1;
    int  note = 0;
    bool effect = false;
    int  program = 0;
    int  effect_id = 0;
    int  effect_no = 0;
    int  effect_volume = 127;
    int  effect_pan = 64;
    bool held = false;
    bool released = false;

    std::uint64_t serial = 0;

    const VagSample *sample = nullptr;
    double           position = 0.0;
    int              rate = 0;

    // Fixed at key-on from the bank: pitch offset in semitones from the note, gain and pan.
    double base_pitch = 0.0;
    float  base_gain = 1.0f;
    int    base_pan = 0;
    int    bend_low = 2;
    int    bend_high = 2;

    // Set by the owner every render block.
    double step = 0.0;
    float  gain_l = 0.0f;
    float  gain_r = 0.0f;

    float    current_l = 0.0f;
    float    current_r = 0.0f;
    bool     fresh = true;
    double   ticks = 0.0;
    Envelope envelope;

    // The sample's SPU attribute: the core it sounds on and its VMIXL/VMIXR/VMIXEL/VMIXER bits.
    int          core = 0;
    std::uint8_t mix = kMixAll;

    int Core() const { return core; }
};

class Synth {
public:
    explicit Synth(int rate) : rate_(rate) {}

    int Rate() const { return rate_; }

    // Takes a free voice on core, or steals the quietest released one, or the oldest.
    Voice &Allocate(int core);

    int FreeVoices(int core) const;

    void Start(Voice &voice, std::uint16_t adsr1, std::uint16_t adsr2);

    std::array<Voice, kVoices> &Voices() { return voices_; }

    const std::array<Voice, kVoices> &Voices() const { return voices_; }

    int ActiveVoices() const;

    // Adds frames of every voice into dry and of each core's voices into that core's effect send,
    // as each voice's mix bits allow; all interleaved stereo.
    void Render(int frames, float *dry, float *const send[kCores]);

private:
    void RenderVoice(Voice &voice, int frames, float *dry, float *send);

    int                        rate_;
    std::uint64_t              serial_ = 0;
    std::array<Voice, kVoices> voices_;
};

} // namespace audio
