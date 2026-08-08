.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_409
/* 198FD0 00298ED0 5652414D */ .word 0x4D415256
/* 198FD4 00298ED4 20697320 */ .word 0x20736920
/* 198FD8 00298ED8 6E6F7420 */ .word 0x20746F6E
/* 198FDC 00298EDC 656E6F75 */ .word 0x756F6E65
/* 198FE0 00298EE0 67680A00 */ .word 0x000A6867
/* 198FE4 00298EE4 00000000 */ .word 0x00000000
