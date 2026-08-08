.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
.align 4
glabel LIT_826
/* 199AB0 002999B0 1C5A1400 */ .word .L00145A1C
/* 199AB4 002999B4 105A1400 */ .word .L00145A10
/* 199AB8 002999B8 045A1400 */ .word .L00145A04
/* 199ABC 002999BC F8591400 */ .word .L001459F8
/* 199AC0 002999C0 EC591400 */ .word .L001459EC
/* 199AC4 002999C4 E0591400 */ .word .L001459E0
/* 199AC8 002999C8 00000000 */ .word 0x00000000
/* 199ACC 002999CC 00000000 */ .word 0x00000000
