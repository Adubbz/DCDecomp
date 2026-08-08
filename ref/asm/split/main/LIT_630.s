.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_630
/* 1993A0 002992A0 6364726F */ .word 0x6F726463
/* 1993A4 002992A4 6D303A5C */ .word 0x5C3A306D
/* 1993A8 002992A8 4D4F4455 */ .word 0x55444F4D
/* 1993AC 002992AC 4C45535C */ .word 0x5C53454C
/* 1993B0 002992B0 4D435345 */ .word 0x4553434D
/* 1993B4 002992B4 52562E49 */ .word 0x492E5652
/* 1993B8 002992B8 52583B31 */ .word 0x313B5852
/* 1993BC 002992BC 00000000 */ .word 0x00000000
