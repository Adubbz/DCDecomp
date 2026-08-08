.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1013
/* 19D718 0029D618 73746179 */ .word 0x79617473
/* 19D71C 0029D61C 6672616D */ .word 0x6D617266
/* 19D720 0029D620 65000000 */ .word 0x00000065
/* 19D724 0029D624 00000000 */ .word 0x00000000
/* 19D728 0029D628 00000000 */ .word 0x00000000
/* 19D72C 0029D62C 00000000 */ .word 0x00000000
