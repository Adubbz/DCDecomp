.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_822__2
/* 19A948 0029A848 6576656E */ .word 0x6E657665
/* 19A94C 0029A84C 74206F76 */ .word 0x766F2074
/* 19A950 0029A850 65722121 */ .word 0x21217265
/* 19A954 0029A854 210A0000 */ .word 0x00000A21
