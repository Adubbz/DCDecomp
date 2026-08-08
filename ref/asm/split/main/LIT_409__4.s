.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_409__4
/* 19FD58 0029FC58 63686172 */ .word 0x72616863
/* 19FD5C 0029FC5C 612F6630 */ .word 0x30662F61
/* 19FD60 0029FC60 33612E63 */ .word 0x632E6133
/* 19FD64 0029FC64 68720000 */ .word 0x00007268
