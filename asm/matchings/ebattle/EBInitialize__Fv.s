.include "macro.inc"

.set noat
.set noreorder

glabel EBInitialize__Fv
    /* 068200 00168100 9C8E80AF */  sw         $0, -0x7164($28)
    /* 068204 00168104 0800E003 */  jr         $31
    /* 068208 00168108 00000000 */   nop
    /* 06820C 0016810C 00000000 */  nop
