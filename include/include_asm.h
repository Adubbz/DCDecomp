#pragma once

/**
 * @file
 * Declares the marker that stands in for a function that is not decompiled yet.
 *
 * `INCLUDE_ASM("<directory>", <mangled name>);` puts retail's own instructions
 * for that function into the object that this translation unit compiles to. It
 * exists because mwcc emits a translation unit's functions as one contiguous
 * .text, so a function that the file does not define cannot be supplied from
 * an outside .s without moving everything after it.
 *
 * splat writes the reference assembly, one file per function, under the
 * translation unit it belongs to -- so `src/common/shop.cpp`'s PAL markers name
 * `asm/pal/nonmatchings/shop`. tools/mwccgap reads the marker, finds
 * `<directory>/<mangled name>.s`, and puts the assembled bytes where the
 * marker stands. The compiler itself sees nothing, which is why the marker is
 * empty here. A constant that only the function loads travels inside the
 * function's file; any other datum it uses is defined in C.
 *
 * A marker inside `#ifdef PAL` or `#ifndef PAL` belongs to that release only:
 * the build hands mwccgap and splat the source as the release being built
 * compiles it (scripts/build/region.py, `active_text`).
 *
 * A function that a marker supplies is not decompiled. objdiff is told so:
 * scripts/build/layout.py gives it no base, so it counts as zero, and
 * scripts/build/verify.py counts it as `asm`.
 */

#define INCLUDE_ASM(FOLDER, NAME)
