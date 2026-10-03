#pragma once

#include <cstddef>
#include <cstdint>

// The arenas' memory. The game casts pointers to int and back, and the cast back sign-extends, so
// a round trip only survives below 2 GiB. Linux maps the arenas there with MAP_32BIT.
//
// arm64 macOS cannot: xnu refuses to exec a 64-bit arm64 image whose hard page zero does not cover
// the whole low 4 GiB (bsd/kern/mach_loader.c, load_machfile), and the map's minimum address then
// keeps every mapping above it. There the arenas are ordinary high memory and every truncation the
// game reaches must be widened instead (docs/port/truncations.md). The high path runs on Linux too,
// with DC_HIGH_ARENAS=1 or ArenaMemorySetHigh, so those truncations show up here.
inline constexpr std::uintptr_t kLowMemoryLimit = 0x80000000u;

struct ArenaMemory {
    unsigned char *map = nullptr;
    std::size_t    map_size = 0; // guard page included
    unsigned char *base = nullptr;
    std::size_t    capacity = 0;
    std::size_t    lead = 0;
};

// Before the first ArenaMemoryMap only.
void ArenaMemorySetHigh(bool high);
// True when ArenaMemoryMap puts every mapping below kLowMemoryLimit.
bool ArenaMemoryIsLow();

// Zeroed: capacity (bytes rounded up to 64) usable bytes at base, lead usable bytes before base,
// then an inaccessible page. Aborts with a message when the memory cannot be had.
ArenaMemory ArenaMemoryMap(std::size_t bytes, std::size_t lead = 0);
// Zeroes every usable byte (lead included) and returns the pages to the system.
void ArenaMemoryZero(const ArenaMemory &memory);
// macOS's zeroing (a fixed anonymous mapping over the range), callable anywhere for tests.
void ArenaMemoryZeroByRemap(const ArenaMemory &memory);
// The first byte of the inaccessible page after base + capacity.
const unsigned char *ArenaMemoryGuard(const ArenaMemory &memory);
void                 ArenaMemoryUnmap(ArenaMemory &memory);
std::size_t          ArenaMemoryPageSize();

inline bool IsLowAddress(const void *pointer, std::size_t bytes = 1) {
    auto address = reinterpret_cast<std::uintptr_t>(pointer);
    return address < kLowMemoryLimit && bytes <= kLowMemoryLimit - address;
}
