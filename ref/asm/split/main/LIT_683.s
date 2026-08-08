.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_683
/* 19CCD8 0029CBD8 676B6579 */ .word 0x79656B67
/* 19CCDC 0029CBDC 6D696D69 */ .word 0x696D696D
/* 19CCE0 0029CBE0 00000000 */ .word 0x00000000
/* 19CCE4 0029CBE4 00000000 */ .word 0x00000000
