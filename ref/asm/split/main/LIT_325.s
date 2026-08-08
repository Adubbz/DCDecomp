.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_325
/* 199FE8 00299EE8 62747562 */ .word 0x62757462
/* 199FEC 00299EEC 6F000000 */ .word 0x0000006F
