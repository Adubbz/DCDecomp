.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel RO_002970A8
/* 1971A8 002970A8 63616C6C */ .word 0x6C6C6163
/* 1971AC 002970AC 20436452 */ .word 0x52644320
/* 1971B0 002970B0 65616443 */ .word 0x43646165
/* 1971B4 002970B4 6861696E */ .word 0x6E696168
/* 1971B8 002970B8 20636D64 */ .word 0x646D6320
/* 1971BC 002970BC 20310A00 */ .word 0x000A3120
