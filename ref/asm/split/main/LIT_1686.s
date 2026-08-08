.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1686
/* 19A2E0 0029A1E0 63706F6C */ .word 0x6C6F7063
/* 19A2E4 0029A1E4 79206F76 */ .word 0x766F2079
/* 19A2E8 0029A1E8 65722121 */ .word 0x21217265
/* 19A2EC 0029A1EC 21212025 */ .word 0x25202121
/* 19A2F0 0029A1F0 640A0000 */ .word 0x00000A64
/* 19A2F4 0029A1F4 00000000 */ .word 0x00000000
