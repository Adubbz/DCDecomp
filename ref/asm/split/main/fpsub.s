.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel fpsub
/* 010BD0 00110AD0 A0FFBD27 */  addiu       $29, $29, -0x60
/* 010BD4 00110AD4 4000B0FF */  sd          $16, 0x40($29)
/* 010BD8 00110AD8 3000A427 */  addiu       $4, $29, 0x30
/* 010BDC 00110ADC 5000BFFF */  sd          $31, 0x50($29)
/* 010BE0 00110AE0 2D28A003 */  daddu       $5, $29, $0
/* 010BE4 00110AE4 3000ACE7 */  swc1        $f12, 0x30($29)
/* 010BE8 00110AE8 EC41040C */  jal         __unpack_f
/* 010BEC 00110AEC 3400ADE7 */   swc1       $f13, 0x34($29)
/* 010BF0 00110AF0 1000B027 */  addiu       $16, $29, 0x10
/* 010BF4 00110AF4 3400A427 */  addiu       $4, $29, 0x34
/* 010BF8 00110AF8 EC41040C */  jal         __unpack_f
/* 010BFC 00110AFC 2D280002 */   daddu      $5, $16, $0
/* 010C00 00110B00 1400A28F */  lw          $2, 0x14($29)
/* 010C04 00110B04 2D280002 */  daddu       $5, $16, $0
/* 010C08 00110B08 2000A627 */  addiu       $6, $29, 0x20
/* 010C0C 00110B0C 2D20A003 */  daddu       $4, $29, $0
/* 010C10 00110B10 01004238 */  xori        $2, $2, 0x1
/* 010C14 00110B14 1042040C */  jal         _fpadd_parts__2
/* 010C18 00110B18 1400A2AF */   sw         $2, 0x14($29)
/* 010C1C 00110B1C A841040C */  jal         __pack_f
/* 010C20 00110B20 2D204000 */   daddu      $4, $2, $0
/* 010C24 00110B24 5000BFDF */  ld          $31, 0x50($29)
/* 010C28 00110B28 4000B0DF */  ld          $16, 0x40($29)
/* 010C2C 00110B2C 0800E003 */  jr          $31
/* 010C30 00110B30 6000BD27 */   addiu      $29, $29, 0x60
/* 010C34 00110B34 00000000 */  nop
