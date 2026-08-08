.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00297350
/* 197450 00297350 73636543 */ .word 0x43656373
/* 197454 00297354 64537452 */ .word 0x52745364
/* 197458 00297358 6573756D */ .word 0x6D757365
/* 19745C 0029735C 65206361 */ .word 0x61632065
/* 197460 00297360 6C6C0A00 */ .word 0x000A6C6C
/* 197464 00297364 00000000 */ .word 0x00000000
