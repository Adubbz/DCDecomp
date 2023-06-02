.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetNowTime__9CSaveDataFf
/* 57CC0 00157BC0 D0018CE4 */  swc1       $f12, 0x1D0($4)
/* 57CC4 00157BC4 0800E003 */  jr         $31
/* 57CC8 00157BC8 00000000 */   nop
/* 57CCC 00157BCC 00000000 */  nop
