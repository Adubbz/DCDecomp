#!/usr/bin/env python3
"""Which release of the game a build is for, and where that release's inputs live.

    region.py <key>        print one value, for the shell scripts and CMake

NTSC 1.02 is the default. `DCDECOMP_REGION=PAL` selects the July 12, 2001 PAL
prototype, which the build compiles with `-DPAL`. Everything the two releases
do not share -- the disc, what was extracted from it, the split configuration,
the split itself, the linker script and the retail section layout -- is looked
up here, so no other script names a release.
"""

import json
import os
import re
import sys

NTSC, PAL = "NTSC", "PAL"

REGIONS = {
    NTSC: {
        "iso": "rom/Dark Cloud (USA).iso",
        "checksum": "checksum.sha256",
        "extracted": "rom/extracted",
        "extracted_checksum": "extracted.sha256",
        "config": "config",
        "asm": "asm",
        "assets": "assets",
        "lcf": "SCUS_971.11.lcf",
        "build": "build",
        "built_iso": "Dark Cloud (Build).iso",
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
        "literal_pool": {8: (0x002A17B8, 0x002A1868), 4: (0x002A1868, 0x002A1E80)},
    },
    PAL: {
        "iso": "rom/Dark Cloud (July 12, 2001 prototype).iso",
        "checksum": "checksum_pal.sha256",
        "extracted": "rom/extracted_pal",
        "extracted_checksum": "extracted_pal.sha256",
        "config": "config/pal",
        "asm": "asm/pal",
        "assets": "assets/pal",
        "lcf": "config/pal/SCUS_971.11.lcf",
        "build": "build_pal",
        "built_iso": "Dark Cloud (PAL Build).iso",
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

ISO = CURRENT["iso"]
CHECKSUM = CURRENT["checksum"]
EXTRACTED = CURRENT["extracted"]
EXTRACTED_ISO = EXTRACTED + "/iso"
EXTRACTED_CHECKSUM = CURRENT["extracted_checksum"]
CONFIG = CURRENT["config"]
ASM = CURRENT["asm"]
LCF = CURRENT["lcf"]
BUILD = CURRENT["build"]
OVERLAY_ORIGIN = CURRENT["overlay_origin"]
SECTIONS = CURRENT["sections"]
LITERAL_POOL = CURRENT["literal_pool"]


GUARD = re.compile(r"^\s*#\s*(ifdef|ifndef|if|else|elif|endif)\b\s*(\w*)")


MARKER = re.compile(r'^(\s*(?:INCLUDE_ASM|INCLUDE_RODATA)\(\s*")([^"]*)("\s*,\s*)([^)\s]+)(\s*\).*)$', re.M)
MARKER_NAMES = "marker_names.json"
_marker_names = None


def marker_names():
    """{NTSC marker path: this release's name} for the unguarded markers whose
    constant this release calls something else; written by splat_config.py."""
    global _marker_names
    if _marker_names is None:
        path = os.path.join(CONFIG, MARKER_NAMES)
        _marker_names = {}
        if NAME != NTSC and os.path.exists(path):
            with open(path, encoding="utf-8") as f:
                _marker_names = json.load(f)
    return _marker_names


def active_text(text, pal=None, rename=True):
    """`text` with the lines a `#ifdef PAL` or `#ifndef PAL` guard leaves out of
    this release blanked, so that a scan for markers sees what is compiled.

    Every other conditional is left as it is, as the scans have always read it.
    In a release other than NTSC, a marker left unguarded names NTSC's reference
    assembly; it is pointed at this release's, under this release's name.
    """
    if pal is None:
        pal = NAME == PAL
    if rename and pal == (NAME == PAL) and NAME != NTSC:
        names = marker_names()
        text = MARKER.sub(lambda m: m.group(1) + marker_folder(m.group(2)) + m.group(3)
                          + names.get(f"{m.group(2)}/{m.group(4)}", m.group(4)) + m.group(5), text)
    if "PAL" not in text:
        return text
    out, stack = [], []
    for line in text.split("\n"):
        m = GUARD.match(line)
        if m:
            kind, name = m.groups()
            if kind in ("ifdef", "ifndef", "if"):
                region_guard = kind in ("ifdef", "ifndef") and name == "PAL"
                stack.append([region_guard, not region_guard or (kind == "ifdef") == pal])
                out.append(line)
                continue
            if kind == "else" and stack:
                if stack[-1][0]:
                    stack[-1][1] = not stack[-1][1]
                out.append(line)
                continue
            if kind == "endif" and stack:
                stack.pop()
                out.append(line)
                continue
        out.append(line if all(on for _guard, on in stack) else "")
    return "\n".join(out)


def marker_folder(folder):
    """Where a marker's reference assembly is for this release: a folder under
    NTSC's tree names the same place in this release's own."""
    ntsc = REGIONS[NTSC]["asm"]
    if NAME == NTSC or folder.startswith(ASM + "/") or not folder.startswith(ntsc + "/"):
        return folder
    return ASM + folder[len(ntsc):]


def foreign_asm():
    """The other releases' split trees that sit inside this one's.

    The PAL split lives under asm/pal, inside the NTSC tree, so a walk of the
    NTSC tree has to step around it.
    """
    mine = ASM.rstrip("/") + "/"
    return tuple(
        r["asm"] for n, r in REGIONS.items()
        if n != NAME and r["asm"].startswith(mine)
    )


def is_foreign_asm(path):
    """Whether a path under this release's asm/ belongs to another release."""
    posix = str(path).replace(os.sep, "/")
    return any(posix == root or posix.startswith(root + "/") for root in foreign_asm())


if __name__ == "__main__":
    value = CURRENT.get(sys.argv[1]) if len(sys.argv) > 1 else NAME
    if value is None:
        raise SystemExit(f"region: no value {sys.argv[1]!r}")
    print(hex(value) if isinstance(value, int) else value)
