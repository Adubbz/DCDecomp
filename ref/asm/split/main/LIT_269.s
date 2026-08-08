.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_269
/* 199DB8 00299CB8 74756E6F */ .word 0x6F6E7574
/* 199DBC 00299CBC 00000000 */ .word 0x00000000
