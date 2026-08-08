.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1838__2
/* 19AC98 0029AB98 73686164 */ .word 0x64616873
/* 19AC9C 0029AB9C 6F775F62 */ .word 0x625F776F
/* 19ACA0 0029ABA0 75666600 */ .word GlobalDataBuffer + 0x3BB5F5
/* 19ACA4 0029ABA4 00000000 */ .word 0x00000000
/* 19ACA8 0029ABA8 00000000 */ .word 0x00000000
/* 19ACAC 0029ABAC 00000000 */ .word 0x00000000
