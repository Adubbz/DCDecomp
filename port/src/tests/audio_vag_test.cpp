#include <cstdlib>

#include "../audio/vag.hpp"
#include "audio_fixture.hpp"
#include "test.hpp"

using namespace audio_fixture;

DC_TEST(audio_vag_roundtrip_sine) {
    const auto sine = Sine(441.0, 44100, 700, 0.5);
    const auto vag = EncodeVag(sine, true);
    DC_CHECK(vag.size() == 25 * 16);
    const auto decoded = audio::DecodeVag(vag);
    DC_CHECK(decoded.pcm.size() == 700);
    DC_CHECK(decoded.loops);
    DC_CHECK(decoded.loop_start == 0);
    double error = 0.0, signal = 0.0;
    for (std::size_t i = 0; i < sine.size(); i++) {
        error += double(decoded.pcm[i] - sine[i]) * (decoded.pcm[i] - sine[i]);
        signal += double(sine[i]) * sine[i];
    }
    // 4-bit ADPCM on a clean sine stays well above 30 dB SNR.
    DC_CHECK(10.0 * std::log10(signal / error) > 30.0);
}

DC_TEST(audio_vag_filter_arithmetic) {
    std::uint8_t block[16] = {};
    block[0] = 0x10;
    block[2] = 0x01;
    audio::VagDecoder decoder;
    std::int16_t      out[28];
    decoder.DecodeBlock(block, out);
    DC_CHECK(out[0] == 4096);
    DC_CHECK(out[1] == (4096 * 60 + 32) >> 6);
    DC_CHECK(out[2] == ((out[1] * 60 + 32) >> 6));

    std::uint8_t negative[16] = {};
    negative[0] = 0x04;
    negative[2] = 0x08;
    audio::VagDecoder fresh;
    fresh.DecodeBlock(negative, out);
    DC_CHECK(out[0] == -32768 >> 4);
}

DC_TEST(audio_vag_loop_flags) {
    std::vector<std::uint8_t> data(16 * 5, 0);
    data[1] = 0x00;
    data[16 + 1] = audio::kVagLoopStart | audio::kVagLoopRepeat;
    data[32 + 1] = audio::kVagLoopRepeat;
    data[48 + 1] = audio::kVagLoopEnd | audio::kVagLoopRepeat;
    data[64 + 1] = 0x07;
    auto looped = audio::DecodeVag(data);
    DC_CHECK(looped.pcm.size() == 4 * 28);
    DC_CHECK(looped.loops);
    DC_CHECK(looped.loop_start == 28);

    data[48 + 1] = audio::kVagLoopEnd;
    auto one_shot = audio::DecodeVag(data);
    DC_CHECK(one_shot.pcm.size() == 4 * 28);
    DC_CHECK(!one_shot.loops);

    auto truncated = audio::DecodeVag(std::span(data).first(37));
    DC_CHECK(truncated.pcm.size() == 2 * 28);
    DC_CHECK(!truncated.loops);
}
