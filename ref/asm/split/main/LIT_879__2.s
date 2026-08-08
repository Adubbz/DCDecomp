.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_879__2
/* 19BC90 0029BB90 4D6F6465 */ .word 0x65646F4D
/* 19BC94 0029BB94 6C204E6F */ .word 0x6F4E206C
/* 19BC98 0029BB98 74466F75 */ .word 0x756F4674
/* 19BC9C 0029BB9C 6E642121 */ .word 0x2121646E
/* 19BCA0 0029BBA0 25730A00 */ .word 0x000A7325
/* 19BCA4 0029BBA4 00000000 */ .word 0x00000000
