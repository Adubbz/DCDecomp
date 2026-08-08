.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_584
/* 19BDB0 0029BCB0 64756E2F */ .word 0x2F6E7564
/* 19BDB4 0029BCB4 73637269 */ .word 0x69726373
/* 19BDB8 0029BCB8 70742F64 */ .word 0x642F7470
/* 19BDBC 0029BCBC 3025642F */ .word 0x2F642530
/* 19BDC0 0029BCC0 6576656E */ .word 0x6E657665
/* 19BDC4 0029BCC4 742E7374 */ .word 0x74732E74
/* 19BDC8 0029BCC8 62000000 */ .word 0x00000062
/* 19BDCC 0029BCCC 00000000 */ .word 0x00000000
