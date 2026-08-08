.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_634
/* 199420 00299320 6364726F */ .word 0x6F726463
/* 199424 00299324 6D303A5C */ .word 0x5C3A306D
/* 199428 00299328 4D4F4455 */ .word 0x55444F4D
/* 19942C 0029932C 4C45535C */ .word 0x5C53454C
/* 199430 00299330 4D4F4448 */ .word 0x48444F4D
/* 199434 00299334 53594E2E */ .word 0x2E4E5953
/* 199438 00299338 4952583B */ .word 0x3B585249
/* 19943C 0029933C 31000000 */ .word 0x00000031
