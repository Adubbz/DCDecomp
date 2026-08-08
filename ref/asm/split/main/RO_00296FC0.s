.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00296FC0
/* 1970C0 00296FC0 4C696263 */ .word 0x6362694C
/* 1970C4 00296FC4 64766420 */ .word 0x20647664
/* 1970C8 00296FC8 62696E64 */ .word 0x646E6962
/* 1970CC 00296FCC 20657272 */ .word 0x72726520
/* 1970D0 00296FD0 20506F77 */ .word 0x776F5020
/* 1970D4 00296FD4 65724F66 */ .word 0x664F7265
/* 1970D8 00296FD8 6643420A */ .word 0x0A424366
/* 1970DC 00296FDC 00000000 */ .word 0x00000000
