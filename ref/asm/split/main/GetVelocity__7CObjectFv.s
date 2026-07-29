.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetVelocity__7CObjectFv
/* 057040 00156F40 20008224 */  addiu       $2, $4, 0x20
/* 057044 00156F44 0800E003 */  jr          $31
/* 057048 00156F48 00000000 */   nop
/* 05704C 00156F4C 00000000 */  nop
