.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel sceMcDelete
/* 1ED60 0011EC60 90FFBD27 */  addiu      $sp, $sp, -0x70
/* 1ED64 0011EC64 5000B4FF */  sd         $20, 0x50($sp)
/* 1ED68 0011EC68 4000B3FF */  sd         $19, 0x40($sp)
/* 1ED6C 0011EC6C 2500143C */  lui        $20, (0x250A38 >> 16)
/* 1ED70 0011EC70 3000B2FF */  sd         $18, 0x30($sp)
/* 1ED74 0011EC74 2D98A000 */  daddu      $19, $5, $0
/* 1ED78 0011EC78 380A828E */  lw         $2, (0x250A38 & 0xFFFF)($20)
/* 1ED7C 0011EC7C 2D908000 */  daddu      $18, $4, $0
/* 1ED80 0011EC80 6000BFFF */  sd         $31, 0x60($sp)
/* 1ED84 0011EC84 2D28C000 */  daddu      $5, $6, $0
/* 1ED88 0011EC88 2000B1FF */  sd         $17, 0x20($sp)
/* 1ED8C 0011EC8C 22004014 */  bnez       $2, .L0011ED18
/* 1ED90 0011EC90 1000B0FF */   sd        $16, 0x10($sp)
/* 1ED94 0011EC94 2B00023C */  lui        $2, %hi(D_002A8640)
/* 1ED98 0011EC98 40865124 */  addiu      $17, $2, %lo(D_002A8640)
/* 1ED9C 0011EC9C 2400238E */  lw         $3, 0x24($17)
/* 1EDA0 0011ECA0 03006014 */  bnez       $3, .L0011ECB0
/* 1EDA4 0011ECA4 2B00103C */   lui       $16, %hi(D_002A8704)
/* 1EDA8 0011ECA8 1B000010 */  b          .L0011ED18
/* 1EDAC 0011ECAC 9CFF0224 */   addiu     $2, $0, -0x64
.L0011ECB0:
/* 1EDB0 0011ECB0 FF030624 */  addiu      $6, $0, 0x3FF
/* 1EDB4 0011ECB4 04871026 */  addiu      $16, $16, %lo(D_002A8704)
/* 1EDB8 0011ECB8 5C16040C */  jal        strncpy
/* 1EDBC 0011ECBC 2D200002 */   daddu     $4, $16, $0
/* 1EDC0 0011ECC0 ECFF0326 */  addiu      $3, $16, -0x14
/* 1EDC4 0011ECC4 ECFF12AE */  sw         $18, -0x14($16)
/* 1EDC8 0011ECC8 040073AC */  sw         $19, 0x4($3)
/* 1EDCC 0011ECCC 2B00093C */  lui        $9, %hi(D_002A9C00)
/* 1EDD0 0011ECD0 130460A0 */  sb         $0, 0x413($3)
/* 1EDD4 0011ECD4 2D202002 */  daddu      $4, $17, $0
/* 1EDD8 0011ECD8 080060AC */  sw         $0, 0x8($3)
/* 1EDDC 0011ECDC 2D386000 */  daddu      $7, $3, $0
/* 1EDE0 0011ECE0 009C2925 */  addiu      $9, $9, %lo(D_002A9C00)
/* 1EDE4 0011ECE4 0F000524 */  addiu      $5, $0, 0xF
/* 1EDE8 0011ECE8 0000A0AF */  sw         $0, 0x0($sp)
/* 1EDEC 0011ECEC 01000624 */  addiu      $6, $0, 0x1
/* 1EDF0 0011ECF0 14040824 */  addiu      $8, $0, 0x414
/* 1EDF4 0011ECF4 04000A24 */  addiu      $10, $0, 0x4
/* 1EDF8 0011ECF8 2A5D040C */  jal        sceSifCallRpc
/* 1EDFC 0011ECFC 2D580000 */   daddu     $11, $0, $0
/* 1EE00 0011ED00 2D184000 */  daddu      $3, $2, $0
/* 1EE04 0011ED04 04006014 */  bnez       $3, .L0011ED18
/* 1EE08 0011ED08 2D106000 */   daddu     $2, $3, $0
/* 1EE0C 0011ED0C 0F000224 */  addiu      $2, $0, 0xF
/* 1EE10 0011ED10 380A82AE */  sw         $2, (0x250A38 & 0xFFFF)($20)
/* 1EE14 0011ED14 2D106000 */  daddu      $2, $3, $0
.L0011ED18:
/* 1EE18 0011ED18 6000BFDF */  ld         $31, 0x60($sp)
/* 1EE1C 0011ED1C 5000B4DF */  ld         $20, 0x50($sp)
/* 1EE20 0011ED20 4000B3DF */  ld         $19, 0x40($sp)
/* 1EE24 0011ED24 3000B2DF */  ld         $18, 0x30($sp)
/* 1EE28 0011ED28 2000B1DF */  ld         $17, 0x20($sp)
/* 1EE2C 0011ED2C 1000B0DF */  ld         $16, 0x10($sp)
/* 1EE30 0011ED30 0800E003 */  jr         $31
/* 1EE34 0011ED34 7000BD27 */   addiu     $sp, $sp, 0x70
