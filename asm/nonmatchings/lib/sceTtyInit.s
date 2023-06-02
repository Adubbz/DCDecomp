.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceTtyInit
/* 15AE8 001159E8 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 15AEC 001159EC 2D200000 */  daddu      $4, $0, $0
/* 15AF0 001159F0 1000B1FF */  sd         $17, 0x10($sp)
/* 15AF4 001159F4 0000B0FF */  sd         $16, 0x0($sp)
/* 15AF8 001159F8 2000BFFF */  sd         $31, 0x20($sp)
/* 15AFC 001159FC 6851040C */  jal        FlushCache
/* 15B00 00115A00 2A00103C */   lui       $16, (0x2A5510 >> 16)
/* 15B04 00115A04 10551126 */  addiu      $17, $16, %lo(D_002A5510)
/* 15B08 00115A08 1100063C */  lui        $6, %hi(sceTtyHandler)
/* 15B0C 00115A0C 10020424 */  addiu      $4, $0, 0x210
/* 15B10 00115A10 3056C624 */  addiu      $6, $6, %lo(sceTtyHandler)
/* 15B14 00115A14 EA54040C */  jal        sceDeci2Open
/* 15B18 00115A18 2D282002 */   daddu     $5, $17, $0
/* 15B1C 00115A1C 105502AE */  sw         $2, (0x2A5510 & 0xFFFF)($16)
/* 15B20 00115A20 1055028E */  lw         $2, (0x2A5510 & 0xFFFF)($16)
/* 15B24 00115A24 03004104 */  bgez       $2, .L00115A34
/* 15B28 00115A28 2A00043C */   lui       $4, %hi(D_002A5680)
/* 15B2C 00115A2C 18000010 */  b          .L00115A90
/* 15B30 00115A30 2D100000 */   daddu     $2, $0, $0
.L00115A34:
/* 15B34 00115A34 2A00023C */  lui        $2, %hi(D_002A5540)
/* 15B38 00115A38 0C0020AE */  sw         $0, 0xC($17)
/* 15B3C 00115A3C 0020033C */  lui        $3, (0x20000002 >> 16)
/* 15B40 00115A40 80568424 */  addiu      $4, $4, %lo(D_002A5680)
/* 15B44 00115A44 40554224 */  addiu      $2, $2, %lo(D_002A5540)
/* 15B48 00115A48 25104300 */  or         $2, $2, $3
/* 15B4C 00115A4C 040020AE */  sw         $0, 0x4($17)
/* 15B50 00115A50 25208300 */  or         $4, $4, $3
/* 15B54 00115A54 080020AE */  sw         $0, 0x8($17)
/* 15B58 00115A58 140024AE */  sw         $4, 0x14($17)
/* 15B5C 00115A5C 10020624 */  addiu      $6, $0, 0x210
/* 15B60 00115A60 100022AE */  sw         $2, 0x10($17)
/* 15B64 00115A64 45000524 */  addiu      $5, $0, 0x45
/* 15B68 00115A68 48000324 */  addiu      $3, $0, 0x48
/* 15B6C 00115A6C 00010424 */  addiu      $4, $0, 0x100
/* 15B70 00115A70 040046A4 */  sh         $6, (0x20000004 & 0xFFFF)($2)
/* 15B74 00115A74 060045A0 */  sb         $5, (0x20000006 & 0xFFFF)($2)
/* 15B78 00115A78 070043A0 */  sb         $3, (0x20000007 & 0xFFFF)($2)
/* 15B7C 00115A7C 080040AC */  sw         $0, (0x20000008 & 0xFFFF)($2)
/* 15B80 00115A80 6255040C */  jal        QueueInit
/* 15B84 00115A84 020040A4 */   sh        $0, (0x20000002 & 0xFFFF)($2)
/* 15B88 00115A88 180022AE */  sw         $2, 0x18($17)
/* 15B8C 00115A8C 01000224 */  addiu      $2, $0, 0x1
.L00115A90:
/* 15B90 00115A90 2000BFDF */  ld         $31, 0x20($sp)
/* 15B94 00115A94 1000B1DF */  ld         $17, 0x10($sp)
/* 15B98 00115A98 0000B0DF */  ld         $16, 0x0($sp)
/* 15B9C 00115A9C 0800E003 */  jr         $31
/* 15BA0 00115AA0 3000BD27 */   addiu     $sp, $sp, 0x30
/* 15BA4 00115AA4 00000000 */  nop