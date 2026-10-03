#pragma once

#include <cstddef>

#include "platform/memory.hpp"

// Every arena the port carves gets this many times the quadwords retail asked
// for: the game sizes many allocations with the host's sizeof, which grows
// with 8-byte pointers.
constexpr int kArenaHeadroom = 4;

// A zeroed, 64-byte aligned block of at least `bytes`, with `lead` usable
// bytes before it, kept for `owner` and handed back to it while it fits.
// The memory sits below 2 GiB (platform/memory.hpp), where the game's int
// casts of its pointers still round-trip, and an unmapped page follows it so
// a run past the end faults at once.
unsigned char *ArenaBlock(const void *owner, std::size_t bytes, std::size_t lead = 0);

// Zeroes every block, as retail's clear of the whole GlobalDataBuffer does.
void ArenaClearAll();

[[noreturn]] void ArenaOverflow(const void *arena, int used, int limit);

[[noreturn]] void PortHighPointer(const void *pointer, std::size_t bytes, const char *file, int line);

// For memory the port hands to code that truncates its address to 32 bits: a pointer
// above kLowMemoryLimit stops the process where it was produced, on every platform,
// rather than where the truncated value is used. Debug builds only; nothing is checked
// under DC_LOW_MEMORY=any.
#ifdef NDEBUG
#define PortAssertLow(pointer, ...) ((void) 0)
#else
#define PortAssertLow(pointer, ...) PortCheckLow((pointer), __FILE__, __LINE__ __VA_OPT__(, ) __VA_ARGS__)

inline void PortCheckLow(const void *pointer, const char *file, int line, std::size_t bytes = 1) {
    if (!IsLowAddress(pointer, bytes) && LowMemoryEnforced()) {
        PortHighPointer(pointer, bytes, file, line);
    }
}
#endif
