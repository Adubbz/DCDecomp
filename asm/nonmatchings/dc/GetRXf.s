.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRXf__Fv
/* 69AF0 001699F0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 69AF4 001699F4 0000BF7F */  sq         $31, 0x0($sp)
/* 69AF8 001699F8 78A6050C */  jal        keylock__Fv
/* 69AFC 001699FC 00000000 */   nop
/* 69B00 00169A00 04004010 */  beqz       $2, .L00169A14
/* 69B04 00169A04 00000000 */   nop
/* 69B08 00169A08 00008044 */  mtc1       $0, $f0
/* 69B0C 00169A0C 04000010 */  b          .L00169A20
/* 69B10 00169A10 00000000 */   nop
.L00169A14:
/* 69B14 00169A14 01000424 */  addiu      $4, $0, 0x1
/* 69B18 00169A18 00A6050C */  jal        EdGetRXf__Fi
/* 69B1C 00169A1C 00000000 */   nop
.L00169A20:
/* 69B20 00169A20 0000BF7B */  lq         $31, 0x0($sp)
/* 69B24 00169A24 1000BD27 */  addiu      $sp, $sp, 0x10
/* 69B28 00169A28 0800E003 */  jr         $31
/* 69B2C 00169A2C 00000000 */   nop
