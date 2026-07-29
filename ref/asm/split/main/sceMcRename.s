.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcRename
/* 01F020 0011EF20 90FFBD27 */  addiu       $29, $29, -0x70
/* 01F024 0011EF24 5000B4FF */  sd          $20, 0x50($29)
/* 01F028 0011EF28 2500143C */  lui         $20, %hi(mcRunCmdNo)
/* 01F02C 0011EF2C 3000B2FF */  sd          $18, 0x30($29)
/* 01F030 0011EF30 380A828E */  lw          $2, %lo(mcRunCmdNo)($20)
/* 01F034 0011EF34 2D90E000 */  daddu       $18, $7, $0
/* 01F038 0011EF38 6000BFFF */  sd          $31, 0x60($29)
/* 01F03C 0011EF3C 4000B3FF */  sd          $19, 0x40($29)
/* 01F040 0011EF40 2000B1FF */  sd          $17, 0x20($29)
/* 01F044 0011EF44 2D004014 */  bnez        $2, .L0011EFFC
/* 01F048 0011EF48 1000B0FF */   sd         $16, 0x10($29)
/* 01F04C 0011EF4C 2B00023C */  lui         $2, %hi(mcClientID)
/* 01F050 0011EF50 40865324 */  addiu       $19, $2, %lo(mcClientID)
/* 01F054 0011EF54 2400638E */  lw          $3, 0x24($19)
/* 01F058 0011EF58 28006010 */  beqz        $3, .L0011EFFC
/* 01F05C 0011EF5C 9CFF0224 */   addiu      $2, $0, -0x64
/* 01F060 0011EF60 2B00023C */  lui         $2, %hi(sifParamFname)
/* 01F064 0011EF64 10000324 */  addiu       $3, $0, 0x10
/* 01F068 0011EF68 F0865124 */  addiu       $17, $2, %lo(sifParamFname)
/* 01F06C 0011EF6C F08644AC */  sw          $4, %lo(sifParamFname)($2)
/* 01F070 0011EF70 040025AE */  sw          $5, 0x4($17)
/* 01F074 0011EF74 14002426 */  addiu       $4, $17, 0x14
/* 01F078 0011EF78 2D28C000 */  daddu       $5, $6, $0
/* 01F07C 0011EF7C 080023AE */  sw          $3, 0x8($17)
/* 01F080 0011EF80 5C16040C */  jal         strncpy
/* 01F084 0011EF84 FF030624 */   addiu      $6, $0, 0x3FF
/* 01F088 0011EF88 2B00103C */  lui         $16, %hi(B_002A86A0)
/* 01F08C 0011EF8C 2D284002 */  daddu       $5, $18, $0
/* 01F090 0011EF90 A0861026 */  addiu       $16, $16, %lo(B_002A86A0)
/* 01F094 0011EF94 130420A2 */  sb          $0, 0x413($17)
/* 01F098 0011EF98 2D200002 */  daddu       $4, $16, $0
/* 01F09C 0011EF9C 5C16040C */  jal         strncpy
/* 01F0A0 0011EFA0 20000624 */   addiu      $6, $0, 0x20
/* 01F0A4 0011EFA4 E0FF1026 */  addiu       $16, $16, -0x20
/* 01F0A8 0011EFA8 2D200000 */  daddu       $4, $0, $0
/* 01F0AC 0011EFAC 100030AE */  sw          $16, 0x10($17)
/* 01F0B0 0011EFB0 6851040C */  jal         FlushCache
/* 01F0B4 0011EFB4 3F0000A2 */   sb         $0, 0x3F($16)
/* 01F0B8 0011EFB8 2B00093C */  lui         $9, %hi(retval)
/* 01F0BC 0011EFBC 2D206002 */  daddu       $4, $19, $0
/* 01F0C0 0011EFC0 2D382002 */  daddu       $7, $17, $0
/* 01F0C4 0011EFC4 009C2925 */  addiu       $9, $9, %lo(retval)
/* 01F0C8 0011EFC8 0000A0AF */  sw          $0, 0x0($29)
/* 01F0CC 0011EFCC 0E000524 */  addiu       $5, $0, 0xE
/* 01F0D0 0011EFD0 01000624 */  addiu       $6, $0, 0x1
/* 01F0D4 0011EFD4 14040824 */  addiu       $8, $0, 0x414
/* 01F0D8 0011EFD8 04000A24 */  addiu       $10, $0, 0x4
/* 01F0DC 0011EFDC 2A5D040C */  jal         sceSifCallRpc
/* 01F0E0 0011EFE0 2D580000 */   daddu      $11, $0, $0
/* 01F0E4 0011EFE4 2D184000 */  daddu       $3, $2, $0
/* 01F0E8 0011EFE8 04006014 */  bnez        $3, .L0011EFFC
/* 01F0EC 0011EFEC 2D106000 */   daddu      $2, $3, $0
/* 01F0F0 0011EFF0 13000224 */  addiu       $2, $0, 0x13
/* 01F0F4 0011EFF4 380A82AE */  sw          $2, %lo(mcRunCmdNo)($20)
/* 01F0F8 0011EFF8 2D106000 */  daddu       $2, $3, $0
.L0011EFFC:
/* 01F0FC 0011EFFC 6000BFDF */  ld          $31, 0x60($29)
/* 01F100 0011F000 5000B4DF */  ld          $20, 0x50($29)
/* 01F104 0011F004 4000B3DF */  ld          $19, 0x40($29)
/* 01F108 0011F008 3000B2DF */  ld          $18, 0x30($29)
/* 01F10C 0011F00C 2000B1DF */  ld          $17, 0x20($29)
/* 01F110 0011F010 1000B0DF */  ld          $16, 0x10($29)
/* 01F114 0011F014 0800E003 */  jr          $31
/* 01F118 0011F018 7000BD27 */   addiu      $29, $29, 0x70
/* 01F11C 0011F01C 00000000 */  nop
