.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_00296FE0
/* 1970E0 00296FE0 4C696263 */ .word 0x6362694C
/* 1970E4 00296FE4 64766420 */ .word 0x20647664
/* 1970E8 00296FE8 62696E64 */ .word 0x646E6962
/* 1970EC 00296FEC 20657272 */ .word 0x72726520
/* 1970F0 00296FF0 20436453 */ .word 0x53644320
/* 1970F4 00296FF4 65617263 */ .word 0x63726165
/* 1970F8 00296FF8 6846696C */ .word 0x6C694668
/* 1970FC 00296FFC 650A0000 */ .word 0x00000A65
