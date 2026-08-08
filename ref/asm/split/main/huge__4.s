.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel huge__4
/* 198B88 00298A88 CAF24971 */ .word 0x7149F2CA
/* 198B8C 00298A8C 00000000 */ .word 0x00000000
