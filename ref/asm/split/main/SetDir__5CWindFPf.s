.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetDir__5CWindFPf
/* 03B580 0013B480 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03B584 0013B484 0000BF7F */  sq          $31, 0x0($29)
/* 03B588 0013B488 10008424 */  addiu       $4, $4, 0x10
/* 03B58C 0013B48C 9285040C */  jal         sceVu0Normalize
/* 03B590 0013B490 00000000 */   nop
/* 03B594 0013B494 0000BF7B */  lq          $31, 0x0($29)
/* 03B598 0013B498 1000BD27 */  addiu       $29, $29, 0x10
/* 03B59C 0013B49C 0800E003 */  jr          $31
/* 03B5A0 0013B4A0 00000000 */   nop
/* 03B5A4 0013B4A4 00000000 */  nop
/* 03B5A8 0013B4A8 00000000 */  nop
/* 03B5AC 0013B4AC 00000000 */  nop
