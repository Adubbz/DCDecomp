.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel half__2
/* 19886C 0029876C 0000003F */ .word 0x3F000000
