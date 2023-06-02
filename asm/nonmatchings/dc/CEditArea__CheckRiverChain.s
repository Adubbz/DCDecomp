.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel CheckRiverChain__9CEditAreaFiiii
/* 6FE00 0016FD00 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 6FE04 0016FD04 5000BF7F */  sq         $31, 0x50($sp)
/* 6FE08 0016FD08 4000B47F */  sq         $20, 0x40($sp)
/* 6FE0C 0016FD0C 3000B37F */  sq         $19, 0x30($sp)
/* 6FE10 0016FD10 2000B27F */  sq         $18, 0x20($sp)
/* 6FE14 0016FD14 1000B17F */  sq         $17, 0x10($sp)
/* 6FE18 0016FD18 0000B07F */  sq         $16, 0x0($sp)
/* 6FE1C 0016FD1C 28A68070 */  paddub     $20, $4, $0
/* 6FE20 0016FD20 289EA070 */  paddub     $19, $5, $0
/* 6FE24 0016FD24 2896C070 */  paddub     $18, $6, $0
/* 6FE28 0016FD28 288EE070 */  paddub     $17, $7, $0
/* 6FE2C 0016FD2C 28860071 */  paddub     $16, $8, $0
/* 6FE30 0016FD30 09006006 */  bltz       $19, .L0016FD58
/* 6FE34 0016FD34 00000000 */   nop
/* 6FE38 0016FD38 07004006 */  bltz       $18, .L0016FD58
/* 6FE3C 0016FD3C 00000000 */   nop
/* 6FE40 0016FD40 1000612A */  slti       $at, $19, 0x10
/* 6FE44 0016FD44 04002010 */  beqz       $at, .L0016FD58
/* 6FE48 0016FD48 00000000 */   nop
/* 6FE4C 0016FD4C 1000422A */  slti       $2, $18, 0x10
/* 6FE50 0016FD50 04004014 */  bnez       $2, .L0016FD64
/* 6FE54 0016FD54 00000000 */   nop
.L0016FD58:
/* 6FE58 0016FD58 28160070 */  paddub     $2, $0, $0
/* 6FE5C 0016FD5C 5B000010 */  b          .L0016FECC
/* 6FE60 0016FD60 00000000 */   nop
.L0016FD64:
/* 6FE64 0016FD64 80111300 */  sll        $2, $19, 6
/* 6FE68 0016FD68 21185400 */  addu       $3, $2, $20
/* 6FE6C 0016FD6C 80101200 */  sll        $2, $18, 2
/* 6FE70 0016FD70 21104300 */  addu       $2, $2, $3
/* 6FE74 0016FD74 281C4424 */  addiu      $4, $2, 0x1C28
/* 6FE78 0016FD78 281C428C */  lw         $2, 0x1C28($2)
/* 6FE7C 0016FD7C 04004010 */  beqz       $2, .L0016FD90
/* 6FE80 0016FD80 00000000 */   nop
/* 6FE84 0016FD84 28160070 */  paddub     $2, $0, $0
/* 6FE88 0016FD88 50000010 */  b          .L0016FECC
/* 6FE8C 0016FD8C 00000000 */   nop
.L0016FD90:
/* 6FE90 0016FD90 01000324 */  addiu      $3, $0, 0x1
/* 6FE94 0016FD94 000083AC */  sw         $3, 0x0($4)
/* 6FE98 0016FD98 3C8F8283 */  lb         $2, -0x70C4($gp)
/* 6FE9C 0016FD9C 03004014 */  bnez       $2, .L0016FDAC
/* 6FEA0 0016FDA0 00000000 */   nop
/* 6FEA4 0016FDA4 388F80AF */  sw         $0, -0x70C8($gp)
/* 6FEA8 0016FDA8 3C8F83A3 */  sb         $3, -0x70C4($gp)
.L0016FDAC:
/* 6FEAC 0016FDAC 28268072 */  paddub     $4, $20, $0
/* 6FEB0 0016FDB0 282E6072 */  paddub     $5, $19, $0
/* 6FEB4 0016FDB4 28364072 */  paddub     $6, $18, $0
/* 6FEB8 0016FDB8 A4B7050C */  jal        GetPartsExtra__9CEditAreaFii
/* 6FEBC 0016FDBC 00000000 */   nop
/* 6FEC0 0016FDC0 388F82AF */  sw         $2, -0x70C8($gp)
/* 6FEC4 0016FDC4 388F838F */  lw         $3, -0x70C8($gp)
/* 6FEC8 0016FDC8 02000224 */  addiu      $2, $0, 0x2
/* 6FECC 0016FDCC 0A006210 */  beq        $3, $2, .L0016FDF8
/* 6FED0 0016FDD0 00000000 */   nop
/* 6FED4 0016FDD4 03000224 */  addiu      $2, $0, 0x3
/* 6FED8 0016FDD8 07006210 */  beq        $3, $2, .L0016FDF8
/* 6FEDC 0016FDDC 00000000 */   nop
/* 6FEE0 0016FDE0 05000224 */  addiu      $2, $0, 0x5
/* 6FEE4 0016FDE4 04006210 */  beq        $3, $2, .L0016FDF8
/* 6FEE8 0016FDE8 00000000 */   nop
/* 6FEEC 0016FDEC 28160070 */  paddub     $2, $0, $0
/* 6FEF0 0016FDF0 36000010 */  b          .L0016FECC
/* 6FEF4 0016FDF4 00000000 */   nop
.L0016FDF8:
/* 6FEF8 0016FDF8 06007116 */  bne        $19, $17, .L0016FE14
/* 6FEFC 0016FDFC 00000000 */   nop
/* 6FF00 0016FE00 04005016 */  bne        $18, $16, .L0016FE14
/* 6FF04 0016FE04 00000000 */   nop
/* 6FF08 0016FE08 01000224 */  addiu      $2, $0, 0x1
/* 6FF0C 0016FE0C 2F000010 */  b          .L0016FECC
/* 6FF10 0016FE10 00000000 */   nop
.L0016FE14:
/* 6FF14 0016FE14 FFFF6526 */  addiu      $5, $19, -0x1
/* 6FF18 0016FE18 28268072 */  paddub     $4, $20, $0
/* 6FF1C 0016FE1C 28364072 */  paddub     $6, $18, $0
/* 6FF20 0016FE20 283E2072 */  paddub     $7, $17, $0
/* 6FF24 0016FE24 28460072 */  paddub     $8, $16, $0
/* 6FF28 0016FE28 40BF050C */  jal        CheckRiverChain__9CEditAreaFiiii
/* 6FF2C 0016FE2C 00000000 */   nop
/* 6FF30 0016FE30 04004010 */  beqz       $2, .L0016FE44
/* 6FF34 0016FE34 00000000 */   nop
/* 6FF38 0016FE38 01000224 */  addiu      $2, $0, 0x1
/* 6FF3C 0016FE3C 23000010 */  b          .L0016FECC
/* 6FF40 0016FE40 00000000 */   nop
.L0016FE44:
/* 6FF44 0016FE44 01006526 */  addiu      $5, $19, 0x1
/* 6FF48 0016FE48 28268072 */  paddub     $4, $20, $0
/* 6FF4C 0016FE4C 28364072 */  paddub     $6, $18, $0
/* 6FF50 0016FE50 283E2072 */  paddub     $7, $17, $0
/* 6FF54 0016FE54 28460072 */  paddub     $8, $16, $0
/* 6FF58 0016FE58 40BF050C */  jal        CheckRiverChain__9CEditAreaFiiii
/* 6FF5C 0016FE5C 00000000 */   nop
/* 6FF60 0016FE60 04004010 */  beqz       $2, .L0016FE74
/* 6FF64 0016FE64 00000000 */   nop
/* 6FF68 0016FE68 01000224 */  addiu      $2, $0, 0x1
/* 6FF6C 0016FE6C 17000010 */  b          .L0016FECC
/* 6FF70 0016FE70 00000000 */   nop
.L0016FE74:
/* 6FF74 0016FE74 FFFF4626 */  addiu      $6, $18, -0x1
/* 6FF78 0016FE78 28268072 */  paddub     $4, $20, $0
/* 6FF7C 0016FE7C 282E6072 */  paddub     $5, $19, $0
/* 6FF80 0016FE80 283E2072 */  paddub     $7, $17, $0
/* 6FF84 0016FE84 28460072 */  paddub     $8, $16, $0
/* 6FF88 0016FE88 40BF050C */  jal        CheckRiverChain__9CEditAreaFiiii
/* 6FF8C 0016FE8C 00000000 */   nop
/* 6FF90 0016FE90 04004010 */  beqz       $2, .L0016FEA4
/* 6FF94 0016FE94 00000000 */   nop
/* 6FF98 0016FE98 01000224 */  addiu      $2, $0, 0x1
/* 6FF9C 0016FE9C 0B000010 */  b          .L0016FECC
/* 6FFA0 0016FEA0 00000000 */   nop
.L0016FEA4:
/* 6FFA4 0016FEA4 01004626 */  addiu      $6, $18, 0x1
/* 6FFA8 0016FEA8 28268072 */  paddub     $4, $20, $0
/* 6FFAC 0016FEAC 282E6072 */  paddub     $5, $19, $0
/* 6FFB0 0016FEB0 283E2072 */  paddub     $7, $17, $0
/* 6FFB4 0016FEB4 28460072 */  paddub     $8, $16, $0
/* 6FFB8 0016FEB8 40BF050C */  jal        CheckRiverChain__9CEditAreaFiiii
/* 6FFBC 0016FEBC 00000000 */   nop
/* 6FFC0 0016FEC0 01000324 */  addiu      $3, $0, 0x1
/* 6FFC4 0016FEC4 0A180200 */  movz       $3, $0, $2
/* 6FFC8 0016FEC8 28166070 */  paddub     $2, $3, $0
.L0016FECC:
/* 6FFCC 0016FECC 5000BF7B */  lq         $31, 0x50($sp)
/* 6FFD0 0016FED0 4000B47B */  lq         $20, 0x40($sp)
/* 6FFD4 0016FED4 3000B37B */  lq         $19, 0x30($sp)
/* 6FFD8 0016FED8 2000B27B */  lq         $18, 0x20($sp)
/* 6FFDC 0016FEDC 1000B17B */  lq         $17, 0x10($sp)
/* 6FFE0 0016FEE0 0000B07B */  lq         $16, 0x0($sp)
/* 6FFE4 0016FEE4 6000BD27 */  addiu      $sp, $sp, 0x60
/* 6FFE8 0016FEE8 0800E003 */  jr         $31
/* 6FFEC 0016FEEC 00000000 */   nop
