.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_2751
/* 19AEE8 0029ADE8 696D672F */ .word 0x2F676D69
/* 19AEEC 0029ADEC 73797374 */ .word 0x74737973
/* 19AEF0 0029ADF0 656D2E69 */ .word 0x692E6D65
/* 19AEF4 0029ADF4 6D670000 */ .word 0x0000676D
