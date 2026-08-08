.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3066
/* 19ED70 0029EC70 23667261 */ .word 0x61726623
/* 19ED74 0029EC74 6D655F69 */ .word 0x695F656D
/* 19ED78 0029EC78 6D616765 */ .word 0x6567616D
/* 19ED7C 0029EC7C 5F736176 */ .word 0x7661735F
/* 19ED80 0029EC80 65233634 */ .word 0x34362365
/* 19ED84 0029EC84 30233434 */ .word 0x34342330
/* 19ED88 0029EC88 38233400 */ .word GlobalDataBuffer + 0x972B8
/* 19ED8C 0029EC8C 00000000 */ .word 0x00000000
