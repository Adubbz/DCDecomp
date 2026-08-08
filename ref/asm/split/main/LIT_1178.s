.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1178
/* 19E170 0029E070 23667261 */ .word 0x61726623
/* 19E174 0029E074 6D655F6D */ .word 0x6D5F656D
/* 19E178 0029E078 656E755F */ .word 0x5F756E65
/* 19E17C 0029E07C 63686172 */ .word 0x72616863
/* 19E180 0029E080 61233634 */ .word 0x34362361
/* 19E184 0029E084 30233434 */ .word 0x34342330
/* 19E188 0029E088 38233400 */ .word GlobalDataBuffer + 0x972B8
/* 19E18C 0029E08C 00000000 */ .word 0x00000000
