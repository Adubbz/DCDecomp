.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002968E0
/* 1969E0 002968E0 61436F63 */ .word 0x636F4361
/* 1969E4 002968E4 A787D23F */ .word 0x3FD287A7
