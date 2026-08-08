.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_330__2
/* 19A010 00299F10 73756B61 */ .word 0x616B7573
/* 19A014 00299F14 61746F00 */ .word GlobalDataBuffer + 0x44C3E1
