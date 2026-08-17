.include "macro.inc"

.set noat
.set noreorder

glabel SetAngleSoon__13CCameraFollowFf
    /* 024C30 00124B30 D8028CE4 */  swc1       $f12, 0x2D8($4)
    /* 024C34 00124B34 DC028CE4 */  swc1       $f12, 0x2DC($4)
    /* 024C38 00124B38 0800E003 */  jr         $31
    /* 024C3C 00124B3C 00000000 */   nop
