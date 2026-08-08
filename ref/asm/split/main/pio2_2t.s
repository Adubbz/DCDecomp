.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel pio2_2t
/* 198420 00298320 7370032E */ .word 0x2E037073
/* 198424 00298324 8A19A33B */ .word 0x3BA3198A
