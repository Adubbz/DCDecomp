.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1160
/* 19C4D0 0029C3D0 2A2A2A2A */ .word 0x2A2A2A2A
/* 19C4D4 0029C3D4 2A2A2063 */ .word 0x63202A2A
/* 19C4D8 0029C3D8 646F6F72 */ .word 0x726F6F64
/* 19C4DC 0029C3DC 5F616C0A */ .word 0x0A6C615F
/* 19C4E0 0029C3E0 00000000 */ .word 0x00000000
/* 19C4E4 0029C3E4 00000000 */ .word 0x00000000
/* 19C4E8 0029C3E8 00000000 */ .word 0x00000000
/* 19C4EC 0029C3EC 00000000 */ .word 0x00000000
