.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_296
/* 199ED8 00299DD8 3266202D */ .word 0x2D206632
/* 199EDC 00299DDC 65303368 */ .word 0x68333065
/* 199EE0 00299DE0 30385F73 */ .word 0x735F3830
/* 199EE4 00299DE4 00000000 */ .word 0x00000000
