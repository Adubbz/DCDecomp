.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel AllDeadMes__Fi
/* 60650 00160550 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 60654 00160554 0000BF7F */  sq         $31, 0x0($sp)
/* 60658 00160558 282E8070 */  paddub     $5, $4, $0
/* 6065C 0016055C 3D000424 */  addiu      $4, $0, 0x3D
/* 60660 00160560 08000624 */  addiu      $6, $0, 0x8
/* 60664 00160564 01000724 */  addiu      $7, $0, 0x1
/* 60668 00160568 28460070 */  paddub     $8, $0, $0
/* 6066C 0016056C 284E0070 */  paddub     $9, $0, $0
/* 60670 00160570 9481050C */  jal        SetSystemMes__FiiiiPiPi
/* 60674 00160574 00000000 */   nop
/* 60678 00160578 0000BF7B */  lq         $31, 0x0($sp)
/* 6067C 0016057C 1000BD27 */  addiu      $sp, $sp, 0x10
/* 60680 00160580 0800E003 */  jr         $31
/* 60684 00160584 00000000 */   nop
/* 60688 00160588 00000000 */  nop
/* 6068C 0016058C 00000000 */  nop
