.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel pio2_2
/* 198418 00298318 0000601A */ .word 0x1A600000
/* 19841C 0029831C 61B4D03D */ .word 0x3DD0B461
