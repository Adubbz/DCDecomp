.include "macro.inc"

.set noat
.set noreorder

glabel GetDay__9CSaveDataFv
    /* 057E00 00157D00 D801828C */  lw         $2, 0x1D8($4)
    /* 057E04 00157D04 0800E003 */  jr         $31
    /* 057E08 00157D08 00000000 */   nop
    /* 057E0C 00157D0C 00000000 */  nop
