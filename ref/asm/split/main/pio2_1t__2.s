.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel pio2_1t__2
/* 19887C 0029877C 43443537 */ .word 0x37354443
