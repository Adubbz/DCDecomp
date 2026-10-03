#include <gtest/gtest.h>

#include <algorithm>
#include <cmath>
#include <complex>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <iterator>
#include <numbers>
#include <set>
#include <span>
#include <string>
#include <vector>

#include "../audio/mixer.hpp"
#include "../audio/wav.hpp"
#include "audio_fixture.hpp"

// The title's music on the real PAL data (DC_DATA): titledat/title.pak's banks and sequences played
// through the mixer the way CSound binds them. Skipped without the data. DC_AUDIO_TEST_WAV=<dir>
// also writes what each case rendered there, to listen to.

namespace fs = std::filesystem;

namespace {

struct Pack {
    std::vector<std::uint8_t> bytes;

    // A member's bytes; retail's PACK_ENTRY is a 64-byte name, then offset, size and the next
    // entry's distance, each relative to the entry.
    std::span<const std::uint8_t> Member(const char *name) const {
        std::size_t at = 0;
        while (at + 76 <= bytes.size() && bytes[at] != 0) {
            const auto field = [&](int index) {
                std::int32_t value;
                std::memcpy(&value, bytes.data() + at + 64 + index * 4, 4);
                return value;
            };
            const char *entry = reinterpret_cast<const char *>(bytes.data() + at);
            if (strncasecmp(entry, name, 64) == 0 && field(0) >= 0 && field(1) >= 0 &&
                at + field(0) + field(1) <= bytes.size()) {
                return std::span(bytes).subspan(at + field(0), field(1));
            }
            if (field(2) <= 0) {
                break;
            }
            at += field(2);
        }
        return {};
    }
};

// The title pack out of DC_DATA; a case is skipped where there is none.
class AudioRealData : public testing::Test {
protected:
    void SetUp() override {
        const char *data = std::getenv("DC_DATA");
        if (data == nullptr || *data == '\0') {
            GTEST_SKIP() << "DC_DATA is not set";
        }
        std::ifstream file(fs::path(data) / "titledat" / "title.pak", std::ios::binary);
        if (!file) {
            GTEST_SKIP() << "DC_DATA holds no titledat/title.pak";
        }
        pack.bytes.assign(std::istreambuf_iterator<char>(file), std::istreambuf_iterator<char>());
    }

    Pack pack;
};

std::shared_ptr<audio::Bank> LoadBank(const Pack &pack, const char *stem) {
    const std::string hd = std::string(stem) + ".hd";
    const std::string bd = std::string(stem) + ".bd";
    auto              bank = audio::Bank::Create(pack.Member(hd.c_str()), pack.Member(bd.c_str()));
    EXPECT_TRUE(bank != nullptr);
    return bank;
}

std::vector<float> Render(audio::Mixer &mixer, double seconds) {
    std::vector<float> out(static_cast<std::size_t>(seconds * mixer.Rate()) * 2);
    mixer.Render(out.data(), static_cast<int>(out.size() / 2));
    return out;
}

void Dump(const char *name, std::span<const float> stereo, int rate) {
    const char *dir = std::getenv("DC_AUDIO_TEST_WAV");
    if (dir == nullptr || *dir == '\0') {
        return;
    }
    audio::WavWriter writer;
    ASSERT_TRUE(writer.Open((fs::path(dir) / name).c_str(), rate));
    writer.Append(stereo.data(), static_cast<int>(stereo.size() / 2));
}

// The strongest frequency of the left channel over a window, from a direct DFT on a semitone grid
// between 55 Hz and 1.8 kHz, as a MIDI note number.
int DominantNote(std::span<const float> stereo, int rate) {
    int    best = -1;
    double best_power = 0.0;
    for (int note = 33; note <= 93; note++) {
        const double         frequency = 440.0 * std::exp2((note - 69) / 12.0);
        std::complex<double> sum;
        for (std::size_t i = 0; i < stereo.size() / 2; i++) {
            sum += double(stereo[i * 2]) *
                   std::polar(1.0, -2.0 * std::numbers::pi * frequency * double(i) / rate);
        }
        if (std::norm(sum) > best_power) {
            best_power = std::norm(sum);
            best = note;
        }
    }
    return best;
}

float Peak(std::span<const float> stereo) {
    float peak = 0.0f;
    for (float v : stereo) {
        peak = std::max(peak, std::fabs(v));
    }
    return peak;
}

} // namespace

