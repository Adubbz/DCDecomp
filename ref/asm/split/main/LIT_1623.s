.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1623
/* 19BB30 0029BA30 6C637265 */ .word 0x6572636C
/* 19BB34 0029BA34 6620252E */ .word 0x2E252066
/* 19BB38 0029BA38 32662F20 */ .word 0x202F6632
/* 19BB3C 0029BA3C 252E3266 */ .word 0x66322E25
/* 19BB40 0029BA40 2F20252E */ .word 0x2E25202F
/* 19BB44 0029BA44 32660A00 */ .word 0x000A6632
