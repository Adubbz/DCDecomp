.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetEscapeDngFlag__Fv
/* 0F40B0 001F3FB0 64958287 */  lh          $2, -0x6A9C($28)
/* 0F40B4 001F3FB4 0800E003 */  jr          $31
/* 0F40B8 001F3FB8 00000000 */   nop
/* 0F40BC 001F3FBC 00000000 */  nop
