.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_695
/* 19CD70 0029CC70 6F726765 */ .word 0x6567726F
/* 19CD74 0029CC74 6C6E656A */ .word 0x6A656E6C
/* 19CD78 0029CC78 00000000 */ .word 0x00000000
/* 19CD7C 0029CC7C 00000000 */ .word 0x00000000
