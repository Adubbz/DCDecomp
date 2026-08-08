.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_410__3
/* 19FD68 0029FC68 63686172 */ .word 0x72616863
/* 19FD6C 0029FC6C 612F6630 */ .word 0x30662F61
/* 19FD70 0029FC70 34612E63 */ .word 0x632E6134
/* 19FD74 0029FC74 68720000 */ .word 0x00007268
