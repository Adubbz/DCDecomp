.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_975
/* 19BE80 0029BD80 65787420 */ .word 0x20747865
/* 19BE84 0029BD84 66756E63 */ .word 0x636E7566
/* 19BE88 0029BD88 206F7665 */ .word 0x65766F20
/* 19BE8C 0029BD8C 72212100 */ .word 0x00212172
