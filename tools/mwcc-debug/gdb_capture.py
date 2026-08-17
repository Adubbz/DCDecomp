"""GDB command that captures MWCC 2.3.3 PCode and register-allocation state.

Sourced inside GDB by capture.py; not run on its own:

    mwcc-capture start --profile FILE --output DIRECTORY [--function NAME]

The decoding is mwccps2-debugger's: this file imports its profile model and
uses the profile schema unchanged. What it supplies is the transport. The
upstream capture command debugs the compiler as the process GDB started, and
fingerprints whatever GDB has open; here the process GDB starts is wibo, and
mwccmips.exe is a guest image wibo maps at 0x400000, so the compiler to
fingerprint has to be named separately. Guest addresses are 32-bit and the
inferior is 64-bit, which costs nothing: only $esp, $eax, and guest memory are
read, and GDB serves all three from the compatibility-mode frame.
"""
from __future__ import annotations

import json
import os
import re
import sys
from pathlib import Path
from typing import Any

import gdb

_MODEL_DIRECTORY = Path(__file__).resolve().parents[1] / "mwccps2-debugger" / "gdb"
if str(_MODEL_DIRECTORY) not in sys.path:
    sys.path.insert(0, str(_MODEL_DIRECTORY))

import mwccps2_profile_model as model  # noqa: E402
from mwccps2_profile_model import (  # noqa: E402
    MemoryReadError,
    ProfileError,
    address,
    codegen_function_name,
    collect_pcode,
    collect_regalloc_list,
    fingerprint_executable,
    format_pcode,
    format_regalloc,
    load_profile,
    u16,
    u32,
)


def _operand_2_3_3(memory: Any, pointer: int, profile: dict[str, Any], block_ids: dict[int, int]) -> dict[str, Any]:
    """Decode one 14-byte 2.3.3 PCode operand.

    The schema describes 2.4's 22-byte operand, whose payload sits at a single
    offset for every tag. This build packs a union into 14 bytes and puts each
    tag's payload where it fits, so the payload offset is per tag:

        tag 0  register     class at +1, attributes at +2, number at +4,
                            owning object at +6
        tag 2  immediate    value at +2
        tag 3  inline       object at +2, value at +6
        tag 4  memory       displacement at +2, object at +6
        tag 6  label        label record at +2

    Every operand also keeps its raw bytes, so a tag this decoder does not
    describe stays readable instead of becoming a wrong number.
    """
    layout = profile["pcode_layout"]["operand"]
    data = memory.read(pointer, int(profile["pcode_layout"]["instruction"]["operand_stride"]))
    tag = data[0]
    result: dict[str, Any] = {"tag": tag, "kind": layout.get("tags", {}).get(str(tag), "unknown"), "raw": data.hex()}
    if tag == 0:
        classes = layout.get("register_classes", [])
        register_class = data[1]
        result.update(
            register_class=register_class,
            register_class_name=classes[register_class] if register_class < len(classes) else f"class{register_class}",
            register=u16(data, 4),
            attributes=f"0x{u16(data, 2):04x}",
            object_pointer=f"0x{u32(data, 6):08x}",
        )
    elif tag == 2:
        result["value"] = u32(data, 2)
    elif tag in (3, 4):
        result.update(value=u32(data, 6) if tag == 3 else u16(data, 2), object_pointer=f"0x{u32(data, 2 if tag == 3 else 6):08x}")
    elif tag == 6:
        record = u32(data, 2)
        result["label_record"] = f"0x{record:08x}"
        if record:
            label = profile["pcode_layout"]["label_record"]
            size = int(label["block_pointer_offset"]) + 4
            try:
                block_pointer = u32(memory.read(record, size), int(label["block_pointer_offset"]))
            except Exception:
                block_pointer = 0
            result["block_id"] = block_ids.get(block_pointer)
    return result


model._operand = _operand_2_3_3


class _Memory:
    """The read(pointer, size) interface the profile model expects."""

    def read(self, pointer: int, size: int) -> bytes:
        return bytes(gdb.selected_inferior().read_memory(pointer, size))


def _write_json(path: Path, value: Any) -> None:
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def _u32(expression: str) -> int:
    return int(gdb.parse_and_eval(expression)) & 0xFFFFFFFF


def _slug(value: str) -> str:
    return re.sub(r"[^A-Za-z0-9_.-]+", "_", value).strip("._") or "anonymous"


def _interference(memory: Any, profile: dict[str, Any], node_pointer: int, vreg: int, limit: int = 4096) -> list[int]:
    """List the virtual registers one node interferes with.

    colorgraph reaches a node's neighbours through the chain at +26. Each link
    is one edge, shared by both of its endpoints: the endpoint pair is stored
    at +12 and +14, and the link carries a separate next-pointer for each side,
    at +4 for the lower endpoint and +8 for the higher one. Walking it is what
    makes a colour explainable -- the mask colorgraph starts from loses exactly
    one bit per already-coloured neighbour here.
    """
    allocation = profile["register_allocation"]
    fields = allocation["edge_fields"]
    neighbours: list[int] = []
    seen: set[int] = set()
    edge = node_pointer
    field = int(allocation["node_fields"]["interference_tree"])
    edge = u32(memory.read(node_pointer + field, 4), 0)
    while edge and edge not in seen and len(neighbours) < limit:
        seen.add(edge)
        data = memory.read(edge, int(allocation["edge_stride"]))
        low = u16(data, int(fields["range_low_i16"]))
        high = u16(data, int(fields["range_high_i16"]))
        if vreg >= high:
            neighbours.append(low)
            edge = u32(data, int(fields["right"]))
        else:
            neighbours.append(high)
            edge = u32(data, int(fields["left"]))
    return neighbours


