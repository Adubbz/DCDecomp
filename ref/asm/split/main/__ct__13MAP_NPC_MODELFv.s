.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__13MAP_NPC_MODELFv
/* 043600 00143500 E0FFBD27 */  addiu       $29, $29, -0x20
/* 043604 00143504 1000BF7F */  sq          $31, 0x10($29)
/* 043608 00143508 0000B07F */  sq          $16, 0x0($29)
/* 04360C 0014350C 28868070 */  paddub      $16, $4, $0
/* 043610 00143510 4C0D050C */  jal         __ct__10CCharacterFv
/* 043614 00143514 00000000 */   nop
/* 043618 00143518 28160072 */  paddub      $2, $16, $0
/* 04361C 0014351C 1000BF7B */  lq          $31, 0x10($29)
/* 043620 00143520 0000B07B */  lq          $16, 0x0($29)
/* 043624 00143524 2000BD27 */  addiu       $29, $29, 0x20
/* 043628 00143528 0800E003 */  jr          $31
/* 04362C 0014352C 00000000 */   nop
