.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_659__3
/* 19CBA8 0029CAA8 62616E61 */ .word 0x616E6162
/* 19CBAC 0029CAAC 6E610000 */ .word 0x0000616E
