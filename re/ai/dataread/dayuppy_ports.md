# Dayuppy body ports

These functions use the byte-exact source bodies from Dayuppy's private export
`1707723`, adapted only to the established names and types in this tree.

## `CommandSIZE`

The cloth `SIZE` command reads two integer arguments, clamps each grid dimension
to the inclusive range 1 through 16, and stores the resulting row and column
counts. The compiled function matches the 0x60-byte retail body at `0x0013FB80`.

## `CommandNORMAL`

The cloth `NORMAL` command copies its single floating-point argument into the
cloth normal scale. The compiled function matches the 0x18-byte retail body at
`0x0013FC60`.

## `CommandFOLLOW`

The cloth `FOLLOW` command copies three floating-point arguments into the
cloth follow vector. The compiled function matches the 0x38-byte retail body
at `0x0013FC80`.

## `CommandK`

The cloth `K` command copies three floating-point arguments into the cloth
stiffness vector. The compiled function matches the 0x38-byte retail body at
`0x0013FCC0`.

## `CommandWINDEFFECT`

The cloth `WINDEFFECT` command copies its floating-point argument into the
cloth wind-effect scale. The compiled function matches the 0x18-byte retail
body at `0x0013FD00`.

## `CommandGRAVITY`

The cloth `GRAVITY` command copies three floating-point arguments into the
cloth gravity vector. The compiled function matches the 0x38-byte retail body
at `0x0013FD20`.

## `CommandPOLYDIVE`

The cloth `POLYDIV` command converts up to sixteen characters into per-row
polygon-division flags, stopping at the input terminator. The compiled function
matches the 0x50-byte retail body at `0x0013FD60`.

## `keyCtrl`

The analog-stick helper normalizes the two axes by magnitude, writes the
clamped motion speed into the third motion record, and returns whether the
input is idle, moving, or above the run threshold. The `MOTION_INFO` stride is
0x10, so the retail `+0x28` store is `motion[2].speed`. The compiled function
matches the 0xF0-byte retail body at `0x00140570`.

## `unitRotation`

The rotation helper finds the signed yaw delta, turns by fifteen degrees along
the shorter arc unless already within one step, wraps the result into the
signed-pi range, and returns the new yaw. The double-precision comparisons are
part of the retail operation sequence. The compiled function matches the
0x28C-byte retail body at `0x00140810`.
