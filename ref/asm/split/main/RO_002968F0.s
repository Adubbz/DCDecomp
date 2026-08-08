.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002968F0
/* 1969F0 002968F0 FB799F50 */ .word 0x509F79FB
/* 1969F4 002968F4 1344D33F */ .word 0x3FD34413
/* 1969F8 002968F8 00000000 */ .word 0x00000000
/* 1969FC 002968FC 00000000 */ .word 0x00000000
