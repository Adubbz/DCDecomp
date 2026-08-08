.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_617__2
/* 19C970 0029C870 7A617464 */ .word 0x6474617A
/* 19C974 0029C874 696E6F00 */ .word GlobalDataBuffer + 0x44BDE9
