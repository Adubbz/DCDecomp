#!/usr/bin/env python3
"""Write objdiff.json, the unit list objdiff and decomp.dev work from.

    gen_objdiff.py [-o objdiff.json] [--list-extra-objects]

objdiff compares object files in pairs. Retail's translation units are unknown,
but every symbol's origin is, so a unit here is one retail function: the target
is its reference dump assembled as retail wrote it, and the base is the
build/src/<file>.cpp.o providing it, or nothing, which scores the unit at zero.
Pairing every function that way makes the percentage a share of the whole game.

Both sides come from build/symbol_provenance.txt and the address index, so
nothing is maintained by hand. --list-extra-objects prints the .s the ordinary
build no longer assembles but objdiff still needs as targets.
"""

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                "..", "diff"))
import ref_index  # noqa: E402  (lives with the other index readers)

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
PROVENANCE = "build/symbol_provenance.txt"

# objdiff runs `<custom_make> <custom_args...> <object path>` to rebuild. The
# path is meaningless here -- this project builds in one step -- so the trailing
# argument is swallowed the same way diff_settings.py does it, by handing it to
# `sh -c` as $0.
CUSTOM_MAKE = "sh"
CUSTOM_ARGS = ["-c", "exec scripts/build/build_objdiff.sh"]

WATCH_PATTERNS = ["src/**/*.{c,cpp,h,hpp,s,inc,lcf}", "include/**/*.{h,hpp,s,inc,lcf}"]


def provenance():
    """symbol -> the object currently providing it, for decompiled symbols."""
    path = os.path.join(REPO, PROVENANCE)
    if not os.path.exists(path):
        raise SystemExit(
            "gen_objdiff: %s is missing.\n"
            "             Build first: scripts/build/cmake.sh" % PROVENANCE)

    out = {}
    with open(path, encoding="utf-8") as f:
        for line in f:
            if line.startswith("#"):
                continue
            parts = line.rstrip("\n").split("\t")
            if len(parts) < 4 or parts[1] != "cpp":
                continue
            # `savedata.cpp.o(.text)` -> savedata.cpp.o
            out[parts[3]] = parts[2].split("(")[0]
    return out


# Only the per-function dumps under split/. The whole-section dumps under
# sections/ are data, and the build supplies them through the migration
# carving rather than through a decompiled translation unit, so they have no
# target/base pair of the shape objdiff wants.
FUNCTION_DUMPS = "ref/asm/split/"


def is_function_dump(entry):
    return entry.source.startswith(FUNCTION_DUMPS) and entry.source.endswith(".s")


def extra_objects():
    """Reference dumps objdiff needs that the build does not already assemble.

    None, now that the build assembles every dump in the address index whether
    or not the link uses it -- which is exactly what objdiff wants, since a dump
    superseded by decompiled C++ is still the target that C++ is compared
    against. Kept so the build can ask, and answer nothing.
    """
    return []


def units():
    """One unit per retail function, in address order within each section."""
    provided = provenance()
    result = []
    extra = []

    for section in ref_index.SECTIONS:
        for entry in ref_index.entries(section):
            if not is_function_dump(entry):
                continue

            target = "build/%s.o" % entry.source
            unit = {
                "name": "%s/%s" % (section, entry.symbol),
                "target_path": target,
            }

            obj = provided.get(entry.symbol)
            if obj:
                unit["base_path"] = "build/src/%s" % obj
                # The .s is not in the object lists any more, so the ordinary
                # build does not assemble it -- but it is still the target.
                extra.append(entry.source)
            else:
                # No base: nothing supplies this function yet, and objdiff
                # scores the unit at zero rather than skipping it.
                unit["metadata"] = {"complete": False}

            result.append(unit)

    return result, extra


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("-o", "--output", default="objdiff.json")
    ap.add_argument("--list-extra-objects", action="store_true",
                    help="print the .s the build does not otherwise assemble")
    args = ap.parse_args()

    os.chdir(REPO)

    # Deliberately before units(): this path reads only the object lists and
    # the address index, so it works at configure time, when the provenance
    # file units() needs does not exist yet.
    if args.list_extra_objects:
        print("\n".join(extra_objects()))
        return

    unit_list, extra = units()

    config = {
        "min_version": "2.0.0",
        "name": "Dark Cloud (USA, SCUS-97111)",
        "custom_make": CUSTOM_MAKE,
        "custom_args": CUSTOM_ARGS,
        "build_target": True,
        "build_base": True,
        "watch_patterns": WATCH_PATTERNS,
        "units": unit_list,
    }

    with open(args.output, "w", encoding="utf-8") as f:
        json.dump(config, f, indent=2)
        f.write("\n")

    done = sum(1 for u in unit_list if "base_path" in u)
    print("objdiff: %d units, %d with a decompiled base -> %s"
          % (len(unit_list), done, args.output))


if __name__ == "__main__":
    main()
