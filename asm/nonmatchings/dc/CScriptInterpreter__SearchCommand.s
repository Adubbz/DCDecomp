.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SearchCommand__18CScriptInterpreterFPi
/* 5FC80 0015FB80 B0FEBD27 */  addiu      $sp, $sp, -0x150
/* 5FC84 0015FB84 4000BF7F */  sq         $31, 0x40($sp)
/* 5FC88 0015FB88 3000B37F */  sq         $19, 0x30($sp)
/* 5FC8C 0015FB8C 2000B27F */  sq         $18, 0x20($sp)
/* 5FC90 0015FB90 1000B17F */  sq         $17, 0x10($sp)
/* 5FC94 0015FB94 0000B07F */  sq         $16, 0x0($sp)
/* 5FC98 0015FB98 289E8070 */  paddub     $19, $4, $0
/* 5FC9C 0015FB9C 2896A070 */  paddub     $18, $5, $0
/* 5FCA0 0015FBA0 4C7F050C */  jal        SkipSpace__FR9input_str_3
/* 5FCA4 0015FBA4 00000000 */   nop
/* 5FCA8 0015FBA8 04004014 */  bnez       $2, .L0015FBBC
/* 5FCAC 0015FBAC 00000000 */   nop
/* 5FCB0 0015FBB0 28160070 */  paddub     $2, $0, $0
/* 5FCB4 0015FBB4 53000010 */  b          .L0015FD04
/* 5FCB8 0015FBB8 00000000 */   nop
.L0015FBBC:
/* 5FCBC 0015FBBC 28860070 */  paddub     $16, $0, $0
.L0015FBC0:
/* 5FCC0 0015FBC0 0000628E */  lw         $2, 0x0($19)
/* 5FCC4 0015FBC4 0800638E */  lw         $3, 0x8($19)
/* 5FCC8 0015FBC8 21104300 */  addu       $2, $2, $3
/* 5FCCC 0015FBCC 00005190 */  lbu        $17, 0x0($2)
/* 5FCD0 0015FBD0 01006224 */  addiu      $2, $3, 0x1
/* 5FCD4 0015FBD4 080062AE */  sw         $2, 0x8($19)
/* 5FCD8 0015FBD8 0400638E */  lw         $3, 0x4($19)
/* 5FCDC 0015FBDC 0800628E */  lw         $2, 0x8($19)
/* 5FCE0 0015FBE0 2A086200 */  slt        $at, $3, $2
/* 5FCE4 0015FBE4 01000224 */  addiu      $2, $0, 0x1
/* 5FCE8 0015FBE8 0B100100 */  movn       $2, $0, $at
/* 5FCEC 0015FBEC 01000010 */  b          .L0015FBF4
/* 5FCF0 0015FBF0 00000000 */   nop
.L0015FBF4:
/* 5FCF4 0015FBF4 04004014 */  bnez       $2, .L0015FC08
/* 5FCF8 0015FBF8 00000000 */   nop
/* 5FCFC 0015FBFC 28160070 */  paddub     $2, $0, $0
/* 5FD00 0015FC00 40000010 */  b          .L0015FD04
/* 5FD04 0015FC04 00000000 */   nop
.L0015FC08:
/* 5FD08 0015FC08 3C261100 */  dsll32     $4, $17, 24
/* 5FD0C 0015FC0C 3F260400 */  dsra32     $4, $4, 24
/* 5FD10 0015FC10 747F050C */  jal        CheckChar__Fc_3
/* 5FD14 0015FC14 00000000 */   nop
/* 5FD18 0015FC18 06004010 */  beqz       $2, .L0015FC34
/* 5FD1C 0015FC1C 00000000 */   nop
/* 5FD20 0015FC20 21101D02 */  addu       $2, $16, $sp
/* 5FD24 0015FC24 500051A0 */  sb         $17, 0x50($2)
/* 5FD28 0015FC28 01001026 */  addiu      $16, $16, 0x1
/* 5FD2C 0015FC2C E4FF0010 */  b          .L0015FBC0
/* 5FD30 0015FC30 00000000 */   nop
.L0015FC34:
/* 5FD34 0015FC34 21101D02 */  addu       $2, $16, $sp
/* 5FD38 0015FC38 500040A0 */  sb         $0, 0x50($2)
/* 5FD3C 0015FC3C 5000A383 */  lb         $3, 0x50($sp)
/* 5FD40 0015FC40 41006228 */  slti       $2, $3, 0x41
/* 5FD44 0015FC44 04004014 */  bnez       $2, .L0015FC58
/* 5FD48 0015FC48 00000000 */   nop
/* 5FD4C 0015FC4C 5B006128 */  slti       $at, $3, 0x5B
/* 5FD50 0015FC50 06002014 */  bnez       $at, .L0015FC6C
/* 5FD54 0015FC54 00000000 */   nop
.L0015FC58:
/* 5FD58 0015FC58 FFFF0224 */  addiu      $2, $0, -0x1
/* 5FD5C 0015FC5C 000042AE */  sw         $2, 0x0($18)
/* 5FD60 0015FC60 01000224 */  addiu      $2, $0, 0x1
/* 5FD64 0015FC64 27000010 */  b          .L0015FD04
/* 5FD68 0015FC68 00000000 */   nop
.L0015FC6C:
/* 5FD6C 0015FC6C 28860070 */  paddub     $16, $0, $0
/* 5FD70 0015FC70 13000010 */  b          .L0015FCC0
/* 5FD74 0015FC74 00000000 */   nop
.L0015FC78:
/* 5FD78 0015FC78 80101000 */  sll        $2, $16, 2
/* 5FD7C 0015FC7C 21185000 */  addu       $3, $2, $16
/* 5FD80 0015FC80 80100300 */  sll        $2, $3, 2
/* 5FD84 0015FC84 21106200 */  addu       $2, $3, $2
/* 5FD88 0015FC88 80180200 */  sll        $3, $2, 2
/* 5FD8C 0015FC8C 1804628E */  lw         $2, 0x418($19)
/* 5FD90 0015FC90 21104300 */  addu       $2, $2, $3
/* 5FD94 0015FC94 0000448C */  lw         $4, 0x0($2)
/* 5FD98 0015FC98 5000A527 */  addiu      $5, $sp, 0x50
/* 5FD9C 0015FC9C 0815040C */  jal        strcmp
/* 5FDA0 0015FCA0 00000000 */   nop
/* 5FDA4 0015FCA4 05004014 */  bnez       $2, .L0015FCBC
/* 5FDA8 0015FCA8 00000000 */   nop
/* 5FDAC 0015FCAC 000050AE */  sw         $16, 0x0($18)
/* 5FDB0 0015FCB0 01000224 */  addiu      $2, $0, 0x1
/* 5FDB4 0015FCB4 13000010 */  b          .L0015FD04
/* 5FDB8 0015FCB8 00000000 */   nop
.L0015FCBC:
/* 5FDBC 0015FCBC 01001026 */  addiu      $16, $16, 0x1
.L0015FCC0:
/* 5FDC0 0015FCC0 1400628E */  lw         $2, 0x14($19)
/* 5FDC4 0015FCC4 2A100202 */  slt        $2, $16, $2
/* 5FDC8 0015FCC8 EBFF4014 */  bnez       $2, .L0015FC78
/* 5FDCC 0015FCCC 00000000 */   nop
/* 5FDD0 0015FCD0 5000A427 */  addiu      $4, $sp, 0x50
/* 5FDD4 0015FCD4 2A00023C */  lui        $2, %hi(_403)
/* 5FDD8 0015FCD8 50A04524 */  addiu      $5, $2, %lo(_403)
/* 5FDDC 0015FCDC 0815040C */  jal        strcmp
/* 5FDE0 0015FCE0 00000000 */   nop
/* 5FDE4 0015FCE4 04004014 */  bnez       $2, .L0015FCF8
/* 5FDE8 0015FCE8 00000000 */   nop
/* 5FDEC 0015FCEC 28160070 */  paddub     $2, $0, $0
/* 5FDF0 0015FCF0 04000010 */  b          .L0015FD04
/* 5FDF4 0015FCF4 00000000 */   nop
.L0015FCF8:
/* 5FDF8 0015FCF8 FFFF0224 */  addiu      $2, $0, -0x1
/* 5FDFC 0015FCFC 000042AE */  sw         $2, 0x0($18)
/* 5FE00 0015FD00 01000224 */  addiu      $2, $0, 0x1
.L0015FD04:
/* 5FE04 0015FD04 4000BF7B */  lq         $31, 0x40($sp)
/* 5FE08 0015FD08 3000B37B */  lq         $19, 0x30($sp)
/* 5FE0C 0015FD0C 2000B27B */  lq         $18, 0x20($sp)
/* 5FE10 0015FD10 1000B17B */  lq         $17, 0x10($sp)
/* 5FE14 0015FD14 0000B07B */  lq         $16, 0x0($sp)
/* 5FE18 0015FD18 5001BD27 */  addiu      $sp, $sp, 0x150
/* 5FE1C 0015FD1C 0800E003 */  jr         $31
/* 5FE20 0015FD20 00000000 */   nop
/* 5FE24 0015FD24 00000000 */  nop
/* 5FE28 0015FD28 00000000 */  nop
/* 5FE2C 0015FD2C 00000000 */  nop
