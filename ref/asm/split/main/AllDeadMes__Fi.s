.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel AllDeadMes__Fi
/* 060650 00160550 F0FFBD27 */  addiu       $29, $29, -0x10
/* 060654 00160554 0000BF7F */  sq          $31, 0x0($29)
/* 060658 00160558 282E8070 */  paddub      $5, $4, $0
/* 06065C 0016055C 3D000424 */  addiu       $4, $0, 0x3D
/* 060660 00160560 08000624 */  addiu       $6, $0, 0x8
/* 060664 00160564 01000724 */  addiu       $7, $0, 0x1
/* 060668 00160568 28460070 */  paddub      $8, $0, $0
/* 06066C 0016056C 284E0070 */  paddub      $9, $0, $0
/* 060670 00160570 9481050C */  jal         SetSystemMes__FiiiiPiPi
/* 060674 00160574 00000000 */   nop
/* 060678 00160578 0000BF7B */  lq          $31, 0x0($29)
/* 06067C 0016057C 1000BD27 */  addiu       $29, $29, 0x10
/* 060680 00160580 0800E003 */  jr          $31
/* 060684 00160584 00000000 */   nop
/* 060688 00160588 00000000 */  nop
/* 06068C 0016058C 00000000 */  nop
