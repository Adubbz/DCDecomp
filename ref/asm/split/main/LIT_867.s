.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_867
/* 19BC60 0029BB60 4D6F6465 */ .word 0x65646F4D
/* 19BC64 0029BB64 6C204E6F */ .word 0x6F4E206C
/* 19BC68 0029BB68 74466F75 */ .word 0x756F4674
/* 19BC6C 0029BB6C 6E642121 */ .word 0x2121646E
/* 19BC70 0029BB70 2025730A */ .word 0x0A732520
/* 19BC74 0029BB74 00000000 */ .word 0x00000000
