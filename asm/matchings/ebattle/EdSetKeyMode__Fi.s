.include "macro.inc"

.set noat
.set noreorder

glabel EdSetKeyMode__Fi
    /* 0698F0 001697F0 248784AF */  sw         $4, -0x78DC($28)
    /* 0698F4 001697F4 28168070 */  paddub     $2, $4, $0
    /* 0698F8 001697F8 0800E003 */  jr         $31
    /* 0698FC 001697FC 00000000 */   nop
