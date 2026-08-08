.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
.align 4
glabel LIT_5313
/* 19DC10 0029DB10 E8352000 */ .word .L002035E8
/* 19DC14 0029DB14 54312000 */ .word .L00203154
/* 19DC18 0029DB18 68312000 */ .word .L00203168
/* 19DC1C 0029DB1C D0312000 */ .word .L002031D0
/* 19DC20 0029DB20 4C322000 */ .word .L0020324C
/* 19DC24 0029DB24 68532000 */ .word .L00205368
/* 19DC28 0029DB28 9C332000 */ .word .L0020339C
/* 19DC2C 0029DB2C 00000000 */ .word 0x00000000
