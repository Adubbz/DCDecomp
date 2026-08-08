.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_633
/* 199400 00299300 6364726F */ .word 0x6F726463
/* 199404 00299304 6D303A5C */ .word 0x5C3A306D
/* 199408 00299308 4D4F4455 */ .word 0x55444F4D
/* 19940C 0029930C 4C45535C */ .word 0x5C53454C
/* 199410 00299310 4D4F444D */ .word 0x4D444F4D
/* 199414 00299314 4944492E */ .word 0x2E494449
/* 199418 00299318 4952583B */ .word 0x3B585249
/* 19941C 0029931C 31000000 */ .word 0x00000031
