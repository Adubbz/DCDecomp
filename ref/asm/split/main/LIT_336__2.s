.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_336__2
/* 19A6A8 0029A5A8 57415445 */ .word 0x45544157
/* 19A6AC 0029A5AC 525F5355 */ .word 0x55535F52
/* 19A6B0 0029A5B0 52464143 */ .word 0x43414652
/* 19A6B4 0029A5B4 45000000 */ .word 0x00000045
