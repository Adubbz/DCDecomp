.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_726__2
/* 19A0E0 00299FE0 736F756E */ .word 0x6E756F73
/* 19A0E4 00299FE4 642F766F */ .word 0x6F762F64
/* 19A0E8 00299FE8 6963652F */ .word 0x2F656369
/* 19A0EC 00299FEC 25732E73 */ .word 0x732E7325
/* 19A0F0 00299FF0 6E640000 */ .word 0x0000646E
/* 19A0F4 00299FF4 00000000 */ .word 0x00000000
