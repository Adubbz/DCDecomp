#pragma helper_mask_gpr 0x30
#pragma helper_mask_fpr 0x1000

#include "dataalloc.hpp"

// clang-format off
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
// clang-format on

/* @ 0x143850 (0x20 bytes) -- __ct__18CDataAlloc<1,6000>Fv */
CDataAlloc<1, 6000>::CDataAlloc() {
    used = 0;
}
