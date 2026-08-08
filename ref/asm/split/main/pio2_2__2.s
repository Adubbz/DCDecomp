.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel pio2_2__2
/* 198880 00298780 00443537 */ .word 0x37354400
