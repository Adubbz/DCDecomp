#include <random>

#include "../audio/hdbank.hpp"
#include "../audio/sq.hpp"
#include "audio_fixture.hpp"
#include "test.hpp"

using namespace audio_fixture;

DC_TEST(audio_hd_parse) {
    audio_fixture::SampleSpec spec;
    spec.base_note = 57;
    spec.pan = 40;
    spec.volume = 90;
    const auto bank = BuildBank(2, spec);
    const auto header = audio::HdBank::Parse(bank.hd);
    DC_CHECK(header.has_value());
    DC_CHECK(header->programs.size() == 3);
    DC_CHECK(!header->programs[0].present);
    DC_CHECK(header->programs[2].present);
    DC_CHECK(header->programs[2].splits.size() == 1);
    DC_CHECK(header->programs[2].splits[0].key_high == 127);
    DC_CHECK(header->programs[2].splits[0].bend_low == 2);
    DC_CHECK(header->sample_sets.size() == 1);
    DC_CHECK(header->samples.size() == 1);
    DC_CHECK(header->samples[0].base_note == 57);
    DC_CHECK(header->samples[0].pan == 40);
    DC_CHECK(header->samples[0].volume == 90);
    DC_CHECK(header->samples[0].adsr2 == 0x1FCA);
    DC_CHECK(header->vags.size() == 1);
    DC_CHECK(header->vags[0].offset == 16);
    DC_CHECK(header->vags[0].rate == 44100);

    const auto playable = audio::Bank::Create(bank.hd, bank.bd);
    DC_CHECK(playable != nullptr);
    audio::Layer layers[4];
    DC_CHECK(playable->Resolve(2, 60, 100, layers) == 1);
    DC_CHECK(layers[0].vag->pcm.size() == 700);
    DC_CHECK(layers[0].rate == 44100);
    DC_CHECK(playable->Resolve(0, 60, 100, layers) == 0);
    DC_CHECK(playable->Resolve(9, 60, 100, layers) == 0);
    DC_CHECK(playable->ResolveSplit(2, 0, 100, layers) == 1);
    DC_CHECK(playable->ResolveSplit(2, 1, 100, layers) == 0);
}

DC_TEST(audio_hd_hostile_input) {
    const auto bank = BuildBank();
    for (std::size_t cut = 0; cut < bank.hd.size(); cut += 7) {
        const auto parsed = audio::Bank::Create(std::span(bank.hd).first(cut), bank.bd);
        if (parsed != nullptr) {
            audio::Layer layers[4];
            parsed->Resolve(0, 60, 100, layers);
        }
    }
    std::mt19937 random(1234);
    for (int round = 0; round < 200; round++) {
        auto corrupt = bank.hd;
        for (int i = 0; i < 16; i++) {
            corrupt[random() % corrupt.size()] = static_cast<std::uint8_t>(random());
        }
        const auto parsed = audio::Bank::Create(corrupt, std::span(bank.bd).first(random() % bank.bd.size()));
        if (parsed != nullptr) {
            audio::Layer layers[4];
            for (int note = 0; note < 128; note += 13) {
                parsed->Resolve(0, note, 100, layers);
            }
        }
        auto sq = BuildSq(Track{}.Event(0, {0x90, 60, 100}).End(10).events);
        for (int i = 0; i < 8; i++) {
            sq[random() % sq.size()] = static_cast<std::uint8_t>(random());
        }
        if (const auto file = audio::SqFile::Create(sq)) {
            for (const auto &song : file->Songs()) {
                audio::SqReader reader(file->Events(song));
                for (int i = 0; i < 64 && reader.Next().kind != audio::SqEventKind::End; i++) {
                }
            }
        }
    }
}

DC_TEST(audio_sq_parse) {
    const auto sq = BuildSq(Track{}.Tempo(0, 250000).Event(0, {0x91, 60, 100}).Event(240, {61, 0}).End(0).events, 96);
    const auto file = audio::SqFile::Create(sq);
    DC_CHECK(file != nullptr);
    DC_CHECK(file->Songs().size() == 1);
    DC_CHECK(file->Songs()[0].division == 96);
    audio::SqReader reader(file->Events(file->Songs()[0]));
    auto            tempo = reader.Next();
    DC_CHECK(tempo.kind == audio::SqEventKind::Meta && tempo.meta == 0x51 && tempo.payload.size() == 3);
    auto on = reader.Next();
    DC_CHECK(on.kind == audio::SqEventKind::Channel && on.status == 0x91 && on.data[0] == 60 && on.data[1] == 100);
    auto running = reader.Next();
    DC_CHECK(running.delta == 240 && running.status == 0x91 && running.data[0] == 61 && running.data[1] == 0);
    DC_CHECK(reader.Next().kind == audio::SqEventKind::End);
    DC_CHECK(audio::SqFile::Create(std::vector<std::uint8_t>(64, 0)) == nullptr);
}
