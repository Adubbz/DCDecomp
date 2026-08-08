.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_791
/* 19D2B8 0029D1B8 6974656D */ .word 0x6D657469
/* 19D2BC 0029D1BC 69636F6E */ .word 0x6E6F6369
/* 19D2C0 0029D1C0 00000000 */ .word 0x00000000
/* 19D2C4 0029D1C4 00000000 */ .word 0x00000000
