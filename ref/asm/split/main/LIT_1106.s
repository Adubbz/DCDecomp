.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1106
/* 19E090 0029DF90 25642070 */ .word 0x70206425
/* 19E094 0029DF94 61636B20 */ .word 0x206B6361
/* 19E098 0029DF98 64617461 */ .word 0x61746164
/* 19E09C 0029DF9C 20697320 */ .word 0x20736920
/* 19E0A0 0029DFA0 4E554C4C */ .word 0x4C4C554E
/* 19E0A4 0029DFA4 0A000000 */ .word 0x0000000A
/* 19E0A8 0029DFA8 00000000 */ .word 0x00000000
/* 19E0AC 0029DFAC 00000000 */ .word 0x00000000
