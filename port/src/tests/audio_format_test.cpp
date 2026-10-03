#include <vector>

#include "../audio/mixer.hpp"
#include "../audio/sq.hpp"
#include "audio_fixture.hpp"
#include "test.hpp"

using namespace audio_fixture;

namespace {

constexpr int kRate = 48000;

std::vector<float> Pull(audio::Mixer &mixer, double seconds) {
    std::vector<float> out(static_cast<std::size_t>(seconds * kRate) * 2);
    mixer.Render(out.data(), static_cast<int>(out.size() / 2));
    return out;
}

} // namespace

// The byte pattern of the title's t01a_e.sq at 0x6D and 0x15C: a two-note chord whose first
// velocity carries bit 7 (the second note follows with no delta), and note-offs of one data byte
// with the same flag on the first.
DC_TEST(audio_sq_sony_encoding) {
    const std::uint8_t stream[] = {0x1D, 0x91, 0x14, 0xFF, 0x17, 0x7F, 0x87, 0x40, 0x81, 0x94,
                                   0x17, 0x10, 0xB1, 0x0B, 0x05, 0x00, 0xFF, 0x2F, 0x00};
    audio::SqReader    reader(stream);

    struct Expected {
        std::uint32_t delta;
        std::uint8_t  status, data1, data2;
    };

    constexpr Expected kExpected[] = {
        {29,  0x91, 20, 127},
        {0,   0x91, 23, 127},
        {960, 0x81, 20, 0  },
        {0,   0x81, 23, 0  },
        {16,  0xB1, 11, 5  },
    };
    for (const Expected &expected : kExpected) {
        const audio::SqEvent event = reader.Next();
        DC_CHECK(event.kind == audio::SqEventKind::Channel);
        DC_CHECK(event.delta == expected.delta);
        DC_CHECK(event.status == expected.status);
        DC_CHECK(event.data[0] == expected.data1);
        DC_CHECK(event.data[1] == expected.data2);
    }
    DC_CHECK(reader.Next().kind == audio::SqEventKind::End);
}

// Split bend ranges are in 128ths of a semitone: the disc's usual 0x600 bends a full octave.
DC_TEST(audio_bend_range_in_fine_units) {
    SampleSpec spec;
    spec.bend_range = 0x600;
    const auto   bank = BuildBank(0, spec);
    audio::Mixer mixer(kRate);
    mixer.BindBank(0, audio::Bank::Create(bank.hd, bank.bd));
    mixer.SetVolume(0, 256);
    mixer.ShortMessage(0, 0x90 | (60 << 8) | (127 << 16));
    DC_CHECK_NEAR(Frequency(Pull(mixer, 0.2), 0, kRate), 441.0, 3.0);
    mixer.ShortMessage(0, 0xE0 | (0x7F << 8) | (0x7F << 16));
    Pull(mixer, 0.02);
    DC_CHECK_NEAR(Frequency(Pull(mixer, 0.2), 0, kRate), 441.0 * std::exp2(8191.0 / 8192.0), 6.0);
    mixer.ShortMessage(0, 0xE0);
    Pull(mixer, 0.02);
    DC_CHECK_NEAR(Frequency(Pull(mixer, 0.2), 0, kRate), 220.5, 2.0);
}

DC_TEST(audio_velocity_curves) {
    DC_CHECK(audio::ApplyVelocityCurve(0, 100) == 100);
    DC_CHECK(audio::ApplyVelocityCurve(1, 100) == 28);
    DC_CHECK(audio::ApplyVelocityCurve(2, 100) == 78);
    DC_CHECK(audio::ApplyVelocityCurve(2, 5) == 1);
    DC_CHECK(audio::ApplyVelocityCurve(3, 100) == 50);
    DC_CHECK(audio::ApplyVelocityCurve(4, 100) == 122);
    DC_CHECK(audio::ApplyVelocityCurve(5, 100) == 6);
}

// A sample's SPU attribute picks the core whatever the port, and only its send bits feed reverb.
DC_TEST(audio_spu_attribute_core_and_send) {
    auto tail = [](std::uint8_t attribute) {
        SampleSpec spec;
        spec.spu_attr = attribute;
        const auto   bank = BuildBank(0, spec);
        audio::Mixer mixer(kRate);
        mixer.BindBank(0, audio::Bank::Create(bank.hd, bank.bd));
        mixer.SetVolume(0, 256);
        mixer.SetReverb(1, 5, 100);
        mixer.ShortMessage(0, 0x90 | (60 << 8) | (127 << 16));
        Pull(mixer, 0.05);
        mixer.KeyOffCore(0);
        mixer.KeyOffCore(1);
        Pull(mixer, 0.2);
        return Rms(Pull(mixer, 0.2), 0);
    };
    DC_CHECK(tail(0x2F) > 1e-4);
    DC_CHECK(tail(0x23) < 1e-6);
    DC_CHECK(tail(0x1F) < 1e-6);

    SampleSpec spec;
    spec.spu_attr = 0x23;
    const auto   bank = BuildBank(0, spec);
    audio::Mixer mixer(kRate);
    mixer.BindBank(0, audio::Bank::Create(bank.hd, bank.bd));
    mixer.SetVolume(0, 256);
    mixer.ShortMessage(0, 0x90 | (60 << 8) | (127 << 16));
    mixer.KeyOffCore(0);
    Pull(mixer, 0.1);
    DC_CHECK(mixer.ActiveVoices() == 1);
    mixer.KeyOffCore(1);
    Pull(mixer, 0.1);
    DC_CHECK(mixer.ActiveVoices() == 0);
}
