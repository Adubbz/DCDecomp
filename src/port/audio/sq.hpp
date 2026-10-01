#pragma once

#include <cstddef>
#include <cstdint>
#include <memory>
#include <span>
#include <vector>

namespace audio {

namespace sq {
constexpr std::size_t kMidiCount = 0x0C;
constexpr std::size_t kMidiOffsets = 0x10;
constexpr std::size_t kBlockDataOffset = 0;
constexpr std::size_t kBlockDivision = 4;
constexpr std::size_t kBlockMinSize = 6;
} // namespace sq

struct SqSong {
    std::size_t begin = 0;
    std::size_t end = 0;
    int         division = 480;
};

class SqFile {
public:
    // Copies the file: the game reuses its load buffer as soon as the call returns.
    static std::shared_ptr<SqFile> Create(std::span<const std::uint8_t> sq);

    const std::vector<SqSong> &Songs() const { return songs_; }

    std::span<const std::uint8_t> Events(const SqSong &song) const {
        return std::span<const std::uint8_t>(data_).subspan(song.begin, song.end - song.begin);
    }

private:
    std::vector<std::uint8_t> data_;
    std::vector<SqSong>       songs_;
};

enum class SqEventKind {
    Channel,
    Meta,
    SysEx,
    End,
};

struct SqEvent {
    std::uint32_t                 delta = 0;
    SqEventKind                   kind = SqEventKind::End;
    std::uint8_t                  status = 0;
    std::uint8_t                  data[2] = {0, 0};
    std::uint8_t                  meta = 0;
    std::span<const std::uint8_t> payload;
};

// SMF-style track data: variable-length deltas, running status, meta and SysEx events.
class SqReader {
public:
    SqReader() = default;

    explicit SqReader(std::span<const std::uint8_t> events) : events_(events) {}

    // Reads the next event; a truncated stream reads as End.
    SqEvent Next();

    std::size_t Position() const { return position_; }

    std::uint8_t RunningStatus() const { return running_; }

    void Seek(std::size_t position, std::uint8_t running) {
        position_ = position;
        running_ = running;
    }

private:
    bool ReadVarLen(std::uint32_t &value);

    std::span<const std::uint8_t> events_;
    std::size_t                   position_ = 0;
    std::uint8_t                  running_ = 0;
};

} // namespace audio
