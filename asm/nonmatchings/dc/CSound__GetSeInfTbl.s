.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetSeInfTbl__6CSoundFv
/* 43C60 00143B60 CF01023C */  lui        $2, %hi(se_inf_tbl)
/* 43C64 00143B64 509F4224 */  addiu      $2, $2, %lo(se_inf_tbl)
/* 43C68 00143B68 0800E003 */  jr         $31
/* 43C6C 00143B6C 00000000 */   nop
