.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceGifPkOpenGifTag
/* 020A68 00120968 0000828C */  lw          $2, 0x0($4)
/* 020A6C 0012096C 10004324 */  addiu       $3, $2, 0x10
/* 020A70 00120970 0000457C */  sq          $5, 0x0($2)
/* 020A74 00120974 000083AC */  sw          $3, 0x0($4)
/* 020A78 00120978 0800E003 */  jr          $31
/* 020A7C 0012097C 0C0082AC */   sw         $2, 0xC($4)
