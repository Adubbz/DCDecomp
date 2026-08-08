.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_670
/* 19CC48 0029CB48 74616B61 */ .word 0x616B6174
/* 19CC4C 0029CB4C 72616B79 */ .word 0x796B6172
/* 19CC50 0029CB50 00000000 */ .word 0x00000000
/* 19CC54 0029CB54 00000000 */ .word 0x00000000
