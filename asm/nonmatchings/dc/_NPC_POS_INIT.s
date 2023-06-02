.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NPC_POS_INIT__FP12RS_STACKDATAi
/* 8EA20 0018E920 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 8EA24 0018E924 4000BF7F */  sq         $31, 0x40($sp)
/* 8EA28 0018E928 3000B37F */  sq         $19, 0x30($sp)
/* 8EA2C 0018E92C 2000B27F */  sq         $18, 0x20($sp)
/* 8EA30 0018E930 1000B17F */  sq         $17, 0x10($sp)
/* 8EA34 0018E934 0000B07F */  sq         $16, 0x0($sp)
/* 8EA38 0018E938 288E8070 */  paddub     $17, $4, $0
/* 8EA3C 0018E93C 2886A070 */  paddub     $16, $5, $0
/* 8EA40 0018E940 2700023C */  lui        $2, %hi(_1188)
/* 8EA44 0018E944 A09B4224 */  addiu      $2, $2, %lo(_1188)
/* 8EA48 0018E948 5000A327 */  addiu      $3, $sp, 0x50
/* 8EA4C 0018E94C 00004278 */  lq         $2, 0x0($2)
/* 8EA50 0018E950 0000627C */  sq         $2, 0x0($3)
/* 8EA54 0018E954 28960070 */  paddub     $18, $0, $0
/* 8EA58 0018E958 18000010 */  b          .L0018E9BC
/* 8EA5C 0018E95C 00000000 */   nop
.L0018E960:
/* 8EA60 0018E960 28262072 */  paddub     $4, $17, $0
/* 8EA64 0018E964 08009124 */  addiu      $17, $4, 0x8
/* 8EA68 0018E968 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8EA6C 0018E96C 00000000 */   nop
/* 8EA70 0018E970 28264070 */  paddub     $4, $2, $0
/* 8EA74 0018E974 842C060C */  jal        GetChara__Fi
/* 8EA78 0018E978 00000000 */   nop
/* 8EA7C 0018E97C 289E4070 */  paddub     $19, $2, $0
/* 8EA80 0018E980 0D006012 */  beqz       $19, .L0018E9B8
/* 8EA84 0018E984 00000000 */   nop
/* 8EA88 0018E988 28266072 */  paddub     $4, $19, $0
/* 8EA8C 0018E98C 5000A527 */  addiu      $5, $sp, 0x50
/* 8EA90 0018E990 A000798E */  lw         $25, 0xA0($19)
/* 8EA94 0018E994 1400398F */  lw         $25, 0x14($25)
/* 8EA98 0018E998 09F82003 */  jalr       $25
/* 8EA9C 0018E99C 00000000 */   nop
/* 8EAA0 0018E9A0 28266072 */  paddub     $4, $19, $0
/* 8EAA4 0018E9A4 5000A527 */  addiu      $5, $sp, 0x50
/* 8EAA8 0018E9A8 A000798E */  lw         $25, 0xA0($19)
/* 8EAAC 0018E9AC 3400398F */  lw         $25, 0x34($25)
/* 8EAB0 0018E9B0 09F82003 */  jalr       $25
/* 8EAB4 0018E9B4 00000000 */   nop
.L0018E9B8:
/* 8EAB8 0018E9B8 01005226 */  addiu      $18, $18, 0x1
.L0018E9BC:
/* 8EABC 0018E9BC 2A105002 */  slt        $2, $18, $16
/* 8EAC0 0018E9C0 E7FF4014 */  bnez       $2, .L0018E960
/* 8EAC4 0018E9C4 00000000 */   nop
/* 8EAC8 0018E9C8 01000224 */  addiu      $2, $0, 0x1
/* 8EACC 0018E9CC 4000BF7B */  lq         $31, 0x40($sp)
/* 8EAD0 0018E9D0 3000B37B */  lq         $19, 0x30($sp)
/* 8EAD4 0018E9D4 2000B27B */  lq         $18, 0x20($sp)
/* 8EAD8 0018E9D8 1000B17B */  lq         $17, 0x10($sp)
/* 8EADC 0018E9DC 0000B07B */  lq         $16, 0x0($sp)
/* 8EAE0 0018E9E0 6000BD27 */  addiu      $sp, $sp, 0x60
/* 8EAE4 0018E9E4 0800E003 */  jr         $31
/* 8EAE8 0018E9E8 00000000 */   nop
/* 8EAEC 0018E9EC 00000000 */  nop
