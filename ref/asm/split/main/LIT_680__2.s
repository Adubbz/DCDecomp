.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_680__2
/* 19CCB0 0029CBB0 65626900 */ .word GlobalDataBuffer + 0x3EB1E5
/* 19CCB4 0029CBB4 00000000 */ .word 0x00000000
