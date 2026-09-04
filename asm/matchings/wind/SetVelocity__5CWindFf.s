.include "macro.inc"

.set noat
.set noreorder

glabel SetVelocity__5CWindFf
    /* 03B5B0 0013B4B0 20008CE4 */  swc1       $f12, 0x20($4)
    /* 03B5B4 0013B4B4 0800E003 */  jr         $31
    /* 03B5B8 0013B4B8 00000000 */   nop
    /* 03B5BC 0013B4BC 00000000 */  nop
