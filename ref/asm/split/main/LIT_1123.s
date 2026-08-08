.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1123
/* 19E970 0029E870 666F726D */ .word 0x6D726F66
/* 19E974 0029E874 61742066 */ .word 0x66207461
/* 19E978 0029E878 696E6973 */ .word 0x73696E69
/* 19E97C 0029E87C 6865640A */ .word 0x0A646568
/* 19E980 0029E880 00000000 */ .word 0x00000000
/* 19E984 0029E884 00000000 */ .word 0x00000000
