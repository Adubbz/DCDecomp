.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_685
/* 19CCF8 0029CBF8 746F6765 */ .word 0x65676F74
/* 19CCFC 0029CBFC 63636869 */ .word 0x69686363
/* 19CD00 0029CC00 00000000 */ .word 0x00000000
/* 19CD04 0029CC04 00000000 */ .word 0x00000000
