.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMDTDataAddress__10CVisualVu1Fv
/* 037F90 00137E90 28160070 */  paddub      $2, $0, $0
/* 037F94 00137E94 0800E003 */  jr          $31
/* 037F98 00137E98 00000000 */   nop
/* 037F9C 00137E9C 00000000 */  nop
