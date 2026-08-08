.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_488
/* 19C0E8 0029BFE8 4752445F */ .word 0x5F445247
/* 19C0EC 0029BFEC 494D4700 */ .word GlobalDataBuffer + 0x1C9CC9
