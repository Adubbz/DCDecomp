#!/usr/bin/env python3
"""Promote one guarded draft only if the linked game proves it byte-identical.

The source is restored and the game rebuilt after any failed compile, link, or
verification. Run one instance at a time; all agents share the same build.
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

import draft_status
import verify


ROOT = Path(__file__).resolve().parents[2]
TARGETS = ("SCUS_971.11", "TITLE.BIN", "DUN.BIN")


def build() -> tuple[bool, str]:
    result = subprocess.run(
        ["./dev.sh", "cmake", "--build", "build", "--target", *TARGETS, "-j4"],
        cwd=ROOT, capture_output=True, text=True,
    )
    return result.returncode == 0, result.stdout + result.stderr


def snapshot() -> tuple[dict[tuple[str, str], str], dict[str, int]]:
    declared = verify.declarations(str(ROOT / "src"))
    asm = verify.markers(str(ROOT / "src"))
    verdicts = {}
    data = {}
    for section in verify.SECTIONS:
        rows, data[section] = verify.categorise(section, declared, asm)
        verdicts.update({(section, entry.symbol): verdict for entry, verdict in rows})
    return verdicts, data


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("functions", nargs="+")
    args = parser.parse_args()
    source = ROOT / args.source
    guards = draft_status.remaining(source)
    for function in args.functions:
        if guards.get(function) is not True:
            parser.error(f"{function} is not a guarded draft in {args.source}")

    original = source.read_bytes()
    built, log = build()
    if not built:
        print("Baseline build failed:\n" + log[-4000:])
        return 1
    before, before_data = snapshot()

    keep = False
    try:
        promoted = subprocess.run(
            [sys.executable, "scripts/build/promote.py", "--out",
             str(args.source), *args.functions],
            cwd=ROOT, capture_output=True, text=True,
        )
        if promoted.returncode != 0 or f"promoted {len(args.functions)}:" not in promoted.stdout:
            print("Promotion failed:\n" + (promoted.stdout + promoted.stderr)[-4000:])
            return 1

        built, log = build()
        if not built:
            print("Candidate did not compile/link:\n" + log[-4000:])
            return 1

        after, after_data = snapshot()
        matches = [key for key, verdict in after.items()
                   if key[1] in args.functions and verdict == verify.PERFECT]
        regressions = [key for key, verdict in before.items()
                       if verdict in (verify.PERFECT, verify.FUZZY, verify.ASM)
                       and key not in matches and after.get(key) != verdict]
        data_changed = {section: after_data[section] - before_data[section]
                        for section in verify.SECTIONS
                        if after_data[section] > before_data[section]}
        if len(matches) != len(args.functions) or regressions or data_changed:
            print(f"Not exact: target perfect={matches}, regressions={regressions[:8]}, "
                  f"data differences={data_changed}")
            return 1
        keep = True
        print(f"MATCHED {args.source} {' '.join(args.functions)}; exact linked bytes, "
              "no function or data regressions")
        return 0
    finally:
        if not keep:
            source.write_bytes(original)
            # A failed candidate may leave a newer compiled object behind.
            # Remove that generated object so Ninja must compile the restored
            # source, regardless of file timestamp granularity.
            object_path = ROOT / "build" / (str(args.source) + ".o")
            object_path.unlink(missing_ok=True)
            rebuilt, log = build()
            if not rebuilt:
                print("Baseline rebuild failed after restoration:\n" + log[-4000:])


if __name__ == "__main__":
    raise SystemExit(main())
