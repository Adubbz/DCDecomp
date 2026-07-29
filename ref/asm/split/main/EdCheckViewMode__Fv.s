.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdCheckViewMode__Fv
/* 06A220 0016A120 F08E828F */  lw          $2, -0x7110($28)
/* 06A224 0016A124 0800E003 */  jr          $31
/* 06A228 0016A128 00000000 */   nop
/* 06A22C 0016A12C 00000000 */  nop
