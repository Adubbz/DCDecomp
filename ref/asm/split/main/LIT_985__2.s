.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_985__2
/* 19DF48 0029DE48 6B616765 */ .word 0x6567616B
/* 19DF4C 0029DE4C 746F616E */ .word 0x6E616F74
/* 19DF50 0029DE50 00000000 */ .word 0x00000000
/* 19DF54 0029DE54 00000000 */ .word 0x00000000
