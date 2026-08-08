.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1618
/* 19BAB0 0029B9B0 726F7420 */ .word 0x20746F72
/* 19BAB4 0029B9B4 252E3266 */ .word 0x66322E25
/* 19BAB8 0029B9B8 2F20252E */ .word 0x2E25202F
/* 19BABC 0029B9BC 32662F20 */ .word 0x202F6632
/* 19BAC0 0029B9C0 252E3266 */ .word 0x66322E25
/* 19BAC4 0029B9C4 0A000000 */ .word 0x0000000A
