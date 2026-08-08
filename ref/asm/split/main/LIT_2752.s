.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2752
/* 19AEF8 0029ADF8 696D672F */ .word 0x2F676D69
/* 19AEFC 0029ADFC 70617573 */ .word 0x73756170
/* 19AF00 0029AE00 652E696D */ .word 0x6D692E65
/* 19AF04 0029AE04 67000000 */ .word 0x00000067
