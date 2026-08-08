.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2816
/* 19B048 0029AF48 69626F78 */ .word 0x786F6269
/* 19B04C 0029AF4C 5F302E6D */ .word 0x6D2E305F
/* 19B050 0029AF50 64730000 */ .word 0x00007364
/* 19B054 0029AF54 00000000 */ .word 0x00000000
