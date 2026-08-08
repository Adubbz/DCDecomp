.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1230
/* 19EAE0 0029E9E0 646D7920 */ .word 0x20796D64
/* 19EAE4 0029E9E4 73796E63 */ .word 0x636E7973
/* 19EAE8 0029E9E8 0A000000 */ .word 0x0000000A
/* 19EAEC 0029E9EC 00000000 */ .word 0x00000000
