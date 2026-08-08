.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1095
/* 19F540 0029F440 23667261 */ .word 0x61726623
/* 19F544 0029F444 6D655F6D */ .word 0x6D5F656D
/* 19F548 0029F448 656E755F */ .word 0x5F756E65
/* 19F54C 0029F44C 6C657665 */ .word 0x6576656C
/* 19F550 0029F450 6C233634 */ .word 0x3436236C
/* 19F554 0029F454 30233434 */ .word 0x34342330
/* 19F558 0029F458 38233400 */ .word GlobalDataBuffer + 0x972B8
/* 19F55C 0029F45C 00000000 */ .word 0x00000000