def _collect_nodes(memory: Any, profile: dict[str, Any], head: int) -> dict[str, Any]:
    """The model's priority list, plus each node's neighbours."""
    capture = collect_regalloc_list(memory, profile, head, 32767)
    for node in capture["nodes"]:
        try:
            node["interferes_with"] = _interference(memory, profile, node["address"], node["virtual_register"])
        except Exception as exc:
            node["interference_error"] = str(exc)
    return capture


def _format_nodes(capture: dict[str, Any]) -> str:
    """format_regalloc, plus the neighbour list the colour follows from."""
    lines = [f"{capture['class']['name']} allocation priority at colorgraph {capture['moment']} ({capture['node_count']} nodes):"]
    for node in capture["nodes"]:
        colour = "-" if node["physical_register"] < 0 else f"r{node['physical_register']}"
        flags = ",".join(node["flag_names"]) or "-"
        neighbours = " ".join(f"v{value}" for value in sorted(node.get("interferes_with", [])))
        lines.append(f"  {node['priority']:04d}: v{node['virtual_register']:<4} -> {colour:<5} [{flags}]  interferes: {neighbours}")
    return "\n".join(lines) + "\n"


class _CodeGenEntry(gdb.Breakpoint):
    def __init__(self, recorder: "_Recorder") -> None:
        super().__init__(f"*{address(recorder.profile['functions']['CodeGen_Generator']['address']):#x}", internal=True)
        self.silent = True
        self.recorder = recorder

    def stop(self) -> bool:
        try:
            self.recorder.enter_function(codegen_function_name(_Memory(), _u32("$esp"), self.recorder.profile))
        except Exception as exc:
            self.recorder.error("codegen-entry", exc)
        return False


class _CodeGenReturn(gdb.Breakpoint):
    def __init__(self, recorder: "_Recorder") -> None:
        super().__init__(f"*{address(recorder.profile['functions']['CodeGen_Generator']['return_address']):#x}", internal=True)
        self.silent = True
        self.recorder = recorder

    def stop(self) -> bool:
        self.recorder.leave_function()
        return False


class _StageBreakpoint(gdb.Breakpoint):
    def __init__(self, recorder: "_Recorder", stage: dict[str, Any]) -> None:
        super().__init__(f"*{address(stage['address']):#x}", internal=True)
        self.silent = True
        self.recorder = recorder
        self.stage = stage["name"]

    def stop(self) -> bool:
        if self.recorder.active:
            self.recorder.capture_pcode(self.stage)
        return False


class _ColorgraphEntry(gdb.Breakpoint):
    """colorgraph's first argument is the head of the priority-ordered list."""

    def __init__(self, recorder: "_Recorder") -> None:
        super().__init__(f"*{address(recorder.profile['register_allocation']['colorgraph']):#x}", internal=True)
        self.silent = True
        self.recorder = recorder

    def stop(self) -> bool:
        if self.recorder.active:
            try:
                head = int.from_bytes(_Memory().read(_u32("$esp") + 4, 4), "little")
                self.recorder.pending_head = head
                # Before colouring: every node still carries -1 except the ones
                # the compiler pre-coloured, which is what the colours chosen
                # afterwards have to be read against.
                self.recorder.capture_regalloc(head, None, "entry")
            except Exception as exc:
                self.recorder.error("colorgraph-entry", exc)
        return False


class _ColorgraphReturn(gdb.Breakpoint):
    """The same list, read back in the driver once every node carries a colour."""

    def __init__(self, recorder: "_Recorder") -> None:
        super().__init__(f"*{address(recorder.profile['register_allocation']['colorgraph_return']):#x}", internal=True)
        self.silent = True
        self.recorder = recorder

    def stop(self) -> bool:
        head = self.recorder.pending_head
        self.recorder.pending_head = None
        if self.recorder.active and head is not None:
            self.recorder.capture_regalloc(head, _u32("$eax"), "result")
        return False