// The title screen's music is t01a_e.sq on the ambient port at sqtbl.txt's volume of 88: two long
// recordings (left and right, one split each) whose halves cross-fade every 18 beats in an endless
// loop, behind an expression ramp over the first 3800 ticks.
TEST_F(AudioRealData, TitleMusic) {
    audio::Mixer mixer;
    mixer.BindBank(1, LoadBank(pack, "t01a_e"));
    auto sequence = audio::SqFile::Create(pack.Member("t01a_e.sq"));
    ASSERT_TRUE(sequence != nullptr);
    ASSERT_TRUE(sequence->Songs().size() == 1);
    ASSERT_TRUE(sequence->Songs()[0].division == 480);
    mixer.SetSequence(1, sequence);
    mixer.SetVolume(1, 88);
    mixer.Rewind(1, 0);
    mixer.Play(1);

    // The loop closes at tick 23035, 32.4 s in; the second window is past the jump back.
    const auto out = Render(mixer, 36.0);
    Dump("title-music.wav", out, mixer.Rate());
    ASSERT_TRUE(mixer.IsPlaying(1));
    ASSERT_TRUE(Peak(out) < 0.99f);
    const std::size_t block = mixer.Rate() / 10;
    for (const std::size_t start : {6, 33}) {
        for (std::size_t at = start * mixer.Rate(); at + block <= (start + 2) * std::size_t(mixer.Rate());
             at += block) {
            const auto window = std::span(out).subspan(at * 2, block * 2);
            ASSERT_TRUE(audio_fixture::Rms(window, 0) > 0.01);
            ASSERT_TRUE(audio_fixture::Rms(window, 1) > 0.01);
        }
    }
}

// The title's BGM-port sequence, v16a_a.sq at its table volume of 78, which the opening book
// starts: a melody, so its 2 s must hold more than one pitch.
TEST_F(AudioRealData, TitleBgm) {
    audio::Mixer mixer;
    mixer.BindBank(0, LoadBank(pack, "v16a_a"));
    auto sequence = audio::SqFile::Create(pack.Member("v16a_a.sq"));
    ASSERT_TRUE(sequence != nullptr);
    mixer.SetSequence(0, sequence);
    mixer.SetVolume(0, 78);
    mixer.Rewind(0, 0);
    mixer.Play(0);

    const auto out = Render(mixer, 10.0);
    Dump("opening-bgm.wav", out, mixer.Rate());
    ASSERT_TRUE(mixer.IsPlaying(0));
    ASSERT_TRUE(Peak(out) < 0.99f);
    const std::size_t block = mixer.Rate() / 10;
    std::set<int>     notes;
    for (std::size_t at = 2 * mixer.Rate(); at + block <= 4 * std::size_t(mixer.Rate()); at += block) {
        const auto window = std::span(out).subspan(at * 2, block * 2);
        ASSERT_TRUE(audio_fixture::Rms(window, 0) > 0.005);
        notes.insert(DominantNote(window, mixer.Rate()));
    }
    ASSERT_TRUE(notes.size() > 1);
}

// The title's effects as TiPlayVolSE sends them (bank, program, setbl.txt volume) through the banks
// CSound binds: t01a_c on port 15, t01a_i on 14, sysa_m on 13. Each must sound in its second.
TEST_F(AudioRealData, TitleEffects) {
    audio::Mixer mixer;
    mixer.BindBank(15, LoadBank(pack, "t01a_c"));
    mixer.BindBank(14, LoadBank(pack, "t01a_i"));
    mixer.BindBank(13, LoadBank(pack, "sysa_m"));
    mixer.SetReverb(0, 4, 5);

    struct Effect {
        int port, bank, program, volume;
    };

    constexpr Effect kEffects[] = {
        {14, 38,  21, 55 },
        {13, 122, 25, 75 },
        {13, 122, 24, 110},
        {14, 38,  20, 44 },
        {15, 16,  24, 14 },
    };
    std::vector<float> out;
    for (const Effect &effect : kEffects) {
        mixer.SetVolume(effect.port, 256);
        mixer.ShortMessage(effect.port, static_cast<std::uint32_t>((effect.bank << 8) | 0xC0));
        const std::uint8_t volume[] = {0xF9, 0, 0, static_cast<std::uint8_t>(effect.volume), 0};
        const std::uint8_t pan[] = {0xF9, 1, 0, 64, 0};
        const std::uint8_t on[] = {0xFD, 0x10, 0, static_cast<std::uint8_t>(effect.program), 0, 127, 0};
        mixer.HsMessage(effect.port, volume);
        mixer.HsMessage(effect.port, pan);
        mixer.HsMessage(effect.port, on);
        const auto second = Render(mixer, 1.2);
        ASSERT_TRUE(audio_fixture::Rms(std::span(second).first(second.size() / 4), 0) > 0.002);
        ASSERT_TRUE(Peak(second) < 0.99f);
        out.insert(out.end(), second.begin(), second.end());
    }
    Dump("title-se.wav", out, mixer.Rate());
}
