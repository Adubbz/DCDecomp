.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_425__3
/* 19FE08 0029FD08 63686172 */ .word 0x72616863
/* 19FE0C 0029FD0C 612F6631 */ .word 0x31662F61
/* 19FE10 0029FD10 32612E63 */ .word 0x632E6132
/* 19FE14 0029FD14 68720000 */ .word 0x00007268
