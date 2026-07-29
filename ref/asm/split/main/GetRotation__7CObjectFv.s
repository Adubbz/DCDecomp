.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRotation__7CObjectFv
/* 057080 00156F80 60008224 */  addiu       $2, $4, 0x60
/* 057084 00156F84 0800E003 */  jr          $31
/* 057088 00156F88 00000000 */   nop
/* 05708C 00156F8C 00000000 */  nop
