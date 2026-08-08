.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_489
/* 19C0F0 0029BFF0 46495245 */ .word 0x45524946
/* 19C0F4 0029BFF4 5F494D47 */ .word 0x474D495F
/* 19C0F8 0029BFF8 00000000 */ .word 0x00000000
/* 19C0FC 0029BFFC 00000000 */ .word 0x00000000
