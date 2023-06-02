.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel get_obj_scale__FP10OBJ_HANDLEPf
/* 8AE10 0018AD10 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 8AE14 0018AD14 0000BF7F */  sq         $31, 0x0($sp)
/* 8AE18 0018AD18 0000838C */  lw         $3, 0x0($4)
/* 8AE1C 0018AD1C 08006010 */  beqz       $3, .L0018AD40
/* 8AE20 0018AD20 00000000 */   nop
/* 8AE24 0018AD24 28266070 */  paddub     $4, $3, $0
/* 8AE28 0018AD28 A000798C */  lw         $25, 0xA0($3)
/* 8AE2C 0018AD2C 8C00398F */  lw         $25, 0x8C($25)
/* 8AE30 0018AD30 09F82003 */  jalr       $25
/* 8AE34 0018AD34 00000000 */   nop
/* 8AE38 0018AD38 1F000010 */  b          .L0018ADB8
/* 8AE3C 0018AD3C 00000000 */   nop
.L0018AD40:
/* 8AE40 0018AD40 0400838C */  lw         $3, 0x4($4)
/* 8AE44 0018AD44 08006010 */  beqz       $3, .L0018AD68
/* 8AE48 0018AD48 00000000 */   nop
/* 8AE4C 0018AD4C 28266070 */  paddub     $4, $3, $0
/* 8AE50 0018AD50 A000798C */  lw         $25, 0xA0($3)
/* 8AE54 0018AD54 8C00398F */  lw         $25, 0x8C($25)
/* 8AE58 0018AD58 09F82003 */  jalr       $25
/* 8AE5C 0018AD5C 00000000 */   nop
/* 8AE60 0018AD60 15000010 */  b          .L0018ADB8
/* 8AE64 0018AD64 00000000 */   nop
.L0018AD68:
/* 8AE68 0018AD68 28360070 */  paddub     $6, $0, $0
/* 8AE6C 0018AD6C 0F000010 */  b          .L0018ADAC
/* 8AE70 0018AD70 00000000 */   nop
.L0018AD74:
/* 8AE74 0018AD74 80180600 */  sll        $3, $6, 2
/* 8AE78 0018AD78 21186400 */  addu       $3, $3, $4
/* 8AE7C 0018AD7C 0800638C */  lw         $3, 0x8($3)
/* 8AE80 0018AD80 09006010 */  beqz       $3, .L0018ADA8
/* 8AE84 0018AD84 00000000 */   nop
/* 8AE88 0018AD88 100260C4 */  lwc1       $f0, 0x210($3)
/* 8AE8C 0018AD8C 0000A0E4 */  swc1       $f0, 0x0($5)
/* 8AE90 0018AD90 140260C4 */  lwc1       $f0, 0x214($3)
/* 8AE94 0018AD94 0400A0E4 */  swc1       $f0, 0x4($5)
/* 8AE98 0018AD98 180260C4 */  lwc1       $f0, 0x218($3)
/* 8AE9C 0018AD9C 0800A0E4 */  swc1       $f0, 0x8($5)
/* 8AEA0 0018ADA0 05000010 */  b          .L0018ADB8
/* 8AEA4 0018ADA4 00000000 */   nop
.L0018ADA8:
/* 8AEA8 0018ADA8 0100C624 */  addiu      $6, $6, 0x1
.L0018ADAC:
/* 8AEAC 0018ADAC 0C00C328 */  slti       $3, $6, 0xC
/* 8AEB0 0018ADB0 F0FF6014 */  bnez       $3, .L0018AD74
/* 8AEB4 0018ADB4 00000000 */   nop
.L0018ADB8:
/* 8AEB8 0018ADB8 0000BF7B */  lq         $31, 0x0($sp)
/* 8AEBC 0018ADBC 1000BD27 */  addiu      $sp, $sp, 0x10
/* 8AEC0 0018ADC0 0800E003 */  jr         $31
/* 8AEC4 0018ADC4 00000000 */   nop
/* 8AEC8 0018ADC8 00000000 */  nop
/* 8AECC 0018ADCC 00000000 */  nop
