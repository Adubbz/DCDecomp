.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_384__2
/* 19A0A8 00299FA8 25640A00 */ .word 0x000A6425
/* 19A0AC 00299FAC 00000000 */ .word 0x00000000
