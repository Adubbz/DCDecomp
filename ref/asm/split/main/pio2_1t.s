.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel pio2_1t
/* 198410 00298310 3163621A */ .word 0x1A626331
/* 198414 00298314 61B4D03D */ .word 0x3DD0B461
