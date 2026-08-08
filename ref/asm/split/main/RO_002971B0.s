.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel RO_002971B0
/* 1972B0 002971B0 4C696263 */ .word 0x6362694C
/* 1972B4 002971B4 64766420 */ .word 0x20647664
/* 1972B8 002971B8 45786974 */ .word 0x74697845
/* 1972BC 002971BC 0A000000 */ .word 0x0000000A
