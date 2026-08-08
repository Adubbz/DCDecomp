.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_394
/* 198E90 00298D90 61646472 */ .word 0x72646461
/* 198E94 00298D94 65737320 */ .word 0x20737365
/* 198E98 00298D98 6572726F */ .word 0x6F727265
/* 198E9C 00298D9C 72212120 */ .word 0x20212172
/* 198EA0 00298DA0 2564200A */ .word 0x0A206425
/* 198EA4 00298DA4 00000000 */ .word 0x00000000
