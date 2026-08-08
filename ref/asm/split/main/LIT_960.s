.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_960
/* 19D150 0029D050 6C6F636B */ .word 0x6B636F6C
/* 19D154 0029D054 3A4E6F66 */ .word 0x666F4E3A
/* 19D158 0029D058 466F756E */ .word 0x6E756F46
/* 19D15C 0029D05C 744E756C */ .word 0x6C754E74
/* 19D160 0029D060 6C202573 */ .word 0x7325206C
/* 19D164 0029D064 0A000000 */ .word 0x0000000A
/* 19D168 0029D068 00000000 */ .word 0x00000000
/* 19D16C 0029D06C 00000000 */ .word 0x00000000
