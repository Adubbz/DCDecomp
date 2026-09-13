# Opcode local-symbol and data follow-ups

## Stack helpers

The retail main executable contains three copies of the five script stack
helpers. All fifteen definitions have their natural C++ names and `FUNC LOCAL`
binding. Their first addresses are `0x0018A350` in `editloop3`, `0x001BB930` in
`btsysscript`, and `0x001E1640` in `runscript_opcodes`. Splat adds `__2` and
`__3` only to distinguish the latter two copies in generated reference files.

A temporary probe tested natural static definitions with per-object
`symbols` mappings to those suffixed names. `objcopy --redefine-sym` preserved
the five definitions as `FUNC LOCAL`, but retained assembly callers produced
separate `GLOBAL UND` entries with the identical suffixed names. MWLD did not
bind those entries to the local definitions and reported every helper name
unresolved. The same result was reproduced independently for the `__2` and
`__3` copies.

The probe used the staged battle-script bodies from `20eb8e27`, the opcode
source series `b5a7883d..cc9a64d3`, and the five exact opcode helper bodies in
the opcode shard's `runscript-helper-test.patch`. No helper mapping remains in
the tree. These helpers need an atomic source conversion of their callers or
build-tool support that retargets retained-assembly relocation symbol indices
to the local definitions. Globalizing the helpers would disagree with retail.

## Private opcode data

Two objects used by the opcode setup functions remain in residual section
dumps:

| Object | Retail range | Size | Binding |
|---|---:|---:|---|
| `ext_func_info` | `0x002918A0..0x00291B80` | `0x2E0` | `OBJECT LOCAL` |
| `ext_func` | `0x01D8FCB0..0x01D900B0` | `0x400` | `OBJECT LOCAL` |

The typed shapes are a 92-row `{ opcode function pointer, operation }` table
and a 256-entry opcode function-pointer array. A future migration can carve
the data residual into `0x291830..0x2918A0` and
`0x291B80..0x294150`, and the BSS residual into
`0x1D8FA80..0x1D8FCB0` and `0x1D900B0..0x1DA8B80`. The linker script can place
`runscript_opcodes.cpp.o (.data)` and `(.bss)` between those pairs. The natural
local table name then needs a per-object rename to `ext_func_info__3`.

There is one prerequisite beyond the two setup functions. Generated
`GetItemMoney__Fii.s` currently spells its two address pairs as references to
`ext_func_info__3 + 0x19C/0x19E`, although retail's retained relocations at
`0x001E6EFC..0x001E6F1C` target the global `PriceList` symbol at `0x00291B80`.
A local source table would therefore leave the generated assembly's global
undefined table symbol unresolved. The future pass must first compile
`GetItemMoney` or make its reference assembly reflect the original `PriceList`
relocations.

The paired data migration and setup functions were not applied because the
wave's Dayuppy allowlist has no body for either setup function.
