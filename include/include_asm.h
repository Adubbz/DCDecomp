#pragma once

/**
 * @file
 * Declares the markers that stand in for a function that is not decompiled yet.
 *
 * `INCLUDE_ASM("<image>", <mangled name>);` puts retail's own instructions for
 * that function into the object that this translation unit compiles to. It
 * exists because mwcc emits a translation unit's functions as one contiguous
 * .text, so a function that the file does not define cannot be supplied from
 * an outside .s without moving everything after it.
 *
 * tools/mwccgap reads the marker, finds the dump at
 * `ref/asm/split/<image>/<mangled name>.s`, and puts the assembled bytes where
 * the marker stands. The compiler itself sees nothing, which is why both
 * markers are empty here.
 *
 * A function that a marker supplies is not decompiled. objdiff is told so:
 * scripts/build/gen_objdiff.py gives it no base, so it counts as zero.
 */

#define INCLUDE_ASM(FOLDER, NAME)
#define INCLUDE_RODATA(FOLDER, NAME)
