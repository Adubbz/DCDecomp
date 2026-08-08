.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_628
/* 199360 00299260 6364726F */ .word 0x6F726463
/* 199364 00299264 6D303A5C */ .word 0x5C3A306D
/* 199368 00299268 4D4F4455 */ .word 0x55444F4D
/* 19936C 0029926C 4C45535C */ .word 0x5C53454C
/* 199370 00299270 5041444D */ .word 0x4D444150
/* 199374 00299274 414E2E49 */ .word 0x492E4E41
/* 199378 00299278 52583B31 */ .word 0x313B5852
/* 19937C 0029927C 00000000 */ .word 0x00000000
