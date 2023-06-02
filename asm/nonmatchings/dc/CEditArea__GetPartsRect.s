.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetPartsRect__9CEditAreaFR8CRect_i_Pii
/* 6FC50 0016FB50 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 6FC54 0016FB54 7000BF7F */  sq         $31, 0x70($sp)
/* 6FC58 0016FB58 6000B67F */  sq         $22, 0x60($sp)
/* 6FC5C 0016FB5C 5000B57F */  sq         $21, 0x50($sp)
/* 6FC60 0016FB60 4000B47F */  sq         $20, 0x40($sp)
/* 6FC64 0016FB64 3000B37F */  sq         $19, 0x30($sp)
/* 6FC68 0016FB68 2000B27F */  sq         $18, 0x20($sp)
/* 6FC6C 0016FB6C 1000B17F */  sq         $17, 0x10($sp)
/* 6FC70 0016FB70 0000B07F */  sq         $16, 0x0($sp)
/* 6FC74 0016FB74 28B68070 */  paddub     $22, $4, $0
/* 6FC78 0016FB78 28AEA070 */  paddub     $21, $5, $0
/* 6FC7C 0016FB7C 28A6C070 */  paddub     $20, $6, $0
/* 6FC80 0016FB80 289EE070 */  paddub     $19, $7, $0
/* 6FC84 0016FB84 28960070 */  paddub     $18, $0, $0
/* 6FC88 0016FB88 0000B08C */  lw         $16, 0x0($5)
/* 6FC8C 0016FB8C 32000010 */  b          .L0016FC58
/* 6FC90 0016FB90 00000000 */   nop
.L0016FB94:
/* 6FC94 0016FB94 0400B18E */  lw         $17, 0x4($21)
/* 6FC98 0016FB98 28000010 */  b          .L0016FC3C
/* 6FC9C 0016FB9C 00000000 */   nop
.L0016FBA0:
/* 6FCA0 0016FBA0 2A085302 */  slt        $at, $18, $19
/* 6FCA4 0016FBA4 2B002010 */  beqz       $at, .L0016FC54
/* 6FCA8 0016FBA8 00000000 */   nop
/* 6FCAC 0016FBAC 2826C072 */  paddub     $4, $22, $0
/* 6FCB0 0016FBB0 282E0072 */  paddub     $5, $16, $0
/* 6FCB4 0016FBB4 28362072 */  paddub     $6, $17, $0
/* 6FCB8 0016FBB8 D4B6050C */  jal        GetPartsID__9CEditAreaFii
/* 6FCBC 0016FBBC 00000000 */   nop
/* 6FCC0 0016FBC0 1D004004 */  bltz       $2, .L0016FC38
/* 6FCC4 0016FBC4 00000000 */   nop
/* 6FCC8 0016FBC8 07004016 */  bnez       $18, .L0016FBE8
/* 6FCCC 0016FBCC 00000000 */   nop
/* 6FCD0 0016FBD0 80181200 */  sll        $3, $18, 2
/* 6FCD4 0016FBD4 21188302 */  addu       $3, $20, $3
/* 6FCD8 0016FBD8 000062AC */  sw         $2, 0x0($3)
/* 6FCDC 0016FBDC 01005226 */  addiu      $18, $18, 0x1
/* 6FCE0 0016FBE0 15000010 */  b          .L0016FC38
/* 6FCE4 0016FBE4 00000000 */   nop
.L0016FBE8:
/* 6FCE8 0016FBE8 28260070 */  paddub     $4, $0, $0
/* 6FCEC 0016FBEC 282E0070 */  paddub     $5, $0, $0
/* 6FCF0 0016FBF0 08000010 */  b          .L0016FC14
/* 6FCF4 0016FBF4 00000000 */   nop
.L0016FBF8:
/* 6FCF8 0016FBF8 80180500 */  sll        $3, $5, 2
/* 6FCFC 0016FBFC 21188302 */  addu       $3, $20, $3
/* 6FD00 0016FC00 0000638C */  lw         $3, 0x0($3)
/* 6FD04 0016FC04 02004314 */  bne        $2, $3, .L0016FC10
/* 6FD08 0016FC08 00000000 */   nop
/* 6FD0C 0016FC0C 01000424 */  addiu      $4, $0, 0x1
.L0016FC10:
/* 6FD10 0016FC10 0100A524 */  addiu      $5, $5, 0x1
.L0016FC14:
/* 6FD14 0016FC14 2A18B200 */  slt        $3, $5, $18
/* 6FD18 0016FC18 F7FF6014 */  bnez       $3, .L0016FBF8
/* 6FD1C 0016FC1C 00000000 */   nop
/* 6FD20 0016FC20 05008014 */  bnez       $4, .L0016FC38
/* 6FD24 0016FC24 00000000 */   nop
/* 6FD28 0016FC28 80181200 */  sll        $3, $18, 2
/* 6FD2C 0016FC2C 21188302 */  addu       $3, $20, $3
/* 6FD30 0016FC30 000062AC */  sw         $2, 0x0($3)
/* 6FD34 0016FC34 01005226 */  addiu      $18, $18, 0x1
.L0016FC38:
/* 6FD38 0016FC38 01003126 */  addiu      $17, $17, 0x1
.L0016FC3C:
/* 6FD3C 0016FC3C 0400A38E */  lw         $3, 0x4($21)
/* 6FD40 0016FC40 0C00A28E */  lw         $2, 0xC($21)
/* 6FD44 0016FC44 21106200 */  addu       $2, $3, $2
/* 6FD48 0016FC48 2A102202 */  slt        $2, $17, $2
/* 6FD4C 0016FC4C D4FF4014 */  bnez       $2, .L0016FBA0
/* 6FD50 0016FC50 00000000 */   nop
.L0016FC54:
/* 6FD54 0016FC54 01001026 */  addiu      $16, $16, 0x1
.L0016FC58:
/* 6FD58 0016FC58 0000A38E */  lw         $3, 0x0($21)
/* 6FD5C 0016FC5C 0800A28E */  lw         $2, 0x8($21)
/* 6FD60 0016FC60 21106200 */  addu       $2, $3, $2
/* 6FD64 0016FC64 2A100202 */  slt        $2, $16, $2
/* 6FD68 0016FC68 CAFF4014 */  bnez       $2, .L0016FB94
/* 6FD6C 0016FC6C 00000000 */   nop
/* 6FD70 0016FC70 28164072 */  paddub     $2, $18, $0
/* 6FD74 0016FC74 7000BF7B */  lq         $31, 0x70($sp)
/* 6FD78 0016FC78 6000B67B */  lq         $22, 0x60($sp)
/* 6FD7C 0016FC7C 5000B57B */  lq         $21, 0x50($sp)
/* 6FD80 0016FC80 4000B47B */  lq         $20, 0x40($sp)
/* 6FD84 0016FC84 3000B37B */  lq         $19, 0x30($sp)
/* 6FD88 0016FC88 2000B27B */  lq         $18, 0x20($sp)
/* 6FD8C 0016FC8C 1000B17B */  lq         $17, 0x10($sp)
/* 6FD90 0016FC90 0000B07B */  lq         $16, 0x0($sp)
/* 6FD94 0016FC94 8000BD27 */  addiu      $sp, $sp, 0x80
/* 6FD98 0016FC98 0800E003 */  jr         $31
/* 6FD9C 0016FC9C 00000000 */   nop
