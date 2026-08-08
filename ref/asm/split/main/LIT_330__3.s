.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_330__3
/* 19A678 0029A578 494D4700 */ .word GlobalDataBuffer + 0x1C9CC9
/* 19A67C 0029A57C 00000000 */ .word 0x00000000
