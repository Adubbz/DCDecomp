#include "sequencer.hpp"

#include "trace.hpp"

namespace audio {

void Sequencer::SetSequence(std::shared_ptr<const SqFile> file) {
    playing_ = false;
    file_ = std::move(file);
    song_ = nullptr;
    Rewind(0);
}

void Sequencer::Rewind(int song) {
    has_pending_ = false;
    tempo_ = 500000;
    tick_ = 0;
    nrpn_ = kNone;
    data_entry_ = kNone;
    loops_ = {};
    song_ = nullptr;
    reader_ = SqReader{};
    if (file_ == nullptr || song < 0 || song >= static_cast<int>(file_->Songs().size())) {
        return;
    }
    song_ = &file_->Songs()[song];
    division_ = song_->division;
    reader_ = SqReader(file_->Events(*song_));
}

void Sequencer::Play() {
    if (song_ == nullptr) {
        return;
    }
    playing_ = true;
}

bool Sequencer::Fetch(int rate) {
    pending_ = reader_.Next();
    has_pending_ = pending_.kind != SqEventKind::End;
    const double samples_per_tick = tempo_ * 1e-6 * rate / division_;
    due_ += pending_.delta * samples_per_tick;
    return has_pending_;
}

void Sequencer::DispatchDue(int rate, MidiSink &sink) {
    if (!playing_) {
        return;
    }
    if (!has_pending_) {
        due_ = 0.0;
        if (!Fetch(rate)) {
            playing_ = false;
            Trace("port %d: sequence ended at tick %llu", trace_port_, Ticks());
            return;
        }
    }
    // An empty loop body would otherwise spin here forever.
    for (int budget = 1 << 16; playing_ && due_ <= 0.0; budget--) {
        if (budget == 0) {
            playing_ = false;
            break;
        }
        tick_ += pending_.delta;
        Handle(pending_, sink);
        if (!Fetch(rate)) {
            playing_ = false;
            Trace("port %d: sequence ended at tick %llu", trace_port_, Ticks());
        }
    }
}

unsigned long long Sequencer::Ticks() const {
    return tick_;
}

Sequencer::Loop *Sequencer::FindLoop(std::uint8_t id) {
    for (Loop &loop : loops_) {
        if (loop.id == id) {
            return &loop;
        }
    }
    return nullptr;
}

void Sequencer::Controller(int controller, int value) {
    switch (controller) {
        case 99:
            nrpn_ = static_cast<std::uint8_t>(value);
            data_entry_ = kNone;
            return;
        case 6: {
            data_entry_ = static_cast<std::uint8_t>(value);
            if (nrpn_ != kNrpnLoopStart) {
                return;
            }
            Loop *loop = FindLoop(data_entry_);
            if (loop == nullptr) {
                loop = FindLoop(kNone);
            }
            if (loop == nullptr) {
                Trace("port %d: loop table full", trace_port_);
                return;
            }
            loop->id = data_entry_;
            loop->remaining = kNone;
            loop->resume = reader_.Save();
            Trace("port %d: tick %llu loop %d start", trace_port_, Ticks(), value);
            return;
        }
        case 38: {
            if (nrpn_ != kNrpnLoopEnd || data_entry_ == kNone) {
                return;
            }
            Loop *loop = FindLoop(data_entry_);
            if (loop == nullptr) {
                Trace("port %d: loop %d ends but never started", trace_port_, data_entry_);
                return;
            }
            if (loop->remaining == kNone) {
                loop->remaining = static_cast<std::uint8_t>(value);
            }
            if (value != 0 && loop->remaining == 0) {
                loop->remaining = kNone;
                return;
            }
            Trace("port %d: tick %llu loop %d back (%d more)", trace_port_, Ticks(),
                  data_entry_, value == 0 ? -1 : loop->remaining);
            reader_.Restore(loop->resume);
            if (value != 0) {
                loop->remaining--;
            }
            return;
        }
        default:
            return;
    }
}

void Sequencer::Handle(const SqEvent &event, MidiSink &sink) {
    if (event.kind == SqEventKind::Meta) {
        if (event.meta == 0x51 && event.payload.size() >= 3) {
            const std::uint32_t tempo = (event.payload[0] << 16) | (event.payload[1] << 8) | event.payload[2];
            if (tempo != 0) {
                tempo_ = tempo;
                Trace("port %d: tick %llu tempo %u us per beat", trace_port_, Ticks(),
                      tempo);
            }
        }
        return;
    }
    if (event.kind != SqEventKind::Channel) {
        return;
    }
    // The IOP sequencer passes the loop markers on to the synth too.
    if ((event.status & 0xF0) == 0xB0) {
        Controller(event.data[0], event.data[1]);
    }
    sink.ChannelMessage(event.status, event.data[0], event.data[1]);
}

} // namespace audio
