.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __kernel_cos
/* 01AEE8 0011ADE8 70FFBD27 */  addiu       $29, $29, -0x90
/* 01AEEC 0011ADEC 7000B6FF */  sd          $22, 0x70($29)
/* 01AEF0 0011ADF0 5000B4FF */  sd          $20, 0x50($29)
/* 01AEF4 0011ADF4 8000BFFF */  sd          $31, 0x80($29)
/* 01AEF8 0011ADF8 2DA08000 */  daddu       $20, $4, $0
/* 01AEFC 0011ADFC 6000B5FF */  sd          $21, 0x60($29)
/* 01AF00 0011AE00 4000B3FF */  sd          $19, 0x40($29)
/* 01AF04 0011AE04 3000B2FF */  sd          $18, 0x30($29)
/* 01AF08 0011AE08 2000B1FF */  sd          $17, 0x20($29)
/* 01AF0C 0011AE0C 1000B0FF */  sd          $16, 0x10($29)
/* 01AF10 0011AE10 2D108002 */  daddu       $2, $20, $0
/* 01AF14 0011AE14 3F800200 */  dsra32      $16, $2, 0
/* 01AF18 0011AE18 FF7F033C */  lui         $3, (0x7FFFFFFF >> 16)
/* 01AF1C 0011AE1C FFFF6334 */  ori         $3, $3, (0x7FFFFFFF & 0xFFFF)
/* 01AF20 0011AE20 3F3E023C */  lui         $2, (0x3E3FFFFF >> 16)
/* 01AF24 0011AE24 24800302 */  and         $16, $16, $3
/* 01AF28 0011AE28 FFFF4234 */  ori         $2, $2, (0x3E3FFFFF & 0xFFFF)
/* 01AF2C 0011AE2C 2A105000 */  slt         $2, $2, $16
/* 01AF30 0011AE30 09004014 */  bnez        $2, .L0011AE58
/* 01AF34 0011AE34 2DB0A000 */   daddu      $22, $5, $0
/* 01AF38 0011AE38 2A41040C */  jal         dptoli
/* 01AF3C 0011AE3C 00000000 */   nop
/* 01AF40 0011AE40 06004014 */  bnez        $2, .L0011AE5C
/* 01AF44 0011AE44 2D208002 */   daddu      $4, $20, $0
/* 01AF48 0011AE48 C0FF0234 */  ori         $2, $0, 0xFFC0
/* 01AF4C 0011AE4C BC130200 */  dsll32      $2, $2, 14
/* 01AF50 0011AE50 6F000010 */  b           .L0011B010
/* 01AF54 0011AE54 8000BFDF */   ld         $31, 0x80($29)
.L0011AE58:
/* 01AF58 0011AE58 2D208002 */  daddu       $4, $20, $0
.L0011AE5C:
/* 01AF5C 0011AE5C 9E3F040C */  jal         dpmul
/* 01AF60 0011AE60 2D288002 */   daddu      $5, $20, $0
/* 01AF64 0011AE64 2D984000 */  daddu       $19, $2, $0
/* 01AF68 0011AE68 2A00013C */  lui         $1, %hi(RO_002987C8)
/* 01AF6C 0011AE6C C88725DC */  ld          $5, %lo(RO_002987C8)($1)
/* 01AF70 0011AE70 9E3F040C */  jal         dpmul
/* 01AF74 0011AE74 2D206002 */   daddu      $4, $19, $0
/* 01AF78 0011AE78 2A00013C */  lui         $1, %hi(RO_002987D0)
/* 01AF7C 0011AE7C D08725DC */  ld          $5, %lo(RO_002987D0)($1)
/* 01AF80 0011AE80 6E3F040C */  jal         dpadd
/* 01AF84 0011AE84 2D204000 */   daddu      $4, $2, $0
/* 01AF88 0011AE88 2D284000 */  daddu       $5, $2, $0
/* 01AF8C 0011AE8C 9E3F040C */  jal         dpmul
/* 01AF90 0011AE90 2D206002 */   daddu      $4, $19, $0
/* 01AF94 0011AE94 2A00013C */  lui         $1, %hi(RO_002987D8)
/* 01AF98 0011AE98 D88725DC */  ld          $5, %lo(RO_002987D8)($1)
/* 01AF9C 0011AE9C 6E3F040C */  jal         dpadd
/* 01AFA0 0011AEA0 2D204000 */   daddu      $4, $2, $0
/* 01AFA4 0011AEA4 2D284000 */  daddu       $5, $2, $0
/* 01AFA8 0011AEA8 9E3F040C */  jal         dpmul
/* 01AFAC 0011AEAC 2D206002 */   daddu      $4, $19, $0
/* 01AFB0 0011AEB0 2A00013C */  lui         $1, %hi(RO_002987E0)
/* 01AFB4 0011AEB4 E08725DC */  ld          $5, %lo(RO_002987E0)($1)
/* 01AFB8 0011AEB8 6E3F040C */  jal         dpadd
/* 01AFBC 0011AEBC 2D204000 */   daddu      $4, $2, $0
/* 01AFC0 0011AEC0 2D284000 */  daddu       $5, $2, $0
/* 01AFC4 0011AEC4 9E3F040C */  jal         dpmul
/* 01AFC8 0011AEC8 2D206002 */   daddu      $4, $19, $0
/* 01AFCC 0011AECC 2A00013C */  lui         $1, %hi(RO_002987E8)
/* 01AFD0 0011AED0 E88725DC */  ld          $5, %lo(RO_002987E8)($1)
/* 01AFD4 0011AED4 6E3F040C */  jal         dpadd
/* 01AFD8 0011AED8 2D204000 */   daddu      $4, $2, $0
/* 01AFDC 0011AEDC 2D284000 */  daddu       $5, $2, $0
/* 01AFE0 0011AEE0 9E3F040C */  jal         dpmul
/* 01AFE4 0011AEE4 2D206002 */   daddu      $4, $19, $0
/* 01AFE8 0011AEE8 2A00013C */  lui         $1, %hi(RO_002987F0)
/* 01AFEC 0011AEEC F08725DC */  ld          $5, %lo(RO_002987F0)($1)
/* 01AFF0 0011AEF0 6E3F040C */  jal         dpadd
/* 01AFF4 0011AEF4 2D204000 */   daddu      $4, $2, $0
/* 01AFF8 0011AEF8 2D284000 */  daddu       $5, $2, $0
/* 01AFFC 0011AEFC 9E3F040C */  jal         dpmul
/* 01B000 0011AF00 2D206002 */   daddu      $4, $19, $0
/* 01B004 0011AF04 2DA84000 */  daddu       $21, $2, $0
/* 01B008 0011AF08 D33F023C */  lui         $2, (0x3FD33332 >> 16)
/* 01B00C 0011AF0C 32334234 */  ori         $2, $2, (0x3FD33332 & 0xFFFF)
/* 01B010 0011AF10 2A105000 */  slt         $2, $2, $16
/* 01B014 0011AF14 17004014 */  bnez        $2, .L0011AF74
/* 01B018 0011AF18 E93F023C */   lui        $2, (0x3FE90000 >> 16)
/* 01B01C 0011AF1C 80FF0534 */  ori         $5, $0, 0xFF80
/* 01B020 0011AF20 BC2B0500 */  dsll32      $5, $5, 14
/* 01B024 0011AF24 9E3F040C */  jal         dpmul
/* 01B028 0011AF28 2D206002 */   daddu      $4, $19, $0
/* 01B02C 0011AF2C 2D884000 */  daddu       $17, $2, $0
/* 01B030 0011AF30 2D206002 */  daddu       $4, $19, $0
/* 01B034 0011AF34 9E3F040C */  jal         dpmul
/* 01B038 0011AF38 2D28A002 */   daddu      $5, $21, $0
/* 01B03C 0011AF3C 2D804000 */  daddu       $16, $2, $0
/* 01B040 0011AF40 2D208002 */  daddu       $4, $20, $0
/* 01B044 0011AF44 9E3F040C */  jal         dpmul
/* 01B048 0011AF48 2D28C002 */   daddu      $5, $22, $0
/* 01B04C 0011AF4C 2D200002 */  daddu       $4, $16, $0
/* 01B050 0011AF50 843F040C */  jal         dpsub
/* 01B054 0011AF54 2D284000 */   daddu      $5, $2, $0
/* 01B058 0011AF58 2D202002 */  daddu       $4, $17, $0
/* 01B05C 0011AF5C 843F040C */  jal         dpsub
/* 01B060 0011AF60 2D284000 */   daddu      $5, $2, $0
/* 01B064 0011AF64 C0FF0434 */  ori         $4, $0, 0xFFC0
/* 01B068 0011AF68 BC230400 */  dsll32      $4, $4, 14
/* 01B06C 0011AF6C 25000010 */  b           .L0011B004
/* 01B070 0011AF70 00000000 */   nop
.L0011AF74:
/* 01B074 0011AF74 2A105000 */  slt         $2, $2, $16
/* 01B078 0011AF78 05004010 */  beqz        $2, .L0011AF90
/* 01B07C 0011AF7C E0FF023C */   lui        $2, (0xFFE00000 >> 16)
/* 01B080 0011AF80 48FF1134 */  ori         $17, $0, 0xFF48
/* 01B084 0011AF84 BC8B1100 */  dsll32      $17, $17, 14
/* 01B088 0011AF88 03000010 */  b           .L0011AF98
/* 01B08C 0011AF8C 00000000 */   nop
.L0011AF90:
/* 01B090 0011AF90 21100202 */  addu        $2, $16, $2
/* 01B094 0011AF94 3C880200 */  dsll32      $17, $2, 0
.L0011AF98:
/* 01B098 0011AF98 80FF0534 */  ori         $5, $0, 0xFF80
/* 01B09C 0011AF9C BC2B0500 */  dsll32      $5, $5, 14
/* 01B0A0 0011AFA0 9E3F040C */  jal         dpmul
/* 01B0A4 0011AFA4 2D206002 */   daddu      $4, $19, $0
/* 01B0A8 0011AFA8 2D282002 */  daddu       $5, $17, $0
/* 01B0AC 0011AFAC 843F040C */  jal         dpsub
/* 01B0B0 0011AFB0 2D204000 */   daddu      $4, $2, $0
/* 01B0B4 0011AFB4 C0FF0434 */  ori         $4, $0, 0xFFC0
/* 01B0B8 0011AFB8 BC230400 */  dsll32      $4, $4, 14
/* 01B0BC 0011AFBC 2D804000 */  daddu       $16, $2, $0
/* 01B0C0 0011AFC0 843F040C */  jal         dpsub
/* 01B0C4 0011AFC4 2D282002 */   daddu      $5, $17, $0
/* 01B0C8 0011AFC8 2D904000 */  daddu       $18, $2, $0
/* 01B0CC 0011AFCC 2D206002 */  daddu       $4, $19, $0
/* 01B0D0 0011AFD0 9E3F040C */  jal         dpmul
/* 01B0D4 0011AFD4 2D28A002 */   daddu      $5, $21, $0
/* 01B0D8 0011AFD8 2D884000 */  daddu       $17, $2, $0
/* 01B0DC 0011AFDC 2D208002 */  daddu       $4, $20, $0
/* 01B0E0 0011AFE0 9E3F040C */  jal         dpmul
/* 01B0E4 0011AFE4 2D28C002 */   daddu      $5, $22, $0
/* 01B0E8 0011AFE8 2D202002 */  daddu       $4, $17, $0
/* 01B0EC 0011AFEC 843F040C */  jal         dpsub
/* 01B0F0 0011AFF0 2D284000 */   daddu      $5, $2, $0
/* 01B0F4 0011AFF4 2D200002 */  daddu       $4, $16, $0
/* 01B0F8 0011AFF8 843F040C */  jal         dpsub
/* 01B0FC 0011AFFC 2D284000 */   daddu      $5, $2, $0
/* 01B100 0011B000 2D204002 */  daddu       $4, $18, $0
.L0011B004:
/* 01B104 0011B004 843F040C */  jal         dpsub
/* 01B108 0011B008 2D284000 */   daddu      $5, $2, $0
/* 01B10C 0011B00C 8000BFDF */  ld          $31, 0x80($29)
.L0011B010:
/* 01B110 0011B010 7000B6DF */  ld          $22, 0x70($29)
/* 01B114 0011B014 6000B5DF */  ld          $21, 0x60($29)
/* 01B118 0011B018 5000B4DF */  ld          $20, 0x50($29)
/* 01B11C 0011B01C 4000B3DF */  ld          $19, 0x40($29)
/* 01B120 0011B020 3000B2DF */  ld          $18, 0x30($29)
/* 01B124 0011B024 2000B1DF */  ld          $17, 0x20($29)
/* 01B128 0011B028 1000B0DF */  ld          $16, 0x10($29)
/* 01B12C 0011B02C 0800E003 */  jr          $31
/* 01B130 0011B030 9000BD27 */   addiu      $29, $29, 0x90
/* 01B134 0011B034 00000000 */  nop
