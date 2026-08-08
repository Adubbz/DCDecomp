.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2819
/* 19B070 0029AF70 696D672E */ .word 0x2E676D69
/* 19B074 0029AF74 70616B00 */ .word GlobalDataBuffer + 0x40B0F0
