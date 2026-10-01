#include "sequencer.hpp"

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
    loop_count_ = kNoLoop;
    loop_entry_ = false;
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
            return;
        }
    }
    // An empty loop body would otherwise spin here forever.
    for (int budget = 1 << 16; playing_ && due_ <= 0.0; budget--) {
        if (budget == 0) {
            playing_ = false;
            break;
        }
        Handle(pending_, sink);
        if (!Fetch(rate)) {
            playing_ = false;
        }
    }
}

void Sequencer::Handle(const SqEvent &event, MidiSink &sink) {
    if (event.kind == SqEventKind::Meta) {
        if (event.meta == 0x51 && event.payload.size() >= 3) {
            const std::uint32_t tempo = (event.payload[0] << 16) | (event.payload[1] << 8) | event.payload[2];
            if (tempo != 0) {
                tempo_ = tempo;
            }
        }
        return;
    }
    if (event.kind != SqEventKind::Channel) {
        return;
    }
    if ((event.status & 0xF0) == 0xB0) {
        if (event.data[0] == 99 && event.data[1] == kLoopStart) {
            loop_position_ = reader_.Position();
            loop_running_ = reader_.RunningStatus();
            loop_count_ = kLoopEndless;
            loop_entry_ = true;
            return;
        }
        if (event.data[0] == 6 && loop_entry_) {
            loop_count_ = (event.data[1] == 0 || event.data[1] == 127) ? kLoopEndless : event.data[1];
            loop_entry_ = false;
            return;
        }
        loop_entry_ = false;
        if (event.data[0] == 99 && event.data[1] == kLoopEnd) {
            if (loop_count_ == kNoLoop) {
                return;
            }
            if (loop_count_ != kLoopEndless && --loop_count_ == 0) {
                loop_count_ = kNoLoop;
                return;
            }
            reader_.Seek(loop_position_, loop_running_);
            return;
        }
    }
    sink.ChannelMessage(event.status, event.data[0], event.data[1]);
}

} // namespace audio
