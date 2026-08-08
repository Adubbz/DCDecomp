.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_663__2
/* 19F6F0 0029F5F0 23667261 */ .word 0x61726623
/* 19F6F4 0029F5F4 6D655F69 */ .word 0x695F656D
/* 19F6F8 0029F5F8 6D616765 */ .word 0x6567616D
/* 19F6FC 0029F5FC 5F6E616D */ .word 0x6D616E5F
/* 19F700 0029F600 65233634 */ .word 0x34362365
/* 19F704 0029F604 30233434 */ .word 0x34342330
/* 19F708 0029F608 38233400 */ .word GlobalDataBuffer + 0x972B8
/* 19F70C 0029F60C 00000000 */ .word 0x00000000
