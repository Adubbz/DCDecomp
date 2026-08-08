.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .rodata
.align 3
glabel LIT_986__3
/* 19DF58 0029DE58 6B616765 */ .word 0x6567616B
/* 19DF5C 0029DE5C 7379616F */ .word 0x6F617973
/* 19DF60 0029DE60 00000000 */ .word 0x00000000
/* 19DF64 0029DE64 00000000 */ .word 0x00000000
