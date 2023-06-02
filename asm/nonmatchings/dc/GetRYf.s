.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetRYf__Fv
/* 69B30 00169A30 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 69B34 00169A34 0000BF7F */  sq         $31, 0x0($sp)
/* 69B38 00169A38 78A6050C */  jal        keylock__Fv
/* 69B3C 00169A3C 00000000 */   nop
/* 69B40 00169A40 04004010 */  beqz       $2, .L00169A54
/* 69B44 00169A44 00000000 */   nop
/* 69B48 00169A48 00008044 */  mtc1       $0, $f0
/* 69B4C 00169A4C 04000010 */  b          .L00169A60
/* 69B50 00169A50 00000000 */   nop
.L00169A54:
/* 69B54 00169A54 01000424 */  addiu      $4, $0, 0x1
/* 69B58 00169A58 14A6050C */  jal        EdGetRYf__Fi
/* 69B5C 00169A5C 00000000 */   nop
.L00169A60:
/* 69B60 00169A60 0000BF7B */  lq         $31, 0x0($sp)
/* 69B64 00169A64 1000BD27 */  addiu      $sp, $sp, 0x10
/* 69B68 00169A68 0800E003 */  jr         $31
/* 69B6C 00169A6C 00000000 */   nop
