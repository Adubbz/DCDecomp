.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_586
/* 19C580 0029C480 64756E2F */ .word 0x2F6E7564
/* 19C584 0029C484 6D61696E */ .word 0x6E69616D
/* 19C588 0029C488 63686172 */ .word 0x72616863
/* 19C58C 0029C48C 612F6330 */ .word 0x30632F61
/* 19C590 0029C490 34622E63 */ .word 0x632E6234
/* 19C594 0029C494 68720000 */ .word 0x00007268
/* 19C598 0029C498 00000000 */ .word 0x00000000
/* 19C59C 0029C49C 00000000 */ .word 0x00000000
