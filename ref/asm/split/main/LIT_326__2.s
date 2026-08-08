.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_326__2
/* 19A640 0029A540 53554E5F */ .word 0x5F4E5553
/* 19A644 0029A544 494D4700 */ .word GlobalDataBuffer + 0x1C9CC9
