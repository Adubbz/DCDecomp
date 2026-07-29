.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetWind__5CWindFPf
/* 03B5C0 0013B4C0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 03B5C4 0013B4C4 0000BF7F */  sq          $31, 0x0($29)
/* 03B5C8 0013B4C8 28168070 */  paddub      $2, $4, $0
/* 03B5CC 0013B4CC 2826A070 */  paddub      $4, $5, $0
/* 03B5D0 0013B4D0 10004524 */  addiu       $5, $2, 0x10
/* 03B5D4 0013B4D4 20004CC4 */  lwc1        $f12, 0x20($2)
/* 03B5D8 0013B4D8 FA85040C */  jal         sceVu0ScaleVector
/* 03B5DC 0013B4DC 00000000 */   nop
/* 03B5E0 0013B4E0 0000BF7B */  lq          $31, 0x0($29)
/* 03B5E4 0013B4E4 1000BD27 */  addiu       $29, $29, 0x10
/* 03B5E8 0013B4E8 0800E003 */  jr          $31
/* 03B5EC 0013B4EC 00000000 */   nop
