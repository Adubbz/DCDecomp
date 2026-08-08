.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_725__2
/* 19A0D8 00299FD8 766F6963 */ .word 0x63696F76
/* 19A0DC 00299FDC 65256400 */ .word GlobalDataBuffer + 0x3974E5
