.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel _i2b
/* 003BB8 00103AB8 E0FFBD27 */  addiu       $29, $29, -0x20
/* 003BBC 00103ABC 0000B0FF */  sd          $16, 0x0($29)
/* 003BC0 00103AC0 2D80A000 */  daddu       $16, $5, $0
/* 003BC4 00103AC4 1000BFFF */  sd          $31, 0x10($29)
/* 003BC8 00103AC8 8E0D040C */  jal         _Balloc
/* 003BCC 00103ACC 01000524 */   addiu      $5, $0, 0x1
/* 003BD0 00103AD0 2D184000 */  daddu       $3, $2, $0
/* 003BD4 00103AD4 01000424 */  addiu       $4, $0, 0x1
/* 003BD8 00103AD8 140070AC */  sw          $16, 0x14($3)
/* 003BDC 00103ADC 1000BFDF */  ld          $31, 0x10($29)
/* 003BE0 00103AE0 0000B0DF */  ld          $16, 0x0($29)
/* 003BE4 00103AE4 100064AC */  sw          $4, 0x10($3)
/* 003BE8 00103AE8 0800E003 */  jr          $31
/* 003BEC 00103AEC 2000BD27 */   addiu      $29, $29, 0x20
