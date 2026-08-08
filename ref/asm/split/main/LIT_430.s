.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_430
/* 19FE58 0029FD58 63686172 */ .word 0x72616863
/* 19FE5C 0029FD5C 612F6631 */ .word 0x31662F61
/* 19FE60 0029FD60 37612E63 */ .word 0x632E6137
/* 19FE64 0029FD64 68720000 */ .word 0x00007268
