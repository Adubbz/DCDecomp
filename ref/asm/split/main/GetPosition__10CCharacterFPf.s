.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetPosition__10CCharacterFPf
/* 0391B0 001390B0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 0391B4 001390B4 0000BF7F */  sq          $31, 0x0($29)
/* 0391B8 001390B8 28168070 */  paddub      $2, $4, $0
/* 0391BC 001390BC 2826A070 */  paddub      $4, $5, $0
/* 0391C0 001390C0 10004524 */  addiu       $5, $2, 0x10
/* 0391C4 001390C4 0C86040C */  jal         sceVu0CopyVector
/* 0391C8 001390C8 00000000 */   nop
/* 0391CC 001390CC 0000BF7B */  lq          $31, 0x0($29)
/* 0391D0 001390D0 1000BD27 */  addiu       $29, $29, 0x10
/* 0391D4 001390D4 0800E003 */  jr          $31
/* 0391D8 001390D8 00000000 */   nop
/* 0391DC 001390DC 00000000 */  nop
