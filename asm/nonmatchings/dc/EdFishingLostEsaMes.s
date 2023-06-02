.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdFishingLostEsaMes__Fv
/* 73B30 00173A30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73B34 00173A34 0000BF7F */  sq         $31, 0x0($sp)
/* 73B38 00173A38 848F80AF */  sw         $0, -0x707C($gp)
/* 73B3C 00173A3C 888F80AF */  sw         $0, -0x7078($gp)
/* 73B40 00173A40 D2000424 */  addiu      $4, $0, 0xD2
/* 73B44 00173A44 B4000524 */  addiu      $5, $0, 0xB4
/* 73B48 00173A48 08000624 */  addiu      $6, $0, 0x8
/* 73B4C 00173A4C 283E0070 */  paddub     $7, $0, $0
/* 73B50 00173A50 FFFF0824 */  addiu      $8, $0, -0x1
/* 73B54 00173A54 28CD050C */  jal        EdSetHelpMes__FiiiPii
/* 73B58 00173A58 00000000 */   nop
/* 73B5C 00173A5C 0000BF7B */  lq         $31, 0x0($sp)
/* 73B60 00173A60 1000BD27 */  addiu      $sp, $sp, 0x10
/* 73B64 00173A64 0800E003 */  jr         $31
/* 73B68 00173A68 00000000 */   nop
/* 73B6C 00173A6C 00000000 */  nop
