.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel now_loading_off__Fv
/* 0540B0 00153FB0 01000324 */  addiu       $3, $0, 0x1
/* 0540B4 00153FB4 E48D83AF */  sw          $3, -0x721C($28)
/* 0540B8 00153FB8 0800E003 */  jr          $31
/* 0540BC 00153FBC 00000000 */   nop
