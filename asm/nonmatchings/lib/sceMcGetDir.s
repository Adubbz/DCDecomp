.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMcGetDir
/* 1EA78 0011E978 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 1EA7C 0011E97C 2D50A000 */  daddu      $10, $5, $0
/* 1EA80 0011E980 5000B4FF */  sd         $20, 0x50($sp)
/* 1EA84 0011E984 2D28C000 */  daddu      $5, $6, $0
/* 1EA88 0011E988 2500143C */  lui        $20, (0x250A38 >> 16)
/* 1EA8C 0011E98C 3000B2FF */  sd         $18, 0x30($sp)
/* 1EA90 0011E990 2000B1FF */  sd         $17, 0x20($sp)
/* 1EA94 0011E994 2D900001 */  daddu      $18, $8, $0
/* 1EA98 0011E998 380A828E */  lw         $2, (0x250A38 & 0xFFFF)($20)
/* 1EA9C 0011E99C 2D882001 */  daddu      $17, $9, $0
/* 1EAA0 0011E9A0 6000BFFF */  sd         $31, 0x60($sp)
/* 1EAA4 0011E9A4 4000B3FF */  sd         $19, 0x40($sp)
/* 1EAA8 0011E9A8 25004014 */  bnez       $2, .L0011EA40
/* 1EAAC 0011E9AC 1000B0FF */   sd        $16, 0x10($sp)
/* 1EAB0 0011E9B0 2B00023C */  lui        $2, %hi(D_002A8640)
/* 1EAB4 0011E9B4 40865324 */  addiu      $19, $2, %lo(D_002A8640)
/* 1EAB8 0011E9B8 2400638E */  lw         $3, 0x24($19)
/* 1EABC 0011E9BC 20006010 */  beqz       $3, .L0011EA40
/* 1EAC0 0011E9C0 9CFF0224 */   addiu     $2, $0, -0x64
/* 1EAC4 0011E9C4 2B00023C */  lui        $2, %hi(D_002A86F0)
/* 1EAC8 0011E9C8 FF030624 */  addiu      $6, $0, 0x3FF
/* 1EACC 0011E9CC F0865024 */  addiu      $16, $2, %lo(D_002A86F0)
/* 1EAD0 0011E9D0 F08644AC */  sw         $4, -0x7910($2)
/* 1EAD4 0011E9D4 04000AAE */  sw         $10, 0x4($16)
/* 1EAD8 0011E9D8 14000426 */  addiu      $4, $16, 0x14
/* 1EADC 0011E9DC 080007AE */  sw         $7, 0x8($16)
/* 1EAE0 0011E9E0 0C0012AE */  sw         $18, 0xC($16)
/* 1EAE4 0011E9E4 5C16040C */  jal        strncpy
/* 1EAE8 0011E9E8 100011AE */   sw        $17, 0x10($16)
/* 1EAEC 0011E9EC 2D202002 */  daddu      $4, $17, $0
/* 1EAF0 0011E9F0 80291200 */  sll        $5, $18, 6
/* 1EAF4 0011E9F4 E65A040C */  jal        sceSifWriteBackDCache
/* 1EAF8 0011E9F8 130400A2 */   sb        $0, 0x413($16)
/* 1EAFC 0011E9FC 2B00093C */  lui        $9, %hi(D_002A9C00)
/* 1EB00 0011EA00 2D206002 */  daddu      $4, $19, $0
/* 1EB04 0011EA04 2D380002 */  daddu      $7, $16, $0
/* 1EB08 0011EA08 009C2925 */  addiu      $9, $9, %lo(D_002A9C00)
/* 1EB0C 0011EA0C 0000A0AF */  sw         $0, 0x0($sp)
/* 1EB10 0011EA10 0D000524 */  addiu      $5, $0, 0xD
/* 1EB14 0011EA14 01000624 */  addiu      $6, $0, 0x1
/* 1EB18 0011EA18 14040824 */  addiu      $8, $0, 0x414
/* 1EB1C 0011EA1C 04000A24 */  addiu      $10, $0, 0x4
/* 1EB20 0011EA20 2A5D040C */  jal        sceSifCallRpc
/* 1EB24 0011EA24 2D580000 */   daddu     $11, $0, $0
/* 1EB28 0011EA28 2D184000 */  daddu      $3, $2, $0
/* 1EB2C 0011EA2C 04006014 */  bnez       $3, .L0011EA40
/* 1EB30 0011EA30 2D106000 */   daddu     $2, $3, $0
/* 1EB34 0011EA34 0D000224 */  addiu      $2, $0, 0xD
/* 1EB38 0011EA38 380A82AE */  sw         $2, (0x250A38 & 0xFFFF)($20)
/* 1EB3C 0011EA3C 2D106000 */  daddu      $2, $3, $0
.L0011EA40:
/* 1EB40 0011EA40 6000BFDF */  ld         $31, 0x60($sp)
/* 1EB44 0011EA44 5000B4DF */  ld         $20, 0x50($sp)
/* 1EB48 0011EA48 4000B3DF */  ld         $19, 0x40($sp)
/* 1EB4C 0011EA4C 3000B2DF */  ld         $18, 0x30($sp)
/* 1EB50 0011EA50 2000B1DF */  ld         $17, 0x20($sp)
/* 1EB54 0011EA54 1000B0DF */  ld         $16, 0x10($sp)
/* 1EB58 0011EA58 0800E003 */  jr         $31
/* 1EB5C 0011EA5C 7000BD27 */   addiu     $sp, $sp, 0x70
