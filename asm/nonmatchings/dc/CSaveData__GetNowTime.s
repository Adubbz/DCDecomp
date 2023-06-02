.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetNowTime__9CSaveDataFv
/* 57CD0 00157BD0 D00180C4 */  lwc1       $f0, 0x1D0($4)
/* 57CD4 00157BD4 0800E003 */  jr         $31
/* 57CD8 00157BD8 00000000 */   nop
/* 57CDC 00157BDC 00000000 */  nop
