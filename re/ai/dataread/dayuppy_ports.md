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
