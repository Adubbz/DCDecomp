# Dayuppy `edit_in` park

`CommandDEBUG__FPPv` has a byte-identical Dayuppy body, but its local data cannot be placed at
the retail address within this ticket's file allowance. The retail map places `debug__2` at
`0x002A2B10` in the `edit_in` small-BSS run. Compiling the source below preserves local binding,
but the linker places `debug` at `0x002A370C` because `edit_in.cpp.o (.sbss)` is not interleaved
with `main.sbss.part4f.s.o`.

The checker reported objdiff `100.0` and verdict `WRONG`: the store instruction's low immediate
was `0x9320` in retail and `0x9F1C` in the build, a delta of 3068 bytes. The assembly marker is
retained until the data layout owner can carve the word at `0x002A2B10` from the residual dump
and place the source object's `.sbss` there.

```cpp
/* Enables the map editor's debug command. */
static int debug;

void CommandDEBUG(void **) {
    debug = 1;
}
```
