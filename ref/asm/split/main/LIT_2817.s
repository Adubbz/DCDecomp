.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2817
/* 19B058 0029AF58 69626F78 */ .word 0x786F6269
/* 19B05C 0029AF5C 5F312E6D */ .word 0x6D2E315F
/* 19B060 0029AF60 64730000 */ .word 0x00007364
/* 19B064 0029AF64 00000000 */ .word 0x00000000
