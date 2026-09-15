#!/usr/bin/env python3
"""Generate evidence-bound Ghidra annotations for undecompiled functions."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
INCLUDE_ASM_RE = re.compile(
    r'(?m)^\s*INCLUDE_ASM\(\s*"asm/nonmatchings/([^"]+)"\s*,\s*([^\s,)]+)\s*\)\s*;'
)
WORD_RE = re.compile(r'/\*\s+[0-9A-F]{6}\s+([0-9A-F]{8})\s+([0-9A-F]{8})\s+\*/')
GLABEL_RE = re.compile(r'(?m)^glabel\s+(?:"([^"]+)"|([^\s]+))')
UNIT_RE = re.compile(
    r'\{\s*start:\s*0x[0-9a-fA-F]+\s*,\s*type:\s*(?:cpp|c|asm|hasm|gcc)\s*,\s*name:\s*([^,}\s]+)'
)
DOC_RE = re.compile(r'/\*\*(.*?)\*/', re.S)
TAG_RE = re.compile(r'@(mangled|address|size)\s+([^\s*]+)')
ELF_FUNCTION_RE = re.compile(
    r'^\s*\d+:\s+([0-9a-fA-F]+)\s+(\d+)\s+FUNC\s+.*?\s+'
    r'(?:DEFAULT|INTERNAL|HIDDEN|PROTECTED)\s+(\d+)\s+(\S+)\s*$'
)

KNOWN_TYPES = [
    {
        "kind": "enum",
        "name": "SHOT_COLLISION_RESULT",
        "size": 4,
        "comment": "Identifies what stopped a moving projectile during a collision query.",
        "values": {
            "SHOT_COLLISION_NONE": 0,
            "SHOT_COLLISION_MAP": 1,
            "SHOT_COLLISION_PLAYER": 2,
            "SHOT_COLLISION_MONSTER": 3,
        },
        "documentation": "include/shot_utils.hpp",
    },
    {
        "kind": "structure",
        "name": "CHealEffect",
        "size": "0x520",
        "comment": "Animates the ring of healing particles around the player character.",
        "fields": [
            {"offset": "0x000", "name": "position", "type": "float", "dimensions": [4], "comment": "World-space centre of the effect."},
            {"offset": "0x010", "name": "particle_offset", "type": "float", "dimensions": [32, 4], "comment": "Rotated offset of each healing particle."},
            {"offset": "0x210", "name": "angle", "type": "float", "dimensions": [32], "comment": "Rotation angle of each particle around the centre."},
            {"offset": "0x290", "name": "angular_velocity", "type": "float", "dimensions": [32], "comment": "Per-step angular advance of each particle."},
            {"offset": "0x310", "name": "radius", "type": "float", "dimensions": [32], "comment": "Horizontal orbit radius of each particle."},
            {"offset": "0x390", "name": "alpha", "type": "float", "dimensions": [32], "comment": "Current opacity of each particle."},
            {"offset": "0x410", "name": "phase", "type": "float", "dimensions": [32], "comment": "Lifetime phase controlling height and opacity."},
            {"offset": "0x490", "name": "size", "type": "float", "dimensions": [32], "comment": "Draw size of each particle."},
            {"offset": "0x510", "name": "active", "type": "s32", "comment": "Indicates that the particle effect is advancing."},
            {"offset": "0x514", "name": "unk_514", "type": "u8", "dimensions": [12]},
        ],
        "documentation": "include/healeffect.hpp",
    },
    {
        "kind": "structure",
        "name": "CMenuItemStep",
        "size": "0x2c",
        "comment": "Accumulates elapsed play time and applies it to time-sensitive inventory items.",
        "fields": [
            {"offset": "0x00", "name": "frame", "type": "s32", "comment": "Frames accumulated toward the next inventory-volume step."},
            {"offset": "0x04", "name": "unk_04", "type": "s32"},
            {"offset": "0x08", "name": "unk_08", "type": "s16"},
            {"offset": "0x0a", "name": "unk_0A", "type": "s16"},
            {"offset": "0x0c", "name": "enabled", "type": "s16", "comment": "Enables periodic inventory-volume accumulation."},
            {"offset": "0x0e", "name": "unk_0E", "type": "s16"},
            {"offset": "0x10", "name": "unk_10", "type": "s16", "dimensions": [4]},
            {"offset": "0x18", "name": "unk_18", "type": "s16", "dimensions": [4]},
            {"offset": "0x20", "name": "unk_20", "type": "s16", "dimensions": [4]},
            {"offset": "0x28", "name": "pending_volume", "type": "s32", "comment": "Inventory-volume steps waiting to be applied."},
        ],
        "documentation": "include/menuitemstep.hpp",
    },
    {
        "kind": "opaque",
        "name": "CTexture",
        "comment": "Texture object referenced by rendering helpers.",
    },
    {
        "kind": "opaque",
        "name": "CEffectTextureFrame",
        "comment": "Linked texture-animation frame referenced by effects.",
    },
    {
        "kind": "structure", "name": "CRect_i_", "size": "0x10",
        "comment": "Names a rectangle by its origin and extent.",
        "documentation": "include/rect.hpp",
        "fields": [
            {"offset": "0x0", "name": "x", "type": "s32", "comment": "Horizontal origin."},
            {"offset": "0x4", "name": "y", "type": "s32", "comment": "Vertical origin."},
            {"offset": "0x8", "name": "width", "type": "s32", "comment": "Horizontal extent."},
            {"offset": "0xC", "name": "height", "type": "s32", "comment": "Vertical extent."},
        ],
    },
    {
        "kind": "structure", "name": "spRGBA", "size": "0x4",
        "comment": "Stores a sprite corner colour and opacity.",
        "documentation": "include/rect.hpp",
        "fields": [
            {"offset": "0x0", "name": "r", "type": "u8", "comment": "Red channel."},
            {"offset": "0x1", "name": "g", "type": "u8", "comment": "Green channel."},
            {"offset": "0x2", "name": "b", "type": "u8", "comment": "Blue channel."},
            {"offset": "0x3", "name": "a", "type": "u8", "comment": "Opacity channel."},
        ],
    },
    {
        "kind": "structure", "name": "Fader", "size": "0x4",
        "comment": "Tracks a linearly changing 0-to-128 fade level.",
        "documentation": "include/fader.hpp",
        "fields": [{"offset": "0x0", "name": "value", "type": "s32", "comment": "Current fade level."}],
    },
    {
        "kind": "structure", "name": "MAP_TRAP_CIRCLE", "size": "0x20",
        "comment": "Describes one trap circle that a trap left on the floor.",
        "documentation": "include/dungeonmap.hpp",
        "fields": [
            {"offset":"0x00","name":"pos","type":"float","dimensions":[4],"comment":"World position of the circle."},
            {"offset":"0x10","name":"state","type":"s32","comment":"Lifecycle state of the circle slot."},
            {"offset":"0x14","name":"kind","type":"s32","comment":"Identifier of the displayed trap."},
            {"offset":"0x18","name":"timer","type":"float","comment":"Elapsed fade time."},
            {"offset":"0x1C","name":"unk_1C","type":"s32"},
        ],
    },
    {
        "kind": "structure", "name": "CCandleEffect", "size": "0x30",
        "comment": "Animates and draws the camera-facing sprite used for a candle flame.",
        "documentation": "include/candleeffect.hpp",
        "fields": [
            {"offset": "0x00", "name": "enabled", "type": "s32", "comment": "Whether the candle sprite can be drawn."},
            {"offset": "0x04", "name": "animation_frame", "type": "float", "comment": "Fractional frame within the eight-frame flame cycle."},
            {"offset": "0x08", "name": "texture", "type": "CTexture *", "comment": "Texture containing the flame atlas."},
            {"offset": "0x0C", "name": "unk_0c", "type": "u32"},
            {"offset": "0x10", "name": "position", "type": "float", "dimensions": [4], "comment": "Homogeneous world-space centre."},
            {"offset": "0x20", "name": "half_width", "type": "float", "comment": "Horizontal half-extent."},
            {"offset": "0x24", "name": "half_height", "type": "float", "comment": "Vertical half-extent."},
            {"offset": "0x28", "name": "unk_28", "type": "u32"},
            {"offset": "0x2C", "name": "unk_2c", "type": "u32"},
        ],
    },
]

KNOWN_TYPES.extend([
    {
        "kind": "structure", "name": "CEffectParam", "size": "0xE0",
        "comment": "Describes the initial motion, appearance, and animation of one effect.",
        "documentation": "include/effect.hpp",
        "fields": [
            {"offset":"0x00","name":"lifetime","type":"s32","comment":"Number of frames before retirement."},
            {"offset":"0x04","name":"position_oscillation_flags","type":"s32","comment":"Enables sinusoidal position offsets."},
            {"offset":"0x08","name":"width","type":"float"}, {"offset":"0x0C","name":"height","type":"float"},
            {"offset":"0x10","name":"draw_mode","type":"s32"}, {"offset":"0x14","name":"scale_oscillation_flags","type":"s32"},
            {"offset":"0x18","name":"unk_18","type":"u32"}, {"offset":"0x1C","name":"unk_1c","type":"u32"},
            {"offset":"0x20","name":"position","type":"float","dimensions":[4]}, {"offset":"0x30","name":"velocity","type":"float","dimensions":[4]},
            {"offset":"0x40","name":"acceleration","type":"float","dimensions":[4]}, {"offset":"0x50","name":"position_oscillation_scale","type":"float","dimensions":[4]},
            {"offset":"0x60","name":"position_oscillation_rate","type":"float","dimensions":[4]}, {"offset":"0x70","name":"scale","type":"float","dimensions":[4]},
            {"offset":"0x80","name":"scale_velocity","type":"float","dimensions":[4]}, {"offset":"0x90","name":"scale_oscillation_scale","type":"float","dimensions":[4]},
            {"offset":"0xA0","name":"scale_oscillation_rate","type":"float","dimensions":[4]},
            {"offset":"0xB0","name":"opacity_mode","type":"s32"}, {"offset":"0xB4","name":"render_flags","type":"s32"},
            {"offset":"0xB8","name":"opacity","type":"float"}, {"offset":"0xBC","name":"texture","type":"CTexture *"},
            {"offset":"0xC0","name":"texel","type":"CRect_i_"}, {"offset":"0xD0","name":"texture_frames","type":"CEffectTextureFrame *"},
            {"offset":"0xD4","name":"texture_frame_period","type":"s32"}, {"offset":"0xD8","name":"unk_d8","type":"u32"},
            {"offset":"0xDC","name":"unk_dc","type":"u32"},
        ],
    },
    {
        "kind":"structure","name":"CEffect","size":"0x100","comment":"Stores one live animated sprite effect in an effect-group pool.","documentation":"include/effect.hpp",
        "fields":[
            {"offset":"0x00","name":"active","type":"s16"},{"offset":"0x02","name":"frame","type":"s16"},{"offset":"0x04","name":"lifetime","type":"s16"},{"offset":"0x06","name":"draw_mode","type":"s16"},
            {"offset":"0x08","name":"width","type":"float"},{"offset":"0x0C","name":"height","type":"float"},{"offset":"0x10","name":"position_oscillation_flags","type":"s32"},
            {"offset":"0x14","name":"unk_14","type":"u32"},{"offset":"0x18","name":"unk_18","type":"u32"},{"offset":"0x1C","name":"unk_1c","type":"u32"},
            {"offset":"0x20","name":"position","type":"float","dimensions":[4]},{"offset":"0x30","name":"velocity","type":"float","dimensions":[4]},
            {"offset":"0x40","name":"acceleration","type":"float","dimensions":[4]},{"offset":"0x50","name":"position_oscillation_scale","type":"float","dimensions":[4]},
            {"offset":"0x60","name":"position_oscillation_rate","type":"float","dimensions":[4]},{"offset":"0x70","name":"scale_oscillation_flags","type":"s32"},
            {"offset":"0x74","name":"unk_74","type":"u32"},{"offset":"0x78","name":"unk_78","type":"u32"},{"offset":"0x7C","name":"unk_7c","type":"u32"},
            {"offset":"0x80","name":"scale","type":"float","dimensions":[4]},{"offset":"0x90","name":"scale_velocity","type":"float","dimensions":[4]},
            {"offset":"0xA0","name":"scale_oscillation_scale","type":"float","dimensions":[4]},{"offset":"0xB0","name":"scale_oscillation_rate","type":"float","dimensions":[4]},
            {"offset":"0xC0","name":"opacity_mode","type":"s32"},{"offset":"0xC4","name":"opacity","type":"float"},{"offset":"0xC8","name":"opacity_step","type":"float"},
            {"offset":"0xCC","name":"render_flags","type":"s32"},{"offset":"0xD0","name":"texture","type":"CTexture *"},{"offset":"0xD4","name":"unk_d4","type":"u32"},
            {"offset":"0xD8","name":"unk_d8","type":"u32"},{"offset":"0xDC","name":"unk_dc","type":"u32"},{"offset":"0xE0","name":"texel","type":"CRect_i_"},
            {"offset":"0xF0","name":"texture_frames","type":"CEffectTextureFrame *"},{"offset":"0xF4","name":"texture_frame_period","type":"s32"},
            {"offset":"0xF8","name":"unk_f8","type":"u32"},{"offset":"0xFC","name":"unk_fc","type":"u32"},
        ],
    },
    {
        "kind":"structure","name":"C3DSprite","size":"0x40","comment":"Draws a textured rectangle positioned in three-dimensional world space.","documentation":"include/effect.hpp",
        "fields":[
            {"offset":"0x00","name":"position","type":"float","dimensions":[4]},{"offset":"0x10","name":"half_width","type":"float"},{"offset":"0x14","name":"half_height","type":"float"},
            {"offset":"0x18","name":"texture","type":"CTexture *"},{"offset":"0x1C","name":"unk_1c","type":"u32"},{"offset":"0x20","name":"texel","type":"CRect_i_"},
            {"offset":"0x30","name":"colour","type":"spRGBA"},{"offset":"0x34","name":"alpha_blend","type":"s32"},{"offset":"0x38","name":"disable_z_write","type":"s32"},{"offset":"0x3C","name":"unk_3c","type":"u32"},
        ],
    },
    {
        "kind":"structure","name":"CEffectGroup","size":"0x8","comment":"Owns access to a caller-supplied fixed-capacity pool of effects.","documentation":"include/effectgroup.hpp",
        "fields":[{"offset":"0x0","name":"effect_table","type":"CEffect *"},{"offset":"0x4","name":"capacity","type":"s32"}],
    },
])

KNOWN_SIGNATURES = {
    "checkCollision__FPfPfPfif": {
        "return_type": "SHOT_COLLISION_RESULT",
        "parameters": [
            {"name": "hit_position", "type": "float *"},
            {"name": "position", "type": "float *"},
            {"name": "movement", "type": "float *"},
            {"name": "target_mode", "type": "s32"},
            {"name": "radius", "type": "float"},
        ],
    },
    "set3DCellModel__FPfPcfiiiiUc": {
        "return_type": "void",
        "parameters": [
            {"name": "world", "type": "float *"},
            {"name": "texture_name", "type": "char *"},
            {"name": "size", "type": "float"},
            {"name": "x", "type": "s32"},
            {"name": "y", "type": "s32"},
            {"name": "width", "type": "s32"},
            {"name": "height", "type": "s32"},
            {"name": "blend", "type": "u8"},
        ],
    },
    "Set__11CHealEffectFPf": {
        "return_type": "void",
        "parameters": [
            {"name": "this", "type": "CHealEffect *"},
            {"name": "world", "type": "float *"},
        ],
    },
    "Step__11CHealEffectFv": {
        "return_type": "void",
        "parameters": [{"name": "this", "type": "CHealEffect *"}],
    },
    "Draw__11CHealEffectFv": {
        "return_type": "void",
        "parameters": [{"name": "this", "type": "CHealEffect *"}],
    },
    "Initialize__13CMenuItemStepFv": {
        "return_type": "void",
        "parameters": [{"name": "this", "type": "CMenuItemStep *"}],
    },
    "LoopStep__13CMenuItemStepFi": {
        "return_type": "void",
        "parameters": [
            {"name": "this", "type": "CMenuItemStep *"},
            {"name": "interval", "type": "s32"},
        ],
    },
    "CheckItemVolume__13CMenuItemStepFv": {
        "return_type": "void",
        "parameters": [{"name": "this", "type": "CMenuItemStep *"}],
    },
}

KNOWN_SIGNATURES.update({
    "Run_TrapCircle__FP15MAP_TRAP_CIRCLE": {"return_type":"s32","parameters":[{"name":"trap","type":"MAP_TRAP_CIRCLE *"}]},
    "In__5FaderFv": {"return_type":"s32","parameters":[{"name":"this","type":"Fader *"}]},
    "Out__5FaderFv": {"return_type":"s32","parameters":[{"name":"this","type":"Fader *"}]},
    "Get__5FaderFi": {"return_type":"s32","parameters":[{"name":"this","type":"Fader *"},{"name":"maximum","type":"s32"}]},
    "Initialize__12CEffectParamFv": {"return_type":"void","parameters":[{"name":"this","type":"CEffectParam *"}]},
    "SetEffect__7CEffectFP12CEffectParam": {"return_type":"void","parameters":[{"name":"this","type":"CEffect *"},{"name":"parameters","type":"CEffectParam *"}]},
    "Step__7CEffectFi": {"return_type":"void","parameters":[{"name":"this","type":"CEffect *"},{"name":"unused","type":"s32"}]},
    "Draw__7CEffectFv": {"return_type":"void","parameters":[{"name":"this","type":"CEffect *"}]},
    "Initialize__7CEffectFv": {"return_type":"void","parameters":[{"name":"this","type":"CEffect *"}]},
    "__ct__9C3DSpriteFv": {"return_type":"void","parameters":[{"name":"this","type":"C3DSprite *"}]},
    "Draw__9C3DSpriteFv": {"return_type":"void","parameters":[{"name":"this","type":"C3DSprite *"}]},
    "Initialize__9C3DSpriteFv": {"return_type":"void","parameters":[{"name":"this","type":"C3DSprite *"}]},
    "EnterEffect__12CEffectGroupFP12CEffectParam": {"return_type":"s32","parameters":[{"name":"this","type":"CEffectGroup *"},{"name":"parameters","type":"CEffectParam *"}]},
    "Step__12CEffectGroupFi": {"return_type":"void","parameters":[{"name":"this","type":"CEffectGroup *"},{"name":"unused","type":"s32"}]},
    "Draw__12CEffectGroupFv": {"return_type":"void","parameters":[{"name":"this","type":"CEffectGroup *"}]},
    "Clear__12CEffectGroupFv": {"return_type":"void","parameters":[{"name":"this","type":"CEffectGroup *"}]},
    "Initialize__12CEffectGroupFP7CEffecti": {"return_type":"void","parameters":[{"name":"this","type":"CEffectGroup *"},{"name":"table","type":"CEffect *"},{"name":"count","type":"s32"}]},
    "Initialize__13CCandleEffectFv": {"return_type":"void","parameters":[{"name":"this","type":"CCandleEffect *"}]},
    "__ct__13CCandleEffectFv": {"return_type":"void","parameters":[{"name":"this","type":"CCandleEffect *"}]},
    "SetTexture__13CCandleEffectFP8CTexture": {"return_type":"void","parameters":[{"name":"this","type":"CCandleEffect *"},{"name":"flame_texture","type":"CTexture *"}]},
    "SetScale__13CCandleEffectFff": {"return_type":"void","parameters":[{"name":"this","type":"CCandleEffect *"},{"name":"half_width","type":"float"},{"name":"half_height","type":"float"}]},
    "SetPosition__13CCandleEffectFPf": {"return_type":"void","parameters":[{"name":"this","type":"CCandleEffect *"},{"name":"position","type":"float *"}]},
    "Step__13CCandleEffectFv": {"return_type":"void","parameters":[{"name":"this","type":"CCandleEffect *"}]},
    "Draw__13CCandleEffectFv": {"return_type":"void","parameters":[{"name":"this","type":"CCandleEffect *"}]},
})

# Linker/overlay sentinels supplied through INCLUDE_ASM are byte ranges, not functions.
NON_FUNCTION_MARKERS = {"_dun_text_start", "_title_text_start"}


def unit_images() -> dict[str, str]:
    result: dict[str, str] = {}
    for image in ("main", "title", "dun"):
        text = (ROOT / "config" / f"{image}.yaml").read_text()
        for match in UNIT_RE.finditer(text):
            result[match.group(1)] = image
    return result


def documented_functions() -> dict[str, dict[str, object]]:
    """Every documented function, from the headers and from the units themselves.

    A file-scope static has no declaration in a header, so the unit that defines
    it carries its documentation; AGENTS.md says as much. Headers are read first
    so that a name documented in both keeps the header's wording.
    """
    docs: dict[str, dict[str, object]] = {}
    sources = sorted((ROOT / "include").rglob("*")) + sorted((ROOT / "src").rglob("*"))
    for path in sources:
        if not path.is_file() or path.suffix not in {".h", ".hpp", ".c", ".cpp"}:
            continue
        text = path.read_text(errors="replace")
        for block in DOC_RE.finditer(text):
            tags = dict(TAG_RE.findall(block.group(1)))
            mangled = tags.get("mangled")
            if not mangled or "address" not in tags or "size" not in tags:
                continue
            lines = []
            for raw in block.group(1).splitlines():
                line = re.sub(r"^\s*\*?\s?", "", raw).strip()
                if line and not line.startswith("@"):
                    lines.append(line)
            comment = " ".join(lines).strip() or None
            try:
                address = int(tags["address"], 0)
                size = int(tags["size"], 0)
            except ValueError:
                continue
            record = {
                "address": address,
                "size": size,
                "comment": comment,
                "header": path.relative_to(ROOT).as_posix(),
            }
            previous = docs.get(mangled)
            if previous is None or previous == record:
                docs[mangled] = record
            elif (previous["address"], previous["size"]) == (address, size):
                # The same function documented twice -- a header declaring it and
                # the unit defining it. They agree on what it is, so the first
                # wins and headers are read first.
                pass
            else:
                # Two different claims about where the function is. Neither is
                # safe to apply.
                docs.pop(mangled, None)
    return docs


def elf_functions() -> dict[tuple[str, int], tuple[int, str]]:
    elf = Path("/home/adubbz/development/re/Dark Cloud/SCUS_971.11")
    output = subprocess.run(
        ["readelf", "-Ws", str(elf)], check=True, text=True, capture_output=True
    ).stdout
    sections = {"4": "main", "6": "title", "8": "dun"}
    result: dict[tuple[str, int], tuple[int, str]] = {}
    for line in output.splitlines():
        match = ELF_FUNCTION_RE.match(line)
        if match is None or match.group(3) not in sections:
            continue
        address = int(match.group(1), 16)
        key = (sections[match.group(3)], address)
        value = (int(match.group(2), 10), match.group(4))
        if key in result and result[key][0] != value[0]:
            raise ValueError(f"ambiguous ELF function at {key}")
        result[key] = value
    return result


def parse_asm(path: Path, expected_name: str, expected_size: int) -> tuple[int, int, str]:
    text = path.read_text()
    labels = list(GLABEL_RE.finditer(text))
    label_match = next(
        (match for match in labels if (match.group(1) or match.group(2)) == expected_name),
        None,
    )
    if label_match is None:
        raise ValueError(f"{path}: no glabel")
    following_label = next(
        (match for match in labels if match.start() > label_match.start()), None
    )
    body = text[label_match.end() : following_label.start() if following_label else len(text)]
    words = WORD_RE.findall(body)
    if not words:
        raise ValueError(f"{path}: no retail instruction words")
    addresses = [int(address, 16) for address, _ in words]
    expected = list(range(addresses[0], addresses[0] + 4 * len(addresses), 4))
    if addresses != expected:
        raise ValueError(f"{path}: non-contiguous retail words")
    data = bytes.fromhex("".join(word for _, word in words))
    if expected_size <= 0 or expected_size > len(data) or expected_size % 4:
        raise ValueError(f"{path}: invalid ELF size 0x{expected_size:x}")
    data = data[:expected_size]
    return addresses[0], len(data), hashlib.sha256(data).hexdigest()


def asm_address(path: Path, expected_name: str) -> int:
    text = path.read_text()
    labels = list(GLABEL_RE.finditer(text))
    label = next(
        (match for match in labels if (match.group(1) or match.group(2)) == expected_name),
        None,
    )
    if label is None:
        raise ValueError(f"{path}: no glabel {expected_name}")
    word = WORD_RE.search(text, label.end())
    if word is None:
        raise ValueError(f"{path}: no words after glabel {expected_name}")
    return int(word.group(1), 16)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--output",
        type=Path,
        default=ROOT / "config" / "ghidra_annotations.json",
    )
    args = parser.parse_args()

    images = unit_images()
    symbols = elf_functions()
    docs = documented_functions()
    functions: list[dict[str, object]] = []
    seen: set[tuple[str, int]] = set()
    missing_assembly = 0

    for source in sorted((ROOT / "src").rglob("*")):
        if not source.is_file() or source.suffix not in {".c", ".cpp"}:
            continue
        text = source.read_text(errors="replace")
        for match in INCLUDE_ASM_RE.finditer(text):
            unit, name = match.groups()
            if name in NON_FUNCTION_MARKERS:
                continue
            asm_path = ROOT / "asm" / "nonmatchings" / unit / f"{name}.s"
            if not asm_path.is_file():
                missing_assembly += 1
                continue
            image = images.get(unit)
            if image is None:
                raise ValueError(f"no retail image mapping for translation unit {unit}")
            start = asm_address(asm_path, name)
            symbol = symbols.get((image, start))
            if symbol is None:
                raise ValueError(f"no ELF function symbol for {image}:{name}")
            address, size, digest = parse_asm(asm_path, name, symbol[0])
            if address != start:
                raise ValueError(f"assembly/ELF address mismatch for {image}:{name}")
            key = (image, address)
            if key in seen:
                raise ValueError(f"duplicate function address {image}:0x{address:08x}")
            seen.add(key)
            entry: dict[str, object] = {
                "translation_unit": unit,
                "source": source.relative_to(ROOT).as_posix(),
                "assembly": asm_path.relative_to(ROOT).as_posix(),
                "image": image,
                "address": f"0x{address:08X}",
                "size": f"0x{size:X}",
                "name": name,
                "sha256": digest,
            }
            doc = docs.get(name)
            if doc and doc["address"] == address and doc["size"] == size:
                if doc["comment"]:
                    entry["comment"] = doc["comment"]
                entry["documentation"] = doc["header"]
            if name in KNOWN_SIGNATURES:
                if not doc or doc["address"] != address or doc["size"] != size:
                    raise ValueError(f"signature documentation disagrees for {name}")
                entry["signature"] = KNOWN_SIGNATURES[name]
            functions.append(entry)

    functions.sort(key=lambda item: (str(item["image"]), int(str(item["address"]), 0)))
    prior_by_image: dict[str, tuple[int, int, str]] = {}
    for function in functions:
        image = str(function["image"])
        start = int(str(function["address"]), 0)
        end = start + int(str(function["size"]), 0)
        prior = prior_by_image.get(image)
        if prior is not None and start < prior[1]:
            raise ValueError(
                f"overlapping retail functions {image}:{prior[2]} and {function['name']}"
            )
        prior_by_image[image] = (start, end, str(function["name"]))
    payload = {
        "schema_version": 2,
        "programs": {
            "main": "SCUS_971.11",
            "title": "TITLE.BIN",
            "dun": "DUN.BIN",
        },
        "types": KNOWN_TYPES,
        "functions": functions,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2) + "\n")
    documented = sum("comment" in function for function in functions)
    signatures = sum("signature" in function for function in functions)
    by_image = {
        image: sum(function["image"] == image for function in functions)
        for image in ("main", "title", "dun")
    }
    print(f"wrote {len(functions)} functions to {args.output}")
    print(f"images: {by_image}; documented comments: {documented}")
    print(f"documented types: {len(KNOWN_TYPES)}; signatures: {signatures}")
    print(f"markers without asm/nonmatchings files: {missing_assembly}")


if __name__ == "__main__":
    main()
