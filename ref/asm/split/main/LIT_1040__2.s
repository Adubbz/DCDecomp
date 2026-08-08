.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_1040__2
/* 19E030 0029DF30 23667261 */ .word 0x61726623
/* 19E034 0029DF34 6D655F6D */ .word 0x6D5F656D
/* 19E038 0029DF38 656E7577 */ .word 0x77756E65
/* 19E03C 0029DF3C 65702336 */ .word 0x36237065
/* 19E040 0029DF40 34302334 */ .word 0x34233034
/* 19E044 0029DF44 34382334 */ .word 0x34233834
/* 19E048 0029DF48 00000000 */ .word 0x00000000
/* 19E04C 0029DF4C 00000000 */ .word 0x00000000
