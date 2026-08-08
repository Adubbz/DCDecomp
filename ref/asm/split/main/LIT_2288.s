.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2288
/* 19B240 0029B140 73616D65 */ .word 0x656D6173
/* 19B244 0029B144 20657874 */ .word 0x74786520
/* 19B248 0029B148 5F66756E */ .word 0x6E75665F
/* 19B24C 0029B14C 635F6E6F */ .word 0x6F6E5F63
/* 19B250 0029B150 2121210A */ .word 0x0A212121
/* 19B254 0029B154 00000000 */ .word 0x00000000
/* 19B258 0029B158 00000000 */ .word 0x00000000
/* 19B25C 0029B15C 00000000 */ .word 0x00000000
