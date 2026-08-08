.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_271
/* 199DC8 00299CC8 6B616964 */ .word 0x6469616B
/* 199DCC 00299CCC 616E0000 */ .word 0x00006E61
