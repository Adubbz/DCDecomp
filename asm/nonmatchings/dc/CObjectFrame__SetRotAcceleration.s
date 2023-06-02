.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SetRotAcceleration__12CObjectFrameF11CVector3_f_
/* 57BC0 00157AC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 57BC4 00157AC4 1000A627 */  addiu      $6, $sp, 0x10
/* 57BC8 00157AC8 0000A378 */  lq         $3, 0x0($5)
/* 57BCC 00157ACC 0000C37C */  sq         $3, 0x0($6)
/* 57BD0 00157AD0 0000A527 */  addiu      $5, $sp, 0x0
/* 57BD4 00157AD4 0000C378 */  lq         $3, 0x0($6)
/* 57BD8 00157AD8 0000A37C */  sq         $3, 0x0($5)
/* 57BDC 00157ADC 0000C378 */  lq         $3, 0x0($6)
/* 57BE0 00157AE0 8000837C */  sq         $3, 0x80($4)
/* 57BE4 00157AE4 01000324 */  addiu      $3, $0, 0x1
/* 57BE8 00157AE8 C00083AC */  sw         $3, 0xC0($4)
/* 57BEC 00157AEC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 57BF0 00157AF0 0800E003 */  jr         $31
/* 57BF4 00157AF4 00000000 */   nop
/* 57BF8 00157AF8 00000000 */  nop
/* 57BFC 00157AFC 00000000 */  nop
