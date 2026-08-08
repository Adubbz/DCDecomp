.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_343
/* 19A718 0029A618 524F4144 */ .word 0x44414F52
/* 19A71C 0029A61C 00000000 */ .word 0x00000000
