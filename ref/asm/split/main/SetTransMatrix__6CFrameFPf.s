.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetTransMatrix__6CFrameFPf
/* 0286A0 001285A0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0286A4 001285A4 0000BF7F */  sq          $31, 0x0($29)
/* 0286A8 001285A8 28368070 */  paddub      $6, $4, $0
/* 0286AC 001285AC 400280AC */  sw          $0, 0x240($4)
/* 0286B0 001285B0 00028478 */  lq          $4, 0x200($4)
/* 0286B4 001285B4 1000A327 */  addiu       $3, $29, 0x10
/* 0286B8 001285B8 0000647C */  sq          $4, 0x0($3)
/* 0286BC 001285BC 2826A070 */  paddub      $4, $5, $0
/* 0286C0 001285C0 D001C524 */  addiu       $5, $6, 0x1D0
/* 0286C4 001285C4 FC9E040C */  jal         QuatToMat__FPfPA4_f
/* 0286C8 001285C8 00000000 */   nop
/* 0286CC 001285CC 1000A327 */  addiu       $3, $29, 0x10
/* 0286D0 001285D0 00006378 */  lq          $3, 0x0($3)
/* 0286D4 001285D4 0002C37C */  sq          $3, 0x200($6)
/* 0286D8 001285D8 0000BF7B */  lq          $31, 0x0($29)
/* 0286DC 001285DC 2000BD27 */  addiu       $29, $29, 0x20
/* 0286E0 001285E0 0800E003 */  jr          $31
/* 0286E4 001285E4 00000000 */   nop
/* 0286E8 001285E8 00000000 */  nop
/* 0286EC 001285EC 00000000 */  nop
