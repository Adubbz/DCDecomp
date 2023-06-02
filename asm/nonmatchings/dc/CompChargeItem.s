.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CompChargeItem__Fii
/* 13FB20 0023FA20 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 13FB24 0023FA24 3000BF7F */  sq         $31, 0x30($sp)
/* 13FB28 0023FA28 2000B27F */  sq         $18, 0x20($sp)
/* 13FB2C 0023FA2C 1000B17F */  sq         $17, 0x10($sp)
/* 13FB30 0023FA30 0000B07F */  sq         $16, 0x0($sp)
/* 13FB34 0023FA34 288E8070 */  paddub     $17, $4, $0
/* 13FB38 0023FA38 2886A070 */  paddub     $16, $5, $0
/* 13FB3C 0023FA3C A043070C */  jal        GetItemData__Fi
/* 13FB40 0023FA40 00000000 */   nop
/* 13FB44 0023FA44 28964070 */  paddub     $18, $2, $0
/* 13FB48 0023FA48 28260072 */  paddub     $4, $16, $0
/* 13FB4C 0023FA4C A043070C */  jal        GetItemData__Fi
/* 13FB50 0023FA50 00000000 */   nop
/* 13FB54 0023FA54 28260070 */  paddub     $4, $0, $0
/* 13FB58 0023FA58 282E0070 */  paddub     $5, $0, $0
/* 13FB5C 0023FA5C 08004012 */  beqz       $18, .L0023FA80
/* 13FB60 0023FA60 00000000 */   nop
/* 13FB64 0023FA64 00004386 */  lh         $3, 0x0($18)
/* 13FB68 0023FA68 80200300 */  sll        $4, $3, 2
/* 13FB6C 0023FA6C 2900033C */  lui        $3, %hi(sort_table_3)
/* 13FB70 0023FA70 F05F6324 */  addiu      $3, $3, %lo(sort_table_3)
/* 13FB74 0023FA74 21186400 */  addu       $3, $3, $4
/* 13FB78 0023FA78 0000648C */  lw         $4, 0x0($3)
/* 13FB7C 0023FA7C 00000000 */  nop
.L0023FA80:
/* 13FB80 0023FA80 08004010 */  beqz       $2, .L0023FAA4
/* 13FB84 0023FA84 00000000 */   nop
/* 13FB88 0023FA88 00004284 */  lh         $2, 0x0($2)
/* 13FB8C 0023FA8C 80180200 */  sll        $3, $2, 2
/* 13FB90 0023FA90 2900023C */  lui        $2, %hi(sort_table_3)
/* 13FB94 0023FA94 F05F4224 */  addiu      $2, $2, %lo(sort_table_3)
/* 13FB98 0023FA98 21104300 */  addu       $2, $2, $3
/* 13FB9C 0023FA9C 0000458C */  lw         $5, 0x0($2)
/* 13FBA0 0023FAA0 00000000 */  nop
.L0023FAA4:
/* 13FBA4 0023FAA4 8400212A */  slti       $at, $17, 0x84
/* 13FBA8 0023FAA8 02002010 */  beqz       $at, .L0023FAB4
/* 13FBAC 0023FAAC 00000000 */   nop
/* 13FBB0 0023FAB0 09000424 */  addiu      $4, $0, 0x9
.L0023FAB4:
/* 13FBB4 0023FAB4 8400012A */  slti       $at, $16, 0x84
/* 13FBB8 0023FAB8 02002010 */  beqz       $at, .L0023FAC4
/* 13FBBC 0023FABC 00000000 */   nop
/* 13FBC0 0023FAC0 09000524 */  addiu      $5, $0, 0x9
.L0023FAC4:
/* 13FBC4 0023FAC4 2A08A400 */  slt        $at, $5, $4
/* 13FBC8 0023FAC8 04002010 */  beqz       $at, .L0023FADC
/* 13FBCC 0023FACC 00000000 */   nop
/* 13FBD0 0023FAD0 01000224 */  addiu      $2, $0, 0x1
/* 13FBD4 0023FAD4 12000010 */  b          .L0023FB20
/* 13FBD8 0023FAD8 00000000 */   nop
.L0023FADC:
/* 13FBDC 0023FADC 2A088500 */  slt        $at, $4, $5
/* 13FBE0 0023FAE0 04002010 */  beqz       $at, .L0023FAF4
/* 13FBE4 0023FAE4 00000000 */   nop
/* 13FBE8 0023FAE8 FFFF0224 */  addiu      $2, $0, -0x1
/* 13FBEC 0023FAEC 0C000010 */  b          .L0023FB20
/* 13FBF0 0023FAF0 00000000 */   nop
.L0023FAF4:
/* 13FBF4 0023FAF4 2A081102 */  slt        $at, $16, $17
/* 13FBF8 0023FAF8 04002010 */  beqz       $at, .L0023FB0C
/* 13FBFC 0023FAFC 00000000 */   nop
/* 13FC00 0023FB00 01000224 */  addiu      $2, $0, 0x1
/* 13FC04 0023FB04 06000010 */  b          .L0023FB20
/* 13FC08 0023FB08 00000000 */   nop
.L0023FB0C:
/* 13FC0C 0023FB0C 2A083002 */  slt        $at, $17, $16
/* 13FC10 0023FB10 FFFF0224 */  addiu      $2, $0, -0x1
/* 13FC14 0023FB14 0A100100 */  movz       $2, $0, $at
/* 13FC18 0023FB18 01000010 */  b          .L0023FB20
/* 13FC1C 0023FB1C 00000000 */   nop
.L0023FB20:
/* 13FC20 0023FB20 3000BF7B */  lq         $31, 0x30($sp)
/* 13FC24 0023FB24 2000B27B */  lq         $18, 0x20($sp)
/* 13FC28 0023FB28 1000B17B */  lq         $17, 0x10($sp)
/* 13FC2C 0023FB2C 0000B07B */  lq         $16, 0x0($sp)
/* 13FC30 0023FB30 4000BD27 */  addiu      $sp, $sp, 0x40
/* 13FC34 0023FB34 0800E003 */  jr         $31
/* 13FC38 0023FB38 00000000 */   nop
/* 13FC3C 0023FB3C 00000000 */  nop
