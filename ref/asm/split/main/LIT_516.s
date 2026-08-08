.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_516
/* 19C258 0029C158 5552415F */ .word 0x5F415255
/* 19C25C 0029C15C 414D4249 */ .word 0x49424D41
/* 19C260 0029C160 454E5400 */ .word GlobalDataBuffer + 0x299DC5
/* 19C264 0029C164 00000000 */ .word 0x00000000
