#!/usr/bin/env python3
"""Replay MWCC 2.3.3's register allocation on a capture, optionally under a
variant rule, and report which functions would be allocated differently.

    python3 tools/mwcc-debug/replay.py CAPTURE-DIR [rule]

CAPTURE-DIR is a directory written by capture.py. Every function in it is
replayed with the compiler's own algorithm first; a function whose replay does
not reproduce the captured allocation exactly is reported and then skipped,
because a variant result would mean nothing there.

Rules (default `none` only checks the replay):

    none    baseline only
    homed   a destination may not reuse an argument register that dies at that
            instruction, when that parameter also has a home copy
    args    ...as `homed`, but for every argument register
    hard    ...for every hard register, not just the argument registers
    home    a homed parameter stays live to the end of the block holding
            the copy

`homed` is the rule that reproduces retail's `CUserStatus::AddDrink`; see
re/ai/adddrink_register_allocation.md. Functions the build currently compiles
and does not mark FUZZY_MATCH are flagged, since a change there is a
regression rather than a fix.
"""
from __future__ import annotations

import collections
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

# From the register-file setup at 0x004abaf0: everything not reserved and not
# in the callee-saved list, then the callee-saved list in the order the
# allocator appends from.
CALLER_SAVED = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 31]
CALLEE_SAVED = [16, 17, 18, 19, 20, 21, 22, 23, 30]
ARGUMENTS = {4, 5, 6, 7}
COPY_FLAG = 0x10
IS_DESTINATION = 2
IS_SOURCE = 1


def colour(order, adjacency, extra=()):
    """The colouring loop at 0x004a6820: lowest free register, and when a node
    cannot be coloured the pool grows by one callee-saved register."""
    adjacency = {node: set(neighbours) for node, neighbours in adjacency.items()}
    for a, b in extra:
        adjacency.setdefault(a, set()).add(b)
        adjacency.setdefault(b, set()).add(a)
    colours = {node: node for node in range(32)}          # physical, pre-coloured
    pool, growable = set(CALLER_SAVED), list(CALLEE_SAVED)
    for node in order:
        while True:
            taken = {colours[n] for n in adjacency.get(node, ()) if n in colours}
            free = sorted(pool - taken)
            if free:
                colours[node] = free[0]
                break
            if not growable:
                colours[node] = None                      # spilled
                break
            pool.add(growable.pop(0))
    return colours


def adjacency_of(entry):
    adjacency: dict[int, set[int]] = {}
    for node in entry["nodes"]:
        adjacency.setdefault(node["virtual_register"], set()).update(node["interferes_with"])
    for node, neighbours in list(adjacency.items()):
        for neighbour in neighbours:
            adjacency.setdefault(neighbour, set()).add(node)
    return adjacency


def gpr_rounds(files):
    """The final GPR colorgraph round per function; earlier rounds are the ones
    that failed and were followed by spilling."""
    rounds: dict[str, dict] = collections.defaultdict(dict)
    for path in files:
        match = re.match(r"(\d+)-(.+)-regalloc-(\d+)-GPR-(entry|result)\.json$", path.name)
        if match:
            rounds[match.group(2)][(int(match.group(3)), match.group(4))] = path
    result = {}
    for function, captured in rounds.items():
        last = max(index for index, _ in captured)
        entry = captured.get((last - 1, "entry")) or captured.get((last, "entry"))
        final = captured.get((last, "result"))
        if entry and final:
            result[function] = (entry, final)
    return result


def gpr_operands(instruction):
    return [(o.get("register"), int(o.get("attributes", "0x0"), 16))
            for o in instruction["operands"]
            if o.get("kind") == "register" and o.get("register_class_name") == "GPR"]


def homed_parameters(pcode):
    """Argument registers this function also copies into a home register."""
    homed = set()
    for block in pcode["graph"]["blocks"]:
        for instruction in block["instructions"]:
            operands = gpr_operands(instruction)
            destinations = [r for r, a in operands if a & IS_DESTINATION]
            sources = [r for r, a in operands if a & IS_SOURCE]
            if (int(instruction["property_flags"], 16) & COPY_FLAG
                    and len(destinations) == 1 and len(sources) == 1
                    and destinations[0] >= 32 and sources[0] in ARGUMENTS):
                homed.add(sources[0])
    return homed


