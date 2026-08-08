.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_439
/* 199250 00299150 46696C65 */ .word 0x656C6946
/* 199254 00299154 206F7065 */ .word 0x65706F20
/* 199258 00299158 6E206572 */ .word 0x7265206E
/* 19925C 0029915C 726F7220 */ .word 0x20726F72
/* 199260 00299160 22257322 */ .word 0x22732522
/* 199264 00299164 0A200A20 */ .word 0x200A200A
/* 199268 00299168 0A000000 */ .word 0x0000000A
/* 19926C 0029916C 00000000 */ .word 0x00000000
