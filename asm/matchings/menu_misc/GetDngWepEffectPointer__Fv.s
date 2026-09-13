.include "macro.inc"

.set noat
.set noreorder

glabel GetDngWepEffectPointer__Fv
    /* 10D170 0020D070 E895828F */  lw         $2, -0x6A18($28)
    /* 10D174 0020D074 0800E003 */  jr         $31
    /* 10D178 0020D078 00000000 */   nop
    /* 10D17C 0020D07C 00000000 */  nop
