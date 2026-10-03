#include "reverb.hpp"

#include <algorithm>

namespace audio {

namespace {

struct ModeShape {
    float size;
    float feedback;
    float damp;
    bool  delay;
};

// Indexed by SPU2 effect mode: off, room, studio A/B/C, hall, space, echo, delay, pipe.
constexpr ModeShape kShapes[Reverb::kModes] = {
    {0.0f,  0.0f,  0.0f, false},
    {0.6f,  0.70f, 0.4f, false},
    {0.5f,  0.65f, 0.4f, false},
    {0.75f, 0.74f, 0.4f, false},
    {0.9f,  0.80f, 0.4f, false},
    {1.2f,  0.86f, 0.3f, false},
    {1.5f,  0.92f, 0.2f, false},
    {0.33f, 0.55f, 0.2f, true },
    {0.33f, 0.0f,  0.0f, true },
    {0.03f, 0.75f, 0.1f, true },
};

constexpr int kCombTuning[] = {1116, 1188, 1277, 1356};
constexpr int kAllpassTuning[] = {556, 441};
constexpr int kStereoSpread = 23;
constexpr int kTuningRate = 44100;

} // namespace

Reverb::Reverb(int rate) : rate_(rate) {}

void Reverb::SetMode(int mode) {
    mode = std::clamp(mode, 0, kModes - 1);
    if (mode == mode_) {
        return;
    }
    mode_ = mode;
    const ModeShape &shape = kShapes[mode];
    feedback_ = shape.feedback;
    damp_ = shape.damp;
    delay_ = shape.delay;
    for (int side = 0; side < 2; side++) {
        combs_[side].clear();
        allpasses_[side].clear();
        if (mode == 0) {
            continue;
        }
        if (delay_) {
            Comb &line = combs_[side].emplace_back();
            line.buffer.assign(std::max(1, static_cast<int>(shape.size * rate_) + side * kStereoSpread), 0.0f);
            continue;
        }
        const float scale = shape.size * rate_ / kTuningRate;
        for (int tuning : kCombTuning) {
            combs_[side].emplace_back().buffer.assign(std::max(1, static_cast<int>((tuning + side * kStereoSpread) * scale)), 0.0f);
        }
        for (int tuning : kAllpassTuning) {
            allpasses_[side].emplace_back().buffer.assign(std::max(1, static_cast<int>((tuning + side * kStereoSpread) * scale)), 0.0f);
        }
    }
}

void Reverb::Clear() {
    for (int side = 0; side < 2; side++) {
        for (Comb &comb : combs_[side]) {
            std::fill(comb.buffer.begin(), comb.buffer.end(), 0.0f);
            comb.filter = 0.0f;
        }
        for (Allpass &allpass : allpasses_[side]) {
            std::fill(allpass.buffer.begin(), allpass.buffer.end(), 0.0f);
        }
    }
}

void Reverb::Process(const float *in, float *out, int frames) {
    if (!Active()) {
        return;
    }
    const float input_gain = delay_ ? 1.0f : 0.015f * static_cast<float>(combs_[0].size());
    for (int i = 0; i < frames; i++) {
        const float mono = (in[i * 2] + in[i * 2 + 1]) * 0.5f;
        for (int side = 0; side < 2; side++) {
            float wet = 0.0f;
            for (Comb &comb : combs_[side]) {
                const float delayed = comb.buffer[comb.index];
                comb.filter = delayed * (1.0f - damp_) + comb.filter * damp_;
                comb.buffer[comb.index] = mono * input_gain + comb.filter * feedback_;
                comb.index = (comb.index + 1) % comb.buffer.size();
                wet += delayed;
            }
            for (Allpass &allpass : allpasses_[side]) {
                const float delayed = allpass.buffer[allpass.index];
                allpass.buffer[allpass.index] = wet + delayed * 0.5f;
                allpass.index = (allpass.index + 1) % allpass.buffer.size();
                wet = delayed - wet;
            }
            out[i * 2 + side] += wet * depth_;
        }
    }
}

} // namespace audio
