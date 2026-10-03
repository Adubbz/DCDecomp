#include <gtest/gtest.h>

#include "../audio/synth.hpp"

namespace {

int TicksUntil(audio::Envelope &envelope, audio::Envelope::Phase phase, int limit = 10'000'000) {
    int ticks = 0;
    while (envelope.CurrentPhase() != phase && ticks < limit) {
        envelope.Tick();
        ticks++;
    }
    return ticks;
}

} // namespace

TEST(AudioEnvelope, Phases) {
    audio::Envelope envelope;
    // Linear attack, shift 0 step +7: 7 << 11 per tick.
    envelope.KeyOn(0x0000 | (0x8 << 4) | 0x7, 0x1FC0 | 10);
    const int attack = TicksUntil(envelope, audio::Envelope::Phase::Decay);
    ASSERT_TRUE(attack == (0x7FFF + (7 << 11) - 1) / (7 << 11));
    ASSERT_TRUE(envelope.Level() == 0x7FFF);

    TicksUntil(envelope, audio::Envelope::Phase::Sustain);
    ASSERT_TRUE(envelope.Level() <= 8 * 0x800);
    ASSERT_TRUE(envelope.Level() > 7 * 0x800);
    const int sustain = envelope.Level();
    for (int i = 0; i < 1000; i++) {
        envelope.Tick();
    }
    ASSERT_TRUE(envelope.Level() >= sustain);

    // Linear release, shift 10: -8 << 1 per tick.
    envelope.KeyOff();
    const int level = envelope.Level();
    const int release = TicksUntil(envelope, audio::Envelope::Phase::Off);
    ASSERT_TRUE(release == (level + 15) / 16);
}

TEST(AudioEnvelope, Exponential) {
    audio::Envelope linear;
    audio::Envelope exponential;
    // Attack shift 13 step +7: one step every 4 ticks, four times slower above 0x6000 when exponential.
    linear.KeyOn(0x3400 | 0xFF, 0x1FC0);
    exponential.KeyOn(0x8000 | 0x3400 | 0xFF, 0x1FC0 | 0x28);
    const int a = TicksUntil(linear, audio::Envelope::Phase::Decay);
    const int b = TicksUntil(exponential, audio::Envelope::Phase::Decay);
    ASSERT_TRUE(b > a * 3 / 2);

    // Exponential release still reaches silence.
    exponential.KeyOff();
    const int release = TicksUntil(exponential, audio::Envelope::Phase::Off);
    ASSERT_TRUE(release < 10'000'000);
    ASSERT_TRUE(exponential.Level() == 0);
}
