.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _SET_SCENE_ROT__FP12RS_STACKDATAi
/* 08DAC0 0018D9C0 C0FFBD27 */  addiu       $29, $29, -0x40
/* 08DAC4 0018D9C4 2000BF7F */  sq          $31, 0x20($29)
/* 08DAC8 0018D9C8 1000B17F */  sq          $17, 0x10($29)
/* 08DACC 0018D9CC 0000B07F */  sq          $16, 0x0($29)
/* 08DAD0 0018D9D0 08009124 */  addiu       $17, $4, 0x8
/* 08DAD4 0018D9D4 D428060C */  jal         GetStackInt__FP12RS_STACKDATA
/* 08DAD8 0018D9D8 00000000 */   nop
/* 08DADC 0018D9DC 28264070 */  paddub      $4, $2, $0
/* 08DAE0 0018D9E0 6C2C060C */  jal         GetScene__Fi
/* 08DAE4 0018D9E4 00000000 */   nop
/* 08DAE8 0018D9E8 28864070 */  paddub      $16, $2, $0
/* 08DAEC 0018D9EC 04000016 */  bnez        $16, .L0018DA00
/* 08DAF0 0018D9F0 00000000 */   nop
/* 08DAF4 0018D9F4 28160070 */  paddub      $2, $0, $0
/* 08DAF8 0018D9F8 0C000010 */  b           .L0018DA2C
/* 08DAFC 0018D9FC 00000000 */   nop
.L0018DA00:
/* 08DB00 0018DA00 28262072 */  paddub      $4, $17, $0
/* 08DB04 0018DA04 3000A527 */  addiu       $5, $29, 0x30
/* 08DB08 0018DA08 B42D060C */  jal         GetRotation__FP12RS_STACKDATAPf
/* 08DB0C 0018DA0C 00000000 */   nop
/* 08DB10 0018DA10 28260072 */  paddub      $4, $16, $0
/* 08DB14 0018DA14 3000A527 */  addiu       $5, $29, 0x30
/* 08DB18 0018DA18 A000198E */  lw          $25, 0xA0($16)
/* 08DB1C 0018DA1C 3400398F */  lw          $25, 0x34($25)
/* 08DB20 0018DA20 09F82003 */  jalr        $25
/* 08DB24 0018DA24 00000000 */   nop
/* 08DB28 0018DA28 01000224 */  addiu       $2, $0, 0x1
.L0018DA2C:
/* 08DB2C 0018DA2C 2000BF7B */  lq          $31, 0x20($29)
/* 08DB30 0018DA30 1000B17B */  lq          $17, 0x10($29)
/* 08DB34 0018DA34 0000B07B */  lq          $16, 0x0($29)
/* 08DB38 0018DA38 4000BD27 */  addiu       $29, $29, 0x40
/* 08DB3C 0018DA3C 0800E003 */  jr          $31
/* 08DB40 0018DA40 00000000 */   nop
/* 08DB44 0018DA44 00000000 */  nop
/* 08DB48 0018DA48 00000000 */  nop
/* 08DB4C 0018DA4C 00000000 */  nop