class _Recorder:
    def __init__(self, profile: dict[str, Any], executable: dict[str, Any], options: dict[str, Any]) -> None:
        self.profile = profile
        self.executable = executable
        self.output = Path(options["output"]).resolve()
        self.function_filter = options["function"]
        self.active = False
        self.current_function = ""
        self.function_sequence = 0
        self.stage_sequence = 0
        self.regalloc_sequence = 0
        self.pending_head: int | None = None
        self.errors: list[dict[str, str]] = []
        self.artifacts: list[dict[str, Any]] = []
        self.output.mkdir(parents=True, exist_ok=True)
        self.breakpoints: list[gdb.Breakpoint] = [_CodeGenEntry(self), _CodeGenReturn(self)]
        self.breakpoints.extend(_StageBreakpoint(self, stage) for stage in profile["pcode_breakpoints"])
        self.breakpoints.extend((_ColorgraphEntry(self), _ColorgraphReturn(self)))
        self.flush_manifest("running")

    def enter_function(self, name: str) -> None:
        self.current_function = name
        self.function_sequence += 1
        self.stage_sequence = 0
        self.regalloc_sequence = 0
        self.active = self.function_filter is None or name == self.function_filter
        if self.active:
            gdb.write(f"MWCC: capturing {name}\n")

    def leave_function(self) -> None:
        self.active = False
        self.current_function = ""

    def prefix(self) -> str:
        return f"{self.function_sequence:03d}-{_slug(self.current_function)}"

    def capture_pcode(self, stage: str) -> None:
        try:
            graph = collect_pcode(_Memory(), self.profile, 4096, 65536)
            basename = f"{self.prefix()}-backend-{self.stage_sequence:02d}-{stage}"
            _write_json(self.output / f"{basename}.json", {"function": self.current_function, "stage": stage, "graph": graph})
            (self.output / f"{basename}.txt").write_text(format_pcode(graph), encoding="utf-8")
            self.artifacts.append({"kind": "pcode", "function": self.current_function, "stage": stage, "text": f"{basename}.txt", "blocks": graph["block_count"], "instructions": graph["instruction_count"]})
            self.stage_sequence += 1
        except Exception as exc:
            self.error(f"pcode:{stage}", exc)

    def capture_regalloc(self, head: int, result: int | None, moment: str) -> None:
        try:
            capture = _collect_nodes(_Memory(), self.profile, head)
            capture["colorgraph_result"] = result
            capture["function"] = self.current_function
            capture["moment"] = moment
            basename = f"{self.prefix()}-regalloc-{self.regalloc_sequence:02d}-{_slug(capture['class']['name'])}-{moment}"
            _write_json(self.output / f"{basename}.json", capture)
            (self.output / f"{basename}.txt").write_text(_format_nodes(capture), encoding="utf-8")
            self.artifacts.append({"kind": "regalloc", "function": self.current_function, "register_class": capture["class"]["name"], "moment": moment, "text": f"{basename}.txt", "nodes": capture["node_count"], "colorgraph_result": result})
            self.regalloc_sequence += 1
        except Exception as exc:
            self.error(f"regalloc:{moment}", exc)

    def error(self, stage: str, exc: Exception) -> None:
        self.errors.append({"stage": stage, "type": type(exc).__name__, "message": str(exc)})
        gdb.write(f"MWCC capture warning [{stage}]: {exc}\n", gdb.STDERR)

    def flush_manifest(self, status: str) -> None:
        _write_json(self.output / "manifest.json", {"schema": "mwcc-2.3.3-capture-v1", "status": status, "profile": self.profile["name"], "compiler": self.executable, "function_filter": self.function_filter, "artifacts": self.artifacts, "errors": self.errors})

    def stop(self) -> None:
        self.flush_manifest("complete" if not self.errors else "complete-with-warnings")
        for breakpoint in self.breakpoints:
            try:
                breakpoint.delete()
            except Exception:
                pass
        self.breakpoints.clear()


_RECORDER: _Recorder | None = None


def _options(argument: str) -> dict[str, Any]:
    values = gdb.string_to_argv(argument)
    if not values or values[0] != "start":
        raise gdb.GdbError("expected: mwcc-capture start --profile FILE --output DIRECTORY --executable FILE [--function NAME]")
    options: dict[str, Any] = {"profile": None, "output": None, "executable": None, "function": None}
    index = 1
    while index < len(values):
        option = values[index]
        key = option[2:]
        if not option.startswith("--") or key not in options:
            raise gdb.GdbError(f"unknown mwcc-capture option: {option}")
        if index + 1 >= len(values):
            raise gdb.GdbError(f"{option} requires a value")
        options[key] = values[index + 1]
        index += 2
    for required in ("profile", "output", "executable"):
        if not options[required]:
            raise gdb.GdbError(f"mwcc-capture start requires --{required}")
    return options


class MwccCaptureCommand(gdb.Command):
    def __init__(self) -> None:
        super().__init__("mwcc-capture", gdb.COMMAND_USER)

    def invoke(self, argument: str, from_tty: bool) -> None:
        global _RECORDER
        if gdb.string_to_argv(argument)[:1] == ["stop"]:
            if _RECORDER is None:
                raise gdb.GdbError("no capture is active")
            _RECORDER.stop()
            _RECORDER = None
            return
        if _RECORDER is not None:
            raise gdb.GdbError("a capture is already active")
        options = _options(argument)
        try:
            profile = load_profile(options["profile"])
            executable = fingerprint_executable(options["executable"], profile)
            _RECORDER = _Recorder(profile, executable, options)
        except (OSError, ProfileError, MemoryReadError) as exc:
            raise gdb.GdbError(str(exc)) from exc
        gdb.write(f"MWCC capture armed for {profile['display_name']}\n")


MwccCaptureCommand()
