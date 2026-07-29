.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Se__7CSpriteFv
/* 028FB0 01DD4CB0 6400828C */  lw          $2, 0x64($4)
/* 028FB4 01DD4CB4 0800E003 */  jr          $31
/* 028FB8 01DD4CB8 00000000 */   nop
/* 028FBC 01DD4CBC 00000000 */  nop
