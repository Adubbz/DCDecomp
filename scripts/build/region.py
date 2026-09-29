#!/usr/bin/env python3
"""Which release of the game a build is for, and where that release's files live.

    region.py [key]        print one value (default: the region's name), for
                           the shell scripts and CMake

NTSC 1.02 is the default. `DCDECOMP_REGION=PAL` selects the July 12, 2001 PAL
prototype. Everything the two releases do not share -- the disc, what was
extracted from it, the split configuration and linker script, the split
itself, the build tree and the retail section layout -- sits under a directory
named for the release (`rom/ntsc`, `config/ntsc`, `asm/ntsc`, `build/ntsc`)
and is looked up here, so no other script names a release.
"""

import os
import sys

NTSC, PAL = "NTSC", "PAL"

REGIONS = {
    NTSC: {
        "overlay_origin": 0x01DABD00,
        "sections": {
            "main": (
                (".text", "text", 0x00100000, 0x00245300),
                (".vutext", "data", 0x00245300, 0x0024FAC0),
                (".data", "data", 0x0024FAC0, 0x00296680),
                (".vudata", "data", 0x00296680, 0x00296780),
                (".rodata", "rodata", 0x00296780, 0x0029FE80),
                (".rdata", "rdata", 0x0029FE80, 0x002A1E80),
                (".sdata", "sdata", 0x002A1E80, 0x002A2380),
                (".sbss", "sbss", 0x002A2380, 0x002A3709),
                (".bss", "bss", 0x002A3709, 0x01DABD00),
            ),
            "title": (
                ("header", "bin", 0x01DABD00, 0x01DABD40),
                (".text", "text", 0x01DABD40, 0x01DD5380),
                (".data", "data", 0x01DD5380, 0x01DE1AFC),
                (".bss", "bss", 0x01DE1AFC, 0x01E5DF80),
            ),
            "dun": (
                ("header", "bin", 0x01DABD00, 0x01DABD40),
                (".text", "text", 0x01DABD40, 0x01DC1B00),
                (".data", "data", 0x01DC1B00, 0x01DC2980),
                (".rodata", "rodata", 0x01DC2980, 0x01DC3580),
                (".sinit", "data", 0x01DC3580, 0x01DC4414),
                (".bss", "bss", 0x01DC4414, 0x01F06B00),
            ),
        },
        # MWLD's literal pool, {entry size: (start, end)}; see literals.py.
        "literal_pool": {8: (0x002A17B8, 0x002A1868), 4: (0x002A1868, 0x002A1E80)},
    },
    PAL: {
        "overlay_origin": 0x01DC4000,
        "sections": {
            "main": (
                (".text", "text", 0x00100000, 0x0024B900),
                (".vutext", "data", 0x0024B900, 0x002560C0),
                (".data", "data", 0x002560C0, 0x0029D480),
                (".vudata", "data", 0x0029D480, 0x0029D580),
                (".rodata", "rodata", 0x0029D580, 0x002A7400),
                (".rdata", "rdata", 0x002A7400, 0x002A9500),
                (".sdata", "sdata", 0x002A9500, 0x002A9A80),
                (".sbss", "sbss", 0x002A9A80, 0x002AAEB9),
                (".bss", "bss", 0x002AAEB9, 0x01DC4000),
            ),
            "title": (
                ("header", "bin", 0x01DC4000, 0x01DC4040),
                (".text", "text", 0x01DC4040, 0x01DEEA00),
                (".data", "data", 0x01DEEA00, 0x01DFB57C),
                (".bss", "bss", 0x01DFB57C, 0x01E77A80),
            ),
            "dun": (
                ("header", "bin", 0x01DC4000, 0x01DC4040),
                (".text", "text", 0x01DC4040, 0x01DD9500),
                (".data", "data", 0x01DD9500, 0x01DDA400),
                (".rodata", "rodata", 0x01DDA400, 0x01DDB000),
                (".sinit", "data", 0x01DDB000, 0x01DDBE94),
                (".bss", "bss", 0x01DDBE94, 0x01F1E900),
            ),
        },
        "literal_pool": {8: (0x002A8E28, 0x002A8EF8), 4: (0x002A8EF8, 0x002A9500)},
    },
}

NAME = os.environ.get("DCDECOMP_REGION", NTSC).upper()
if NAME not in REGIONS:
    raise SystemExit(f"region: DCDECOMP_REGION={NAME} is not one of {', '.join(REGIONS)}")
CURRENT = REGIONS[NAME]



def paths(name):
    """Where the named release's files live, for a script that reads both."""
    directory = name.lower()
    rom = f"rom/{directory}"
    config = f"config/{directory}"
    return {
        # The directory every region-specific tree names the release by.
        "dir": directory,
        # The disc image, and the directory its checksums and extracted files live in.
        "iso": f"rom/Dark Cloud ({name}).iso",
        "rom": rom,
        "extracted": f"{rom}/extracted",
        "extracted_iso": f"{rom}/extracted/iso",
        # The split configuration, the linker script and the split itself.
        "config": config,
        "lcf": f"{config}/SCUS_971.11.lcf",
        "asm": f"asm/{directory}",
        # The CMake binary directory, and the disc image mastered into it.
        "build": f"build/{directory}",
        "built_iso": f"Dark Cloud ({name} Build).iso",
    }


_PATHS = paths(NAME)
DIR = _PATHS["dir"]
ISO = _PATHS["iso"]
ROM = _PATHS["rom"]
EXTRACTED = _PATHS["extracted"]
EXTRACTED_ISO = _PATHS["extracted_iso"]
CONFIG = _PATHS["config"]
LCF = _PATHS["lcf"]
ASM = _PATHS["asm"]
BUILD = _PATHS["build"]
BUILT_ISO = _PATHS["built_iso"]
OVERLAY_ORIGIN = CURRENT["overlay_origin"]
SECTIONS = CURRENT["sections"]
LITERAL_POOL = CURRENT["literal_pool"]

VALUES = {
    "name": NAME,
    "dir": DIR,
    "iso": ISO,
    "rom": ROM,
    "extracted": EXTRACTED,
    "extracted_iso": EXTRACTED_ISO,
    "config": CONFIG,
    "lcf": LCF,
    "asm": ASM,
    "build": BUILD,
    "built_iso": BUILT_ISO,
    "overlay_origin": f"0x{OVERLAY_ORIGIN:08X}",
}


if __name__ == "__main__":
    key = sys.argv[1] if len(sys.argv) > 1 else "name"
    if key not in VALUES:
        raise SystemExit(f"region: no value {key!r}; one of {', '.join(VALUES)}")
    print(VALUES[key])
