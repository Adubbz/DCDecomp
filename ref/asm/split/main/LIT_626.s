.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_626
/* 199320 00299220 6364726F */ .word 0x6F726463
/* 199324 00299224 6D303A5C */ .word 0x5C3A306D
/* 199328 00299228 4D4F4455 */ .word 0x55444F4D
/* 19932C 0029922C 4C45535C */ .word 0x5C53454C
/* 199330 00299230 494F5052 */ .word 0x52504F49
/* 199334 00299234 50323131 */ .word 0x31313250
/* 199338 00299238 2E494D47 */ .word 0x474D492E
/* 19933C 0029923C 3B310000 */ .word 0x0000313B
