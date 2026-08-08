.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_00296B88
/* 196C88 00296B88 9535A094 */ .word 0x94A03595
/* 196C8C 00296B8C FFFFDF3F */ .word 0x3FDFFFFF
