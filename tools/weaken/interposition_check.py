#!/usr/bin/env python3
"""Fails when src/ps2 code calls a function src/port replaces without going through the linker.

A replacement only takes effect where the call in the merged src/ps2 object is a relocation against the
replaced symbol's own name. A call the compiler or assembler bound inside the object (ELF's .Lname$local
aliases with -fno-semantic-interposition, a relocation against a function's own section, a branch the
Mach-O assembler resolved to a local label) still reaches the retail body after the link. Calls the
optimiser removed entirely cannot be seen here; the compile flags have to prevent those.

Also fails when any definition in the merged object is still strong, i.e. the weakening step did nothing.
"""

import argparse
import pathlib
import re
import subprocess
import sys

CALLS = {"call", "callq", "jmp", "jmpq", "bl", "b"}
INSTRUCTION = re.compile(r"^\s+([0-9a-f]+):\s+(\S+)\s*(.*)$")
LABEL = re.compile(r"^([0-9a-f]+) <(.+)>:$")
RELOCATION = re.compile(r"^\s+[0-9a-f]+:\s+((?:R_|ARM64_RELOC_|X86_64_RELOC_)\S*)\s+(\S+)")
TARGET = re.compile(r"^(?:0x)?([0-9a-f]+)\s+<(.+?)(\+0x[0-9a-f]+)?>")
ADDEND = re.compile(r"[+-]0x[0-9a-f]+$")
SECTION = re.compile(r"^__[a-z_]+$")
ELF_SYMBOL = re.compile(r"^([0-9a-f]*)\s+([A-Za-z?])\s+(\S+)$")
MACHO_SYMBOL = re.compile(r"^([0-9a-f]*)\s+\((\S+?)\)\s+(.*\bexternal\b.*?)\s(\S+)$")


def defined_externals(nm, paths):
    """Maps each defined external symbol to (address, weak) across paths."""
    symbols = {}
    out = subprocess.run([nm, "--defined-only", "--extern-only", "-m", *map(str, paths)],
                         check=True, capture_output=True, text=True).stdout
    for line in out.splitlines():
        line = line.rstrip()
        if not line or line.endswith(":"):
            continue
        match = MACHO_SYMBOL.match(line)
        if match:
            address, _, attributes, name = match.groups()
            weak = attributes.split()[0] == "weak"
        else:
            match = ELF_SYMBOL.match(line)
            if not match:
                continue
            address, kind, name = match.groups()
            weak = kind in "WwVv"
        previous = symbols.get(name)
        symbols[name] = (int(address or "0", 16), weak and (previous is None or previous[1]))
    return symbols


def local_alias_base(symbol):
    if symbol.startswith(".L") and symbol.endswith("$local"):
        return symbol[2:-len("$local")]
    if symbol.startswith(".text."):
        return symbol[len(".text."):]
    return None


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--nm", required=True)
    parser.add_argument("--objdump", required=True)
    parser.add_argument("--stamp", type=pathlib.Path)
    parser.add_argument("ps2_object", type=pathlib.Path)
    parser.add_argument("port_objects", type=pathlib.Path, nargs="+")
    args = parser.parse_args()

    port = defined_externals(args.nm, args.port_objects)
    ps2 = defined_externals(args.nm, [args.ps2_object])
    strong_ps2 = sorted(name for name, (_, weak) in ps2.items() if not weak)
    replaced = {name for name, (_, weak) in port.items() if not weak and name in ps2}

    problems = [f"{args.ps2_object.name}: {name} is a strong definition" for name in strong_ps2[:20]]
    if len(strong_ps2) > 20:
        problems.append(f"... and {len(strong_ps2) - 20} more strong definitions")

    disassembly = subprocess.Popen([args.objdump, "-d", "-r", "--no-show-raw-insn", str(args.ps2_object)],
                                   stdout=subprocess.PIPE, text=True)
    macho = False
    by_address = {}
    function = set()
    pending = None
    calls = 0

    def names_at(address, printed):
        names = {printed}
        if macho:
            names |= by_address.get(address, set())
        return names

    def settle():
        nonlocal pending, calls
        if pending is None:
            return
        caller, address, printed, offset, relocation = pending
        pending = None
        if caller & replaced:
            return
        if relocation is not None:
            calls += 1
            symbol = ADDEND.sub("", relocation)
            base = local_alias_base(symbol)
            if base in replaced:
                problems.append(f"{min(caller)} calls {base} through {symbol}")
                return
            if not (macho and SECTION.match(symbol)):
                return
        elif not offset:
            calls += 1
        if offset:
            return
        bound = names_at(address, printed) & replaced
        if bound:
            problems.append(f"{min(caller)} calls {min(bound)} without a relocation")

    for line in disassembly.stdout:
        line = line.rstrip("\n")
        if "file format mach-o" in line:
            macho = True
            by_address = {}
            for name, (address, _) in ps2.items():
                by_address.setdefault(address, set()).add(name)
            continue
        match = RELOCATION.match(line)
        if match:
            if pending is not None and pending[4] is None:
                pending = (*pending[:4], match.group(2))
            continue
        match = INSTRUCTION.match(line)
        if match:
            settle()
            _, mnemonic, operands = match.groups()
            if mnemonic in CALLS:
                target = TARGET.match(operands)
                if target:
                    pending = (function, int(target.group(1), 16), target.group(2), target.group(3), None)
            continue
        match = LABEL.match(line)
        if match:
            settle()
            function = names_at(int(match.group(1), 16), match.group(2))
    settle()
    if disassembly.wait() != 0:
        print(f"interposition check: {args.objdump} failed", file=sys.stderr)
        return 2

    if problems:
        for problem in problems:
            print(f"interposition check: {problem}", file=sys.stderr)
        print(f"interposition check: {len(problems)} problem(s); src/port's replacements would not be reached "
              f"from these call sites", file=sys.stderr)
        return 1
    print(f"interposition check: {calls} direct calls in {args.ps2_object.name}, {len(replaced)} replaced "
          f"symbols, none bound past the linker")
    if args.stamp:
        args.stamp.write_text(f"{calls} {len(replaced)}\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
