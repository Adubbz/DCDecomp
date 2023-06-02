.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_SCENE_ROT__FP12RS_STACKDATAi
/* 8DAC0 0018D9C0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8DAC4 0018D9C4 2000BF7F */  sq         $31, 0x20($sp)
/* 8DAC8 0018D9C8 1000B17F */  sq         $17, 0x10($sp)
/* 8DACC 0018D9CC 0000B07F */  sq         $16, 0x0($sp)
/* 8DAD0 0018D9D0 08009124 */  addiu      $17, $4, 0x8
/* 8DAD4 0018D9D4 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8DAD8 0018D9D8 00000000 */   nop
/* 8DADC 0018D9DC 28264070 */  paddub     $4, $2, $0
/* 8DAE0 0018D9E0 6C2C060C */  jal        GetScene__Fi
/* 8DAE4 0018D9E4 00000000 */   nop
/* 8DAE8 0018D9E8 28864070 */  paddub     $16, $2, $0
/* 8DAEC 0018D9EC 04000016 */  bnez       $16, .L0018DA00
/* 8DAF0 0018D9F0 00000000 */   nop
/* 8DAF4 0018D9F4 28160070 */  paddub     $2, $0, $0
/* 8DAF8 0018D9F8 0C000010 */  b          .L0018DA2C
/* 8DAFC 0018D9FC 00000000 */   nop
.L0018DA00:
/* 8DB00 0018DA00 28262072 */  paddub     $4, $17, $0
/* 8DB04 0018DA04 3000A527 */  addiu      $5, $sp, 0x30
/* 8DB08 0018DA08 B42D060C */  jal        GetRotation__FP12RS_STACKDATAPf
/* 8DB0C 0018DA0C 00000000 */   nop
/* 8DB10 0018DA10 28260072 */  paddub     $4, $16, $0
/* 8DB14 0018DA14 3000A527 */  addiu      $5, $sp, 0x30
/* 8DB18 0018DA18 A000198E */  lw         $25, 0xA0($16)
/* 8DB1C 0018DA1C 3400398F */  lw         $25, 0x34($25)
/* 8DB20 0018DA20 09F82003 */  jalr       $25
/* 8DB24 0018DA24 00000000 */   nop
/* 8DB28 0018DA28 01000224 */  addiu      $2, $0, 0x1
.L0018DA2C:
/* 8DB2C 0018DA2C 2000BF7B */  lq         $31, 0x20($sp)
/* 8DB30 0018DA30 1000B17B */  lq         $17, 0x10($sp)
/* 8DB34 0018DA34 0000B07B */  lq         $16, 0x0($sp)
/* 8DB38 0018DA38 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8DB3C 0018DA3C 0800E003 */  jr         $31
/* 8DB40 0018DA40 00000000 */   nop
/* 8DB44 0018DA44 00000000 */  nop
/* 8DB48 0018DA48 00000000 */  nop
/* 8DB4C 0018DA4C 00000000 */  nop
