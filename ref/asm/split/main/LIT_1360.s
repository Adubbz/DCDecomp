.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1360
/* 19B700 0029B600 69626F78 */ .word 0x786F6269
/* 19B704 0029B604 5F302E6D */ .word 0x6D2E305F
/* 19B708 0029B608 64730000 */ .word 0x00007364
/* 19B70C 0029B60C 00000000 */ .word 0x00000000
