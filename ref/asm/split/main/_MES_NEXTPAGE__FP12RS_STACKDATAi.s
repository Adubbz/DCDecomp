.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _MES_NEXTPAGE__FP12RS_STACKDATAi
/* 08FCC0 0018FBC0 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08FCC4 0018FBC4 0000BF7F */  sq          $31, 0x0($29)
/* 08FCC8 0018FBC8 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08FCCC 0018FBCC 00000000 */   nop
/* 08FCD0 0018FBD0 28264070 */  paddub      $4, $2, $0
/* 08FCD4 0018FBD4 643E060C */  jal         GetMes__Fi
/* 08FCD8 0018FBD8 00000000 */   nop
/* 08FCDC 0018FBDC 04004014 */  bnez        $2, .L0018FBF0
/* 08FCE0 0018FBE0 00000000 */   nop
/* 08FCE4 0018FBE4 28160070 */  paddub      $2, $0, $0
/* 08FCE8 0018FBE8 05000010 */  b           .L0018FC00
/* 08FCEC 0018FBEC 00000000 */   nop
.L0018FBF0:
/* 08FCF0 0018FBF0 28264070 */  paddub      $4, $2, $0
/* 08FCF4 0018FBF4 5C38050C */  jal         GoNextPage__6ClsMesFv
/* 08FCF8 0018FBF8 00000000 */   nop
/* 08FCFC 0018FBFC 01000224 */  addiu       $2, $0, 0x1
.L0018FC00:
/* 08FD00 0018FC00 0000BF7B */  lq          $31, 0x0($29)
/* 08FD04 0018FC04 1000BD27 */  addiu       $29, $29, 0x10
/* 08FD08 0018FC08 0800E003 */  jr          $31
/* 08FD0C 0018FC0C 00000000 */   nop
