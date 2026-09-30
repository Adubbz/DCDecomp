# The PAL build

The tree builds two releases from one set of sources: NTSC 1.02 (the default)
and the July 12, 2001 PAL prototype.

## Selecting a release

    REGION=PAL ./build.sh
    REGION=PAL ./dev.sh scripts/build/cmake.sh all

`REGION` becomes `DCDECOMP_REGION` inside the container, and
`scripts/build/region.py` turns it into every path the build uses. Each
release keeps its own disc image, extraction, split configuration, linker
script, split and build tree:

| | NTSC | PAL |
|---|---|---|
| disc | `rom/Dark Cloud (NTSC).iso` | `rom/Dark Cloud (PAL).iso` |
| extracted files | `rom/ntsc/extracted/` | `rom/pal/extracted/` |
| configuration | `config/ntsc/` | `config/pal/` |
| reference assembly | `asm/ntsc/` | `asm/pal/` |
| build tree | `build/ntsc/` | `build/pal/` |

The two builds share `.build.lock` and must not run at once: both compile the
same sources, and the compile driver writes temporaries beside them.

`build.sh` builds the selected release's objdiff objects after linking, prints
its coloured objdiff summary, and writes `progress/ntsc/report.json` or
`progress/pal/report.json`. The progress
workflow builds both releases and uploads one `SCUS_971.11_report` artifact
containing `progress/report.json`. Its units and categories identify the
release, and the Discord message shows a separate embed for each release.

## Differences in the sources

The PAL build compiles with `-DPAL` and assembles with `--defsym PAL=1`.

- A small difference inside a shared function is an `#ifdef PAL` / `#else`
  branch around the statement or expression that differs.
- A function that changed throughout has a whole PAL body:
  `#ifdef PAL <PAL body> #else <NTSC body> #endif`.
- A function only one release has sits under `#ifdef PAL` or `#ifndef PAL` at
  its retail position.
- Data follows the same rules. Screen geometry uses the `SCREEN_*`,
  `GS_Y_OFFSET` and `*_STR` macros from `include/common.h`.
- A compiler-state pragma block that needs other values under PAL is written
  as `#ifdef PAL #pragma ... #else #pragma ... #endif`.

Retail-derived tables that differ are per release: `src/literals.cpp` holds
both literal pools, `src/vutext.cpp` the one VU word that differs, and
`src/crt0.s` both ends of `.bss`.

## Configuration

`config/pal/*.symbols.txt` are the PAL executable's symbol tables. The yaml,
linker script, `object_fixups.json` and `expression_node_overrides.json` were
carried over from NTSC's by `scripts/build/splat_config.py` and are maintained
by hand. A fixup names the release's own symbols: a unit's `statics` and
`rodata_exports` differ between the two files wherever the compiler's
numbering or retail's constants do.

## Functions not yet decompiled for PAL

A function whose PAL instructions the C does not yet reproduce is supplied by
an INCLUDE_ASM marker under `#ifdef PAL`, the way NTSC's undecompiled functions
were:

    #ifdef PAL
    INCLUDE_ASM("asm/pal/nonmatchings/shop", ChargeShopKey__Fv);
    #pragma name_counter 1370
    #else
    int ChargeShopKey() {
        ...
    }
    #endif

A function only PAL has is `#ifdef PAL` + the marker. tools/mwccgap assembles
`asm/pal/nonmatchings/<unit>/<symbol>.s` from the PAL split and puts it where
the marker stands; the constants only that function uses travel inside the
file. scripts/build/mwccgap_region.py and the split (scripts/build/disassemble.py)
read each source as the release being built compiles it (region.active_text),
so a marker under `#ifdef PAL` is the PAL build's alone and the NTSC compile is
unchanged. `#pragma name_counter` after a marker sets MWCC's invented-name
counter to PAL retail's value after that function, so the constants and
statics of the functions below keep retail's numbering.

Any other datum a marker's function uses -- a constant it shares, an
initialiser template, a function-local static, a virtual table the compiler
would have emitted with it -- is defined in C under the marker with retail's
bytes, at the place retail's compiler put it. The marker's references to
retail's `@N` and `name$N` are resolved to retail's addresses by
`scripts/build/literals.py --resolve-names`, so such a datum needs retail's
place and bytes, not its name; named data keeps retail's name.

`scripts/build/verify.py` counts a marker's function as `asm`. A marker goes
when its C reproduces PAL's bytes, together with the data defined for it.
