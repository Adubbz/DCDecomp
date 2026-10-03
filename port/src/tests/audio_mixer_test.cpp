#include <vector>

#include "../audio/mixer.hpp"
#include "audio_fixture.hpp"
#include "test.hpp"

using namespace audio_fixture;

namespace {

constexpr int kRate = 48000;

std::vector<float> Pull(audio::Mixer &mixer, double seconds) {
    std::vector<float> out(static_cast<std::size_t>(seconds * kRate) * 2);
    // Odd pull sizes, as a device callback would ask for.
    std::size_t done = 0;
    while (done < out.size() / 2) {
        const int frames = std::min<int>(733, static_cast<int>(out.size() / 2 - done));
        mixer.Render(out.data() + done * 2, frames);
        done += frames;
    }
    return out;
}

std::shared_ptr<audio::Bank> MakeBank(SampleSpec spec = {}) {
    const auto bank = BuildBank(0, spec);
    return audio::Bank::Create(bank.hd, bank.bd);
}

// Two notes of half a second at 120 bpm: C4, then C5, then the end.
std::shared_ptr<audio::SqFile> TwoNotes() {
    Track track;
    track.Tempo(0, 500000)
        .Event(0, {0xC0, 0})
        .Event(0, {0xB0, 7, 127})
        .Event(0, {0x90, 60, 127})
        .Event(480, {0x80, 60})
        .Event(0, {0x90, 72, 127})
        .Event(480, {0x80, 72})
        .End(0);
    return audio::SqFile::Create(BuildSq(track.events));
}

void StartSong(audio::Mixer &mixer, int port, std::shared_ptr<audio::SqFile> song, int volume = audio::kFullPortVolume) {
    mixer.BindBank(port, MakeBank());
    mixer.SetSequence(port, std::move(song));
    mixer.SetVolume(port, volume);
    mixer.Rewind(port, 0);
    mixer.Play(port);
}

} // namespace

DC_TEST(audio_sequence_pitch_and_release) {
    audio::Mixer mixer(kRate);
    StartSong(mixer, 0, TwoNotes());
    DC_CHECK(mixer.IsPlaying(0));

    const auto first = Pull(mixer, 0.45);
    DC_CHECK(Rms(first, 0) > 0.05);
    DC_CHECK_NEAR(Frequency(first, 0, kRate), 441.0, 3.0);
    DC_CHECK(Goertzel(first, 0, kRate, 441.0) > 0.8);

    Pull(mixer, 0.1);
    const auto second = Pull(mixer, 0.4);
    DC_CHECK_NEAR(Frequency(second, 1, kRate), 882.0, 6.0);
    DC_CHECK(Goertzel(second, 1, kRate, 882.0) > 0.8);

    // The second note ends at 1.0 s; the release (shift 10, linear) takes about 43 ms.
    Pull(mixer, 0.1);
    const auto tail = Pull(mixer, 0.1);
    DC_CHECK(Rms(tail, 0) < 1e-6);
    DC_CHECK(!mixer.IsPlaying(0));
    DC_CHECK(mixer.ActiveVoices() == 0);
}

DC_TEST(audio_sequence_tempo_and_loop) {
    audio::Mixer mixer(kRate);
    Track        track;
    track.Tempo(0, 250000)
        .Event(0, {0xB0, 99, audio::Sequencer::kNrpnLoopStart})
        .Event(0, {0xB0, 6, 0})
        .Event(0, {0x90, 60, 127})
        .Event(480, {0x80, 60})
        .Event(0, {0xB0, 99, audio::Sequencer::kNrpnLoopEnd})
        .Event(0, {0xB0, 6, 0})
        .Event(0, {0xB0, 38, 0})
        .End(0);
    StartSong(mixer, 1, audio::SqFile::Create(BuildSq(track.events)));
    // At 240 bpm the note lasts a quarter second; the loop keeps restarting it.
    for (int i = 0; i < 8; i++) {
        const auto block = Pull(mixer, 0.2);
        DC_CHECK(Rms(block, 0) > 0.05);
    }
    DC_CHECK(mixer.IsPlaying(1));

    mixer.Stop(1);
    DC_CHECK(!mixer.IsPlaying(1));
    Pull(mixer, 0.1);
    DC_CHECK(Rms(Pull(mixer, 0.05), 0) < 1e-6);

    // A counted loop jumps back that many times, then the song ends.
    Track counted;
    counted.Tempo(0, 250000)
        .Event(0, {0xB0, 99, audio::Sequencer::kNrpnLoopStart})
        .Event(0, {0xB0, 6, 3})
        .Event(0, {0x90, 60, 127})
        .Event(480, {0x80, 60})
        .Event(0, {0xB0, 99, audio::Sequencer::kNrpnLoopEnd})
        .Event(0, {0xB0, 6, 3})
        .Event(0, {0xB0, 38, 1})
        .End(0);
    StartSong(mixer, 2, audio::SqFile::Create(BuildSq(counted.events)));
    Pull(mixer, 0.45);
    DC_CHECK(mixer.IsPlaying(2));
    Pull(mixer, 0.1);
    DC_CHECK(!mixer.IsPlaying(2));
}

