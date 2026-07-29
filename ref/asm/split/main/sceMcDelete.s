.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcDelete
/* 01ED60 0011EC60 90FFBD27 */  addiu       $29, $29, -0x70
/* 01ED64 0011EC64 5000B4FF */  sd          $20, 0x50($29)
/* 01ED68 0011EC68 4000B3FF */  sd          $19, 0x40($29)
/* 01ED6C 0011EC6C 2500143C */  lui         $20, %hi(mcRunCmdNo)
/* 01ED70 0011EC70 3000B2FF */  sd          $18, 0x30($29)
/* 01ED74 0011EC74 2D98A000 */  daddu       $19, $5, $0
/* 01ED78 0011EC78 380A828E */  lw          $2, %lo(mcRunCmdNo)($20)
/* 01ED7C 0011EC7C 2D908000 */  daddu       $18, $4, $0
/* 01ED80 0011EC80 6000BFFF */  sd          $31, 0x60($29)
/* 01ED84 0011EC84 2D28C000 */  daddu       $5, $6, $0
/* 01ED88 0011EC88 2000B1FF */  sd          $17, 0x20($29)
/* 01ED8C 0011EC8C 22004014 */  bnez        $2, .L0011ED18
/* 01ED90 0011EC90 1000B0FF */   sd         $16, 0x10($29)
/* 01ED94 0011EC94 2B00023C */  lui         $2, %hi(mcClientID)
/* 01ED98 0011EC98 40865124 */  addiu       $17, $2, %lo(mcClientID)
/* 01ED9C 0011EC9C 2400238E */  lw          $3, 0x24($17)
/* 01EDA0 0011ECA0 03006014 */  bnez        $3, .L0011ECB0
/* 01EDA4 0011ECA4 2B00103C */   lui        $16, %hi(B_002A8704)
/* 01EDA8 0011ECA8 1B000010 */  b           .L0011ED18
/* 01EDAC 0011ECAC 9CFF0224 */   addiu      $2, $0, -0x64
.L0011ECB0:
/* 01EDB0 0011ECB0 FF030624 */  addiu       $6, $0, 0x3FF
/* 01EDB4 0011ECB4 04871026 */  addiu       $16, $16, %lo(B_002A8704)
/* 01EDB8 0011ECB8 5C16040C */  jal         strncpy
/* 01EDBC 0011ECBC 2D200002 */   daddu      $4, $16, $0
/* 01EDC0 0011ECC0 ECFF0326 */  addiu       $3, $16, -0x14
/* 01EDC4 0011ECC4 ECFF12AE */  sw          $18, -0x14($16)
/* 01EDC8 0011ECC8 040073AC */  sw          $19, 0x4($3)
/* 01EDCC 0011ECCC 2B00093C */  lui         $9, %hi(retval)
/* 01EDD0 0011ECD0 130460A0 */  sb          $0, 0x413($3)
/* 01EDD4 0011ECD4 2D202002 */  daddu       $4, $17, $0
/* 01EDD8 0011ECD8 080060AC */  sw          $0, 0x8($3)
/* 01EDDC 0011ECDC 2D386000 */  daddu       $7, $3, $0
/* 01EDE0 0011ECE0 009C2925 */  addiu       $9, $9, %lo(retval)
/* 01EDE4 0011ECE4 0F000524 */  addiu       $5, $0, 0xF
/* 01EDE8 0011ECE8 0000A0AF */  sw          $0, 0x0($29)
/* 01EDEC 0011ECEC 01000624 */  addiu       $6, $0, 0x1
/* 01EDF0 0011ECF0 14040824 */  addiu       $8, $0, 0x414
/* 01EDF4 0011ECF4 04000A24 */  addiu       $10, $0, 0x4
/* 01EDF8 0011ECF8 2A5D040C */  jal         sceSifCallRpc
/* 01EDFC 0011ECFC 2D580000 */   daddu      $11, $0, $0
/* 01EE00 0011ED00 2D184000 */  daddu       $3, $2, $0
/* 01EE04 0011ED04 04006014 */  bnez        $3, .L0011ED18
/* 01EE08 0011ED08 2D106000 */   daddu      $2, $3, $0
/* 01EE0C 0011ED0C 0F000224 */  addiu       $2, $0, 0xF
/* 01EE10 0011ED10 380A82AE */  sw          $2, %lo(mcRunCmdNo)($20)
/* 01EE14 0011ED14 2D106000 */  daddu       $2, $3, $0
.L0011ED18:
/* 01EE18 0011ED18 6000BFDF */  ld          $31, 0x60($29)
/* 01EE1C 0011ED1C 5000B4DF */  ld          $20, 0x50($29)
/* 01EE20 0011ED20 4000B3DF */  ld          $19, 0x40($29)
/* 01EE24 0011ED24 3000B2DF */  ld          $18, 0x30($29)
/* 01EE28 0011ED28 2000B1DF */  ld          $17, 0x20($29)
/* 01EE2C 0011ED2C 1000B0DF */  ld          $16, 0x10($29)
/* 01EE30 0011ED30 0800E003 */  jr          $31
/* 01EE34 0011ED34 7000BD27 */   addiu      $29, $29, 0x70
