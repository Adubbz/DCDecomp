.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_619
/* 198FF0 00298EF0 494D3200 */ .word GlobalDataBuffer + 0x79CC9
/* 198FF4 00298EF4 00000000 */ .word 0x00000000
/* 198FF8 00298EF8 00000000 */ .word 0x00000000
/* 198FFC 00298EFC 00000000 */ .word 0x00000000
