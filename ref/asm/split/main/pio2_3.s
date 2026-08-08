.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel pio2_3
/* 198428 00298328 0000002E */ .word 0x2E000000
/* 19842C 0029832C 8A19A33B */ .word 0x3BA3198A
