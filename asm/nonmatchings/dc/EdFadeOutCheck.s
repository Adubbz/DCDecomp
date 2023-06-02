.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdFadeOutCheck__Fv
/* 89910 00189810 0C92828F */  lw         $2, -0x6DF4($gp)
/* 89914 00189814 0800E003 */  jr         $31
/* 89918 00189818 00000000 */   nop
/* 8991C 0018981C 00000000 */  nop
