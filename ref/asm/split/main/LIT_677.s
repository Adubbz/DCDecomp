.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_677
/* 19CC98 0029CB98 62617474 */ .word 0x74746162
/* 19CC9C 0029CB9C 616E0000 */ .word 0x00006E61
