#pragma once

#include <cstddef>
#include <cstdint>

#include "platform/memory.hpp"

// Every arena the port carves gets this many times the quadwords retail asked
// for: the game sizes many allocations with the host's sizeof, which grows
// with 8-byte pointers.
constexpr int kArenaHeadroom = 4;

// A zeroed, 64-byte aligned block of at least `bytes`, with `lead` usable
// bytes before it, kept for `owner` and handed back to it while it fits. An
// unmapped page follows it so a run past the end faults at once. A debug build
// stops if no block lies above 4 GiB, so a mapping that drifted low cannot hide
// a pointer the game truncates.
unsigned char *ArenaBlock(const void *owner, std::size_t bytes, std::size_t lead = 0);

// Zeroes every block, as retail's clear of the whole GlobalDataBuffer does.
void ArenaClearAll();

[[noreturn]] void ArenaOverflow(const void *arena, int used, int limit);

// The image is far smaller than 2 GiB, so of the addresses that end in the 32 bits the game kept,
// the one nearest an address inside the image is the one that was truncated. Exact wherever the
// image sits.
inline std::uintptr_t WidenNear(std::uintptr_t anchor, std::uint32_t low) {
    constexpr std::uintptr_t kWindow = std::uintptr_t{1} << 32;
    std::uintptr_t           candidate = (anchor & ~(kWindow - 1)) | low;
    if (candidate > anchor && candidate - anchor > kWindow / 2 && candidate >= kWindow) {
        candidate -= kWindow;
    } else if (candidate < anchor && anchor - candidate > kWindow / 2) {
        candidate += kWindow;
    }
    return candidate;
}

// A pointer into the executable's image (a global, a static, a literal) back from the int the game
// stored it in; null for 0.
void *PortImagePointer(std::int32_t truncated);
