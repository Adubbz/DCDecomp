.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_520
/* 19C290 0029C190 4D494E49 */ .word 0x494E494D
/* 19C294 0029C194 4D41505F */ .word 0x5F50414D
/* 19C298 0029C198 494D4700 */ .word GlobalDataBuffer + 0x1C9CC9
/* 19C29C 0029C19C 00000000 */ .word 0x00000000
