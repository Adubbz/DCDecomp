.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_350
/* 19A078 00299F78 25732E74 */ .word 0x742E7325
/* 19A07C 00299F7C 78740000 */ .word 0x00007478
