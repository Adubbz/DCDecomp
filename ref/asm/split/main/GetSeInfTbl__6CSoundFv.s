.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetSeInfTbl__6CSoundFv
/* 043C60 00143B60 CF01023C */  lui         $2, %hi(se_inf_tbl)
/* 043C64 00143B64 509F4224 */  addiu       $2, $2, %lo(se_inf_tbl)
/* 043C68 00143B68 0800E003 */  jr          $31
/* 043C6C 00143B6C 00000000 */   nop
