.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_408__3
/* 19FD48 0029FC48 63686172 */ .word 0x72616863
/* 19FD4C 0029FC4C 612F6630 */ .word 0x30662F61
/* 19FD50 0029FC50 32612E63 */ .word 0x632E6132
/* 19FD54 0029FC54 68720000 */ .word 0x00007268
