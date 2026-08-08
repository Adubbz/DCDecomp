.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 4
glabel LIT_629
/* 199380 00299280 6364726F */ .word 0x6F726463
/* 199384 00299284 6D303A5C */ .word 0x5C3A306D
/* 199388 00299288 4D4F4455 */ .word 0x55444F4D
/* 19938C 0029928C 4C45535C */ .word 0x5C53454C
/* 199390 00299290 4D434D41 */ .word 0x414D434D
/* 199394 00299294 4E2E4952 */ .word 0x52492E4E
/* 199398 00299298 583B3100 */ .word GlobalDataBuffer + 0x68AD8
/* 19939C 0029929C 00000000 */ .word 0x00000000
