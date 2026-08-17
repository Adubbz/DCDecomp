#!/usr/bin/env python3
"""Dump MWCC 2.3.3's PCode and register-allocation state for one function.

    python3 tools/mwcc-debug/capture.py SOURCE [FUNCTION] -o OUTPUT [-- flags...]

SOURCE is compiled by the project's own compiler under wibo, with GDB attached
and mwccps2-debugger's decoders reading the compiler's internal state at each
pass boundary. FUNCTION is the compiler-visible name, so a C++ member is its
mangled name; omit it to capture every function in the file.

wibo maps mwccmips.exe at its preferred base only once it has loaded the image,
so the guest breakpoints cannot be armed at `starti`. The run therefore stops
first at wibo's import-resolution symbol, which happens after the mapping and
before any guest code runs, and arms the capture there.
"""
from __future__ import annotations

import argparse
import os
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
PROFILE = Path(__file__).resolve().parent / "profiles" / "mwccmips-2.3.3-000921.json"
CAPTURE_SCRIPT = Path(__file__).resolve().parent / "gdb_capture.py"
COMPILER = ROOT / "tools" / "compilers" / "mw" / "2.3.3" / "mwccmips.exe"

# The retail flags, as scripts/build/mwccgap.sh passes them.
DEFAULT_FLAGS = ["-O2", "-c", "-Cpp_exceptions", "off", "-RTTI", "off", "-strings", "readonly"]

# wibo has finished mapping the guest image and resolving its imports here, and
# has not yet entered guest code.
LOADER_ARM_SYMBOL = "wibo::Executable::resolveImports"


class CaptureError(RuntimeError):
    pass


def _quote(value: str) -> str:
    return '"' + str(value).replace("\\", "/").replace('"', '\\"') + '"'


def _commands(loader: Path, compiler_arguments: list[str], output: Path, function: str | None) -> str:
    start = f"mwcc-capture start --profile {_quote(PROFILE)} --output {_quote(output)} --executable {_quote(COMPILER)}"
    if function:
        start += f" --function {_quote(function)}"
    return "\n".join([
        "set pagination off",
        "set confirm off",
        # Guest code is 32-bit inside a 64-bit inferior, so GDB decodes it as
        # 64-bit when it steps over a breakpoint out of line: an absolute
        # `cmp byte ptr ds:addr` reads back as RIP-relative, and the relocated
        # copy faults. Stepping in place needs no decoding and is correct.
        "set displaced-stepping off",
        f"file {_quote(loader)}",
        "set args " + " ".join(_quote(argument) for argument in compiler_arguments),
        f"break {LOADER_ARM_SYMBOL}",
        "run",
        "delete breakpoints",
        # `source` takes a bare path; it does not strip quotes.
        f"source {CAPTURE_SCRIPT}",
        start,
        "continue",
        "mwcc-capture stop",
        "quit",
        "",
    ])


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("source", type=Path)
    parser.add_argument("function", nargs="?")
    parser.add_argument("-o", "--output", type=Path, required=True, help="capture directory")
    parser.add_argument("--wibo", type=Path, default=Path(shutil.which("wibo") or "wibo"))
    parser.add_argument("--gdb", type=Path, default=Path(shutil.which("gdb") or "gdb"))
    # Split on `--` before argparse sees it: everything after it is compiler
    # flags, and argparse would otherwise treat the whole tail as positional
    # and feed the first flag to the optional FUNCTION argument.
    flags: list[str] = []
    if "--" in argv:
        separator = argv.index("--")
        argv, flags = argv[:separator], argv[separator + 1:]
    values, extra = parser.parse_known_args(argv)
    flags = extra + flags

    try:
        source = values.source.resolve(strict=True)
        loader = values.wibo.resolve(strict=True)
        output = values.output.resolve()
        object_path = output.with_suffix(".o")
        arguments = [str(COMPILER), *(flags or DEFAULT_FLAGS), "-o", str(object_path), str(source)]
        with tempfile.NamedTemporaryFile("w", suffix=".gdb", delete=False) as command_file:
            command_file.write(_commands(loader, arguments, output, values.function))
            command_path = Path(command_file.name)
        try:
            # MWCIncludes is the compiler's <> search list, the variable
            # scripts/build/mwccgap.sh sets; it stays empty unless the caller
            # exports one, because a capture source is usually self-contained.
            completed = subprocess.run(
                [str(values.gdb), "--batch", "--nx", "--quiet", "--command", str(command_path)],
                cwd=source.parent, env={"PATH": "/usr/bin:/bin", "HOME": "/tmp",
                                        "MWCIncludes": os.environ.get("MWCIncludes", "")},
                text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=600, check=False,
            )
        finally:
            command_path.unlink(missing_ok=True)
            object_path.unlink(missing_ok=True)

        manifest_path = output / "manifest.json"
        if not manifest_path.is_file():
            raise CaptureError("no capture manifest was written:\n" + completed.stdout.strip())
        manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
        counts: dict[str, int] = {}
        for artifact in manifest["artifacts"]:
            counts[artifact["kind"]] = counts.get(artifact["kind"], 0) + 1
        print(f"{manifest['status']}: {output}")
        print("  " + (", ".join(f"{count} {kind}" for kind, count in sorted(counts.items())) or "no artifacts"))
        for error in manifest["errors"]:
            print(f"  warning [{error['stage']}]: {error['message']}")
        return 0 if manifest["artifacts"] and not manifest["errors"] else 1
    except (CaptureError, OSError, json.JSONDecodeError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
