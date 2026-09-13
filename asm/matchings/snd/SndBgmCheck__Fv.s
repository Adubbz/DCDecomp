.include "macro.inc"

.set noat
.set noreorder

glabel SndBgmCheck__Fv
    /* 059E00 00159D00 088E828F */  lw         $2, -0x71F8($28)
    /* 059E04 00159D04 0800E003 */  jr         $31
    /* 059E08 00159D08 00000000 */   nop
    /* 059E0C 00159D0C 00000000 */  nop
