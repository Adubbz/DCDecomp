.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_423
/* 19FDE8 0029FCE8 63686172 */ .word 0x72616863
/* 19FDEC 0029FCEC 612F6631 */ .word 0x31662F61
/* 19FDF0 0029FCF0 30612E63 */ .word 0x632E6130
/* 19FDF4 0029FCF4 68720000 */ .word 0x00007268
