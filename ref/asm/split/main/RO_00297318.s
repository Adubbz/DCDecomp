.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00297318
/* 197418 00297318 73636543 */ .word 0x43656373
/* 19741C 0029731C 64537452 */ .word 0x52745364
/* 197420 00297320 65616420 */ .word 0x20646165
/* 197424 00297324 424C4B20 */ .word 0x204B4C42
/* 197428 00297328 52656164 */ .word 0x64616552
/* 19742C 0029732C 20456E64 */ .word 0x646E4520
/* 197430 00297330 65640A00 */ .word 0x000A6465
/* 197434 00297334 00000000 */ .word 0x00000000
