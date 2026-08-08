.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_658
/* 199480 00299380 736F756E */ .word 0x6E756F73
/* 199484 00299384 642F7462 */ .word 0x62742F64
/* 199488 00299388 6C2F7371 */ .word 0x71732F6C
/* 19948C 0029938C 74626C2E */ .word 0x2E6C6274
/* 199490 00299390 74787400 */ .word GlobalDataBuffer + 0x49C7F4
/* 199494 00299394 00000000 */ .word 0x00000000
/* 199498 00299398 00000000 */ .word 0x00000000
/* 19949C 0029939C 00000000 */ .word 0x00000000
