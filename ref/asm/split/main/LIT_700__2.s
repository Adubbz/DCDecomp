.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_700__2
/* 19CDB0 0029CCB0 6B657968 */ .word 0x6879656B
/* 19CDB4 0029CCB4 69676500 */ .word GlobalDataBuffer + 0x3AB6E9
