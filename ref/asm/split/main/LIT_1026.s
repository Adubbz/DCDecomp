.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1026
/* 19B1A8 0029B0A8 25736368 */ .word 0x68637325
/* 19B1AC 0029B0AC 6172612F */ .word 0x2F617261
/* 19B1B0 0029B0B0 25732E63 */ .word 0x632E7325
/* 19B1B4 0029B0B4 68720000 */ .word 0x00007268
