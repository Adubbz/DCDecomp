.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMDTDataAddress__13CVisualMDTVu1Fv
/* 035060 00134F60 2000828C */  lw          $2, 0x20($4)
/* 035064 00134F64 0800E003 */  jr          $31
/* 035068 00134F68 00000000 */   nop
/* 03506C 00134F6C 00000000 */  nop
