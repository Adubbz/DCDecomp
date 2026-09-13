# `editarea` analysis

## Object layout

`CEditArea` is a `0x2060`-byte, 16-byte-aligned object. The final alignment
comes from its embedded `CBoxVu0`.

| Offset | Size | Meaning | Evidence |
| --- | ---: | --- | --- |
| `0x0000` | 4 | area ID | `SetMapInfo` writes its second argument; `GetAreaID` returns it |
| `0x0004` | 4 | map number | `SetMapInfo` writes its first argument; `GetMapNo` returns it |
| `0x0008` | 4 | active width | `SetSize`, the grid bounds checks, and `GetWidth` |
| `0x000c` | 4 | active height | `SetSize`, the grid bounds checks, and `GetHeight` |
| `0x0010` | 12 | world-space origin | `SetOffset`, `GetOffset`, `GetPos`, and `CheckArea` |
| `0x001c` | 4 | unknown | no direct access was found in this unit |
| `0x0020` | 4 | horizontal cell size | `SetSize`, `GetUnitSize`, and coordinate conversion |
| `0x0024` | 4 | vertical elevation size | `SetSize`, `GetUnitAlt`, and `GetAlt` |
| `0x0028` | `0x1c00` | 16 by 16 cells of size `0x1c` | every cell access forms `x * 0x1c0 + y * 0x1c`; `Clear` iterates the active dimensions |
| `0x1c28` | `0x400` | 16 by 16 chain-work integers | `ChainWorkClear` forms `x * 0x40 + y * 4` and visits 16 by 16 entries |
| `0x2028` | 4 | grid-rendering frame | `SetGridFrame`, `GetGridFrame`, and `DrawGrid` |
| `0x202c` | 4 | unknown | no direct access was found in this unit |
| `0x2030` | `0x20` | occupied-parts bounding box | `GetPartsBox` copies exactly `0x20` bytes; `MakePartsBox` fills two vectors |
| `0x2050` | 4 | unknown redraw state | `Clear`, `SetMapParts`, `DeleteMapParts`, and `DrawGrid` access it |
| `0x2054` | 4 | unknown redraw counter | `Clear` initializes it to four and `DrawGrid` counts it down |

Each cell contains seven 32-bit words. The proven fields are the part number
at `+0x00`, integral altitude at `+0x04`, part ID at `+0x0c`, geometry code at
`+0x10`, and area-specific extra value at `+0x14`. `Clear` initializes the
unresolved words at `+0x08` and `+0x18`, but this unit does not establish
their purpose.

## Return contracts

The integer getters and predicates return through `$v0`. `GetAlt(int, int)`,
both `GetAlt(float, float, float)` wrappers, `GetUnitSize`, and `GetUnitAlt`
return through `$f0`. The float-coordinate `GetAlt` and `GetAlt_i` routines
preserve the result of their corresponding integer-coordinate call. The
three `PickUpPoly` overloads return an integer count through `$v0`.
`DeleteMapParts` returns zero for a negative part index and one after a
successful pass. `SetRiverParts` and `SetRoadParts` return their encoded
connection value. These observations, together with caller sites that do not
consume a result and each routine's setter, copier, clearing, initialization,
or drawing purpose, justify the `void` declarations. A routine's failure to
set or preserve a return register is only supporting evidence and is not, by
itself, sufficient to establish a `void` return contract.

## Matched behavior

The direct accessors reflect the layout above. The four cell setters reject
coordinates outside the active width and height. `SetAlt` additionally clamps
the stored integral altitude to `[0, 127]`. `GetPartsID` and `GetCode` return
`-1` for an invalid coordinate; `GetAlt_i` returns zero. `GetAlt` scales the
integral value by `unit_alt` and adds the origin's Y component.

`ChainWorkClear` clears all 256 chain-work entries, independent of the active
dimensions. `Clear` resets only active cells, using `-1` for absent part
metadata and zero for altitude and the unresolved `+0x08` word. `CheckArea`
tests X and Z against the inclusive world-space bounds. The constructor only
calls `Initialize` and returns the constructed object.

## Remaining dependencies and blockers

`CVector3_i_` has no definition in the current shared vector headers. Its use
in `GetPos`, the coordinate-based search/altitude wrappers, and the polygon
helpers proves three consecutive 32-bit coordinate fields at offsets `0x00`,
`0x04`, and `0x08`; stack allocation and quadword copies indicate a `0x10`
size/alignment, matching `CVector3_f_`. The definition belongs in the shared
vector header and is intentionally not added from this unit-owned shard.

The remaining larger drafts contain control-flow reconstruction artifacts or
member/field expressions that m2c does not express as the proven grid arrays.
They remain assembly until a clean C++ body reaches a byte-perfect result.
