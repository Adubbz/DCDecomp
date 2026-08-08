.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_609
/* 19C8F8 0029C7F8 6A75656C */ .word 0x6C65756A
/* 19C8FC 0029C7FC 7061726C */ .word 0x6C726170
/* 19C900 0029C800 00000000 */ .word 0x00000000
/* 19C904 0029C804 00000000 */ .word 0x00000000
