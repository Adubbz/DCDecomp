.macro sym name, value
    .global \name
    \name = \value
.endm

# Addresses referred to by code this build assembles, but defined by no object
# in it. Each `sym` gives the linker the retail address directly.
#
# This file used to carry 112 of these, most standing in for references the
# disassembler had left dangling. scripts/build/disassemble.py resolves those itself
# now -- see its configure() and localize_branch_labels() -- and what is left
# is only what genuinely crosses a link boundary.

# The overlays' entry points, called from src/main.cpp; main is linked
# separately from the overlay that defines them. Retail's name for each is
# noted. src/main.cpp still calls them by address because the signatures it was
# decompiled with do not all match the mangling of those names -- retail's
# LoaderInit is LoaderInit__Fv, but it takes an argument here -- and changing a
# signature changes what mwcc emits.
sym func_01DAC1C0 0x01DAC1C0   # GameInit__Fv
sym func_01DAD980 0x01DAD980   # GameLoop__Fv
sym func_01DAF1C0 0x01DAF1C0   # OpeningInit__Fv
sym func_01DAF970 0x01DAF970   # OpeningLoop__Fv
sym func_01DC1420 0x01DC1420   # LoaderInit__Fv
sym func_01DC1510 0x01DC1510   # LoaderLoop__Fv
sym func_01DC8C50 0x01DC8C50   # RushInit__Fv
sym func_01DC8EB0 0x01DC8EB0   # RushLoop__Fv
sym func_01DD1AB0 0x01DD1AB0   # TitleInit__Fi
sym func_01DD2220 0x01DD2220   # TitleLoop__Fv

# Branch targets in one split file reached from another. A branch that crosses
# files is relocated rather than resolved by the assembler, so it needs a
# symbol; the ones that stay within a file are local labels and need nothing.
sym .L00212170 0x00212170
sym .L01DAFB60_2B5360 0x01DAFB60
sym .L01DAFC40_2B5440 0x01DAFC40
sym .L01DCAEA0_2D06A0 0x01DCAEA0

# Called from CSaveData__InvertConfig.s. The disassembler splits this function
# into ref/asm/split/main/func_00158AE0.s, which the link order does
# not list; retail knows the address as InitPos__11CMenuCursorFv.
sym func_00158AE0 0x00158AE0
