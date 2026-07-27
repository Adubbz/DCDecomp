# Dark Cloud Decompilation Project

DCDecomp is a work-in-progress decompilation project for Dark Cloud for the PlayStation 2.

This project is targeting the NTSC 1.02 version of the game. Other versions may be considered in the future, though they aren't currently planned.

This aims to be a matching decompilation project. The compiler used by Level 5 (and by extension this project) is `MWCC/MWLD 2.3.1.01`.

The build produces the main executable, whose text and data sections are identical to the original, and the `TITLE.BIN` and `DUN.BIN` overlays, which are byte-identical to the original. Matching the main executable's symbol/string tables may be explored in future, though this isn't a current priority.

# Building

The toolchain lives in a container built from the repo-root `Dockerfile`.
[Podman](https://podman.io/docs/installation) is what the project targets;
Docker works too, since the image is plain OCI.

1. Clone the project with `git clone --recurse-submodules https://github.com/Adubbz/DCDecomp.git`
2. Place the NTSC 1.02 ISO with the name `Dark Cloud (USA).iso` inside the `rom` folder at the root of the project.
3. Run `scripts/build.sh` (or `scripts\build.bat` on Windows).

That builds the image, extracts and disassembles the retail ISO, builds and
verifies everything, and leaves the results in `build/`.

## Building by hand

Inside the dev container the project is built with CMake and Ninja:

```
cmake -G Ninja -S . -B build            # configure (re-run after `setup`)
cmake --build build --target setup      # extract the ISO and disassemble it
cmake --build build                     # build and verify against the retail hashes
```

The stages, each available as its own target:

| Target | What it does |
| --- | --- |
| `setup` | Extract the retail ISO into `rom/extracted` and disassemble it into `ref/` |
| `disassemble` | Re-run just the disassembly |
| `elf` | Assemble/compile everything and link `build/SCUS_971.11` plus the overlays |
| `build` (default) | `elf`, then verify the executable and both overlays |
| `iso` | Patch the built files into a copy of the retail ISO |
| `run` | Boot that ISO in PCSX2 |

## Diffing

`scripts/diff.sh [main|title|dun] <symbol>` compares a function against the
retail original with [asm-differ](https://github.com/simonlindholm/asm-differ);
the mode defaults to `main`. Symbols are the mangled names as they appear in
the link map, e.g.

```
scripts/diff.sh title Load__7CScriptFPCc
scripts/diff.sh dun GameInit__Fv
```

The overlays ship as raw images with no symbol table, so their functions are
located in `build/SCUS_971.11.xMAP` and diffed by address.

## Running

`cmake --build build --target run` boots `build/Dark Cloud (Build).iso` in
PCSX2. PCSX2 needs a display, so run this on the host rather than in the
container; `scripts/pcsx2.sh` finds it on `PATH`, as a Flatpak or as an
AppImage, and `PCSX2=/path/to/pcsx2-qt` overrides the search.

The ISO is a copy of the retail one with only `SCUS_971.11`, `TITLE.BIN` and
`DUN.BIN` overwritten in place, so every other file keeps the sector it
shipped on -- the game seeks to some of them by LBA.

# Development

## Windows

It is strongly advised that when developing with WSL 2 that you **DO NOT** store the project in a subdirectory of `/mnt`. This is severely detrimental to filesystem performance and by extension compilation performance.
