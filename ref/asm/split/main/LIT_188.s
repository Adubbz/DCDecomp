.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_188
/* 199288 00299188 4652414D */ .word 0x4D415246
/* 19928C 0029918C 45000000 */ .word 0x00000045
