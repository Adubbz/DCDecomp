.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetVertexAddress__10CCollisionFPi
/* 24FB0 00124EB0 28160070 */  paddub     $2, $0, $0
/* 24FB4 00124EB4 0800E003 */  jr         $31
/* 24FB8 00124EB8 00000000 */   nop
/* 24FBC 00124EBC 00000000 */  nop
