.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1002
/* 19DFD0 0029DED0 23667261 */ .word 0x61726623
/* 19DFD4 0029DED4 6D655F6D */ .word 0x6D5F656D
/* 19DFD8 0029DED8 656E7577 */ .word 0x77756E65
/* 19DFDC 0029DEDC 65705F64 */ .word 0x645F7065
/* 19DFE0 0029DEE0 6D792336 */ .word 0x3623796D
/* 19DFE4 0029DEE4 34302334 */ .word 0x34233034
/* 19DFE8 0029DEE8 34382334 */ .word 0x34233834
/* 19DFEC 0029DEEC 00000000 */ .word 0x00000000
