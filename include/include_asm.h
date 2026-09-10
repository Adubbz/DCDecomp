#pragma once

/**
 * @file
 * Declares the markers that stand in for a function that is not decompiled yet.
 *
 * `INCLUDE_ASM("<directory>", <mangled name>);` puts retail's own instructions
 * for that function into the object that this translation unit compiles to. It
 * exists because mwcc emits a translation unit's functions as one contiguous
 * .text, so a function that the file does not define cannot be supplied from
 * an outside .s without moving everything after it.
 *
 * splat writes the reference assembly, one file per function, under the
 * translation unit it belongs to -- so `src/menu/window.cpp` names
 * `asm/nonmatchings/menu/window`. tools/mwccgap reads the marker, finds
 * `<directory>/<mangled name>.s`, and puts the assembled bytes where the
 * marker stands. The compiler itself sees nothing, which is why both markers
 * are empty here.
 *
 * A constant that only one function loads travels inside that function's file,
 * so it needs no marker of its own. `INCLUDE_RODATA` is for the rest: a
 * constant no single function claims, which splat writes to a file of its own
 * beside the functions.
 *
 * A function that a marker supplies is not decompiled. objdiff is told so:
 * scripts/build/layout.py gives it no base, so it counts as zero.
 *
 * `FUZZY_MATCH("<directory>", <mangled name>)` is the opposite: the function below
 * it *is* decompiled and its code is what links. It says that the compiled
 * code reproduces retail's instructions, their order and the control flow
 * between them exactly, and differs only in which registers the compiler chose.
 * Such a function occupies the same bytes as retail's, so nothing after it
 * moves, and every other function and all data still come out byte-identical.
 *
 * The macro expands to nothing: it is a claim about the function that follows,
 * for the tools to check rather than trust. scripts/build/verify.py compares
 * the built image against retail function by function and holds a declared
 * function to exactly that -- same length, same opcodes, same immediates and
 * branch offsets, differing only in register fields. A function that drifts
 * further, or one that differs without the declaration, is a failure, and any
 * difference in data is a failure whether declared or not.
 *
 * `NON_MATCHING` is neither: it keeps a decompiled function that does not
 * reproduce retail's code yet, without letting it into the build. The build
 * never defines it, so the `#else` branch's `INCLUDE_ASM` is what links and the
 * image is unaffected. A function whose compiled length differs from retail's
 * cannot simply be left in the build -- mwcc emits a unit's functions as one
 * contiguous .text, so it would move every function and every section after it.
 * The guarded code is kept so the draft can be worked on until it matches.
 * Note that mwccgap cannot yet compile a unit with the macro defined: it pairs
 * each `INCLUDE_ASM` it finds in the source text with a gap in the compiled
 * object, and there is no gap when the C++ was compiled instead.
 */

#define INCLUDE_ASM(FOLDER, NAME)
#define INCLUDE_RODATA(FOLDER, NAME)
#define FUZZY_MATCH(FOLDER, NAME)
