.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_585
/* 19C560 0029C460 64756E2F */ .word 0x2F6E7564
/* 19C564 0029C464 6D61696E */ .word 0x6E69616D
/* 19C568 0029C468 63686172 */ .word 0x72616863
/* 19C56C 0029C46C 612F6330 */ .word 0x30632F61
/* 19C570 0029C470 31642E63 */ .word 0x632E6431
/* 19C574 0029C474 68720000 */ .word 0x00007268
/* 19C578 0029C478 00000000 */ .word 0x00000000
/* 19C57C 0029C47C 00000000 */ .word 0x00000000
