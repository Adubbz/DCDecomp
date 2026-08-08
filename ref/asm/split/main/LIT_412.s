.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_412
/* 19FD88 0029FC88 63686172 */ .word 0x72616863
/* 19FD8C 0029FC8C 612F6630 */ .word 0x30662F61
/* 19FD90 0029FC90 36612E63 */ .word 0x632E6136
/* 19FD94 0029FC94 68720000 */ .word 0x00007268
