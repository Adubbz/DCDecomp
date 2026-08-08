.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_706
/* 19CDF0 0029CCF0 746F726F */ .word 0x6F726F74
/* 19CDF4 0029CCF4 6B6F696C */ .word 0x6C696F6B
/* 19CDF8 0029CCF8 00000000 */ .word 0x00000000
/* 19CDFC 0029CCFC 00000000 */ .word 0x00000000
