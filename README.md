# Dark Cloud Decompilation Project

[![Code NTSC Progress]](https://decomp.dev/Adubbz/DCDecomp/ntsc)
[![Code PAL Progress]](https://decomp.dev/Adubbz/DCDecomp/pal)

[Code NTSC Progress]: https://decomp.dev/Adubbz/DCDecomp/ntsc.svg?mode=shield&label=NTSC&measure=matched_code_percent
[Code PAL Progress]: https://decomp.dev/Adubbz/DCDecomp/pal.svg?mode=shield&label=PAL&measure=matched_code_percent
[progress_link]: https://decomp.dev/Adubbz/DCDecomp/ntsc


[<img src="https://decomp.dev/Adubbz/DCDecomp/ntsc.svg?w=512&h=256" width="512" height="256" alt="A visual">][progress_link]

DCDecomp is a decompilation project for Dark Cloud for the PlayStation 2.

This project is targeting the NTSC 1.02 and PAL review versions.

The build produces the main executable `SCUS_971.11` with matching text and data sections and completely matching `TITLE.BIN` and `DUN.BIN` overlays. Matching the main executable's symbol/string tables may be explored in future, though this isn't a current priority.

# Building and running

1. Clone the repository with `git clone --recurse-submodules https://github.com/Adubbz/DCDecomp.git`
2. Place the NTSC 1.02 disc image or PAL July 12th build, named `Dark Cloud (NTSC).iso` or `Dark Cloud (PAL).iso`, in the `rom` folder at the root of the project.
3. Run `run.sh`.

`run.sh` builds the disc image and boots it in PCSX2. 
`build.sh` builds only the game.

## PC port

The same code also builds as an x64 program with clang, from the PAL release.
It needs no disc image:

```sh
./dev.sh cmake -S . -B build/pc -G Ninja -DPLATFORM=PC
./dev.sh ninja -C build/pc
```

PlayStation 2 code is stubbed out for now, so `build/pc/darkcloud` stops at
the first call into it. [docs/PC.md](docs/PC.md) explains how `src/port`
replaces code in `src/ps2`.

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

## Documentation

Source documentation is available on [GitHub Pages](https://adubbz.github.io/DCDecomp/).
