.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel func_00122600
/* 022700 00122600 2A00023C */  lui         $2, %hi(LIT_245)
/* 022704 00122604 0800E003 */  jr          $31
/* 022708 00122608 C88C4224 */   addiu      $2, $2, %lo(LIT_245)
/* 02270C 0012260C 00000000 */  nop
