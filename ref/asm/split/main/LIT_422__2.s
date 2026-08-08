.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_422__2
/* 19FDD8 0029FCD8 63686172 */ .word 0x72616863
/* 19FDDC 0029FCDC 612F6630 */ .word 0x30662F61
/* 19FDE0 0029FCE0 39612E63 */ .word 0x632E6139
/* 19FDE4 0029FCE4 68720000 */ .word 0x00007268
