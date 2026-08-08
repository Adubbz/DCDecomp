.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
.align 4
glabel LIT_815
/* 199A90 00299990 0C591400 */ .word .L0014590C
/* 199A94 00299994 00591400 */ .word .L00145900
/* 199A98 00299998 F4581400 */ .word .L001458F4
/* 199A9C 0029999C E8581400 */ .word .L001458E8
/* 199AA0 002999A0 DC581400 */ .word .L001458DC
/* 199AA4 002999A4 D0581400 */ .word .L001458D0
/* 199AA8 002999A8 00000000 */ .word 0x00000000
/* 199AAC 002999AC 00000000 */ .word 0x00000000
