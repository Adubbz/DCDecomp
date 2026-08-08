.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_631
/* 1993C0 002992C0 6364726F */ .word 0x6F726463
/* 1993C4 002992C4 6D303A5C */ .word 0x5C3A306D
/* 1993C8 002992C8 4D4F4455 */ .word 0x55444F4D
/* 1993CC 002992CC 4C45535C */ .word 0x5C53454C
/* 1993D0 002992D0 4C494253 */ .word 0x5342494C
/* 1993D4 002992D4 442E4952 */ .word 0x52492E44
/* 1993D8 002992D8 583B3100 */ .word GlobalDataBuffer + 0x68AD8
/* 1993DC 002992DC 00000000 */ .word 0x00000000
