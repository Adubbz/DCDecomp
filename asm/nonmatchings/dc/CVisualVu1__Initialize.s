.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__10CVisualVu1Fv
/* 34FC0 00134EC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 34FC4 00134EC4 1000BF7F */  sq         $31, 0x10($sp)
/* 34FC8 00134EC8 0000B07F */  sq         $16, 0x0($sp)
/* 34FCC 00134ECC 28868070 */  paddub     $16, $4, $0
/* 34FD0 00134ED0 D4D2040C */  jal        Initialize__7CVisualFv
/* 34FD4 00134ED4 00000000 */   nop
/* 34FD8 00134ED8 180000AE */  sw         $0, 0x18($16)
/* 34FDC 00134EDC 1C0000AE */  sw         $0, 0x1C($16)
/* 34FE0 00134EE0 100000AE */  sw         $0, 0x10($16)
/* 34FE4 00134EE4 140000AE */  sw         $0, 0x14($16)
/* 34FE8 00134EE8 1000BF7B */  lq         $31, 0x10($sp)
/* 34FEC 00134EEC 0000B07B */  lq         $16, 0x0($sp)
/* 34FF0 00134EF0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 34FF4 00134EF4 0800E003 */  jr         $31
/* 34FF8 00134EF8 00000000 */   nop
/* 34FFC 00134EFC 00000000 */  nop
