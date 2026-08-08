.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_427
/* 19FE28 0029FD28 63686172 */ .word 0x72616863
/* 19FE2C 0029FD2C 612F6631 */ .word 0x31662F61
/* 19FE30 0029FD30 34612E63 */ .word 0x632E6134
/* 19FE34 0029FD34 68720000 */ .word 0x00007268
