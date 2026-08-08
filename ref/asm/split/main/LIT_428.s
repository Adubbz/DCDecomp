.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_428
/* 19FE38 0029FD38 63686172 */ .word 0x72616863
/* 19FE3C 0029FD3C 612F6631 */ .word 0x31662F61
/* 19FE40 0029FD40 35612E63 */ .word 0x632E6135
/* 19FE44 0029FD44 68720000 */ .word 0x00007268
