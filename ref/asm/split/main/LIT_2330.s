.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2330
/* 19D0F0 0029CFF0 64756E2F */ .word 0x2F6E7564
/* 19D0F4 0029CFF4 6D6F6E73 */ .word 0x736E6F6D
/* 19D0F8 0029CFF8 746F722F */ .word 0x2F726F74
/* 19D0FC 0029CFFC 25732E73 */ .word 0x732E7325
/* 19D100 0029D000 74620000 */ .word 0x00006274
/* 19D104 0029D004 00000000 */ .word 0x00000000
/* 19D108 0029D008 00000000 */ .word 0x00000000
/* 19D10C 0029D00C 00000000 */ .word 0x00000000
