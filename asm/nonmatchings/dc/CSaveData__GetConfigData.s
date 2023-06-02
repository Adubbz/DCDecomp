.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetConfigData__9CSaveDataFv
/* 57C30 00157B30 28168070 */  paddub     $2, $4, $0
/* 57C34 00157B34 0800E003 */  jr         $31
/* 57C38 00157B38 00000000 */   nop
/* 57C3C 00157B3C 00000000 */  nop
