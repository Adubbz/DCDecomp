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
