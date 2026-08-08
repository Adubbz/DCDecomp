.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
.align 4
glabel LIT_802
/* 199A70 00299970 98561400 */ .word .L00145698
/* 199A74 00299974 8C561400 */ .word .L0014568C
/* 199A78 00299978 80561400 */ .word .L00145680
/* 199A7C 0029997C 74561400 */ .word .L00145674
/* 199A80 00299980 68561400 */ .word .L00145668
/* 199A84 00299984 5C561400 */ .word .L0014565C
/* 199A88 00299988 00000000 */ .word 0x00000000
/* 199A8C 0029998C 00000000 */ .word 0x00000000
