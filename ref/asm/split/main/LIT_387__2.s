.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_387__2
/* 19E6C0 0029E5C0 6D636D61 */ .word 0x616D636D
/* 19E6C4 0029E5C4 6E2E6972 */ .word 0x72692E6E
/* 19E6C8 0029E5C8 78206973 */ .word 0x73692078
/* 19E6CC 0029E5CC 206F6C64 */ .word 0x646C6F20
/* 19E6D0 0029E5D0 2066696C */ .word 0x6C696620
/* 19E6D4 0029E5D4 65200A00 */ .word 0x000A2065
