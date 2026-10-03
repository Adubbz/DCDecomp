# Chronicle

[![NTSC Progress]](https://decomp.dev/TheMoonPeople/Chronicle/ntsc)
[![PAL Progress]](https://decomp.dev/TheMoonPeople/Chronicle/pal)

[NTSC Progress]: https://decomp.dev/TheMoonPeople/Chronicle/ntsc.svg?mode=shield&label=NTSC&measure=matched_code_percent
[PAL Progress]: https://decomp.dev/TheMoonPeople/Chronicle/pal.svg?mode=shield&label=PAL&measure=matched_code_percent
[progress_link]: https://decomp.dev/TheMoonPeople/Chronicle/

[<img src="https://decomp.dev/TheMoonPeople/Chronicle/ntsc.svg?w=512&h=256" width="512" height="256" alt="A visual">][progress_link]

Chronicle is a decompilation project and port of Dark Cloud for the PlayStation 2.

This project produces 100% matching text and data sections for the main executable for the NTSC 1.02 and PAL review versions, and 100% matching `TITLE.BIN` and `DUN.BIN` overlays. Matching the main executable's debug symbols may be explored in the future.

# Building and running

1. Clone the repository with `git clone --recurse-submodules https://github.com/Adubbz/DCDecomp.git`
2. Place the NTSC 1.02 disc image or PAL July 12th build, named `Dark Cloud (NTSC).iso` or `Dark Cloud (PAL).iso`, in the `rom` folder at the root of the project.
3. Run `run.sh`.

`run.sh` builds the disc image and boots it in PCSX2.

`build.sh` builds only the game.

## The PC port

`PLATFORM=PC` builds the game's code as a native Linux and macOS program on SDL3 and Vulkan
(`docs/PC.md`, `docs/MACOS.md`). On Linux it is packaged as a Flatpak, built by CI as
`chronicle.flatpak`; `docs/FLATPAK.md` covers installing it. It needs your own PAL disc: the first
start asks for the disc image and extracts the game's files from it.

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

Source documentation is available on [GitHub Pages](https://themoonpeople.github.io/Chronicle/).
