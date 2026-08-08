.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceGsGetGParam
/* 0124C0 001123C0 2500023C */  lui         $2, %hi(gp_6)
/* 0124C4 001123C4 0800E003 */  jr          $31
/* 0124C8 001123C8 90094224 */   addiu      $2, $2, %lo(gp_6)
/* 0124CC 001123CC 00000000 */  nop
