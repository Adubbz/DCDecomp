.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_451
/* 19A2B0 0029A1B0 5445585F */ .word 0x5F584554
/* 19A2B4 0029A1B4 414E494D */ .word 0x4D494E41
/* 19A2B8 0029A1B8 455F454E */ .word 0x4E455F45
/* 19A2BC 0029A1BC 44000000 */ .word 0x00000044
