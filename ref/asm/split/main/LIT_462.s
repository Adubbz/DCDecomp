.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_462
/* 1998E8 002997E8 2E737100 */ .word GlobalDataBuffer + 0x46C2AE
/* 1998EC 002997EC 00000000 */ .word 0x00000000
