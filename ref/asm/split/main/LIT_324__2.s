.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_324__2
/* 19A630 0029A530 424C445F */ .word 0x5F444C42
/* 19A634 0029A534 494D4700 */ .word GlobalDataBuffer + 0x1C9CC9
