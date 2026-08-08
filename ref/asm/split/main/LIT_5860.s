.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_5860
/* 19DC90 0029DB90 64656D6F */ .word 0x6F6D6564
/* 19DC94 0029DB94 6E207368 */ .word 0x6873206E
/* 19DC98 0029DB98 61667420 */ .word 0x20746661
/* 19DC9C 0029DB9C 4F6E2121 */ .word 0x21216E4F
/* 19DCA0 0029DBA0 2121210A */ .word 0x0A212121
/* 19DCA4 0029DBA4 00000000 */ .word 0x00000000
