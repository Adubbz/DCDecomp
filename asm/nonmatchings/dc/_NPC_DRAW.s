.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _NPC_DRAW__FP12RS_STACKDATAi
/* 8EE90 0018ED90 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* 8EE94 0018ED94 4000BF7F */  sq         $31, 0x40($sp)
/* 8EE98 0018ED98 3000B37F */  sq         $19, 0x30($sp)
/* 8EE9C 0018ED9C 2000B27F */  sq         $18, 0x20($sp)
/* 8EEA0 0018EDA0 1000B17F */  sq         $17, 0x10($sp)
/* 8EEA4 0018EDA4 0000B07F */  sq         $16, 0x0($sp)
/* 8EEA8 0018EDA8 2896A070 */  paddub     $18, $5, $0
/* 8EEAC 0018EDAC 08009324 */  addiu      $19, $4, 0x8
/* 8EEB0 0018EDB0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8EEB4 0018EDB4 00000000 */   nop
/* 8EEB8 0018EDB8 28864070 */  paddub     $16, $2, $0
/* 8EEBC 0018EDBC 288E0070 */  paddub     $17, $0, $0
/* 8EEC0 0018EDC0 19000010 */  b          .L0018EE28
/* 8EEC4 0018EDC4 00000000 */   nop
.L0018EDC8:
/* 8EEC8 0018EDC8 28266072 */  paddub     $4, $19, $0
/* 8EECC 0018EDCC 08009324 */  addiu      $19, $4, 0x8
/* 8EED0 0018EDD0 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8EED4 0018EDD4 00000000 */   nop
/* 8EED8 0018EDD8 28264070 */  paddub     $4, $2, $0
/* 8EEDC 0018EDDC 842C060C */  jal        GetChara__Fi
/* 8EEE0 0018EDE0 00000000 */   nop
/* 8EEE4 0018EDE4 0F004010 */  beqz       $2, .L0018EE24
/* 8EEE8 0018EDE8 00000000 */   nop
/* 8EEEC 0018EDEC 03008104 */  bgez       $4, .L0018EDFC
/* 8EEF0 0018EDF0 00000000 */   nop
/* 8EEF4 0018EDF4 D401013C */  lui        $at, (0x1D40000 >> 16)
/* 8EEF8 0018EDF8 30D230AC */  sw         $16, -0x2DD0($at)
.L0018EDFC:
/* 8EEFC 0018EDFC 09008004 */  bltz       $4, .L0018EE24
/* 8EF00 0018EE00 00000000 */   nop
/* 8EF04 0018EE04 10008128 */  slti       $at, $4, 0x10
/* 8EF08 0018EE08 06002010 */  beqz       $at, .L0018EE24
/* 8EF0C 0018EE0C 00000000 */   nop
/* 8EF10 0018EE10 80180400 */  sll        $3, $4, 2
/* 8EF14 0018EE14 D401023C */  lui        $2, %hi(D_1D3D284)
/* 8EF18 0018EE18 84D24224 */  addiu      $2, $2, %lo(D_1D3D284)
/* 8EF1C 0018EE1C 21104300 */  addu       $2, $2, $3
/* 8EF20 0018EE20 000050AC */  sw         $16, 0x0($2)
.L0018EE24:
/* 8EF24 0018EE24 01003126 */  addiu      $17, $17, 0x1
.L0018EE28:
/* 8EF28 0018EE28 FFFF4226 */  addiu      $2, $18, -0x1
/* 8EF2C 0018EE2C 2A102202 */  slt        $2, $17, $2
/* 8EF30 0018EE30 E5FF4014 */  bnez       $2, .L0018EDC8
/* 8EF34 0018EE34 00000000 */   nop
/* 8EF38 0018EE38 01000224 */  addiu      $2, $0, 0x1
/* 8EF3C 0018EE3C 4000BF7B */  lq         $31, 0x40($sp)
/* 8EF40 0018EE40 3000B37B */  lq         $19, 0x30($sp)
/* 8EF44 0018EE44 2000B27B */  lq         $18, 0x20($sp)
/* 8EF48 0018EE48 1000B17B */  lq         $17, 0x10($sp)
/* 8EF4C 0018EE4C 0000B07B */  lq         $16, 0x0($sp)
/* 8EF50 0018EE50 5000BD27 */  addiu      $sp, $sp, 0x50
/* 8EF54 0018EE54 0800E003 */  jr         $31
/* 8EF58 0018EE58 00000000 */   nop
/* 8EF5C 0018EE5C 00000000 */  nop
