.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2050
/* 19F1D0 0029F0D0 766F6C75 */ .word 0x756C6F76
/* 19F1D4 0029F0D4 6D655B33 */ .word 0x335B656D
/* 19F1D8 0029F0D8 5D3A2533 */ .word 0x33253A5D
/* 19F1DC 0029F0DC 642C2025 */ .word 0x25202C64
/* 19F1E0 0029F0E0 33642C20 */ .word 0x202C6433
/* 19F1E4 0029F0E4 2533640A */ .word 0x0A643325
/* 19F1E8 0029F0E8 00000000 */ .word 0x00000000
/* 19F1EC 0029F0EC 00000000 */ .word 0x00000000
