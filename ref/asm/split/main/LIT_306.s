.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_306
/* 199F50 00299E50 746F7465 */ .word 0x65746F74
/* 199F54 00299E54 6D750000 */ .word 0x0000756D
