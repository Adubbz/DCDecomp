.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Sizeof__6CBoundFv
/* 3DF90 0013DE90 30010224 */  addiu      $2, $0, 0x130
/* 3DF94 0013DE94 0800E003 */  jr         $31
/* 3DF98 0013DE98 00000000 */   nop
/* 3DF9C 0013DE9C 00000000 */  nop
