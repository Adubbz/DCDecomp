.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_935__2
/* 19D680 0029D580 23646267 */ .word 0x67626423
/* 19D684 0029D584 776F726B */ .word 0x6B726F77
/* 19D688 0029D588 5F6D656E */ .word 0x6E656D5F
/* 19D68C 0029D58C 75233235 */ .word 0x35322375
/* 19D690 0029D590 36233232 */ .word 0x32322336
/* 19D694 0029D594 34233300 */ .word GlobalDataBuffer + 0x872B4
