.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_676
/* 19CC90 0029CB90 6D696E6F */ .word 0x6F6E696D
/* 19CC94 0029CB94 6E000000 */ .word 0x0000006E
