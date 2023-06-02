.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetDay__9CSaveDataFv
/* 57E00 00157D00 D801828C */  lw         $2, 0x1D8($4)
/* 57E04 00157D04 0800E003 */  jr         $31
/* 57E08 00157D08 00000000 */   nop
/* 57E0C 00157D0C 00000000 */  nop
