.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdFadeOutCheck__Fv
/* 089910 00189810 0C92828F */  lw          $2, -0x6DF4($28)
/* 089914 00189814 0800E003 */  jr          $31
/* 089918 00189818 00000000 */   nop
/* 08991C 0018981C 00000000 */  nop
