.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel fpadd
/* 10B78 00110A78 A0FFBD27 */  addiu      $sp, $sp, -0x60
/* 10B7C 00110A7C 4000B0FF */  sd         $16, 0x40($sp)
/* 10B80 00110A80 3000A427 */  addiu      $4, $sp, 0x30
/* 10B84 00110A84 5000BFFF */  sd         $31, 0x50($sp)
/* 10B88 00110A88 2D28A003 */  daddu      $5, $sp, $0
/* 10B8C 00110A8C 3000ACE7 */  swc1       $f12, 0x30($sp)
/* 10B90 00110A90 EC41040C */  jal        __unpack_f
/* 10B94 00110A94 3400ADE7 */   swc1      $f13, 0x34($sp)
/* 10B98 00110A98 1000B027 */  addiu      $16, $sp, 0x10
/* 10B9C 00110A9C 3400A427 */  addiu      $4, $sp, 0x34
/* 10BA0 00110AA0 EC41040C */  jal        __unpack_f
/* 10BA4 00110AA4 2D280002 */   daddu     $5, $16, $0
/* 10BA8 00110AA8 2D280002 */  daddu      $5, $16, $0
/* 10BAC 00110AAC 2000A627 */  addiu      $6, $sp, 0x20
/* 10BB0 00110AB0 1042040C */  jal        _fpadd_parts_2
/* 10BB4 00110AB4 2D20A003 */   daddu     $4, $sp, $0
/* 10BB8 00110AB8 A841040C */  jal        __pack_f
/* 10BBC 00110ABC 2D204000 */   daddu     $4, $2, $0
/* 10BC0 00110AC0 5000BFDF */  ld         $31, 0x50($sp)
/* 10BC4 00110AC4 4000B0DF */  ld         $16, 0x40($sp)
/* 10BC8 00110AC8 0800E003 */  jr         $31
/* 10BCC 00110ACC 6000BD27 */   addiu     $sp, $sp, 0x60
