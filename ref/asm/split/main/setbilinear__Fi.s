.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel setbilinear__Fi
/* 05BD10 0015BC10 F88684AF */  sw          $4, -0x7908($28)
/* 05BD14 0015BC14 0800E003 */  jr          $31
/* 05BD18 0015BC18 00000000 */   nop
/* 05BD1C 0015BC1C 00000000 */  nop
