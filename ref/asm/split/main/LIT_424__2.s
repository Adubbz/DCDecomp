.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_424__2
/* 19FDF8 0029FCF8 63686172 */ .word 0x72616863
/* 19FDFC 0029FCFC 612F6631 */ .word 0x31662F61
/* 19FE00 0029FD00 31612E63 */ .word 0x632E6131
/* 19FE04 0029FD04 68720000 */ .word 0x00007268
