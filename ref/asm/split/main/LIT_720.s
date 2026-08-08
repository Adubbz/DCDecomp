.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_720
/* 19AA78 0029A978 6D617069 */ .word 0x6970616D
/* 19AA7C 0029A97C 6E666F2E */ .word 0x2E6F666E
/* 19AA80 0029A980 63666200 */ .word GlobalDataBuffer + 0x37B5E3
/* 19AA84 0029A984 00000000 */ .word 0x00000000
/* 19AA88 0029A988 00000000 */ .word 0x00000000
/* 19AA8C 0029A98C 00000000 */ .word 0x00000000
