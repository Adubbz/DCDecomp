.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1416
/* 19EB58 0029EA58 76696C74 */ .word 0x746C6976
/* 19EB5C 0029EA5C 61670000 */ .word 0x00006761
