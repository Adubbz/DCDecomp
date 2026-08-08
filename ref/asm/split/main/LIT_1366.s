.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1366
/* 19B760 0029B660 64756E2F */ .word 0x2F6E7564
/* 19B764 0029B664 6574632F */ .word 0x2F637465
/* 19B768 0029B668 6974656D */ .word 0x6D657469
/* 19B76C 0029B66C 6765745F */ .word 0x5F746567
/* 19B770 0029B670 732F6430 */ .word 0x30642F73
/* 19B774 0029B674 31693032 */ .word 0x32306931
/* 19B778 0029B678 6D000000 */ .word 0x0000006D
/* 19B77C 0029B67C 00000000 */ .word 0x00000000
