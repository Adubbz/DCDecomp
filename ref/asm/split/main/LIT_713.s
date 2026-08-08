.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_713
/* 19CE60 0029CD60 6B65795F */ .word 0x5F79656B
/* 19CE64 0029CD64 65796500 */ .word GlobalDataBuffer + 0x3AC8E5
