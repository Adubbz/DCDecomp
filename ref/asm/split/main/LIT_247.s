.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_247
/* 199850 00299750 416C6C6F */ .word 0x6F6C6C41
/* 199854 00299754 63496F70 */ .word 0x706F4963
/* 199858 00299758 48656170 */ .word 0x70616548
/* 19985C 0029975C 20457272 */ .word 0x72724520
/* 199860 00299760 0A000000 */ .word 0x0000000A
/* 199864 00299764 00000000 */ .word 0x00000000
/* 199868 00299768 00000000 */ .word 0x00000000
/* 19986C 0029976C 00000000 */ .word 0x00000000
