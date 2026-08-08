.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_893
/* 199600 00299500 25736D65 */ .word 0x656D7325
/* 199604 00299504 6D6F7279 */ .word 0x79726F6D
/* 199608 00299508 20636172 */ .word 0x72616320
/* 19960C 0029950C 64202564 */ .word 0x64252064
/* 199610 00299510 0A000000 */ .word 0x0000000A
/* 199614 00299514 00000000 */ .word 0x00000000
