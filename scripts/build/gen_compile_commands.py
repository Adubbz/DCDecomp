#!/usr/bin/env python3
"""Write build/compile_commands.json for clangd.

The build drives mwcc through a wrapper under wibo, so every compile is a
CMake add_custom_command and CMAKE_EXPORT_COMPILE_COMMANDS has nothing to
export. This restates the same compiles as clang ones, which is all clangd
wants from a compile database.

Deliberately not part of the CMake build: that only ever runs inside the
container, where the tree is /dcdecomp, and clangd runs against whatever path
the editor opened. Paths here come from this file's own location instead, so
running it on either side produces a database correct for that side.
"""

import json
import os

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
OUTPUT = os.path.join(REPO, "build", "compile_commands.json")

SRC_DIR = "src"
# The two -i paths in CMakeLists.txt's CC_MW_FLAGS, and nothing else: the build
# clears MWCIncludes, so include/ is the whole world.
INCLUDE_DIRS = ["include", "build/generated/asm"]

# EE is ILP32, which the default host target is not -- the STATIC_ASSERTs on
# struct sizes only hold with 4-byte long and pointer.
FLAGS = ["-xc++", "-std=c++98", "-nostdinc", "-nostdinc++",
         "--target=mipsel-unknown-elf"]


def entries():
    flags = list(FLAGS)
    for path in INCLUDE_DIRS:
        flags.append("-I%s" % os.path.join(REPO, path))

    # Every source under src/, which is deliberately wider than the build's own
    # src/*.cpp glob: src/title and src/dun are not compiled yet, but they are
    # tracked and someone editing them still wants clangd to work.
    for root, _, names in os.walk(os.path.join(REPO, SRC_DIR)):
        for name in sorted(names):
            if not name.endswith(".cpp"):
                continue
            path = os.path.join(root, name)
            yield {
                "directory": REPO,
                "file": path,
                "arguments": ["clang"] + flags + ["-c", path],
            }


def main():
    db = list(entries())
    os.makedirs(os.path.dirname(OUTPUT), exist_ok=True)
    with open(OUTPUT, "w", encoding="utf-8") as f:
        json.dump(db, f, indent=2)
        f.write("\n")
    print("clangd: %d compile commands -> %s"
          % (len(db), os.path.relpath(OUTPUT, REPO)))


if __name__ == "__main__":
    main()
