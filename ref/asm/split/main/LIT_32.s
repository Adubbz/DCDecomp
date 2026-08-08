.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_32
/* 19F8D0 0029F7D0 44697669 */ .word 0x69766944
/* 19F8D4 0029F7D4 64652062 */ .word 0x62206564
/* 19F8D8 0029F7D8 79203000 */ .word GlobalDataBuffer + 0x56FF9
/* 19F8DC 0029F7DC 00000000 */ .word 0x00000000
