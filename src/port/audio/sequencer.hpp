#pragma once

#include <array>
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
// Loops are Sony's NRPN markers, as the IOP sequencer reads them: NRPN 0 (controller 99 = 0)
// with a data entry (6) of n opens loop n just after that data entry; NRPN 1 with a data entry
// of n and a data entry LSB (38) of c closes it, jumping back c more times, or forever for 0.
// Every disc sequence has one endless loop, 99=0 6=0 ... 99=1 6=0 38=0.
class Sequencer {
public:
    static constexpr double kIdle = 1e30;
    static constexpr int    kNrpnLoopStart = 0;
    static constexpr int    kNrpnLoopEnd = 1;

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

    // Sequence ticks dispatched since the rewind, loops included.
    std::uint64_t Tick() const { return tick_; }

    void SetTraceName(int port) { trace_port_ = port; }

private:
    static constexpr int          kLoops = 8;
    static constexpr std::uint8_t kNone = 0xFF;

    struct Loop {
        std::uint8_t    id = kNone;
        std::uint8_t    remaining = kNone;
        SqReader::State resume;
    };

    bool Fetch(int rate);

    void Handle(const SqEvent &event, MidiSink &sink);

    void Controller(int controller, int value);

    Loop *FindLoop(std::uint8_t id);

    unsigned long long Ticks() const;

    std::shared_ptr<const SqFile> file_;
    const SqSong                 *song_ = nullptr;
    SqReader                      reader_;
    SqEvent                       pending_;
    bool                          has_pending_ = false;
    bool                          playing_ = false;
    double                        due_ = 0.0;
    std::uint32_t                 tempo_ = 500000;
    int                           division_ = 480;
    std::uint64_t                 tick_ = 0;
    int                           trace_port_ = -1;

    std::uint8_t             nrpn_ = kNone;
    std::uint8_t             data_entry_ = kNone;
    std::array<Loop, kLoops> loops_;
};

} // namespace audio
