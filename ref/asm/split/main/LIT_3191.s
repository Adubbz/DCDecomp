.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
.align 4
glabel LIT_3191
/* 19C070 0029BF70 B8BF1C00 */ .word .L001CBFB8
/* 19C074 0029BF74 10C01C00 */ .word .L001CC010
/* 19C078 0029BF78 C8BF1C00 */ .word .L001CBFC8
/* 19C07C 0029BF7C D8BF1C00 */ .word .L001CBFD8
/* 19C080 0029BF80 E8BF1C00 */ .word .L001CBFE8
/* 19C084 0029BF84 F8BF1C00 */ .word .L001CBFF8
/* 19C088 0029BF88 08C01C00 */ .word .L001CC008
/* 19C08C 0029BF8C 00000000 */ .word 0x00000000
