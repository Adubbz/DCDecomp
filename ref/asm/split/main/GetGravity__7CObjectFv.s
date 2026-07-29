.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetGravity__7CObjectFv
/* 057060 00156F60 40008224 */  addiu       $2, $4, 0x40
/* 057064 00156F64 0800E003 */  jr          $31
/* 057068 00156F68 00000000 */   nop
/* 05706C 00156F6C 00000000 */  nop
