.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2328
/* 19D0C0 0029CFC0 64756E2F */ .word 0x2F6E7564
/* 19D0C4 0029CFC4 6D6F6E73 */ .word 0x736E6F6D
/* 19D0C8 0029CFC8 746F722F */ .word 0x2F726F74
/* 19D0CC 0029CFCC 25732E63 */ .word 0x632E7325
/* 19D0D0 0029CFD0 68720000 */ .word 0x00007268
/* 19D0D4 0029CFD4 00000000 */ .word 0x00000000
