.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_285__2
/* 199CA8 00299BA8 696D675F */ .word 0x5F676D69
/* 199CAC 00299BAC 25640000 */ .word 0x00006425
