.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_725
/* 199028 00298F28 56455254 */ .word 0x54524556
/* 19902C 00298F2C 45585F41 */ .word 0x415F5845
/* 199030 00298F30 4E494D45 */ .word 0x454D494E
/* 199034 00298F34 00000000 */ .word 0x00000000
/* 199038 00298F38 00000000 */ .word 0x00000000
/* 19903C 00298F3C 00000000 */ .word 0x00000000
