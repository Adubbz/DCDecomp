.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_1556
/* 199B78 00299A78 66756B69 */ .word 0x696B7566
/* 199B7C 00299A7C 64617368 */ .word 0x68736164
/* 199B80 00299A80 69626173 */ .word 0x73616269
/* 199B84 00299A84 65000000 */ .word 0x00000065
