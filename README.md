# Dark Cloud Decompilation Project

DCDecomp is a work-in-progress decompilation project for Dark Cloud for the PlayStation 2.

This project is targeting the NTSC 1.02 version of the game. Other versions may be considered in the future, though they aren't currently planned.

This aims to be a matching decompilation project. The compiler used by Level 5
(and by extension this project) is Metrowerks CodeWarrior for PlayStation 2 --
`mwcc` 2.3.3 with `mwld` 2.4, the command-line tools from the R2.5 release.
Everything around it (the assembler the reference `.s` files go through, and
`objcopy`/`objdump`/`readelf`/`nm`) comes from
[binutils-mips-ps2-decompals](https://github.com/decompals/binutils-mips-ps2-decompals).

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
rather than copied into the image, so `ref/` and `build/` persist. `build.sh`
copies the sources into an image instead, but mounts `rom/` and `ref/`, so it
does not re-extract or re-disassemble an unchanged disc either. Set
`REBUILD_IMAGE=1` after editing the `Dockerfile`.

PCSX2 runs on the host rather than in the container, since it needs a display.
`scripts/host/pcsx2.sh` looks for it on `PATH`, as a Flatpak and as an AppImage; set
`PCSX2=/path/to/pcsx2-qt` if it is somewhere else. A build that does not match
retail is still booted -- you get a warning, not a refusal -- because that is
exactly when the emulator is useful.

| Script | What it does |
| --- | --- |
| `run.sh` | Build incrementally in the container, then boot in PCSX2 |
| `build.sh` | One-shot build from a clean copy of the tree into `build/` (`build.bat` on Windows) |
| `diff.sh` | Diff a function against the retail original |
| `decompile.sh` | Decompile a function with m2c |
| `permuting/new.sh` | Scaffold a decomp-permuter case for a function |
| `permuting/run.sh` | Run decomp-permuter on one of those cases |
| `scripts/host/pcsx2.sh` | Boot an already-built ISO |

On Windows, `build.bat` covers the build; point PCSX2 at the
`build\Dark Cloud (Build).iso` it leaves behind. The one-command flow is a
shell script, so under WSL use `run.sh` as above.

Those are the entry points; everything they call lives under `scripts/`,
grouped by who invokes it:

| Directory | Contents |
| --- | --- |
| `scripts/build/` | `cmake.sh`, the one place that runs cmake, plus the pipeline it drives: extract, disassemble, carve migrated sections, generate the linker script and layout, compile, verify, write the ISO |
| `scripts/diff/` | Working a function against retail: `compare_build.py`, the `ref_index.py` lookup `diff.sh` and `decompile.sh` share, and `m2ctx.py` for the m2c context |
| `scripts/host/` | Plumbing for the entry-point scripts themselves -- container selection and the PCSX2 launcher |
| `scripts/patterns/` | ImHex pattern files for inspecting the binaries |

## Building by hand

For a shell in the same container `run.sh` uses:

```
podman run --rm -it -v "$PWD:/dcdecomp:Z" -w /dcdecomp dcdecomp_dev bash
```

Mount it at `/dcdecomp` and nowhere else. Every context that touches the tree
-- these scripts, the build image and the `.devcontainer` -- uses that one
path, because they share `build/` and `CMakeCache.txt` records the absolute
source directory it was configured for. A cache written under a different path
is one CMake refuses to reuse, and it refuses during `cmake --build` too, not
just at configure time.

The entry-point scripts notice when they are already inside the container and
do the work directly instead of starting another one, so `build.sh`, `diff.sh`,
`decompile.sh` and the `permuting/` scripts run unchanged from that shell and from the
`.devcontainer`. `run.sh` is the exception: it boots PCSX2, which needs the
host's display.

Inside it, build through `scripts/build/cmake.sh` -- the one place that runs
cmake. It configures, bootstraps `setup` on a fresh tree, and reconfigures
afterwards so the object lists that `setup` writes are picked up:

```
scripts/build/cmake.sh                  # build and verify against the retail hashes
scripts/build/cmake.sh elf ctx          # ...or name the targets
```

It also recovers from a cache left behind at some other path, reconfiguring
with `--fresh` when it finds one -- and only then, so an ordinary incremental
build keeps its cache. Calling `cmake` directly still works, but it is the one
thing that will hit that error.

The stages, each available as its own target:

| Target | What it does |
| --- | --- |
| `setup` | Check the retail ISO, extract it into `rom/extracted`, disassemble it into `ref/` |
| `disassemble` | Force the disassembly to re-run, whatever its inputs say |
| `elf` | Assemble/compile everything and link `build/SCUS_971.11` plus the overlays |
| `build` (default) | `elf`, then verify the executable and both overlays |
| `iso` | Patch the built files into a copy of the retail ISO |
| `run` | Boot that ISO in PCSX2 (needs a native toolchain; otherwise use `run.sh`) |

Every entry point reaches these through `scripts/build/cmake.sh` rather than
calling cmake itself, so the configure rules -- the setup bootstrap, the
reconfigure that has to follow it, and the stale-cache recovery -- live in one
place.

`setup` is three separately tracked steps, not one block of work: checking the
disc, extracting it, and disassembling it. Each records what it produced, so
`setup` on a tree that already has `ref/` does nothing, and changing one input
redoes only what depends on it -- editing `disassemble.py` re-disassembles
without re-extracting 1.7GB first. `disassemble` remains as the escape hatch
for forcing it regardless.

The `iso` target masters a fresh image from `rom/extracted`, with the built
executable and overlays used in place of the retail ones. Because it is
mastered rather than patched, the built files can be any size.

## Diffing

`diff.sh <symbol>` compares a function against the retail original with
[objdiff](https://github.com/encounter/objdiff), in the container. Symbols are
the mangled names the compiler uses; anything after the symbol goes to
objdiff-cli.

```
diff.sh SetDay__9CSaveDataFi          # the main executable
diff.sh Load__7CScriptFPCc            # an overlay -- found on its own
diff.sh dun GameInit__Fv              # ...named explicitly
diff.sh SetDay__9CSaveDataFi -o - --format json    # one-shot, machine-readable
```

objdiff compares object files rather than disassembly text. Each unit pairs the
reference dump of one retail function, assembled exactly as retail wrote it,
with whichever object provides that function now -- the compiled `.cpp` once it
has been decompiled, and nothing before that, which is how a unit scores zero.
`objdiff.json` holds that pairing for every function in the game;
`scripts/build/gen_objdiff.py` derives it from the address index and the
provenance file, and the `objdiff` target regenerates it, so it is generated
rather than committed.

Which image a symbol belongs to comes from `ref/asm/objects/*.index`, the
address index `setup` writes, so `grep <name> ref/asm/objects/*.index` is how
to look one up.

`diff.sh --scratch <symbol>` instead creates a
[decomp.me](https://decomp.me) scratch for the function and prints its URL --
the same thing https://decomp.me/new does, but filled in from this tree:

```
diff.sh --scratch SetDay__9CSaveDataFi
diff.sh --scratch title Se__7CSpriteFv
```

It uses compiler `mwcps2-2.3.3-000906` on platform `ps2` (decomp.me assembles
with the same `mips-ps2-decompals-as` this project does) and `build/ctx.cpp` as
the context -- the C++ one, because decomp.me compiles the context with mwcc
rather than parsing it, and `-lang=c++` is passed so it is read as the C++ it
is. The rest of the flags are the build's own, less the ones decomp.me supplies
itself (`-c`) or cannot resolve (`-i <dir>`, which the context stands in for).
They are read from `build/compiler_flags.txt`, written by CMake from the same
list the objects are compiled with, so the two cannot drift. Note that this
uploads the function's disassembly and the context to a public site.

`diff.sh` answers "how does this one function differ". To ask the other
question -- what is left, across the whole binary -- `compare_build.py`
compares every image byte for byte, attributes each difference to the symbol
that owns it, and prints the instruction it lands on:

```
podman run --rm -v "$PWD:/dcdecomp:Z" -w /dcdecomp dcdecomp_dev \
    python3 scripts/diff/compare_build.py
```

It reports content (which functions differ, and where in them), placement
(symbols at the wrong address, with a changed size or occurrence count, or
never defined at all), and a summary per image. It exits non-zero if anything
differs, and `--help` covers the rest.

## Progress on decomp.dev

`diff.sh --report` writes `progress/report.json`, the objdiff progress report
that [decomp.dev](https://decomp.dev) renders into a progress page, a badge and
PR comments. It measures every retail function, not only the decompiled ones,
so the percentage is a share of the whole game.

`.github/workflows/progress.yml` regenerates and uploads it on every push, so
nothing about it is committed or kept up to date by hand. That job builds the
game from scratch **without the disc**: the reference disassembly under `ref/`
and the Metrowerks compiler under `tools/compilers` are both in the repo, and
they are all the build needs. The disc is only required to *produce* `ref/`,
which has already happened, so no game data is downloaded, stored or uploaded
by CI. `scripts/build/cmake.sh` detects the missing disc and builds against the
committed `ref/` instead of trying to extract one.

Registering the repository is a one-off manual step at
https://decomp.dev/manage/new, done under the account that owns it -- the
workflow alone does not add the project.

## Decompiling

`decompile.sh <symbol>` runs [m2c](https://github.com/matt-kempster/m2c) over a
function's reference disassembly and prints C on stdout. It takes the same
symbol spellings and optional section as `diff.sh`:

```
decompile.sh SetDay__9CSaveDataFi          # found on its own
decompile.sh title Se__7CSpriteFv          # ...or name the overlay
decompile.sh DataLoad__Fv --stack-structs  # extra flags go to m2c
```

m2c is a submodule at `tools/m2c`, so a fresh clone needs
`git submodule update --init`. The target is `mipsee-mwcc-c++` -- the Emotion
Engine's MIPS variant, the compiler this project builds with, and the language
that gets CodeWarrior names demangled, so the output is captioned
`CSaveData::SetDay (int)` rather than left mangled.

Every build writes the context twice, one file either side of that
conversion:

| File | What it is | Who reads it |
| --- | --- | --- |
| `build/ctx.cpp` | every header folded into one self-contained C++ file | `diff.sh --scratch`, and anything else that compiles it as C++ |
| `build/ctx.c` | that same content re-emitted as C by clang | m2c |

`scripts/diff/m2ctx.py` builds the first by inlining includes, and derives the
second from it with clang, keeping the parts C can express -- record layouts, enums, typedefs and free functions. Member
functions, access specifiers and templates are dropped; they carry no layout
m2c can use. With the context m2c names real fields (`this->day`) instead of
inferring `unk1D8`.

Two things in the headers stop `ctx.cpp` compiling, and both are worked around
when generating it rather than by editing the headers -- see the `m2ctx.py`
docstring: `STATIC_ASSERT` in `include/common.h` pastes `__COUNTER__` instead
of expanding it, so every use declares the same typedef name; and `CRunScript`
is defined twice, opaquely in `dataalloc.hpp` (with the real `0x48` layout) and
as a bare constructor in `runscript.hpp`. Both are worth fixing at source.

`scripts/diff/m2ctx.py` generates it and still works by hand: no arguments
covers the project and writes `ctx.c` at the repo root, and given a source file
it narrows the context to that translation unit.

Functions whose switch jumps through a CodeWarrior `LIT_*` literal pool are the
one known gap: m2c only recognises jump tables named `jtbl*`/`jpt_*`/`lbl_*`/
`jumptable_*`, so it reports "Unable to determine jump table" for them.

## Permuting

For a function that is semantically right but a few instructions off, the
[decomp-permuter](https://github.com/simonlindholm/decomp-permuter) setup lives
in `permuting/`. `permuting/new.sh <symbol>` scaffolds a case for one function
-- target, compiler wrapper, settings, and as much of the C rendering as can be
derived -- and `permuting/run.sh <case>` runs it. See `permuting/README.md`,
which is also where the reasons a case can lie to you are written down.