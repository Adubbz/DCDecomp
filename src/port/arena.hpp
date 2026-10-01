#pragma once

#include <cstddef>

// Every arena the port carves gets this many times the quadwords retail asked
// for: the game sizes many allocations with the host's sizeof, which grows
// with 8-byte pointers.
constexpr int kArenaHeadroom = 4;

// A zeroed, 64-byte aligned block of at least `bytes`, with `lead` usable
// bytes before it, kept for `owner` and handed back to it while it fits.
// The memory sits below 2 GiB, where the game's int casts of its pointers
// still round-trip, and an unmapped page follows it so a run past the end
// faults at once.
unsigned char *ArenaBlock(const void *owner, std::size_t bytes, std::size_t lead = 0);

// Zeroes every block, as retail's clear of the whole GlobalDataBuffer does.
void ArenaClearAll();

[[noreturn]] void ArenaOverflow(const void *arena, int used, int limit);
