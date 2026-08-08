.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_671
/* 19CC58 0029CB58 68796F75 */ .word 0x756F7968
/* 19CC5C 0029CB5C 74616E00 */ .word GlobalDataBuffer + 0x43B0F4
