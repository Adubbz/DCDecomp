.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMDTDataAddress__10CVisualVu1Fv
/* 37F90 00137E90 28160070 */  paddub     $2, $0, $0
/* 37F94 00137E94 0800E003 */  jr         $31
/* 37F98 00137E98 00000000 */   nop
/* 37F9C 00137E9C 00000000 */  nop
