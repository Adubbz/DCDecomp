.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_724
/* 19AAE0 0029A9E0 67646174 */ .word 0x74616467
/* 19AAE4 0029A9E4 61302E65 */ .word 0x652E3061
/* 19AAE8 0029A9E8 64740000 */ .word 0x00007464
/* 19AAEC 0029A9EC 00000000 */ .word 0x00000000
