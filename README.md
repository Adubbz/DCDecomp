# Dark Cloud Decompilation Project

![Progress]

[Progress]: https://decomp.dev/Adubbz/DCDecomp.svg?mode=shield&measure=code&label=Code
[progress_link]: https://decomp.dev/Adubbz/DCDecomp


[<img src="https://decomp.dev/Adubbz/DCDecomp.svg?w=512&h=256" width="512" height="256" alt="A visual">][progress_link]

DCDecomp is a work-in-progress decompilation project for Dark Cloud for the PlayStation 2.

This project is targeting the NTSC 1.02 version of the game. Other versions may be considered in the future, though they aren't currently planned.

The build produces the main executable `SCUS_971.11` with matching text and data sections and completely matching `TITLE.BIN` and `DUN.BIN` overlays. Matching the main executable's symbol/string tables may be explored in future, though this isn't a current priority.

# Building and running

1. Clone the repository with `git clone --recurse-submodules https://github.com/Adubbz/DCDecomp.git`
2. Place the NTSC 1.02 disc image, named `Dark Cloud (USA).iso`, in the `rom` folder at the root of the project.
3. Run `run.sh`.

With access to the private repository, building the executables and diffing
work without the disc image; see [Reference assembly](#reference-assembly).

`run.sh` builds the disc image and boots it in PCSX2. `build.sh` does the build
alone, against a clean copy of the sources in a container, and leaves the
results in `build/`.

Both are incremental. The disc is extracted and split once, not once per
build: `rom/`, `asm/` and `build/` are mounted into the container, so the
extracted files, the split and every object survive between runs, and each
step reruns only when one of its inputs changes. Two variables tune it:

```
CLEAN=1 ./build.sh       throw build/ away first, so everything is rebuilt
JOBS=8 ./build.sh        override the job count picked from the visible CPUs
```

On macOS and Windows that count is the podman machine's rather than the
host's, and podman's default is well under it; both scripts say so when they
differ.

## Diffing

`diff.sh <symbol>` compares a function against the retail original with
[objdiff](https://github.com/encounter/objdiff). Symbols are
the mangled names the compiler uses.

```
diff.sh SetDay__9CSaveDataFi          # the main executable
diff.sh Load__7CScriptFPCc            # an overlay -- found on its own
diff.sh dun GameInit__Fv              # ...named explicitly
diff.sh SetDay__9CSaveDataFi -o - --format json    # one-shot, machine-readable
```

`diff.sh --scratch <symbol>` instead creates a
[decomp.me](https://decomp.me) scratch for the function and prints its URL.

```
diff.sh --scratch SetDay__9CSaveDataFi
diff.sh --scratch title Se__7CSpriteFv
```

## Decompiling

`decompile.sh <symbol>` runs [m2c](https://github.com/matt-kempster/m2c) over a
function's reference disassembly and prints C on stdout. It takes the same
symbol spellings and optional section as `diff.sh`:

```
decompile.sh SetDay__9CSaveDataFi          # found on its own
decompile.sh title Se__7CSpriteFv          # ...or name the overlay
decompile.sh DataLoad__Fv --stack-structs  # extra flags go to m2c
```

## Reference assembly

[splat](https://github.com/ethteck/splat) splits the disc images into the
assembly the build compares against, driven by the configuration under
`config/`, which is checked in and is what `scripts/build/disassemble.py` splits
against.
Each translation unit becomes one segment, so its functions and its constants
are written to a single file per unit.

The result, `asm/`, is not checked in. The build splits it on first use and
again whenever the configuration changes. To force a fresh split:

```
cmake --build build --target disassemble
```

The exception is `asm/data/main/parts/`: the main executable's residual data
dumps, carved and hand-edited from an earlier split. They cannot be
regenerated from the disc, so they are checked in.

Without the disc image, `asm/` can instead be split from a copy of
`rom/extracted/iso/SCUS_971.11`, `TITLE.BIN` and `DUN.BIN` kept in a private
repository whose layout mirrors this one; `scripts/host/overlay_private.sh`
copies them into place. This is how CI builds. Either way they are checked
against `rom/extracted.sha256` before a split.

## Documentation

Source documentation is available on [GitHub Pages](https://adubbz.github.io/DCDecomp/).
