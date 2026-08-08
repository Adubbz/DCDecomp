.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_385__2
/* 19E680 0029E580 496E6974 */ .word 0x74696E49
/* 19E684 0029E584 69616C69 */ .word 0x696C6169
/* 19E688 0029E588 7A656420 */ .word 0x2064657A
/* 19E68C 0029E58C 4661696C */ .word 0x6C696146
/* 19E690 0029E590 65642121 */ .word 0x21216465
/* 19E694 0029E594 0A000000 */ .word 0x0000000A
/* 19E698 0029E598 00000000 */ .word 0x00000000
/* 19E69C 0029E59C 00000000 */ .word 0x00000000
