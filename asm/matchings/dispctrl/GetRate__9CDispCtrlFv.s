.include "macro.inc"

.set noat
.set noreorder

glabel GetRate__9CDispCtrlFv
    /* 03E770 0013E670 000080C4 */  lwc1       $f0, 0x0($4)
    /* 03E774 0013E674 0800E003 */  jr         $31
    /* 03E778 0013E678 00000000 */   nop
    /* 03E77C 0013E67C 00000000 */  nop
