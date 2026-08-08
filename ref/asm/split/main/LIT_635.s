.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_635
/* 199440 00299340 6364726F */ .word 0x6F726463
/* 199444 00299344 6D303A5C */ .word 0x5C3A306D
/* 199448 00299348 4D4F4455 */ .word 0x55444F4D
/* 19944C 0029934C 4C45535C */ .word 0x5C53454C
/* 199450 00299350 455A4D49 */ .word 0x494D5A45
/* 199454 00299354 44492E49 */ .word 0x492E4944
/* 199458 00299358 52583B31 */ .word 0x313B5852
/* 19945C 0029935C 00000000 */ .word 0x00000000
