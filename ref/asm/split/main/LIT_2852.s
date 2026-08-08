.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2852
/* 19B0B8 0029AFB8 73756E33 */ .word 0x336E7573
/* 19B0BC 0029AFBC 00000000 */ .word 0x00000000
