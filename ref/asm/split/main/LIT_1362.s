.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1362
/* 19B720 0029B620 69626F78 */ .word 0x786F6269
/* 19B724 0029B624 5F612E6D */ .word 0x6D2E615F
/* 19B728 0029B628 64730000 */ .word 0x00007364
/* 19B72C 0029B62C 00000000 */ .word 0x00000000
