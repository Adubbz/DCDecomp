#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>

#include "../audio/mixer.hpp"
#include "audio_fixture.hpp"
#include "gameutil.hpp"
#include "snd.hpp"
#include "sound.hpp"
#include "test.hpp"

using namespace audio_fixture;

extern unsigned int *snd_read_buf;

namespace {

constexpr int kRate = 48000;

struct Member {
    std::string               name;
    std::vector<std::uint8_t> data;
};

// The game's pack layout: 76-byte entries, each with its data offset and the next entry's offset
// relative to itself, ended by an entry with an empty name.
std::vector<unsigned int> BuildPack(const std::vector<Member> &members) {
    std::vector<std::uint8_t> bytes;
    const std::size_t         entries = (members.size() + 1) * 76;
    bytes.resize(entries);
    for (std::size_t i = 0; i < members.size(); i++) {
        while (bytes.size() % 16) {
            bytes.push_back(0);
        }
        const std::size_t entry = i * 76;
        const std::size_t offset = bytes.size();
        std::strncpy(reinterpret_cast<char *>(&bytes[entry]), members[i].name.c_str(), 63);
        const int fields[3] = {static_cast<int>(offset - entry), static_cast<int>(members[i].data.size()), 76};
        std::memcpy(&bytes[entry + 64], fields, sizeof(fields));
        bytes.insert(bytes.end(), members[i].data.begin(), members[i].data.end());
    }
    std::vector<unsigned int> pack((bytes.size() + 3) / 4 + 1, 0);
    std::memcpy(pack.data(), bytes.data(), bytes.size());
    return pack;
}

std::vector<std::uint8_t> Text(const char *text) {
    return std::vector<std::uint8_t>(text, text + std::strlen(text));
}

std::vector<float> Pull(double seconds) {
    std::vector<float> out(static_cast<std::size_t>(seconds * kRate) * 2);
    audio::DefaultMixer().Render(out.data(), static_cast<int>(out.size() / 2));
    return out;
}

void LoadTestPack(bool init = true) {
    setenv("DC_AUDIO", "off", 1);
    const auto bank = BuildBank();
    Track      song;
    song.Event(0, {0xC0, 0}).Event(0, {0xB0, 7, 127}).Event(0, {0x90, 60, 127}).Event(480, {0x80, 60}).End(0);
    static std::vector<unsigned int> pack = BuildPack({
        {"bgm00.txt", Text("bgm00a.hd\r\nbgm00a.sq\r\nsnd00c.hd\r\n")},
        {"bgm00a.hd", bank.hd                                        },
        {"bgm00a.bd", bank.bd                                        },
        {"bgm00a.sq", BuildSq(song.events)                           },
        {"snd00c.hd", bank.hd                                        },
        {"snd00c.bd", bank.bd                                        },
    });
    if (init) {
        DC_CHECK(CSnd.Init(0, 0, 0, 0) == 0);
    }
    char list[] = "bgm00.txt";
    DC_CHECK(CSnd.LoadSoundFileFromPack(list, pack.data()) == 0);
}

} // namespace

DC_TEST(audio_csound_sequence_and_fade) {
    LoadTestPack();
    MIDI_STATE *state = CSnd.GetMidiState();
    DC_CHECK(state->port[0].bank != nullptr);
    DC_CHECK(state->port[1].bank != nullptr);
    DC_CHECK(state->port[0].sequence_address[0] != nullptr);
    // The sequence table comes from sound/tbl/sqtbl.txt, which a test has no disc for.
    DC_CHECK(state->port[0].sequence_count == 0);
    static MIDI_SEQUENCE description = {"bgm00a.sq", 200};
    state->port[0].sequence[0] = &description;
    state->port[0].sequence_count = 1;

    CSnd.SQ_Play(MIDI_PORT_BGM, 0);
    DC_CHECK(ezMidi(0x8090 + MIDI_PORT_BGM, 0) == 1);
    DC_CHECK(ezMidi(0x80E0 + MIDI_PORT_BGM, 0) == 200);
    const auto playing = Pull(0.3);
    DC_CHECK(Rms(playing, 0) > 0.05);
    DC_CHECK_NEAR(Frequency(playing, 0, kRate), 441.0, 3.0);

    CSnd.Fade(MIDI_PORT_BGM, -50.0f, 0);
    for (int frame = 0; frame < 3; frame++) {
        CSnd.Step();
    }
    DC_CHECK(state->port[0].fade[0].active);
    DC_CHECK(audio::DefaultMixer().Volume(MIDI_PORT_BGM) == 50);
    // Retail ends a fade only once it overshoots, so landing on the target takes one more frame.
    CSnd.Step();
    DC_CHECK(state->port[0].fade[0].active);
    DC_CHECK(audio::DefaultMixer().Volume(MIDI_PORT_BGM) == 0);
    CSnd.Step();
    DC_CHECK(!state->port[0].fade[0].active);
    DC_CHECK(audio::DefaultMixer().Volume(MIDI_PORT_BGM) == 0);
    Pull(0.05);
    DC_CHECK(Rms(Pull(0.05), 0) < 1e-6);

    CSnd.SetVol(MIDI_PORT_BGM, 256);
    CSnd.Stop(MIDI_PORT_BGM);
    DC_CHECK(ezMidi(0x8090 + MIDI_PORT_BGM, 0) == 0);
    CSnd.SQ_RePlay(MIDI_PORT_BGM);
    DC_CHECK(ezMidi(0x8090 + MIDI_PORT_BGM, 0) == 1);
    Pull(1.0);
    DC_CHECK(ezMidi(0x8090 + MIDI_PORT_BGM, 0) == 0);

    CSnd.SQ_Play(MIDI_PORT_BGM, 3);
    DC_CHECK(ezMidi(0x8090 + MIDI_PORT_BGM, 0) == 0);
}