DC_TEST(audio_volume_pan_mono) {
    audio::Mixer full(kRate);
    audio::Mixer half(kRate);
    StartSong(full, 0, TwoNotes(), 256);
    StartSong(half, 0, TwoNotes(), 128);
    const auto a = Pull(full, 0.3);
    const auto b = Pull(half, 0.3);
    DC_CHECK_NEAR(Rms(b, 0) / Rms(a, 0), 0.5, 0.01);

    // Hard left through controller 10.
    Track left;
    left.Event(0, {0xB0, 10, 0}).Event(0, {0x90, 60, 127}).End(48000);
    audio::Mixer panned(kRate);
    StartSong(panned, 0, audio::SqFile::Create(BuildSq(left.events)));
    const auto p = Pull(panned, 0.2);
    DC_CHECK(Rms(p, 0) > 0.05);
    DC_CHECK(Rms(p, 1) < 1e-4);

    panned.SetStereo(false);
    const auto mono = Pull(panned, 0.1);
    DC_CHECK_NEAR(Rms(mono, 0), Rms(mono, 1), 1e-6);
    DC_CHECK(Rms(mono, 1) > 0.02);

    // A volume change glides rather than steps, then settles.
    panned.SetStereo(true);
    panned.SetVolume(0, 64);
    Pull(panned, 0.1);
    const auto quiet = Pull(panned, 0.1);
    DC_CHECK_NEAR(Rms(quiet, 0) / Rms(p, 0), 0.25, 0.02);
}

DC_TEST(audio_reverb_tail) {
    auto tail = [](bool reverb) {
        audio::Mixer mixer(kRate);
        Track        track;
        track.Event(0, {0x90, 60, 127}).Event(96, {0x80, 60}).End(9600);
        StartSong(mixer, 0, audio::SqFile::Create(BuildSq(track.events)));
        mixer.SetReverb(0, 5, reverb ? 100 : 0);
        Pull(mixer, 0.2);
        return Rms(Pull(mixer, 0.2), 0);
    };
    DC_CHECK(tail(false) < 1e-6);
    const double wet = tail(true);
    DC_CHECK(wet > 1e-4);
    DC_CHECK(wet < 0.5);
}

DC_TEST(audio_effect_messages) {
    audio::Mixer mixer(kRate);
    mixer.BindBank(15, MakeBank());
    mixer.SetVolume(15, 256);
    const std::uint8_t volume[] = {0xF9, 0, 0, 127, 0};
    const std::uint8_t pan[] = {0xF9, 1, 0, 64, 0};
    const std::uint8_t on[] = {0xFD, 0x10, 0, 72, 3, 127, 0};
    mixer.ShortMessage(15, 0x00C0);
    mixer.HsMessage(15, volume);
    mixer.HsMessage(15, pan);
    mixer.HsMessage(15, on);
    DC_CHECK(mixer.ActiveVoices() == 1);
    const auto loud = Pull(mixer, 0.2);
    DC_CHECK_NEAR(Frequency(loud, 0, kRate), 882.0, 6.0);

    const std::uint8_t softer[] = {0xFD, 0, 0, 72, 3, 32, 0};
    mixer.HsMessage(15, softer);
    Pull(mixer, 0.05);
    const auto soft = Pull(mixer, 0.1);
    DC_CHECK_NEAR(Rms(soft, 0) / Rms(loud, 0), 32.0 / 127.0, 0.02);

    const std::uint8_t right[] = {0xFD, 1, 0, 72, 3, 127, 0};
    mixer.HsMessage(15, right);
    Pull(mixer, 0.05);
    const auto panned = Pull(mixer, 0.1);
    DC_CHECK(Rms(panned, 0) < 1e-3);
    DC_CHECK(Rms(panned, 1) > 0.01);

    // Another voice number is a separate instance; key-off of one leaves the other.
    const std::uint8_t other[] = {0xFD, 0x10, 0, 72, 4, 127, 0};
    mixer.HsMessage(15, other);
    DC_CHECK(mixer.ActiveVoices() == 2);
    const std::uint8_t off[] = {0xFD, 0x10, 0, 72, 3, 0, 0};
    mixer.HsMessage(15, off);
    Pull(mixer, 0.1);
    DC_CHECK(mixer.ActiveVoices() == 1);

    mixer.Stop(15);
    Pull(mixer, 0.1);
    DC_CHECK(mixer.ActiveVoices() == 0);
}

DC_TEST(audio_effect_split_fallback) {
    SampleSpec spec;
    spec.key_low = 60;
    spec.key_high = 60;
    const auto   bank = BuildBank(0, spec);
    audio::Mixer mixer(kRate);
    mixer.BindBank(12, audio::Bank::Create(bank.hd, bank.bd));
    mixer.SetVolume(12, 256);
    // Id 0 is outside the split's keys, so it names split 0 and sounds at the sample's own pitch.
    const std::uint8_t on[] = {0xFD, 0x10, 0, 0, 0, 127, 0};
    mixer.HsMessage(12, on);
    DC_CHECK(mixer.ActiveVoices() == 1);
    DC_CHECK_NEAR(Frequency(Pull(mixer, 0.2), 0, kRate), 441.0, 3.0);
    const std::uint8_t missing[] = {0xFD, 0x10, 0, 5, 0, 127, 0};
    mixer.HsMessage(12, missing);
    DC_CHECK(mixer.ActiveVoices() == 1);
}

DC_TEST(audio_voice_stealing) {
    audio::Mixer mixer(kRate);
    mixer.BindBank(0, MakeBank());
    mixer.SetVolume(0, 256);
    for (int note = 30; note < 30 + 40; note++) {
        mixer.ShortMessage(0, 0x90 | (note << 8) | (100 << 16));
    }
    DC_CHECK(mixer.ActiveVoices() == audio::kCoreVoices);
    Pull(mixer, 0.05);
    mixer.KeyOffCore(0);
    Pull(mixer, 0.1);
    DC_CHECK(mixer.ActiveVoices() == 0);
}
