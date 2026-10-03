#include <gtest/gtest.h>

#include <random>

#include "../audio/hdbank.hpp"
#include "../audio/sq.hpp"
#include "audio_fixture.hpp"

using namespace audio_fixture;

TEST(AudioHdbank, HdParse) {
    audio_fixture::SampleSpec spec;
    spec.base_note = 57;
    spec.pan = 40;
    spec.volume = 90;
    const auto bank = BuildBank(2, spec);
    const auto header = audio::HdBank::Parse(bank.hd);
    ASSERT_TRUE(header.has_value());
    ASSERT_TRUE(header->programs.size() == 3);
    ASSERT_TRUE(!header->programs[0].present);
    ASSERT_TRUE(header->programs[2].present);
    ASSERT_TRUE(header->programs[2].splits.size() == 1);
    ASSERT_TRUE(header->programs[2].splits[0].key_high == 127);
    ASSERT_TRUE(header->programs[2].splits[0].bend_low == 2 * audio::kFinePerSemitone);
    ASSERT_TRUE(header->sample_sets.size() == 1);
    ASSERT_TRUE(header->samples.size() == 1);
    ASSERT_TRUE(header->samples[0].base_note == 57);
    ASSERT_TRUE(header->samples[0].pan == 40);
    ASSERT_TRUE(header->samples[0].volume == 90);
    ASSERT_TRUE(header->samples[0].adsr2 == 0x1FCA);
    ASSERT_TRUE(header->vags.size() == 1);
    ASSERT_TRUE(header->vags[0].offset == 16);
    ASSERT_TRUE(header->vags[0].rate == 44100);

    const auto playable = audio::Bank::Create(bank.hd, bank.bd);
    ASSERT_TRUE(playable != nullptr);
    audio::Layer layers[4];
    ASSERT_TRUE(playable->Resolve(2, 60, 100, layers) == 1);
    ASSERT_TRUE(layers[0].vag->pcm.size() == 700);
    ASSERT_TRUE(layers[0].rate == 44100);
    ASSERT_TRUE(playable->Resolve(0, 60, 100, layers) == 0);
    ASSERT_TRUE(playable->Resolve(9, 60, 100, layers) == 0);
    ASSERT_TRUE(playable->ResolveSplit(2, 0, 100, layers) == 1);
    ASSERT_TRUE(playable->ResolveSplit(2, 1, 100, layers) == 0);
}

TEST(AudioHdbank, HdHostileInput) {
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

TEST(AudioHdbank, SqParse) {
    const auto sq = BuildSq(Track{}.Tempo(0, 250000).Event(0, {0x91, 60, 100}).Event(240, {61, 0}).End(0).events, 96);
    const auto file = audio::SqFile::Create(sq);
    ASSERT_TRUE(file != nullptr);
    ASSERT_TRUE(file->Songs().size() == 1);
    ASSERT_TRUE(file->Songs()[0].division == 96);
    audio::SqReader reader(file->Events(file->Songs()[0]));
    auto            tempo = reader.Next();
    ASSERT_TRUE(tempo.kind == audio::SqEventKind::Meta && tempo.meta == 0x51 && tempo.payload.size() == 3);
    auto on = reader.Next();
    ASSERT_TRUE(on.kind == audio::SqEventKind::Channel && on.status == 0x91 && on.data[0] == 60 && on.data[1] == 100);
    auto running = reader.Next();
    ASSERT_TRUE(running.delta == 240 && running.status == 0x91 && running.data[0] == 61 && running.data[1] == 0);
    ASSERT_TRUE(reader.Next().kind == audio::SqEventKind::End);
    ASSERT_TRUE(audio::SqFile::Create(std::vector<std::uint8_t>(64, 0)) == nullptr);
}
