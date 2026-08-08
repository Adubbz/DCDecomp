.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_3190
/* 19C050 0029BF50 6D617020 */ .word 0x2070616D
/* 19C054 0029BF54 6275696C */ .word 0x6C697562
/* 19C058 0029BF58 64207375 */ .word 0x75732064
/* 19C05C 0029BF5C 63636573 */ .word 0x73656363
/* 19C060 0029BF60 7321210A */ .word 0x0A212173
/* 19C064 0029BF64 00000000 */ .word 0x00000000
/* 19C068 0029BF68 00000000 */ .word 0x00000000
/* 19C06C 0029BF6C 00000000 */ .word 0x00000000
