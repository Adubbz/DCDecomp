.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_431
/* 19FE68 0029FD68 63686172 */ .word 0x72616863
/* 19FE6C 0029FD6C 612F6631 */ .word 0x31662F61
/* 19FE70 0029FD70 38612E63 */ .word 0x632E6138
/* 19FE74 0029FD74 68720000 */ .word 0x00007268
