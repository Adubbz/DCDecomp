.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_2737
/* 19ADB0 0029ACB0 236D6573 */ .word 0x73656D23
/* 19ADB4 0029ACB4 5F667261 */ .word 0x6172665F
/* 19ADB8 0029ACB8 6D655F62 */ .word 0x625F656D
/* 19ADBC 0029ACBC 75666623 */ .word 0x23666675
/* 19ADC0 0029ACC0 36343023 */ .word 0x23303436
/* 19ADC4 0029ACC4 34343823 */ .word 0x23383434
/* 19ADC8 0029ACC8 34000000 */ .word 0x00000034
/* 19ADCC 0029ACCC 00000000 */ .word 0x00000000
