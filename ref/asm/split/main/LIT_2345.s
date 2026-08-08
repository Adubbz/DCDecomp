.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2345
/* 19EC00 0029EB00 6F707469 */ .word 0x6974706F
/* 19EC04 0029EB04 6F6E2E69 */ .word 0x692E6E6F
/* 19EC08 0029EB08 6D670000 */ .word 0x0000676D
/* 19EC0C 0029EB0C 00000000 */ .word 0x00000000
