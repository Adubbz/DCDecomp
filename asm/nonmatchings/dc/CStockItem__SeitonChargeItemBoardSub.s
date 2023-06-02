.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonChargeItemBoardSub__10CStockItemFv
/* 13FC40 0023FB40 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 13FC44 0023FB44 6000BF7F */  sq         $31, 0x60($sp)
/* 13FC48 0023FB48 5000B57F */  sq         $21, 0x50($sp)
/* 13FC4C 0023FB4C 4000B47F */  sq         $20, 0x40($sp)
/* 13FC50 0023FB50 3000B37F */  sq         $19, 0x30($sp)
/* 13FC54 0023FB54 2000B27F */  sq         $18, 0x20($sp)
/* 13FC58 0023FB58 1000B17F */  sq         $17, 0x10($sp)
/* 13FC5C 0023FB5C 0000B07F */  sq         $16, 0x0($sp)
/* 13FC60 0023FB60 288E8070 */  paddub     $17, $4, $0
/* 13FC64 0023FB64 288A848F */  lw         $4, -0x75D8($gp)
/* 13FC68 0023FB68 28860070 */  paddub     $16, $0, $0
/* 13FC6C 0023FB6C 0C000010 */  b          .L0023FBA0
/* 13FC70 0023FB70 00000000 */   nop
.L0023FB74:
/* 13FC74 0023FB74 80180400 */  sll        $3, $4, 2
/* 13FC78 0023FB78 2900023C */  lui        $2, %hi(sort_table_3)
/* 13FC7C 0023FB7C F05F4224 */  addiu      $2, $2, %lo(sort_table_3)
/* 13FC80 0023FB80 21104300 */  addu       $2, $2, $3
/* 13FC84 0023FB84 000050AC */  sw         $16, 0x0($2)
/* 13FC88 0023FB88 01008424 */  addiu      $4, $4, 0x1
/* 13FC8C 0023FB8C 09008228 */  slti       $2, $4, 0x9
/* 13FC90 0023FB90 02004014 */  bnez       $2, .L0023FB9C
/* 13FC94 0023FB94 00000000 */   nop
/* 13FC98 0023FB98 28260070 */  paddub     $4, $0, $0
.L0023FB9C:
/* 13FC9C 0023FB9C 01001026 */  addiu      $16, $16, 0x1
.L0023FBA0:
/* 13FCA0 0023FBA0 0900022A */  slti       $2, $16, 0x9
/* 13FCA4 0023FBA4 F3FF4014 */  bnez       $2, .L0023FB74
/* 13FCA8 0023FBA8 00000000 */   nop
/* 13FCAC 0023FBAC 09000224 */  addiu      $2, $0, 0x9
/* 13FCB0 0023FBB0 2900013C */  lui        $at, (0x295FF0 >> 16)
/* 13FCB4 0023FBB4 F05F22AC */  sw         $2, (0x295FF0 & 0xFFFF)($at)
/* 13FCB8 0023FBB8 289E0070 */  paddub     $19, $0, $0
/* 13FCBC 0023FBBC 28860070 */  paddub     $16, $0, $0
/* 13FCC0 0023FBC0 1C000010 */  b          .L0023FC34
/* 13FCC4 0023FBC4 00000000 */   nop
.L0023FBC8:
/* 13FCC8 0023FBC8 01001226 */  addiu      $18, $16, 0x1
/* 13FCCC 0023FBCC 15000010 */  b          .L0023FC24
/* 13FCD0 0023FBD0 00000000 */   nop
.L0023FBD4:
/* 13FCD4 0023FBD4 40101000 */  sll        $2, $16, 1
/* 13FCD8 0023FBD8 21A82202 */  addu       $21, $17, $2
/* 13FCDC 0023FBDC 0000A486 */  lh         $4, 0x0($21)
/* 13FCE0 0023FBE0 40101200 */  sll        $2, $18, 1
/* 13FCE4 0023FBE4 21A02202 */  addu       $20, $17, $2
/* 13FCE8 0023FBE8 00008586 */  lh         $5, 0x0($20)
/* 13FCEC 0023FBEC 88FE080C */  jal        CompChargeItem__Fii
/* 13FCF0 0023FBF0 00000000 */   nop
/* 13FCF4 0023FBF4 0A004018 */  blez       $2, .L0023FC20
/* 13FCF8 0023FBF8 00000000 */   nop
/* 13FCFC 0023FBFC 2826A072 */  paddub     $4, $21, $0
/* 13FD00 0023FC00 282E8072 */  paddub     $5, $20, $0
/* 13FD04 0023FC04 38B9080C */  jal        MenuDataSwap__FPsPs
/* 13FD08 0023FC08 00000000 */   nop
/* 13FD0C 0023FC0C 7800A426 */  addiu      $4, $21, 0x78
/* 13FD10 0023FC10 78008526 */  addiu      $5, $20, 0x78
/* 13FD14 0023FC14 38B9080C */  jal        MenuDataSwap__FPsPs
/* 13FD18 0023FC18 00000000 */   nop
/* 13FD1C 0023FC1C 01001324 */  addiu      $19, $0, 0x1
.L0023FC20:
/* 13FD20 0023FC20 01005226 */  addiu      $18, $18, 0x1
.L0023FC24:
/* 13FD24 0023FC24 3C00422A */  slti       $2, $18, 0x3C
/* 13FD28 0023FC28 EAFF4014 */  bnez       $2, .L0023FBD4
/* 13FD2C 0023FC2C 00000000 */   nop
/* 13FD30 0023FC30 01001026 */  addiu      $16, $16, 0x1
.L0023FC34:
/* 13FD34 0023FC34 3B00022A */  slti       $2, $16, 0x3B
/* 13FD38 0023FC38 E3FF4014 */  bnez       $2, .L0023FBC8
/* 13FD3C 0023FC3C 00000000 */   nop
/* 13FD40 0023FC40 28166072 */  paddub     $2, $19, $0
/* 13FD44 0023FC44 6000BF7B */  lq         $31, 0x60($sp)
/* 13FD48 0023FC48 5000B57B */  lq         $21, 0x50($sp)
/* 13FD4C 0023FC4C 4000B47B */  lq         $20, 0x40($sp)
/* 13FD50 0023FC50 3000B37B */  lq         $19, 0x30($sp)
/* 13FD54 0023FC54 2000B27B */  lq         $18, 0x20($sp)
/* 13FD58 0023FC58 1000B17B */  lq         $17, 0x10($sp)
/* 13FD5C 0023FC5C 0000B07B */  lq         $16, 0x0($sp)
/* 13FD60 0023FC60 7000BD27 */  addiu      $sp, $sp, 0x70
/* 13FD64 0023FC64 0800E003 */  jr         $31
/* 13FD68 0023FC68 00000000 */   nop
/* 13FD6C 0023FC6C 00000000 */  nop
