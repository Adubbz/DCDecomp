.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fpsub
/* 10BD0 00110AD0 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 10BD4 00110AD4 4000B0FF */  sd         $16, 0x40($sp)
/* 10BD8 00110AD8 3000A427 */  addiu      $4, $sp, 0x30
/* 10BDC 00110ADC 5000BFFF */  sd         $31, 0x50($sp)
/* 10BE0 00110AE0 2D28A003 */  daddu      $5, $sp, $0
/* 10BE4 00110AE4 3000ACE7 */  swc1       $f12, 0x30($sp)
/* 10BE8 00110AE8 EC41040C */  jal        __unpack_f
/* 10BEC 00110AEC 3400ADE7 */   swc1      $f13, 0x34($sp)
/* 10BF0 00110AF0 1000B027 */  addiu      $16, $sp, 0x10
/* 10BF4 00110AF4 3400A427 */  addiu      $4, $sp, 0x34
/* 10BF8 00110AF8 EC41040C */  jal        __unpack_f
/* 10BFC 00110AFC 2D280002 */   daddu     $5, $16, $0
/* 10C00 00110B00 1400A28F */  lw         $2, 0x14($sp)
/* 10C04 00110B04 2D280002 */  daddu      $5, $16, $0
/* 10C08 00110B08 2000A627 */  addiu      $6, $sp, 0x20
/* 10C0C 00110B0C 2D20A003 */  daddu      $4, $sp, $0
/* 10C10 00110B10 01004238 */  xori       $2, $2, 0x1
/* 10C14 00110B14 1042040C */  jal        _fpadd_parts_2
/* 10C18 00110B18 1400A2AF */   sw        $2, 0x14($sp)
/* 10C1C 00110B1C A841040C */  jal        __pack_f
/* 10C20 00110B20 2D204000 */   daddu     $4, $2, $0
/* 10C24 00110B24 5000BFDF */  ld         $31, 0x50($sp)
/* 10C28 00110B28 4000B0DF */  ld         $16, 0x40($sp)
/* 10C2C 00110B2C 0800E003 */  jr         $31
/* 10C30 00110B30 6000BD27 */   addiu     $sp, $sp, 0x60
/* 10C34 00110B34 00000000 */  nop
