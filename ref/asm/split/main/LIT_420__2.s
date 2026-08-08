.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_420__2
/* 19FDB8 0029FCB8 63686172 */ .word 0x72616863
/* 19FDBC 0029FCBC 612F6630 */ .word 0x30662F61
/* 19FDC0 0029FCC0 37612E63 */ .word 0x632E6137
/* 19FDC4 0029FCC4 68720000 */ .word 0x00007268
