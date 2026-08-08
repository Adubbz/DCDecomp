.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1011
/* 199690 00299590 6C69626D */ .word 0x6D62696C
/* 199694 00299594 6320696E */ .word 0x6E692063
/* 199698 00299598 69746961 */ .word 0x61697469
/* 19969C 0029959C 6C697A65 */ .word 0x657A696C
/* 1996A0 002995A0 20666169 */ .word 0x69616620
/* 1996A4 002995A4 6C640A00 */ .word 0x000A646C
