.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_974
/* 19BE60 0029BD60 73616D65 */ .word 0x656D6173
/* 19BE64 0029BD64 20657874 */ .word 0x74786520
/* 19BE68 0029BD68 5F66756E */ .word 0x6E75665F
/* 19BE6C 0029BD6C 635F6E6F */ .word 0x6F6E5F63
/* 19BE70 0029BD70 2121210A */ .word 0x0A212121
/* 19BE74 0029BD74 00000000 */ .word 0x00000000
/* 19BE78 0029BD78 00000000 */ .word 0x00000000
/* 19BE7C 0029BD7C 00000000 */ .word 0x00000000
