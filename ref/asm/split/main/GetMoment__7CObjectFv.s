.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetMoment__7CObjectFv
/* 057070 00156F70 50008224 */  addiu       $2, $4, 0x50
/* 057074 00156F74 0800E003 */  jr          $31
/* 057078 00156F78 00000000 */   nop
/* 05707C 00156F7C 00000000 */  nop
