.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel pio2_2t__2
/* 198884 00298784 08A3852E */ .word 0x2E85A308
