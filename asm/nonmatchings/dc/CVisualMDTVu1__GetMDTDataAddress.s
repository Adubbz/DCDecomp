.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMDTDataAddress__13CVisualMDTVu1Fv
/* 35060 00134F60 2000828C */  lw         $2, 0x20($4)
/* 35064 00134F64 0800E003 */  jr         $31
/* 35068 00134F68 00000000 */   nop
/* 3506C 00134F6C 00000000 */  nop
