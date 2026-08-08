.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1040
/* 19D1B0 0029D0B0 5B25645D */ .word 0x5D64255B
/* 19D1B4 0029D0B4 2064636F */ .word 0x6F636420
/* 19D1B8 0029D0B8 6C202D3E */ .word 0x3E2D206C
/* 19D1BC 0029D0BC 2025730A */ .word 0x0A732520
/* 19D1C0 0029D0C0 00000000 */ .word 0x00000000
/* 19D1C4 0029D0C4 00000000 */ .word 0x00000000
/* 19D1C8 0029D0C8 00000000 */ .word 0x00000000
/* 19D1CC 0029D0CC 00000000 */ .word 0x00000000
