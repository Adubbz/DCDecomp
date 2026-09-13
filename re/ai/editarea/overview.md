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

`CVector3_i_` is defined in `include/vector3.hpp`: three integer coordinates
at 0x00/0x04/0x08 and an unresolved fourth word. `GetPos` writes those three
coordinates; the float-coordinate `GetAlt` wrapper reserves one 0x10-byte
stack slot at a 16-byte boundary and reads X/Z at +0x20/+0x28. Other polygon
helpers copy the vector by quadword. Its 0x10 size and alignment are pinned.
The float-coordinate altitude wrapper returns the corresponding integer-grid
altitude after converting its input through `GetPos`.

The remaining larger drafts contain control-flow reconstruction artifacts or
member/field expressions that m2c does not express as the proven grid arrays.
They remain assembly until a clean C++ body reaches a byte-perfect result.

## Grid connection attributes

`GetPartsExtra` first handles six map 1 endpoints before checking grid bounds.
Area 0 gives river attribute 2 at (5, -1) and (2, 8); area 1 at (3, 6)
and (12, 3); area 2 at (4, -1) and (3, 8). These off-grid overrides
are intentional inputs to river connectivity. All other requests return
-1 outside the active grid or the cell's stored `parts_extra`. Nested
map/area switches reproduce the retail branch layout; a map `if` removes
one of its unconditional branches.

`SetRoadParts` accepts attribute 1, samples neighbors in negative Z/positive X/positive Z/negative X
order, and encodes the connection shape in bits 4–11 and rotation in bits
0–3. Shapes 1/2 are corners/straight segments, 3/4 are three/four-way
junctions, and 5/6 are isolated/end segments. The final shift-and-mask
is evaluated before the rotation mask to preserve retail register allocation.

`SetRiverParts` requires attribute 2 in the selected cell, and accepts
neighbor attributes 2, 3, and 5 as connections. It uses the same six
shape codes as roads, with different rotations for corners and three-way
junctions. The staged Boolean assignments preserve the retail ordering of
neighbor classification.

## Rectangle and polygon queries

`GetPartsRect` scans X then Z, collecting each nonnegative part identifier
once up to the supplied capacity. `SearchPartsID` converts coordinates and
reads the cell directly without the bounds checks of `GetPartsID`. The
position polygon overload checks area bounds, converts the coordinate,
and gathers a 2-by-2 rectangle beginning one cell before the coordinate.
The box overload converts its minimum and maximum, then uses a rectangle
beginning one cell before the minimum and extending two cells beyond the
difference.

`MakePartsBox` expands the grid extrema of cells with both a nonnegative
part number and part identifier. Retail initializes both minimum coordinates
to zero. Its minimum-X comparison writes the maximum-X accumulator instead
of the minimum; the C++ preserves that behavior even though nonnegative
loop coordinates make the branch unreachable. Minimum Z also remains zero
for nonnegative coordinates. The maximum world X/Z includes one cell size.

The connection enums name only observed road/river attributes and shapes.
Attributes 3 and 5 are accepted river neighbors but their wider meaning is
not established here; their numeric tests remain. Axis names describe grid
indices without claiming geographic directions.
