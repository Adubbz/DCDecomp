.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_411
/* 19FD78 0029FC78 63686172 */ .word 0x72616863
/* 19FD7C 0029FC7C 612F6630 */ .word 0x30662F61
/* 19FD80 0029FC80 35612E63 */ .word 0x632E6135
/* 19FD84 0029FC84 68720000 */ .word 0x00007268
