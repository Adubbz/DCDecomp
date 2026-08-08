.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_514
/* 19A0B0 00299FB0 736E6425 */ .word 0x25646E73
/* 19A0B4 00299FB4 64000000 */ .word 0x00000064
/* 19A0B8 00299FB8 00000000 */ .word 0x00000000
/* 19A0BC 00299FBC 00000000 */ .word 0x00000000
