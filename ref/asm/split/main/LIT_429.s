.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_429
/* 19FE48 0029FD48 63686172 */ .word 0x72616863
/* 19FE4C 0029FD4C 612F6631 */ .word 0x31662F61
/* 19FE50 0029FD50 36612E63 */ .word 0x632E6136
/* 19FE54 0029FD54 68720000 */ .word 0x00007268
