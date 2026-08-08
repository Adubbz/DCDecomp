.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_366
/* 19A840 0029A740 4D4F5449 */ .word 0x49544F4D
/* 19A844 0029A744 4F4E5F50 */ .word 0x505F4E4F
/* 19A848 0029A748 41525453 */ .word 0x53545241
/* 19A84C 0029A74C 00000000 */ .word 0x00000000
