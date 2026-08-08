.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_372
/* 19A890 0029A790 54414C4B */ .word 0x4B4C4154
/* 19A894 0029A794 5F524F54 */ .word 0x544F525F
/* 19A898 0029A798 00000000 */ .word 0x00000000
/* 19A89C 0029A79C 00000000 */ .word 0x00000000
