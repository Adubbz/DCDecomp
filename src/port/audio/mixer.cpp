#include "mixer.hpp"

#include <algorithm>
#include <cmath>

namespace audio {

Mixer::Mixer(int rate) : rate_(rate), synth_(rate), reverbs_{Reverb(rate), Reverb(rate)} {
    for (int i = 0; i < kPorts; i++) {
        ports_[i].mixer = this;
        ports_[i].index = i;
    }
    for (auto &buffer : core_buffers_) {
        buffer.assign(kBlock * 2, 0.0f);
    }
}

namespace {

bool ValidPort(int port) {
    return port >= 0 && port < kPorts;
}

} // namespace

void Mixer::Reset() {
    std::lock_guard lock(mutex_);
    for (Voice &voice : synth_.Voices()) {
        voice.active = false;
        voice.envelope.Kill();
    }
    for (Port &port : ports_) {
        port.bank.reset();
        port.sequencer.SetSequence(nullptr);
        port.channels = {};
        port.volume = 0;
        port.attribute = 0;
        port.effect_volume = 127;
        port.effect_pan = 64;
    }
    for (Reverb &reverb : reverbs_) {
        reverb.SetMode(0);
        reverb.SetDepth(0.0f);
    }
    stereo_ = true;
}

void Mixer::BindBank(int port, std::shared_ptr<const Bank> bank) {
    if (!ValidPort(port)) {
        return;
    }
    std::lock_guard lock(mutex_);
    // A voice reads its bank's decoded samples; rebinding must not leave one pointing into a
    // bank about to be freed.
    for (Voice &voice : synth_.Voices()) {
        if (voice.active && voice.port == port) {
            voice.active = false;
            voice.envelope.Kill();
        }
    }
    ports_[port].bank = std::move(bank);
    ports_[port].channels = {};
}

void Mixer::SetSequence(int port, std::shared_ptr<const SqFile> file) {
    if (!ValidPort(port)) {
        return;
    }
    std::lock_guard lock(mutex_);
    ports_[port].sequencer.SetSequence(std::move(file));
    ForVoices([&](const Voice &v) { return v.port == port && !v.effect; }, [&](Voice &v) { ReleaseVoice(v); });
}

void Mixer::Rewind(int port, int song) {
    if (!ValidPort(port)) {
        return;
    }
    std::lock_guard lock(mutex_);
    ports_[port].sequencer.Rewind(song);
    ports_[port].channels = {};
}

void Mixer::Play(int port) {
    if (!ValidPort(port)) {
        return;
    }
    std::lock_guard lock(mutex_);
    ports_[port].sequencer.Play();
}

void Mixer::Stop(int port) {
    if (!ValidPort(port)) {
        return;
    }
    std::lock_guard lock(mutex_);
    ports_[port].sequencer.Stop();
    ForVoices([&](const Voice &v) { return v.port == port; }, [&](Voice &v) { ReleaseVoice(v); });
}

bool Mixer::IsPlaying(int port) const {
    if (!ValidPort(port)) {
        return false;
    }
    std::lock_guard lock(mutex_);
    return ports_[port].sequencer.Playing();
}

void Mixer::SetVolume(int port, int volume) {
    if (!ValidPort(port)) {
        return;
    }
    std::lock_guard lock(mutex_);
    ports_[port].volume = volume;
}

int Mixer::Volume(int port) const {
    if (!ValidPort(port)) {
        return 0;
    }
    std::lock_guard lock(mutex_);
    return ports_[port].volume;
}

void Mixer::SetAttribute(int port, int attribute) {
    if (!ValidPort(port)) {
        return;
    }
    std::lock_guard lock(mutex_);
    ports_[port].attribute = attribute;
}

int Mixer::Attribute(int port) const {
    if (!ValidPort(port)) {
        return 0;
    }
    std::lock_guard lock(mutex_);
    return ports_[port].attribute;
}

void Mixer::SetStereo(bool stereo) {
    std::lock_guard lock(mutex_);
    stereo_ = stereo;
}

bool Mixer::Stereo() const {
    std::lock_guard lock(mutex_);
    return stereo_;
}

void Mixer::SetReverb(int core, int mode, int depth) {
    if (core < 0 || core >= kCores) {
        return;
    }
    std::lock_guard lock(mutex_);
    reverbs_[core].SetMode(mode);
    // The game writes depth << 8 into a 15-bit effect volume.
    reverbs_[core].SetDepth(std::clamp(depth, 0, 127) / 127.0f);
}

void Mixer::SetReverbEnabled(bool enabled) {
    std::lock_guard lock(mutex_);
    reverb_enabled_ = enabled;
}

void Mixer::SetMasterGain(float gain) {
    std::lock_guard lock(mutex_);
    master_ = gain;
}

void Mixer::KeyOffCore(int core) {
    std::lock_guard lock(mutex_);
    ForVoices([&](const Voice &v) { return v.Core() == core; }, [&](Voice &v) { ReleaseVoice(v); });
}

void Mixer::ShortMessage(int port, std::uint32_t message) {
    if (!ValidPort(port)) {
        return;
    }
    std::lock_guard lock(mutex_);
    Message(ports_[port], message & 0xFF, (message >> 8) & 0x7F, (message >> 16) & 0x7F);
}

void Mixer::HsMessage(int port, std::span<const std::uint8_t> message) {
    if (!ValidPort(port) || message.size() < 4) {
        return;
    }
    std::lock_guard lock(mutex_);
    Port           &p = ports_[port];
    if (message[0] == 0xF9) {
        if (message[1] == 0) {
            p.effect_volume = message[3] & 0x7F;
        } else if (message[1] == 1) {
            p.effect_pan = message[3] & 0x7F;
        }
        return;
    }
    if (message[0] != 0xFD || message.size() < 6) {
        return;
    }
    const int program = p.channels[0].program;
    const int id = message[3];
    const int number = message[4];
    const int value = message[5] & 0x7F;
    auto      match = [&](const Voice &v) {
        return v.port == port && v.effect && v.program == program && v.effect_id == id && v.effect_no == number;
    };
    switch (message[1]) {
        case 0x10:
            if (value == 0) {
                ForVoices(match, [&](Voice &v) { ReleaseVoice(v); });
            } else {
                EffectOn(p, id, number, value);
            }
            break;
        case 0x00:
            ForVoices(match, [&](Voice &v) { v.effect_volume = value; });
            break;
        case 0x01:
            ForVoices(match, [&](Voice &v) { v.effect_pan = value; });
            break;
        default:
            break;
    }
}

int Mixer::ActiveVoices() const {
    std::lock_guard lock(mutex_);
    return synth_.ActiveVoices();
}

template <class Match, class Action>
void Mixer::ForVoices(Match match, Action action) {
    for (Voice &voice : synth_.Voices()) {
        if (voice.active && match(voice)) {
            action(voice);
        }
    }
}

void Mixer::ReleaseVoice(Voice &voice) {
    voice.released = true;
    voice.held = false;
    voice.envelope.KeyOff();
}

void Mixer::Port::ChannelMessage(std::uint8_t status, std::uint8_t data1, std::uint8_t data2) {
    mixer->Message(*this, status, data1, data2);
}

void Mixer::Message(Port &port, std::uint8_t status, std::uint8_t data1, std::uint8_t data2) {
    const int channel = status & 0x0F;
    Channel  &state = port.channels[channel];
    switch (status & 0xF0) {
        case 0x90:
            if (data2 != 0) {
                NoteOn(port, channel, data1, data2);
                break;
            }
            [[fallthrough]];
        case 0x80:
            ForVoices(
                [&](const Voice &v) {
                    return v.port == port.index && !v.effect && v.channel == channel && v.note == data1 && !v.released;
                },
                [&](Voice &v) {
                    if (state.sustain) {
                        v.held = true;
                    } else {
                        ReleaseVoice(v);
                    }
                });
            break;
        case 0xB0:
            Controller(port, channel, data1, data2);
            break;
        case 0xC0:
            state.program = data1;
            break;
        case 0xE0:
            state.bend = data1 | (data2 << 7);
            break;
        default:
            break;
    }
}

void Mixer::Controller(Port &port, int channel, int controller, int value) {
    Channel &state = port.channels[channel];
    auto     on_channel = [&](const Voice &v) { return v.port == port.index && !v.effect && v.channel == channel; };
    switch (controller) {
        case 6:
            if (state.rpn == 0) {
                state.bend_range = value;
            }
            break;
        case 7:
            state.volume = value;
            break;
        case 10:
            state.pan = value;
            break;
        case 11:
            state.expression = value;
            break;
        case 64:
            state.sustain = value >= 64;
            if (!state.sustain) {
                ForVoices([&](const Voice &v) { return on_channel(v) && v.held; }, [&](Voice &v) { ReleaseVoice(v); });
            }
            break;
        case 98:
        case 99:
            state.rpn = 0x3FFF;
            break;
        case 100:
            state.rpn = (state.rpn & 0x3F80) | value;
            break;
        case 101:
            state.rpn = (state.rpn & 0x7F) | (value << 7);
            break;
        case 120:
            ForVoices(on_channel, [](Voice &v) {
                v.active = false;
                v.envelope.Kill();
            });
            break;
        case 121:
            state.expression = 127;
            state.bend = 8192;
            state.sustain = false;
            state.rpn = 0x3FFF;
            break;
        case 123:
            ForVoices(on_channel, [&](Voice &v) { ReleaseVoice(v); });
            break;
        default:
            break;
    }
}

void Mixer::NoteOn(Port &port, int channel, int note, int velocity) {
    if (port.bank == nullptr) {
        return;
    }
    ForVoices([&](const Voice &v) { return v.port == port.index && !v.effect && v.channel == channel && v.note == note; },
              [&](Voice &v) { ReleaseVoice(v); });
    std::array<Layer, kMaxLayers> layers;
    const int                     count = port.bank->Resolve(port.channels[channel].program, note, velocity, layers);
    Voice                         prototype;
    prototype.port = port.index;
    prototype.channel = channel;
    prototype.note = note;
    prototype.program = port.channels[channel].program;
    for (int i = 0; i < count; i++) {
        StartLayer(port, layers[i], note, velocity, prototype);
    }
}

// Effects come addressed by program and id. The id is taken as a key into the program's split
// table first, as a sequence's note would be, and failing that as the split's index, sounding at
// the sample's own pitch.
void Mixer::EffectOn(Port &port, int id, int number, int velocity) {
    const int program = port.channels[0].program;
    ForVoices([&](const Voice &v) { return v.port == port.index && v.effect && v.program == program && v.effect_id == id && v.effect_no == number; },
              [&](Voice &v) { ReleaseVoice(v); });
    if (port.bank == nullptr) {
        return;
    }
    std::array<Layer, kMaxLayers> layers;
    int                           note = id;
    int                           count = port.bank->Resolve(program, id, velocity, layers);
    if (count == 0) {
        count = port.bank->ResolveSplit(program, id, velocity, layers);
        note = -1;
    }
    Voice prototype;
    prototype.port = port.index;
    prototype.effect = true;
    prototype.program = program;
    prototype.effect_id = id;
    prototype.effect_no = number;
    prototype.effect_volume = port.effect_volume;
    prototype.effect_pan = port.effect_pan;
    for (int i = 0; i < count; i++) {
        StartLayer(port, layers[i], note < 0 ? layers[i].sample->base_note : note, velocity, prototype);
    }
}

void Mixer::StartLayer(Port &port, const Layer &layer, int note, int velocity, Voice &prototype) {
    const HdProgram &program = *port.bank->Program(prototype.program);
    const HdSplit   &split = *layer.split;
    const HdSample  &sample = *layer.sample;

    Voice &voice = synth_.Allocate(prototype.Core());
    voice = prototype;
    voice.note = note;
    voice.sample = layer.vag;
    voice.rate = layer.rate;
    voice.base_pitch = note - sample.base_note + program.transpose + split.transpose +
                       (program.detune + split.detune + sample.detune) / 128.0;
    voice.base_gain = velocity / 127.0f * program.volume / 127.0f * split.volume / 127.0f * sample.volume / 127.0f;
    voice.base_pan = program.pan + split.pan + sample.pan - 3 * 64;
    voice.bend_low = split.bend_low;
    voice.bend_high = split.bend_high;
    synth_.Start(voice, sample.adsr1, sample.adsr2);
}

void Mixer::UpdateVoices() {
    const double max_step = kSpuRate * kSpuMaxPitch / rate_;
    for (Voice &voice : synth_.Voices()) {
        if (!voice.active) {
            continue;
        }
        const Port &port = ports_[voice.port];
        float       gain = voice.base_gain * std::clamp(port.volume, 0, kFullPortVolume) / float(kFullPortVolume) * master_;
        double      pitch = voice.base_pitch;
        int         pan = voice.base_pan;
        if (voice.effect) {
            gain *= voice.effect_volume / 127.0f;
            pan += voice.effect_pan;
        } else {
            const Channel &channel = port.channels[voice.channel];
            gain *= channel.volume / 127.0f * channel.expression / 127.0f;
            pan += channel.pan;
            const int bend = channel.bend - 8192;
            // The split's own bend range wins; a split without one follows the channel's RPN.
            int range = bend < 0 ? voice.bend_low : voice.bend_high;
            if (voice.bend_low == 0 && voice.bend_high == 0) {
                range = channel.bend_range;
            }
            pitch += bend / 8192.0 * range;
        }
        pan = std::clamp(pan, 0, 127);
        const float left = std::min(1.0f, 2.0f * (127 - pan) / 127.0f);
        const float right = std::min(1.0f, 2.0f * pan / 127.0f);
        voice.gain_l = gain * left;
        voice.gain_r = gain * right;
        voice.step = std::min(max_step, voice.rate * std::exp2(pitch / 12.0) / rate_);
    }
}

void Mixer::Render(float *out, int frames) {
    std::lock_guard lock(mutex_);
    std::fill(out, out + frames * 2, 0.0f);
    float *cores[kCores] = {core_buffers_[0].data(), core_buffers_[1].data()};
    while (frames > 0) {
        int block = std::min(frames, kBlock);
        for (Port &port : ports_) {
            port.sequencer.DispatchDue(rate_, port);
            const double next = port.sequencer.SamplesToNext();
            if (next < block) {
                block = std::max(1, static_cast<int>(std::ceil(next)));
            }
        }
        UpdateVoices();
        for (float *core : cores) {
            std::fill(core, core + block * 2, 0.0f);
        }
        synth_.Render(block, cores);
        for (int core = 0; core < kCores; core++) {
            for (int i = 0; i < block * 2; i++) {
                out[i] += cores[core][i];
            }
            if (reverb_enabled_) {
                reverbs_[core].Process(cores[core], out, block);
            }
        }
        if (!stereo_) {
            for (int i = 0; i < block; i++) {
                out[i * 2] = out[i * 2 + 1] = (out[i * 2] + out[i * 2 + 1]) * 0.5f;
            }
        }
        for (int i = 0; i < block * 2; i++) {
            out[i] = std::clamp(out[i], -1.0f, 1.0f);
        }
        for (Port &port : ports_) {
            port.sequencer.Elapse(block);
        }
        out += block * 2;
        frames -= block;
    }
}

// Never destroyed: SDL's audio thread may still pull from it while static destructors run.
Mixer &DefaultMixer() {
    static Mixer *mixer = new Mixer;
    return *mixer;
}

} // namespace audio
