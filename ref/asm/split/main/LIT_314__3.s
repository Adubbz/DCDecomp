.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_314__3
/* 19A5D8 0029A4D8 53434E00 */ .word GlobalDataBuffer + 0x2392D3
/* 19A5DC 0029A4DC 00000000 */ .word 0x00000000
