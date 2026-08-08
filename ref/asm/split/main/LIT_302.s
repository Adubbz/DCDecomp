.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_302
/* 199F20 00299E20 68617369 */ .word 0x69736168
/* 199F24 00299E24 72610000 */ .word 0x00006172
