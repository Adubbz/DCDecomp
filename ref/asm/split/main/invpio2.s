.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel invpio2
/* 198400 00298300 83C8C96D */ .word 0x6DC9C883
/* 198404 00298304 305FE43F */ .word 0x3FE45F30
