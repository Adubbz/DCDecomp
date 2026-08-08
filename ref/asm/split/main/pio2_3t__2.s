.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 2
glabel pio2_3t__2
/* 19888C 0029878C 32318D24 */ .word 0x248D3132
