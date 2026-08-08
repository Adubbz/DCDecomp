.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_360
/* 19A7F0 0029A6F0 534B595F */ .word 0x5F594B53
/* 19A7F4 0029A6F4 464F4C4C */ .word 0x4C4C4F46
/* 19A7F8 0029A6F8 4F570000 */ .word 0x0000574F
/* 19A7FC 0029A6FC 00000000 */ .word 0x00000000
