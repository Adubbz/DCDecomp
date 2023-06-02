.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_SCENE_POS__FP12RS_STACKDATAi
/* 8DA30 0018D930 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8DA34 0018D934 2000BF7F */  sq         $31, 0x20($sp)
/* 8DA38 0018D938 1000B17F */  sq         $17, 0x10($sp)
/* 8DA3C 0018D93C 0000B07F */  sq         $16, 0x0($sp)
/* 8DA40 0018D940 08009124 */  addiu      $17, $4, 0x8
/* 8DA44 0018D944 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8DA48 0018D948 00000000 */   nop
/* 8DA4C 0018D94C 28264070 */  paddub     $4, $2, $0
/* 8DA50 0018D950 6C2C060C */  jal        GetScene__Fi
/* 8DA54 0018D954 00000000 */   nop
/* 8DA58 0018D958 28864070 */  paddub     $16, $2, $0
/* 8DA5C 0018D95C 04000016 */  bnez       $16, .L0018D970
/* 8DA60 0018D960 00000000 */   nop
/* 8DA64 0018D964 28160070 */  paddub     $2, $0, $0
/* 8DA68 0018D968 0C000010 */  b          .L0018D99C
/* 8DA6C 0018D96C 00000000 */   nop
.L0018D970:
/* 8DA70 0018D970 28262072 */  paddub     $4, $17, $0
/* 8DA74 0018D974 3000A527 */  addiu      $5, $sp, 0x30
/* 8DA78 0018D978 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 8DA7C 0018D97C 00000000 */   nop
/* 8DA80 0018D980 28260072 */  paddub     $4, $16, $0
/* 8DA84 0018D984 3000A527 */  addiu      $5, $sp, 0x30
/* 8DA88 0018D988 A000198E */  lw         $25, 0xA0($16)
/* 8DA8C 0018D98C 1400398F */  lw         $25, 0x14($25)
/* 8DA90 0018D990 09F82003 */  jalr       $25
/* 8DA94 0018D994 00000000 */   nop
/* 8DA98 0018D998 01000224 */  addiu      $2, $0, 0x1
.L0018D99C:
/* 8DA9C 0018D99C 2000BF7B */  lq         $31, 0x20($sp)
/* 8DAA0 0018D9A0 1000B17B */  lq         $17, 0x10($sp)
/* 8DAA4 0018D9A4 0000B07B */  lq         $16, 0x0($sp)
/* 8DAA8 0018D9A8 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8DAAC 0018D9AC 0800E003 */  jr         $31
/* 8DAB0 0018D9B0 00000000 */   nop
/* 8DAB4 0018D9B4 00000000 */  nop
/* 8DAB8 0018D9B8 00000000 */  nop
/* 8DABC 0018D9BC 00000000 */  nop
