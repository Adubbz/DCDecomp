.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_407__2
/* 19FD38 0029FC38 63686172 */ .word 0x72616863
/* 19FD3C 0029FC3C 612F6630 */ .word 0x30662F61
/* 19FD40 0029FC40 31612E63 */ .word 0x632E6131
/* 19FD44 0029FC44 68720000 */ .word 0x00007268
