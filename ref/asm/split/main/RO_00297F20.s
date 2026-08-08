.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00297F20
/* 198020 00297F20 65256400 */ .word GlobalDataBuffer + 0x3974E5
/* 198024 00297F24 00000000 */ .word 0x00000000
