.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
.align 4
glabel LIT_5442
/* 19DC30 0029DB30 205B2000 */ .word .L00205B20
/* 19DC34 0029DB34 205B2000 */ .word .L00205B20
/* 19DC38 0029DB38 205B2000 */ .word .L00205B20
/* 19DC3C 0029DB3C 205B2000 */ .word .L00205B20
/* 19DC40 0029DB40 485B2000 */ .word .L00205B48
/* 19DC44 0029DB44 485B2000 */ .word .L00205B48
/* 19DC48 0029DB48 00000000 */ .word 0x00000000
/* 19DC4C 0029DB4C 00000000 */ .word 0x00000000
