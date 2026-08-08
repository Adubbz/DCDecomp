.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_426
/* 19FE18 0029FD18 63686172 */ .word 0x72616863
/* 19FE1C 0029FD1C 612F6631 */ .word 0x31662F61
/* 19FE20 0029FD20 33612E63 */ .word 0x632E6133
/* 19FE24 0029FD24 68720000 */ .word 0x00007268
