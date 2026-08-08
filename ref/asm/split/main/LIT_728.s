.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_728
/* 199060 00298F60 53484144 */ .word 0x44414853
/* 199064 00298F64 4F575F4D */ .word 0x4D5F574F
/* 199068 00298F68 4F44454C */ .word 0x4C45444F
/* 19906C 00298F6C 00000000 */ .word 0x00000000
