.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _NPC_PLIGHT_INIT__FP12RS_STACKDATAi
/* 08F870 0018F770 F0FFBD27 */  addiu       $29, $29, -0x10
/* 08F874 0018F774 0000BF7F */  sq          $31, 0x0($29)
/* 08F878 0018F778 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08F87C 0018F77C 00000000 */   nop
/* 08F880 0018F780 28264070 */  paddub      $4, $2, $0
/* 08F884 0018F784 842C060C */  jal         GetChara__Fi
/* 08F888 0018F788 00000000 */   nop
/* 08F88C 0018F78C 04004014 */  bnez        $2, .L0018F7A0
/* 08F890 0018F790 00000000 */   nop
/* 08F894 0018F794 28160070 */  paddub      $2, $0, $0
/* 08F898 0018F798 05000010 */  b           .L0018F7B0
/* 08F89C 0018F79C 00000000 */   nop
.L0018F7A0:
/* 08F8A0 0018F7A0 28264070 */  paddub      $4, $2, $0
/* 08F8A4 0018F7A4 A8DF040C */  jal         ClearPointLight__10CCharacterFv
/* 08F8A8 0018F7A8 00000000 */   nop
/* 08F8AC 0018F7AC 01000224 */  addiu       $2, $0, 0x1
.L0018F7B0:
/* 08F8B0 0018F7B0 0000BF7B */  lq          $31, 0x0($29)
/* 08F8B4 0018F7B4 1000BD27 */  addiu       $29, $29, 0x10
/* 08F8B8 0018F7B8 0800E003 */  jr          $31
/* 08F8BC 0018F7BC 00000000 */   nop
