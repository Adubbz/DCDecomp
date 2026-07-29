.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetRotVelocity__7CObjectFv
/* 057090 00156F90 70008224 */  addiu       $2, $4, 0x70
/* 057094 00156F94 0800E003 */  jr          $31
/* 057098 00156F98 00000000 */   nop
/* 05709C 00156F9C 00000000 */  nop
