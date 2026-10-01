#pragma once

#include <cstdint>
#include <memory>

#include "sq.hpp"

namespace audio {

class MidiSink {
public:
    virtual void ChannelMessage(std::uint8_t status, std::uint8_t data1, std::uint8_t data2) = 0;

protected:
    ~MidiSink() = default;
};

// Plays one SQ song on one port in output samples, so its timing follows the audio clock.
// Loops are Sony's NRPN markers: controller 99 = 20 opens a loop (a data entry right after it
// sets the count, 0 or 127 for endless) and 99 = 30 closes it.
class Sequencer {
public:
    static constexpr int    kLoopStart = 20;
    static constexpr int    kLoopEnd = 30;
    static constexpr double kIdle = 1e30;
    static constexpr int    kNoLoop = 0;
    static constexpr int    kLoopEndless = -1;

    void SetSequence(std::shared_ptr<const SqFile> file);

    // Positions at the start of song; keeps playing or stopped as it was.
    void Rewind(int song);

    void Play();

    void Stop() { playing_ = false; }

    bool Playing() const { return playing_; }

    // Output samples until the next event is due, or kIdle while stopped.
    double SamplesToNext() const { return playing_ ? due_ : kIdle; }

    // Dispatches every event due now.
    void DispatchDue(int rate, MidiSink &sink);

    void Elapse(double samples) {
        if (playing_) {
            due_ -= samples;
        }
    }

    std::uint32_t Tempo() const { return tempo_; }

private:
    bool Fetch(int rate);

    void Handle(const SqEvent &event, MidiSink &sink);

    std::shared_ptr<const SqFile> file_;
    const SqSong                 *song_ = nullptr;
    SqReader                      reader_;
    SqEvent                       pending_;
    bool                          has_pending_ = false;
    bool                          playing_ = false;
    double                        due_ = 0.0;
    std::uint32_t                 tempo_ = 500000;
    int                           division_ = 480;

    std::size_t  loop_position_ = 0;
    std::uint8_t loop_running_ = 0;
    int          loop_count_ = kNoLoop;
    bool         loop_entry_ = false;
};

} // namespace audio
