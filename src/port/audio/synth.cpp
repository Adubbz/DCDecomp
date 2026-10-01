#include "synth.hpp"

#include <algorithm>
#include <cmath>

namespace audio {

void Envelope::KeyOn(std::uint16_t adsr1, std::uint16_t adsr2) {
    adsr1_ = adsr1;
    adsr2_ = adsr2;
    level_ = 0;
    counter_ = 0;
    phase_ = Phase::Attack;
}

void Envelope::KeyOff() {
    if (phase_ != Phase::Off) {
        phase_ = Phase::Release;
        counter_ = 0;
    }
}

void Envelope::Step(int shift, int step, bool exponential, bool decrease) {
    int cycles = 1 << std::max(0, shift - 11);
    step <<= std::max(0, 11 - shift);
    if (exponential && !decrease && level_ > 0x6000) {
        cycles *= 4;
    }
    if (exponential && decrease) {
        // Floor rather than truncate, so an exponential release still reaches zero.
        step = (step * level_) >> 15;
    }
    if (++counter_ < cycles) {
        return;
    }
    counter_ = 0;
    level_ = std::clamp(level_ + step, 0, kEnvelopeMax);
}

void Envelope::Tick() {
    switch (phase_) {
        case Phase::Off:
            return;
        case Phase::Attack: {
            const int rate = (adsr1_ >> 8) & 0x7F;
            Step(rate >> 2, 7 - (rate & 3), (adsr1_ & 0x8000) != 0, false);
            if (level_ >= kEnvelopeMax) {
                phase_ = Phase::Decay;
                counter_ = 0;
            }
            return;
        }
        case Phase::Decay:
            Step((adsr1_ >> 4) & 0x0F, -8, true, true);
            if (level_ <= SustainLevel()) {
                phase_ = Phase::Sustain;
                counter_ = 0;
            }
            return;
        case Phase::Sustain: {
            const int  rate = (adsr2_ >> 6) & 0x7F;
            const bool decrease = (adsr2_ & 0x4000) != 0;
            Step(rate >> 2, decrease ? -8 + (rate & 3) : 7 - (rate & 3), (adsr2_ & 0x8000) != 0, decrease);
            return;
        }
        case Phase::Release:
            Step(adsr2_ & 0x1F, -8, (adsr2_ & 0x20) != 0, true);
            if (level_ == 0) {
                phase_ = Phase::Off;
            }
            return;
    }
}

Voice &Synth::Allocate(int core) {
    Voice *const first = voices_.data() + core * kCoreVoices;
    Voice *const last = first + kCoreVoices;
    for (Voice *v = first; v != last; v++) {
        if (!v->active) {
            return *v;
        }
    }
    Voice *victim = nullptr;
    for (Voice *v = first; v != last; v++) {
        if (v->released && (victim == nullptr || v->envelope.Level() < victim->envelope.Level())) {
            victim = v;
        }
    }
    if (victim == nullptr) {
        victim = std::min_element(first, last, [](const Voice &a, const Voice &b) { return a.serial < b.serial; });
    }
    return *victim;
}

void Synth::Start(Voice &voice, std::uint16_t adsr1, std::uint16_t adsr2) {
    voice.active = true;
    voice.released = false;
    voice.held = false;
    voice.position = 0.0;
    voice.fresh = true;
    voice.ticks = 0.0;
    voice.serial = ++serial_;
    voice.current_l = voice.current_r = 0.0f;
    voice.envelope.KeyOn(adsr1, adsr2);
}

int Synth::ActiveVoices() const {
    return static_cast<int>(std::count_if(voices_.begin(), voices_.end(), [](const Voice &v) { return v.active; }));
}

void Synth::Render(int frames, float *const out[kCores]) {
    for (Voice &voice : voices_) {
        if (voice.active) {
            RenderVoice(voice, frames, out[voice.Core()]);
        }
    }
}

namespace {

float Fetch(const VagSample &sample, std::int64_t index) {
    const auto size = static_cast<std::int64_t>(sample.pcm.size());
    if (index < 0) {
        return 0.0f;
    }
    if (index >= size) {
        if (!sample.loops) {
            return 0.0f;
        }
        const std::int64_t length = size - sample.loop_start;
        index = sample.loop_start + (index - sample.loop_start) % length;
    }
    return sample.pcm[index] * (1.0f / 32768.0f);
}

} // namespace

void Synth::RenderVoice(Voice &voice, int frames, float *out) {
    const VagSample &sample = *voice.sample;
    const auto       size = static_cast<double>(sample.pcm.size());
    const double     loop = sample.loops ? size - sample.loop_start : 0.0;
    const double     tick = static_cast<double>(kSpuRate) / rate_;
    if (voice.fresh) {
        voice.current_l = voice.gain_l;
        voice.current_r = voice.gain_r;
        voice.fresh = false;
    }
    // A one-pole glide of a few milliseconds keeps volume and pan changes from clicking.
    const float glide = std::min(1.0f, 240.0f / rate_);

    for (int i = 0; i < frames; i++) {
        voice.ticks += tick;
        while (voice.ticks >= 1.0) {
            voice.envelope.Tick();
            voice.ticks -= 1.0;
        }
        if (voice.envelope.CurrentPhase() == Envelope::Phase::Off) {
            voice.active = false;
            return;
        }

        const auto  index = static_cast<std::int64_t>(voice.position);
        const auto  t = static_cast<float>(voice.position - index);
        const float p0 = Fetch(sample, index - 1);
        const float p1 = Fetch(sample, index);
        const float p2 = Fetch(sample, index + 1);
        const float p3 = Fetch(sample, index + 2);
        const float value = p1 + 0.5f * t * (p2 - p0 + t * (2.0f * p0 - 5.0f * p1 + 4.0f * p2 - p3 + t * (3.0f * (p1 - p2) + p3 - p0)));
        const float level = voice.envelope.Level() * (1.0f / kEnvelopeMax) * value;

        voice.current_l += (voice.gain_l - voice.current_l) * glide;
        voice.current_r += (voice.gain_r - voice.current_r) * glide;
        out[i * 2] += level * voice.current_l;
        out[i * 2 + 1] += level * voice.current_r;

        voice.position += voice.step;
        if (voice.position >= size) {
            if (!sample.loops || loop <= 0.0) {
                // The SPU mutes a voice that reaches an end block without the repeat flag.
                voice.active = false;
                voice.envelope.Kill();
                return;
            }
            voice.position = sample.loop_start + std::fmod(voice.position - sample.loop_start, loop);
        }
    }
}

} // namespace audio
