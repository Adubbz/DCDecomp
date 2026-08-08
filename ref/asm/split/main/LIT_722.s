.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_722
/* 19AAB0 0029A9B0 67656469 */ .word 0x69646567
/* 19AAB4 0029A9B4 742F696E */ .word 0x6E692F74
/* 19AAB8 0029A9B8 74657269 */ .word 0x69726574
/* 19AABC 0029A9BC 6F722F69 */ .word 0x692F726F
/* 19AAC0 0029A9C0 6E746572 */ .word 0x7265746E
/* 19AAC4 0029A9C4 696F722E */ .word 0x2E726F69
/* 19AAC8 0029A9C8 63666700 */ .word GlobalDataBuffer + 0x3CB5E3
/* 19AACC 0029A9CC 00000000 */ .word 0x00000000