def dying_source_edges(pcode, only):
    """Edges between a destination and the hard registers the same instruction
    reads, i.e. forbidding reuse of a register that dies there."""
    edges = []
    for block in pcode["graph"]["blocks"]:
        for instruction in block["instructions"]:
            operands = gpr_operands(instruction)
            for destination in [r for r, a in operands if a & IS_DESTINATION]:
                for source in [r for r, a in operands if a & IS_SOURCE]:
                    if source == 0 or source >= 32 or destination < 32:
                        continue
                    if only is not None and source not in only:
                        continue
                    edges.append((destination, source))
    return edges


def home_block_edges(pcode):
    """A homed parameter stays live to the end of the block holding the copy."""
    edges = []
    for block in pcode["graph"]["blocks"]:
        instructions = block["instructions"]
        for index, instruction in enumerate(instructions):
            operands = gpr_operands(instruction)
            destinations = [r for r, a in operands if a & IS_DESTINATION]
            sources = [r for r, a in operands if a & IS_SOURCE]
            if not (int(instruction["property_flags"], 16) & COPY_FLAG
                    and len(destinations) == 1 and len(sources) == 1
                    and destinations[0] >= 32 and sources[0] in ARGUMENTS):
                continue
            for later in instructions[index + 1:]:
                for register, attributes in gpr_operands(later):
                    if attributes & IS_DESTINATION and register >= 32:
                        edges.append((register, sources[0]))
    return edges


def variant_edges(rule, pcode):
    if rule == "homed":
        homed = homed_parameters(pcode)
        return dying_source_edges(pcode, homed) if homed else []
    if rule == "args":
        return dying_source_edges(pcode, ARGUMENTS)
    if rule == "hard":
        return dying_source_edges(pcode, None)
    if rule == "home":
        return home_block_edges(pcode)
    return []


def matching_functions():
    """Compiler-visible names the build compiles and does not mark fuzzy."""
    provenance = ROOT / "build" / "symbol_provenance.txt"
    if not provenance.is_file():
        return None
    compiled = set()
    for line in provenance.read_text().splitlines():
        if line.startswith("#") or not line.strip():
            continue
        _, provider, _, symbol = line.split("\t")
        if provider == "cpp":
            compiled.add(symbol)
    fuzzy = set()
    for source in (ROOT / "src").rglob("*.cpp"):
        fuzzy |= set(re.findall(r'FUZZY_MATCH\s*\(\s*"[^"]*"\s*,\s*([^)\s]+)\s*\)',
                                source.read_text(errors="replace")))
    return {symbol.split("__")[0] for symbol in compiled - fuzzy}


def main(argv):
    if not argv:
        print(__doc__.strip(), file=sys.stderr)
        return 2
    capture = Path(argv[0])
    rule = argv[1] if len(argv) > 1 else "none"
    matching = matching_functions()
    files = list(capture.glob("*.json"))
    replayed = unreplayable = 0
    changed = []
    for function, (entry_path, result_path) in sorted(gpr_rounds(files).items()):
        entry = json.loads(entry_path.read_text())
        result = json.loads(result_path.read_text())
        pcode_path = next((f for f in files
                           if f.name.endswith("before-register-allocation.json")
                           and f"-{function}-backend" in f.name), None)
        if pcode_path is None:
            continue
        adjacency = adjacency_of(entry)
        order = [node["virtual_register"] for node in entry["nodes"]]
        actual = {node["virtual_register"]: node["physical_register"] for node in result["nodes"]}
        baseline = colour(order, adjacency)
        if any(baseline.get(v) != actual[v] for v in actual):
            unreplayable += 1
            print(f"   {function}: replay does not reproduce the capture; skipped")
            continue
        replayed += 1
        if rule == "none":
            continue
        variant = colour(order, adjacency, variant_edges(rule, json.loads(pcode_path.read_text())))
        difference = {v: (actual[v], variant[v]) for v in actual if variant.get(v) != actual[v]}
        if difference:
            changed.append((function, difference, matching is not None and function in matching))
    print(f"{capture.name}: replayed exactly {replayed}, unreplayable {unreplayable}")
    if rule != "none":
        regressions = sum(1 for _, _, m in changed if m)
        print(f"rule {rule!r}: {len(changed)} function(s) allocate differently, "
              f"{regressions} of which currently match retail")
        for function, difference, is_matching in changed:
            tag = "REGRESSION" if is_matching else "currently unmatched"
            moves = ", ".join(f"v{v}: r{a}->r{b}" for v, (a, b) in sorted(difference.items())[:5])
            print(f"   {function:28} {len(difference):2} node(s)  [{tag}]  {moves}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
