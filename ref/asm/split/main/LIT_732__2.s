.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_732__2
/* 19AB38 0029AA38 66636F6E */ .word 0x6E6F6366
/* 19AB3C 0029AA3C 762E6269 */ .word 0x69622E76
/* 19AB40 0029AA40 6E000000 */ .word 0x0000006E
/* 19AB44 0029AA44 00000000 */ .word 0x00000000
/* 19AB48 0029AA48 00000000 */ .word 0x00000000
/* 19AB4C 0029AA4C 00000000 */ .word 0x00000000
