.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_942
/* 19D6B8 0029D5B8 616C6C6D */ .word 0x6D6C6C61
/* 19D6BC 0029D5BC 656E752E */ .word 0x2E756E65
/* 19D6C0 0029D5C0 6D657300 */ .word GlobalDataBuffer + 0x48B4ED
/* 19D6C4 0029D5C4 00000000 */ .word 0x00000000
/* 19D6C8 0029D5C8 00000000 */ .word 0x00000000
/* 19D6CC 0029D5CC 00000000 */ .word 0x00000000
