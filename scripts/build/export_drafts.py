#!/usr/bin/env python3
"""Draft every function the build still splices in from assembly.

For each `INCLUDE_ASM` marker the annotation manifest knows about, this
gathers the three readings of it the project already has -- the brief that
documents it, Ghidra's decompilation, m2c's, and the retail disassembly
itself -- and writes them out as one draft per function:

    re/drafts/<unit>/<mangled>.md

They disagree in useful ways. m2c gives control flow that is faithful to the
instruction order and names nothing; Ghidra gives names and types and rewrites
the control flow; the disassembly settles both. A function whose m2c output
failed is still written, with the reason, because the disassembly is what the
draft is for.

    export_drafts.py                    every unit
    export_drafts.py <unit> ...         those units
    export_drafts.py --jobs 8           how many m2c runs at once
    export_drafts.py --list             what would be drafted, and nothing else

Ghidra's half comes from `re/ai/<unit>/ghidra-decompilation.md`, which
`DarkCloudExportDecompilation.java` writes; run
`scripts/ghidra/export_decompilation.sh` when a unit is new or its boundaries
have moved. m2c reads a copy of the dump prepared by `scripts/diff/m2c_prep.py`
-- jump tables named the way it recognises them, `$gp` displacements resolved
to their symbols -- and needs `build/ctx.c`, which is generated if missing. Its
output then goes through `scripts/diff/m2c_calls.py`, which writes each call
the way the source had it rather than by its mangled name.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import json
import os
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts" / "diff"))
import m2c_calls  # noqa: E402
import m2c_prep  # noqa: E402

MANIFEST = ROOT / "config" / "ghidra_annotations.json"
DRAFTS = ROOT / "re" / "drafts"
CONTEXT = ROOT / "build" / "ctx.c"
M2C = ROOT / "tools" / "m2c" / "m2c.py"
HEADING = re.compile(r"^## `([^`]+)`\s*$")


def outstanding(units: set[str]) -> list[dict]:
    """Every manifest function the build still takes from assembly."""
    manifest = json.loads(MANIFEST.read_text())
    rows = [
        row for row in manifest["functions"]
        if row.get("assembly") and (not units or row["translation_unit"] in units)
    ]
    rows.sort(key=lambda row: (row["translation_unit"], int(row["address"], 16)))
    return rows


def ghidra_sections(unit: str) -> dict[str, str]:
    """Each function's block of `re/ai/<unit>/ghidra-decompilation.md`."""
    path = ROOT / "re" / "ai" / unit / "ghidra-decompilation.md"
    if not path.is_file():
        return {}
    found: dict[str, list[str]] = {}
    current = None
    for line in path.read_text(errors="replace").splitlines():
        heading = HEADING.match(line)
        if heading:
            current = heading.group(1)
            found[current] = []
            continue
        if current is not None:
            found[current].append(line)
    return {name: "\n".join(body).strip("\n") for name, body in found.items()}


SYMBOLS: dict[str, tuple[dict, list]] = {}


def prepared(row: dict) -> Path:
    """The dump m2c reads: jump tables renamed, `$gp` displacements resolved."""
    image = row["image"]
    if image not in SYMBOLS:
        SYMBOLS[image] = m2c_prep.symbols(image)
    by_name, rows = SYMBOLS[image]
    source = ROOT / row["assembly"]
    text = m2c_prep.resolve_gp(source.read_text(errors="replace"), rows, by_name["_gp"])
    appended = []
    for name in dict.fromkeys(m2c_prep.jump_tables(text)):
        text = text.replace(f'"{name}"', m2c_prep.rename(name)).replace(
            name, m2c_prep.rename(name))
        words = m2c_prep.table_words(image, name)
        if words:
            appended.append(words)
    if appended:
        text = text.rstrip("\n") + "\n\n" + "\n\n".join(appended) + "\n"
    path = ROOT / "build" / "m2c" / row["image"] / f"{row['name']}.s"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)
    return path


def m2c(row: dict) -> tuple[str, str]:
    """m2c's reading of one function, or the reason there is none."""
    command = [
        sys.executable, str(M2C), "--target", "mipsee-mwcc-c++",
        "--context", str(CONTEXT), "-f", row["name"], str(prepared(row)),
    ]
    try:
        done = subprocess.run(command, capture_output=True, text=True, timeout=180)
    except subprocess.TimeoutExpired:
        return "", "m2c timed out after 180s"
    text = m2c_calls.fold(done.stdout).strip("\n")
    if done.returncode != 0 or "Decompilation failure" in text:
        # m2c reports a failure as a comment block; keep the whole reason
        detail = (text or done.stderr).replace("/*", "").replace("*/", "").strip()
        return "", detail or f"m2c exited {done.returncode}"
    return text, ""


def disassembly(row: dict) -> str:
    path = ROOT / row["assembly"]
    return path.read_text(errors="replace").strip("\n") if path.is_file() else ""


def draft(row: dict, ghidra: str, decompiled: str, reason: str) -> str:
    unit = row["translation_unit"]
    parts = [
        f"# `{row['name']}`\n",
        f"- Unit: `{unit}` (`{row['source']}`)",
        f"- Image: `{row['image']}`  Address: `{row['address']}`  Size: `{row['size']}`",
        f"- Assembly: `{row['assembly']}`",
    ]
    if row.get("documentation"):
        parts.append(f"- Documented in: `{row['documentation']}`")
    parts.append("")
    if row.get("comment"):
        parts += ["## Brief\n", row["comment"].strip(), ""]
    parts += ["## m2c\n"]
    parts += [f"m2c produced nothing: {reason}\n"] if reason else ["```c", decompiled, "```\n"]
    parts += ["## Ghidra\n"]
    parts += [ghidra + "\n"] if ghidra else ["No Ghidra decompilation is exported for this unit.\n"]
    parts += ["## Retail disassembly\n", "```mips", disassembly(row), "```"]
    return "\n".join(parts) + "\n"


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("units", nargs="*", help="translation units to draft")
    parser.add_argument("--jobs", type=int, default=os.cpu_count() or 4)
    parser.add_argument("--list", action="store_true", help="print the work and stop")
    args = parser.parse_args()

    rows = outstanding(set(args.units))
    if args.list:
        for row in rows:
            print(f"{row['translation_unit']:20} {row['address']} {row['name']}")
        print(f"{len(rows)} function(s)", file=sys.stderr)
        return

    if not M2C.is_file():
        sys.exit("tools/m2c is empty. Run: git submodule update --init")
    if not CONTEXT.is_file():
        print(f"generating {CONTEXT}", file=sys.stderr)
        CONTEXT.parent.mkdir(parents=True, exist_ok=True)
        subprocess.run(
            [sys.executable, str(ROOT / "scripts" / "diff" / "m2ctx.py"), "-o", str(CONTEXT)],
            check=True,
        )

    ghidra: dict[str, dict[str, str]] = {}
    written = failed = 0
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
        for row, (decompiled, reason) in zip(rows, pool.map(m2c, rows)):
            unit = row["translation_unit"]
            if unit not in ghidra:
                ghidra[unit] = ghidra_sections(unit)
            path = DRAFTS / unit / f"{row['name']}.md"
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(draft(row, ghidra[unit].get(row["name"], ""), decompiled, reason))
            written += 1
            failed += bool(reason)
    print(f"drafted {written} function(s) into {DRAFTS}; m2c failed on {failed}")


if __name__ == "__main__":
    main()
