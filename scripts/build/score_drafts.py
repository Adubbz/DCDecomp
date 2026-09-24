#!/usr/bin/env python3
"""Rank guarded game drafts by instruction similarity to the retail binary.

Compile each unit once with NON_MATCHING enabled, then compare every guarded
function's instructions with retail using quicktu's relocation-aware scorer.
The score is a triage measure: only a linked whole-image comparison can prove a
function matches.

    ./dev.sh python3 scripts/build/score_drafts.py --output re/draft_scores.csv
"""

from __future__ import annotations

import argparse
import csv
import os
import subprocess
import sys
import tempfile
from pathlib import Path

import draft_status
import quicktu


ROOT = Path(__file__).resolve().parents[2]
COMPILER = "tools/compilers/mw/2.3.3/mwccmips.exe"


def compile_drafts(source: Path, temporary: Path, obj: Path) -> str:
    temporary.write_bytes(source.read_bytes())
    relative_source = source.relative_to(ROOT)
    command = [
        "scripts/build/statefix-wibo.sh", COMPILER, *quicktu.FLAGS,
        "-define", "NON_MATCHING", "-lang",
        "c" if source.suffix == ".c" else "c++", "-o", str(obj), str(temporary),
    ]
    result = subprocess.run(
        command, cwd=ROOT, capture_output=True, text=True,
        env={**os.environ, "MWCIncludes": "include/std;include/sce",
             "STATEFIX_SOURCE": str(relative_source)},
    )
    output = (result.stdout + result.stderr).replace("\r", "")
    if result.returncode != 0 or "caused tool to abort" in output or not obj.exists():
        return output
    return ""


def compiled_name(retail_name: str, objects: list[str], renamed: dict[str, str]) -> str:
    """Resolve retail aliases absent from the ordinary object-fixup table."""
    mapped = next((symbol for symbol, retail in renamed.items()
                   if retail == retail_name), None)
    if mapped is not None:
        return mapped
    if retail_name in objects:
        return retail_name

    def normalize(symbol: str) -> str:
        return symbol.replace("CDataAlloc2<1>", "CDataAlloc2_1_")

    exact = [symbol for symbol in objects if normalize(symbol) == retail_name]
    if len(exact) == 1:
        return exact[0]

    # A P1 argument in a retail symbol is an unresolved pointer type. Match
    # the known prefix and the overload's preceding arguments.
    if "P1ii" in retail_name:
        prefix = retail_name.split("P1ii", 1)[0]
        candidates = [symbol for symbol in objects
                      if normalize(symbol).startswith(prefix) and symbol.endswith("ii")]
        if len(candidates) == 1:
            return candidates[0]

    candidates = [symbol for symbol in objects if symbol.startswith(retail_name)]
    if len(candidates) == 1:
        return candidates[0]
    return retail_name


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=ROOT / "re/draft_scores.csv")
    parser.add_argument("sources", nargs="*", type=Path,
                        help="limit scoring to these sources")
    args = parser.parse_args()
    rows = []
    failed = 0

    for source in sorted((ROOT / "src").rglob("*")):
        if source.suffix not in (".cpp", ".c"):
            continue
        if args.sources and source.relative_to(ROOT) not in args.sources:
            continue
        guards = sorted(name for name, guarded in draft_status.remaining(source).items()
                        if guarded)
        if not guards:
            continue
        relative_source = str(source.relative_to(ROOT))
        image = "dun" if relative_source.startswith("src/dun/") else (
            "title" if relative_source.startswith("src/title/") else "main")
        with tempfile.TemporaryDirectory(prefix="draft_score_", dir=source.parent) as work:
            temporary = Path(work) / source.name
            obj = Path(work) / (source.stem + ".o")
            complaint = compile_drafts(source, temporary, obj)
            if complaint:
                print(f"{relative_source}: compile failed: {complaint[-600:]}", file=sys.stderr)
                for name in guards:
                    rows.append((None, None, None, None, relative_source, name,
                                 "compile failed"))
                failed += len(guards)
                continue

            objects = quicktu.object_functions(str(obj))
            renamed = quicktu.retail_names(relative_source, objects)
            for name in guards:
                object_name = compiled_name(name, objects, renamed)
                try:
                    retail = quicktu.retail_function(image, name)
                    draft = quicktu.ours(str(obj), object_name)
                    if not draft:
                        root = name if name.startswith("__") else name.split("__", 1)[0]
                        matching = [symbol for symbol in objects if root in symbol]
                        raise ValueError(f"compiled symbol missing ({matching[:5]})")
                    different = quicktu.compare(retail, draft)
                    count = max(len(retail), len(draft))
                    score = 100.0 * (count - different) / count if count else 100.0
                    rows.append((score, different, len(retail), len(draft),
                                 relative_source, name, "scored"))
                except (ValueError, SystemExit) as error:
                    rows.append((None, None, None, None, relative_source, name, str(error)))
                    failed += 1
        print(f"scored {relative_source}: {len(guards)} drafts", file=sys.stderr)

    rows.sort(key=lambda row: (row[0] is None, -(row[0] or 0), row[1] or 0,
                               row[4], row[5]))
    with args.output.open("w", newline="") as output:
        writer = csv.writer(output)
        writer.writerow(("score_percent", "different_instructions", "retail_instructions",
                         "draft_instructions", "source", "function", "status"))
        for row in rows:
            writer.writerow((f"{row[0]:.2f}" if row[0] is not None else "", *row[1:]))
    print(f"{len(rows) - failed} scored, {failed} failed; {args.output}")
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
