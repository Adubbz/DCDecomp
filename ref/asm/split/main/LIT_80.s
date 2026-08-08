.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_80
/* 19F960 0029F860 696C6C65 */ .word 0x656C6C69
/* 19F964 0029F864 67616C20 */ .word 0x206C6167
/* 19F968 0029F868 66756E63 */ .word 0x636E7566
/* 19F96C 0029F86C 74696F6E */ .word 0x6E6F6974
/* 19F970 0029F870 2063616C */ .word 0x6C616320
/* 19F974 0029F874 6C206578 */ .word 0x7865206C
/* 19F978 0029F878 74202564 */ .word 0x64252074
/* 19F97C 0029F87C 0A000000 */ .word 0x0000000A
