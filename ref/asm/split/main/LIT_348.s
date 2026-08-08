.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_348
/* 19A050 00299F50 62676D25 */ .word 0x256D6762
/* 19A054 00299F54 64000000 */ .word 0x00000064
/* 19A058 00299F58 00000000 */ .word 0x00000000
/* 19A05C 00299F5C 00000000 */ .word 0x00000000
