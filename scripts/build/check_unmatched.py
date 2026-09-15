#!/usr/bin/env python3
"""Compile every source with `NON_MATCHING` defined, and report what will not.

A draft kept behind `#ifdef NON_MATCHING` is never compiled by the build --
that is the point of the guard -- so nothing otherwise stops it from being
written against a field that does not exist. This compiles each source the way
the build does but with the guard on, which is a syntax and type check of the
drafts and nothing more: the object is thrown away, and mwccgap is bypassed,
since it cannot pair a marker with a gap that the compiled draft has filled.

    check_unmatched.py                every source
    check_unmatched.py src/snd.cpp    those sources
    check_unmatched.py --jobs 8       how many compiles at once
    check_unmatched.py --quiet        only the count

Run it inside the container (`./dev.sh python3 scripts/build/check_unmatched.py`).
"""

from __future__ import annotations

import argparse
import concurrent.futures
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
MW = Path(os.environ.get("MW_DIR", "tools/compilers/mw/2.3.3"))
LIB_INCLUDES = os.environ.get("LIB_INCLUDE_DIRS", "include/std;include/sce")
FLAGS = [
    "-O2", "-c", "-Cpp_exceptions", "off", "-RTTI", "off", "-strings", "readonly",
    "-pragma", "divbyzerocheck on", "-i", "include", "-define", "NON_MATCHING",
]
GUARD = re.compile(r"^#ifdef\s+NON_MATCHING\s*$", re.M)


def sources() -> list[Path]:
    return sorted(
        path.relative_to(ROOT)
        for path in (ROOT / "src").rglob("*")
        if path.suffix in {".c", ".cpp"} and "lib/" not in str(path.relative_to(ROOT))
    )


def compile_one(source: Path) -> tuple[Path, str]:
    """The compiler's complaint about one source, or an empty string."""
    with tempfile.TemporaryDirectory() as scratch:
        command = [
            "scripts/build/statefix-wibo.sh", str(MW / "mwccmips.exe"),
            *FLAGS, "-lang", "c" if source.suffix == ".c" else "c++",
            "-o", str(Path(scratch) / "check.o"), str(source),
        ]
        done = subprocess.run(
            command, cwd=ROOT, capture_output=True, text=True,
            env={**os.environ, "MWCIncludes": LIB_INCLUDES, "STATEFIX_SOURCE": str(source)},
        )
    # wibo hands back zero whether or not mwcc got anywhere, so the output is
    # what says so: mwcc ends a failed compile with "caused tool to abort".
    output = (done.stdout + done.stderr).replace("\r", "")
    if done.returncode == 0 and "caused tool to abort" not in output:
        return source, ""
    return source, "\n".join(
        line for line in output.splitlines()
        if line.startswith("#") and ("Error" in line or ":" in line)
    ).strip()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("sources", nargs="*", type=Path)
    parser.add_argument("--jobs", type=int, default=os.cpu_count() or 4)
    parser.add_argument("--quiet", action="store_true")
    args = parser.parse_args()

    wanted = args.sources or sources()
    drafted = [path for path in wanted if GUARD.search((ROOT / path).read_text(errors="replace"))]
    if not args.sources:
        wanted = drafted
    failures = 0
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
        for source, complaint in pool.map(compile_one, wanted):
            if not complaint:
                continue
            failures += 1
            print(f"== {source}")
            if not args.quiet:
                print(complaint)
    print(f"{len(wanted)} source(s) with drafts, {failures} that do not compile")
    sys.exit(1 if failures else 0)


if __name__ == "__main__":
    main()
