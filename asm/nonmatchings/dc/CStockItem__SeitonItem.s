.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel SeitonItem__10CStockItemFv
/* 13FD70 0023FC70 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 13FD74 0023FC74 2000BF7F */  sq         $31, 0x20($sp)
/* 13FD78 0023FC78 1000B17F */  sq         $17, 0x10($sp)
/* 13FD7C 0023FC7C 0000B07F */  sq         $16, 0x0($sp)
/* 13FD80 0023FC80 288E8070 */  paddub     $17, $4, $0
/* 13FD84 0023FC84 28860070 */  paddub     $16, $0, $0
/* 13FD88 0023FC88 10000010 */  b          .L0023FCCC
/* 13FD8C 0023FC8C 00000000 */   nop
.L0023FC90:
/* 13FD90 0023FC90 28262072 */  paddub     $4, $17, $0
/* 13FD94 0023FC94 D0FE080C */  jal        SeitonChargeItemBoardSub__10CStockItemFv
/* 13FD98 0023FC98 00000000 */   nop
/* 13FD9C 0023FC9C 0E004014 */  bnez       $2, .L0023FCD8
/* 13FDA0 0023FCA0 00000000 */   nop
/* 13FDA4 0023FCA4 288A838F */  lw         $3, -0x75D8($gp)
/* 13FDA8 0023FCA8 01006324 */  addiu      $3, $3, 0x1
/* 13FDAC 0023FCAC 288A83AF */  sw         $3, -0x75D8($gp)
/* 13FDB0 0023FCB0 288A838F */  lw         $3, -0x75D8($gp)
/* 13FDB4 0023FCB4 09006328 */  slti       $3, $3, 0x9
/* 13FDB8 0023FCB8 03006014 */  bnez       $3, .L0023FCC8
/* 13FDBC 0023FCBC 00000000 */   nop
/* 13FDC0 0023FCC0 01000324 */  addiu      $3, $0, 0x1
/* 13FDC4 0023FCC4 288A83AF */  sw         $3, -0x75D8($gp)
.L0023FCC8:
/* 13FDC8 0023FCC8 01001026 */  addiu      $16, $16, 0x1
.L0023FCCC:
/* 13FDCC 0023FCCC 0900032A */  slti       $3, $16, 0x9
/* 13FDD0 0023FCD0 EFFF6014 */  bnez       $3, .L0023FC90
/* 13FDD4 0023FCD4 00000000 */   nop
.L0023FCD8:
/* 13FDD8 0023FCD8 2000BF7B */  lq         $31, 0x20($sp)
/* 13FDDC 0023FCDC 1000B17B */  lq         $17, 0x10($sp)
/* 13FDE0 0023FCE0 0000B07B */  lq         $16, 0x0($sp)
/* 13FDE4 0023FCE4 3000BD27 */  addiu      $sp, $sp, 0x30
/* 13FDE8 0023FCE8 0800E003 */  jr         $31
/* 13FDEC 0023FCEC 00000000 */   nop
