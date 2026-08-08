.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_632
/* 1993E0 002992E0 6364726F */ .word 0x6F726463
/* 1993E4 002992E4 6D303A5C */ .word 0x5C3A306D
/* 1993E8 002992E8 4D4F4455 */ .word 0x55444F4D
/* 1993EC 002992EC 4C45535C */ .word 0x5C53454C
/* 1993F0 002992F0 53445244 */ .word 0x44524453
/* 1993F4 002992F4 52562E49 */ .word 0x492E5652
/* 1993F8 002992F8 52583B31 */ .word 0x313B5852
/* 1993FC 002992FC 00000000 */ .word 0x00000000
