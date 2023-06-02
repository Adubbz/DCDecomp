.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetMonsterNameDrawFlag__Fv
/* 10EC70 0020EB70 20968287 */  lh         $2, -0x69E0($gp)
/* 10EC74 0020EB74 0800E003 */  jr         $31
/* 10EC78 0020EB78 00000000 */   nop
/* 10EC7C 0020EB7C 00000000 */  nop
