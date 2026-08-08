.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_5881
/* 19DD30 0029DC30 25642069 */ .word 0x69206425
/* 19DD34 0029DC34 73204E55 */ .word 0x554E2073
/* 19DD38 0029DC38 4C4C206E */ .word 0x6E204C4C
/* 19DD3C 0029DC3C 6F746869 */ .word 0x6968746F
/* 19DD40 0029DC40 6E670A00 */ .word 0x000A676E
/* 19DD44 0029DC44 00000000 */ .word 0x00000000
/* 19DD48 0029DC48 00000000 */ .word 0x00000000
/* 19DD4C 0029DC4C 00000000 */ .word 0x00000000
