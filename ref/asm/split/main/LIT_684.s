.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_684
/* 19CCE8 0029CBE8 616B6169 */ .word 0x69616B61
/* 19CCEC 0029CBEC 6B696D69 */ .word 0x696D696B
/* 19CCF0 0029CBF0 00000000 */ .word 0x00000000
/* 19CCF4 0029CBF4 00000000 */ .word 0x00000000
