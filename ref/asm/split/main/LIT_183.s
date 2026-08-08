.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_183
/* 19A128 0029A028 6572726F */ .word 0x6F727265
/* 19A12C 0029A02C 72206174 */ .word 0x74612072
/* 19A130 0029A030 20000000 */ .word 0x00000020
/* 19A134 0029A034 00000000 */ .word 0x00000000
