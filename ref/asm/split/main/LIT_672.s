.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_672
/* 19CC60 0029CB60 6B6F6E61 */ .word 0x616E6F6B
/* 19CC64 0029CB64 72657065 */ .word 0x65706572
/* 19CC68 0029CB68 5F617400 */ .word GlobalDataBuffer + 0x49B0DF
/* 19CC6C 0029CB6C 00000000 */ .word 0x00000000
