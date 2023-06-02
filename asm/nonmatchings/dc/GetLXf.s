.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLXf__Fv
/* 69B70 00169A70 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 69B74 00169A74 0000BF7F */  sq         $31, 0x0($sp)
/* 69B78 00169A78 78A6050C */  jal        keylock__Fv
/* 69B7C 00169A7C 00000000 */   nop
/* 69B80 00169A80 04004010 */  beqz       $2, .L00169A94
/* 69B84 00169A84 00000000 */   nop
/* 69B88 00169A88 00008044 */  mtc1       $0, $f0
/* 69B8C 00169A8C 04000010 */  b          .L00169AA0
/* 69B90 00169A90 00000000 */   nop
.L00169A94:
/* 69B94 00169A94 01000424 */  addiu      $4, $0, 0x1
/* 69B98 00169A98 28A6050C */  jal        EdGetLXf__Fi
/* 69B9C 00169A9C 00000000 */   nop
.L00169AA0:
/* 69BA0 00169AA0 0000BF7B */  lq         $31, 0x0($sp)
/* 69BA4 00169AA4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 69BA8 00169AA8 0800E003 */  jr         $31
/* 69BAC 00169AAC 00000000 */   nop
