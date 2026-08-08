.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2807
/* 19AFB0 0029AEB0 67656469 */ .word 0x69646567
/* 19AFB4 0029AEB4 742F7379 */ .word 0x79732F74
/* 19AFB8 0029AEB8 7374656D */ .word 0x6D657473
/* 19AFBC 0029AEBC 2F657379 */ .word 0x7973652F
/* 19AFC0 0029AEC0 735F2564 */ .word 0x64255F73
/* 19AFC4 0029AEC4 2E70616B */ .word 0x6B61702E
/* 19AFC8 0029AEC8 00000000 */ .word 0x00000000
/* 19AFCC 0029AECC 00000000 */ .word 0x00000000
