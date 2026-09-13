.include "macro.inc"

.set noat
.set noreorder

glabel BtSetMapJumpFloor__Fi
    /* 0BBA20 001BB920 F49384AF */  sw         $4, -0x6C0C($28)
    /* 0BBA24 001BB924 0800E003 */  jr         $31
    /* 0BBA28 001BB928 00000000 */   nop
    /* 0BBA2C 001BB92C 00000000 */  nop
