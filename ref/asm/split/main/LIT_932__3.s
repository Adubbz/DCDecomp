.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_932__3
/* 19D648 0029D548 76696C6E */ .word 0x6E6C6976
/* 19D64C 0029D54C 616D6500 */ .word GlobalDataBuffer + 0x3ABCE1
