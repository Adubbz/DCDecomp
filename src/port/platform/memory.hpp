#pragma once

#include <cstddef>
#include <cstdint>

// Memory the game may truncate pointers into. The game casts pointers to int and back; the cast
// back sign-extends, so a round trip only survives below 2 GiB, not 4.
//
// Linux maps with MAP_32BIT. macOS has no such flag: the mapper asks for hint addresses in the
// low range, retries across it and checks the result. An x86-64 Mach-O must be linked with
// -Wl,-pagezero_size,0x1000 so the low 4 GiB are not reserved as __PAGEZERO. arm64 macOS refuses
// to load a 64-bit arm64 executable whose hard page zero does not cover the whole low 4 GiB
// (xnu bsd/kern/mach_loader.c, load_machfile), so there nothing can ever be mapped low and every
// truncation the game reaches has to be widened instead (docs/port/truncations.md).
// DC_LOW_MEMORY=any maps anywhere with a warning, for finding those sites.
inline constexpr std::uintptr_t kLowMemoryLimit = 0x80000000u;

struct LowBlock {
    unsigned char *map = nullptr;
    std::size_t    map_size = 0; // guard page included
    unsigned char *base = nullptr;
    std::size_t    capacity = 0;
    std::size_t    lead = 0;
};

enum class LowMemoryStrategy : std::uint8_t {
    Native, // MAP_32BIT and madvise on Linux, Hinted on macOS
    Hinted, // portable mmap hints and fixed re-mapping; macOS's path, forcible anywhere for tests
};

// Zeroed: capacity (bytes rounded up to 64) usable bytes at base, lead usable bytes before
// base, then an inaccessible page. The whole mapping is below kLowMemoryLimit, or the process
// aborts with a message.
LowBlock LowMemoryMap(std::size_t bytes, std::size_t lead = 0);
LowBlock LowMemoryMap(LowMemoryStrategy strategy, std::size_t bytes, std::size_t lead = 0);
// Zeroes every usable byte (lead included) and returns the pages to the system.
void LowMemoryZero(const LowBlock &block);
void LowMemoryZero(LowMemoryStrategy strategy, const LowBlock &block);
// The first byte of the inaccessible page after base + capacity.
const unsigned char *LowMemoryGuard(const LowBlock &block);
void                 LowMemoryUnmap(LowBlock &block);
std::size_t          LowMemoryPageSize();
// False under DC_LOW_MEMORY=any.
bool LowMemoryEnforced();

inline bool IsLowAddress(const void *pointer, std::size_t bytes = 1) {
    auto address = reinterpret_cast<std::uintptr_t>(pointer);
    return address < kLowMemoryLimit && bytes <= kLowMemoryLimit - address;
}
