# Dark Cloud Decompilation Project

DCDecomp is a work-in-progress decompilation project for Dark Cloud for the PlayStation 2.

This project is targeting the NTSC 1.02 version of the game. Other versions may be considered in the future, though they aren't currently planned.

This aims to be a matching decompilation project. The compiler used by Level 5 (and by extension this project) is `MWCC/MWLD 2.3.1.01`.

The build produces the main executable, whose text and data sections are identical to the original, and the `TITLE.BIN` and `DUN.BIN` overlays, which are byte-identical to the original. Matching the main executable's symbol/string tables may be explored in future, though this isn't a current priority.

# Building and running

The toolchain lives in a container built from the repo-root `Dockerfile`.
[Podman](https://podman.io/docs/installation) is what the project targets;
Docker works too, since the image is plain OCI.

1. Clone the project with `git clone --recurse-submodules https://github.com/Adubbz/DCDecomp.git`
2. Place the NTSC 1.02 disc image, named `Dark Cloud (USA).iso`, in the `rom` folder at the root of the project.
3. Run `run.sh`.

That is the whole thing: it builds the container image, extracts and
disassembles the disc, builds and verifies the game, writes the result back to
a copy of the disc image, and boots it in PCSX2.

The first run takes a while, mostly extracting and disassembling. Runs after
that are incremental, because the working tree is mounted into the container
rather than copied into the image, so `ref/` and `build/` persist. Set
`REBUILD_IMAGE=1` after editing the `Dockerfile`.

PCSX2 runs on the host rather than in the container, since it needs a display.
`scripts/pcsx2.sh` looks for it on `PATH`, as a Flatpak and as an AppImage; set
`PCSX2=/path/to/pcsx2-qt` if it is somewhere else. A build that does not match
retail is still booted -- you get a warning, not a refusal -- because that is
exactly when the emulator is useful.

| Script | What it does |
| --- | --- |
| `run.sh` | Build incrementally in the container, then boot in PCSX2 |
| `build.sh` | One-shot build from a clean copy of the tree into `build/` (`build.bat` on Windows) |
| `diff.sh` | Diff a function against the retail original |
| `scripts/pcsx2.sh` | Boot an already-built ISO |

On Windows, `build.bat` covers the build; point PCSX2 at the
`build\Dark Cloud (Build).iso` it leaves behind. The one-command flow is a
shell script, so under WSL use `run.sh` as above.

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
| `run` | Boot that ISO in PCSX2 (needs a native toolchain; otherwise use `run.sh`) |

The rebuilt ISO is a copy of the retail one with only `SCUS_971.11`,
`TITLE.BIN` and `DUN.BIN` overwritten in place, so every other file keeps the
sector it shipped on -- the game seeks to some of them by LBA.

## Diffing

`diff.sh [main|title|dun] <symbol>` compares a function against the
retail original with [asm-differ](https://github.com/simonlindholm/asm-differ);
the mode defaults to `main`. Symbols are the mangled names as they appear in
the link map, e.g.

```
diff.sh title Load__7CScriptFPCc
diff.sh dun GameInit__Fv
```

The overlays ship as raw images with no symbol table, so their functions are
located in `build/SCUS_971.11.xMAP` and diffed by address.

# Development

## Windows

It is strongly advised that when developing with WSL 2 that you **DO NOT** store the project in a subdirectory of `/mnt`. This is severely detrimental to filesystem performance and by extension compilation performance.
