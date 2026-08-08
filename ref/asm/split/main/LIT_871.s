.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_871
/* 19A958 0029A858 62676D20 */ .word 0x206D6762
/* 19A95C 0029A85C 3D202564 */ .word 0x6425203D
/* 19A960 0029A860 0A000000 */ .word 0x0000000A
/* 19A964 0029A864 00000000 */ .word 0x00000000
/* 19A968 0029A868 00000000 */ .word 0x00000000
/* 19A96C 0029A86C 00000000 */ .word 0x00000000