DC_TEST(audio_csound_effects) {
    LoadTestPack();
    CSnd.SetVol(MIDI_PORT_SE_TITLE, 0x100);
    CSnd.SE_Play(MIDI_PORT_SE_TITLE, 0, 72, 0);
    // Like libmodmsin's buffers, effect messages wait for the frame's Step().
    DC_CHECK(audio::DefaultMixer().ActiveVoices() == 0);
    CSnd.Step();
    DC_CHECK(audio::DefaultMixer().ActiveVoices() == 1);
    const auto centre = Pull(0.2);
    DC_CHECK_NEAR(Frequency(centre, 0, kRate), 882.0, 6.0);
    DC_CHECK_NEAR(Rms(centre, 0), Rms(centre, 1), 0.01);

    CSnd.SE_SetPan(MIDI_PORT_SE_TITLE, 0, 72, 127, 0);
    CSnd.Step();
    Pull(0.05);
    const auto right = Pull(0.1);
    DC_CHECK(Rms(right, 0) < 1e-3);

    CSnd.SE_SetVol(MIDI_PORT_SE_TITLE, 0, 72, 0, 0);
    CSnd.Step();
    Pull(0.05);
    DC_CHECK(Rms(Pull(0.05), 1) < 1e-3);

    CSnd.SE_Stop(MIDI_PORT_SE_TITLE, 0, 72, 0);
    CSnd.Step();
    Pull(0.1);
    DC_CHECK(audio::DefaultMixer().ActiveVoices() == 0);

    CSnd.SE_Play(MIDI_PORT_SE_TITLE, 0, 60, 0x10, 0);
    CSnd.Step();
    DC_CHECK(audio::DefaultMixer().ActiveVoices() == 1);
    // The fixture's sample pins its voices to core 0, whatever port plays it.
    CSnd.StopVoice(0);
    Pull(0.1);
    DC_CHECK(audio::DefaultMixer().ActiveVoices() == 0);

    CSnd.SetStereoMode(0);
    DC_CHECK(!audio::DefaultMixer().Stereo());
    CSnd.SetStereoMode(1);
    DC_CHECK(audio::DefaultMixer().Stereo());
}

DC_TEST(audio_csound_reload_frees) {
    LoadTestPack();
    MIDI_STATE          *state = CSnd.GetMidiState();
    void                *first_bank = state->port[0].bank;
    void                *first_song = state->port[0].sequence_address[0];
    static MIDI_SEQUENCE description = {"bgm00a.sq", 100};
    state->port[0].sequence[0] = &description;
    state->port[0].sequence_count = 1;
    CSnd.SQ_Play(MIDI_PORT_BGM, 0);
    DC_CHECK(ezMidi(0x8090 + MIDI_PORT_BGM, 0) == 1);

    // Loading over a bound slot stops its port and frees its bank and sequences first.
    LoadTestPack(false);
    DC_CHECK(ezMidi(0x8090 + MIDI_PORT_BGM, 0) == 0);
    DC_CHECK(state->port[0].bank != nullptr);
    DC_CHECK(state->port[0].bank != first_bank);
    DC_CHECK(state->port[0].sequence_count == 0);
    DC_CHECK(state->port[0].sequence_address[0] != nullptr);
    DC_CHECK(state->port[0].sequence_address[0] != first_song);
    Pull(0.1);
    DC_CHECK(audio::DefaultMixer().ActiveVoices() == 0);
    DC_CHECK(state->port[2].spu_address == 0x7D010 + static_cast<int>(BuildBank().bd.size()) + 0x10);
    DC_CHECK(CSnd.GetSeNo(0, 0) == -1);
}

DC_TEST(audio_snd_read_buffer_alignment) {
    static unsigned int buffer[64];
    SndSetReadBuffer(buffer + 1);
    DC_CHECK(reinterpret_cast<std::uintptr_t>(snd_read_buf) % 64 == 0);
    DC_CHECK(snd_read_buf > buffer && snd_read_buf <= buffer + 17);
}
