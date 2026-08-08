.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_814
/* 19E7F0 0029E6F0 72656164 */ .word 0x64616572
/* 19E7F4 0029E6F4 2073697A */ .word 0x7A697320
/* 19E7F8 0029E6F8 65203D20 */ .word 0x203D2065
/* 19E7FC 0029E6FC 25640A00 */ .word 0x000A6425
