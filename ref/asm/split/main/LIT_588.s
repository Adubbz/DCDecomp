.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_588
/* 19C5C0 0029C4C0 64756E2F */ .word 0x2F6E7564
/* 19C5C4 0029C4C4 6D61696E */ .word 0x6E69616D
/* 19C5C8 0029C4C8 63686172 */ .word 0x72616863
/* 19C5CC 0029C4CC 612F6330 */ .word 0x30632F61
/* 19C5D0 0029C4D0 35612E63 */ .word 0x632E6135
/* 19C5D4 0029C4D4 68720000 */ .word 0x00007268
/* 19C5D8 0029C4D8 00000000 */ .word 0x00000000
/* 19C5DC 0029C4DC 00000000 */ .word 0x00000000
