.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_960__2
/* 19DF20 0029DE20 6B676575 */ .word 0x7565676B
/* 19DF24 0029DE24 6E676100 */ .word GlobalDataBuffer + 0x36B6EE
