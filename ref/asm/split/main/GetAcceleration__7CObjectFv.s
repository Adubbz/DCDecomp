.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetAcceleration__7CObjectFv
/* 057050 00156F50 30008224 */  addiu       $2, $4, 0x30
/* 057054 00156F54 0800E003 */  jr          $31
/* 057058 00156F58 00000000 */   nop
/* 05705C 00156F5C 00000000 */  nop
