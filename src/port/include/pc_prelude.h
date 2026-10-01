#pragma once

/**
 * Included ahead of every unit of the PC build.
 */

#include <strings.h>

#include <cassert>
#include <cstddef>
#include <new>

/**
 * Reports a call into PlayStation 2 code the port does not implement, then aborts.
 */
[[noreturn]] void Ps2Stub(const char *function, const char *file, int line);

/** Stands in for PlayStation 2 code: asserts when it is reached. */
#define PS2_STUB() Ps2Stub(__func__, __FILE__, __LINE__)

/** Stands in for a block of MWCC inline assembly in src/ps2: asserts when it is reached. */
#define PS2_ASM() PS2_STUB()

/**
 * The Metrowerks runtime's assertion failure, in its own argument order.
 */
[[noreturn]] void __assert(const char *file, int line, const char *expression);

/**
 * The Metrowerks runtime's exit, which the game calls by its mangled name.
 */
extern "C" [[noreturn]] void exit__2(int status);
