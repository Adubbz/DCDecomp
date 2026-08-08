.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00296B98
/* 196C98 00296B98 9535A094 */ .word 0x94A03595
/* 196C9C 00296B9C FFFFCF3F */ .word 0x3FCFFFFF
