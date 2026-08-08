.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_742
/* 199138 00299038 464F4F54 */ .word 0x544F4F46
/* 19913C 0029903C 00000000 */ .word 0x00000000
