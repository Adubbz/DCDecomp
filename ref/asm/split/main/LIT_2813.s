.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2813
/* 19B020 0029AF20 63757273 */ .word 0x73727563
/* 19B024 0029AF24 6F723031 */ .word 0x3130726F
/* 19B028 0029AF28 2E6D6473 */ .word 0x73646D2E
/* 19B02C 0029AF2C 00000000 */ .word 0x00000000
