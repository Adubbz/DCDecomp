.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMaxY__10CCollisionFPf
/* 27940 00127840 28160070 */  paddub     $2, $0, $0
/* 27944 00127844 0800E003 */  jr         $31
/* 27948 00127848 00000000 */   nop
/* 2794C 0012784C 00000000 */  nop
