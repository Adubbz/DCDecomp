.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _i2b
/* 3BB8 00103AB8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3BBC 00103ABC 0000B0FF */  sd         $16, 0x0($sp)
/* 3BC0 00103AC0 2D80A000 */  daddu      $16, $5, $0
/* 3BC4 00103AC4 1000BFFF */  sd         $31, 0x10($sp)
/* 3BC8 00103AC8 8E0D040C */  jal        _Balloc
/* 3BCC 00103ACC 01000524 */   addiu     $5, $0, 0x1
/* 3BD0 00103AD0 2D184000 */  daddu      $3, $2, $0
/* 3BD4 00103AD4 01000424 */  addiu      $4, $0, 0x1
/* 3BD8 00103AD8 140070AC */  sw         $16, 0x14($3)
/* 3BDC 00103ADC 1000BFDF */  ld         $31, 0x10($sp)
/* 3BE0 00103AE0 0000B0DF */  ld         $16, 0x0($sp)
/* 3BE4 00103AE4 100064AC */  sw         $4, 0x10($3)
/* 3BE8 00103AE8 0800E003 */  jr         $31
/* 3BEC 00103AEC 2000BD27 */   addiu     $sp, $sp, 0x20
