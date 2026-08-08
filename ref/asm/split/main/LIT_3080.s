.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3080
/* 19EDB0 0029ECB0 646B6963 */ .word 0x63696B64
/* 19EDB4 0029ECB4 6F6E2E69 */ .word 0x692E6E6F
/* 19EDB8 0029ECB8 636F0000 */ .word 0x00006F63
/* 19EDBC 0029ECBC 00000000 */ .word 0x00000000
