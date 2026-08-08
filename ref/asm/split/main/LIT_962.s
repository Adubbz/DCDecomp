.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_962
/* 19D6D0 0029D5D0 23667261 */ .word 0x61726623
/* 19D6D4 0029D5D4 6D655F69 */ .word 0x695F656D
/* 19D6D8 0029D5D8 6D616765 */ .word 0x6567616D
/* 19D6DC 0029D5DC 30233634 */ .word 0x34362330
/* 19D6E0 0029D5E0 30233434 */ .word 0x34342330
/* 19D6E4 0029D5E4 38233400 */ .word GlobalDataBuffer + 0x972B8
/* 19D6E8 0029D5E8 00000000 */ .word 0x00000000
/* 19D6EC 0029D5EC 00000000 */ .word 0x00000000
