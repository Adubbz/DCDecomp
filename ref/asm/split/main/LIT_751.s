.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_751
/* 19A0F8 00299FF8 73702564 */ .word 0x64257073
/* 19A0FC 00299FFC 00000000 */ .word 0x00000000
