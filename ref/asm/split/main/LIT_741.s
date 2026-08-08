.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_741
/* 199130 00299030 494D475F */ .word 0x5F474D49
/* 199134 00299034 454E4400 */ .word GlobalDataBuffer + 0x199DC5
