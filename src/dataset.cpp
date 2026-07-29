#include "dataalloc.hpp"

/* @ 0x143820 (0x30 bytes) -- __ct__14CDataAlloc2<1>Fv
 *
 * Written as a raw `asm` body: MWCC's normal constructor codegen defensively
 * spills `this` into a callee-saved register around the call and re-copies it
 * to $v0, four instructions retail does not have. Retail instead relies on
 * the callee (__ct__14CDataAlloc2_1_Fi) leaving $v0 = this across the tail
 * call, which MWCC's optimizer cannot prove for an ordinary call. */
asm CDataAlloc2<1>::CDataAlloc2() {
    addiu sp,sp,-16
    sq ra,0(sp)
    addiu a1,zero,-1
    jal __ct__14CDataAlloc2_1_Fi
    nop
    lq ra,0(sp)
    addiu sp,sp,16
    jr ra
    nop
}

/* @ 0x143850 (0x20 bytes) -- __ct__18CDataAlloc<1,6000>Fv */
CDataAlloc<1, 6000>::CDataAlloc() {
    unk_17700 = 0;
}
