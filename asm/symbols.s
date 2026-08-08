.macro sym name, value
    .global \name
    \name = \value
.endm

# Addresses referred to by code this build assembles, but defined by no object
# in it. Each `sym` gives the linker the retail address directly.
#
# This file used to carry 112 of these, then 15. Everything that was standing in
# for a dangling reference is gone: scripts/build/disassemble.py resolves branch
# targets itself (see localize_branch_labels), grouping functions into
# translation units put the rest inside a single object, and reading the
# processor-specific symbol binding retail uses gave 55 functions their real
# names instead of func_<address>.
#
# What is left is not a build artefact. src/main.cpp calls the overlays'
# entry points by address rather than by name, so nothing in the link defines
# what it refers to. Naming them would empty this file -- the overlays do
# export them -- but the signatures main.cpp was decompiled with do not all
# match those names' mangling, and changing a signature changes what mwcc
# emits. That is a decompilation question, not a build one.

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

