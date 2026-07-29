.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel CommandWINDEFFECT__FPPv
/* 03FE00 0013FD00 0000838C */  lw          $3, 0x0($4)
/* 03FE04 0013FD04 000060C4 */  lwc1        $f0, 0x0($3)
/* 03FE08 0013FD08 0C8D838F */  lw          $3, -0x72F4($28)
/* 03FE0C 0013FD0C 540060E4 */  swc1        $f0, 0x54($3)
/* 03FE10 0013FD10 0800E003 */  jr          $31
/* 03FE14 0013FD14 00000000 */   nop
/* 03FE18 0013FD18 00000000 */  nop
/* 03FE1C 0013FD1C 00000000 */  nop
