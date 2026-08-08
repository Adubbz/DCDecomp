.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel pio2_1
/* 198408 00298308 00004054 */ .word 0x54400000
/* 19840C 0029830C FB21F93F */ .word 0x3FF921FB
