.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel pio2_3__2
/* 198888 00298788 00A3852E */ .word 0x2E85A300
