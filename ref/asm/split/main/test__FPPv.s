.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel test__FPPv
/* 0742D0 001741D0 0000828C */  lw          $2, 0x0($4)
/* 0742D4 001741D4 0000428C */  lw          $2, 0x0($2)
/* 0742D8 001741D8 0800E003 */  jr          $31
/* 0742DC 001741DC 00000000 */   nop
