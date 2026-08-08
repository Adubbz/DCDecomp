.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1601
/* 19B4D8 0029B3D8 464C414D */ .word 0x4D414C46
/* 19B4DC 0029B3DC 45000000 */ .word 0x00000045
