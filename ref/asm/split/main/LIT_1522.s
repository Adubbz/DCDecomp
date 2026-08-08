.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1522
/* 19B810 0029B710 4D494E49 */ .word 0x494E494D
/* 19B814 0029B714 204D4150 */ .word 0x50414D20
/* 19B818 0029B718 20564945 */ .word 0x45495620
/* 19B81C 0029B71C 5720203D */ .word 0x3D202057
/* 19B820 0029B720 2025730A */ .word 0x0A732520
/* 19B824 0029B724 00000000 */ .word 0x00000000
/* 19B828 0029B728 00000000 */ .word 0x00000000
/* 19B82C 0029B72C 00000000 */ .word 0x00000000
