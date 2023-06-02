.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetLYf__Fv
/* 69BB0 00169AB0 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 69BB4 00169AB4 0000BF7F */  sq         $31, 0x0($sp)
/* 69BB8 00169AB8 78A6050C */  jal        keylock__Fv
/* 69BBC 00169ABC 00000000 */   nop
/* 69BC0 00169AC0 04004010 */  beqz       $2, .L00169AD4
/* 69BC4 00169AC4 00000000 */   nop
/* 69BC8 00169AC8 00008044 */  mtc1       $0, $f0
/* 69BCC 00169ACC 04000010 */  b          .L00169AE0
/* 69BD0 00169AD0 00000000 */   nop
.L00169AD4:
/* 69BD4 00169AD4 01000424 */  addiu      $4, $0, 0x1
/* 69BD8 00169AD8 3CA6050C */  jal        EdGetLYf__Fi
/* 69BDC 00169ADC 00000000 */   nop
.L00169AE0:
/* 69BE0 00169AE0 0000BF7B */  lq         $31, 0x0($sp)
/* 69BE4 00169AE4 1000BD27 */  addiu      $sp, $sp, 0x10
/* 69BE8 00169AE8 0800E003 */  jr         $31
/* 69BEC 00169AEC 00000000 */   nop
