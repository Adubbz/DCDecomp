.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_568
/* 199310 00299210 44554E2E */ .word 0x2E4E5544
/* 199314 00299214 42494E00 */ .word GlobalDataBuffer + 0x2398C2
