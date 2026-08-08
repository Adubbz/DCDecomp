.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1177
/* 19E160 0029E060 63302564 */ .word 0x64253063
/* 19E164 0029E064 6D6F6465 */ .word 0x65646F6D
/* 19E168 0029E068 6C2E7061 */ .word 0x61702E6C
/* 19E16C 0029E06C 6B000000 */ .word 0x0000006B
