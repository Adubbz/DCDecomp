.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel ItemShopGoodInitialize__Fi
/* 0EDFA0 001EDEA0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 0EDFA4 001EDEA4 4000BF7F */  sq          $31, 0x40($29)
/* 0EDFA8 001EDEA8 3000B37F */  sq          $19, 0x30($29)
/* 0EDFAC 001EDEAC 2000B27F */  sq          $18, 0x20($29)
/* 0EDFB0 001EDEB0 1000B17F */  sq          $17, 0x10($29)
/* 0EDFB4 001EDEB4 0000B07F */  sq          $16, 0x0($29)
/* 0EDFB8 001EDEB8 349A070C */  jal         GetItemShopList__Fi
/* 0EDFBC 001EDEBC 00000000 */   nop
/* 0EDFC0 001EDEC0 28864070 */  paddub      $16, $2, $0
/* 0EDFC4 001EDEC4 288E0070 */  paddub      $17, $0, $0
/* 0EDFC8 001EDEC8 65000010 */  b           .L001EE060
/* 0EDFCC 001EDECC 00000000 */   nop
.L001EDED0:
/* 0EDFD0 001EDED0 40101100 */  sll         $2, $17, 1
/* 0EDFD4 001EDED4 21100202 */  addu        $2, $16, $2
/* 0EDFD8 001EDED8 00005284 */  lh          $18, 0x0($2)
/* 0EDFDC 001EDEDC 5100422A */  slti        $2, $18, 0x51
/* 0EDFE0 001EDEE0 51004014 */  bnez        $2, .L001EE028
/* 0EDFE4 001EDEE4 00000000 */   nop
/* 0EDFE8 001EDEE8 28264072 */  paddub      $4, $18, $0
/* 0EDFEC 001EDEEC 88C7080C */  jal         WhatIsKindofItem__Fi
/* 0EDFF0 001EDEF0 00000000 */   nop
/* 0EDFF4 001EDEF4 2B004010 */  beqz        $2, .L001EDFA4
/* 0EDFF8 001EDEF8 00000000 */   nop
/* 0EDFFC 001EDEFC 02000324 */  addiu       $3, $0, 0x2
/* 0EE000 001EDF00 11004310 */  beq         $2, $3, .L001EDF48
/* 0EE004 001EDF04 00000000 */   nop
/* 0EE008 001EDF08 01000324 */  addiu       $3, $0, 0x1
/* 0EE00C 001EDF0C 03004310 */  beq         $2, $3, .L001EDF1C
/* 0EE010 001EDF10 00000000 */   nop
/* 0EE014 001EDF14 2E000010 */  b           .L001EDFD0
/* 0EE018 001EDF18 00000000 */   nop
.L001EDF1C:
/* 0EE01C 001EDF1C 80111100 */  sll         $2, $17, 6
/* 0EE020 001EDF20 23105100 */  subu        $2, $2, $17
/* 0EE024 001EDF24 80180200 */  sll         $3, $2, 2
/* 0EE028 001EDF28 A094828F */  lw          $2, -0x6B60($28)
/* 0EE02C 001EDF2C 21104300 */  addu        $2, $2, $3
/* 0EE030 001EDF30 28264072 */  paddub      $4, $18, $0
/* 0EE034 001EDF34 04004524 */  addiu       $5, $2, 0x4
/* 0EE038 001EDF38 24C9080C */  jal         WepDataListToHaveCopy__FiP11WEAPON_HAVE
/* 0EE03C 001EDF3C 00000000 */   nop
/* 0EE040 001EDF40 2C000010 */  b           .L001EDFF4
/* 0EE044 001EDF44 00000000 */   nop
.L001EDF48:
/* 0EE048 001EDF48 80111100 */  sll         $2, $17, 6
/* 0EE04C 001EDF4C 23105100 */  subu        $2, $2, $17
/* 0EE050 001EDF50 80980200 */  sll         $19, $2, 2
/* 0EE054 001EDF54 A094828F */  lw          $2, -0x6B60($28)
/* 0EE058 001EDF58 21105300 */  addu        $2, $2, $19
/* 0EE05C 001EDF5C 28264072 */  paddub      $4, $18, $0
/* 0EE060 001EDF60 04004524 */  addiu       $5, $2, 0x4
/* 0EE064 001EDF64 94C9080C */  jal         AttachDataListToHaveCopy__FiP11ATTACH_LIST
/* 0EE068 001EDF68 00000000 */   nop
/* 0EE06C 001EDF6C 5B00422A */  slti        $2, $18, 0x5B
/* 0EE070 001EDF70 20004014 */  bnez        $2, .L001EDFF4
/* 0EE074 001EDF74 00000000 */   nop
/* 0EE078 001EDF78 5F00412A */  slti        $1, $18, 0x5F
/* 0EE07C 001EDF7C 1D002010 */  beqz        $1, .L001EDFF4
/* 0EE080 001EDF80 00000000 */   nop
/* 0EE084 001EDF84 01000424 */  addiu       $4, $0, 0x1
/* 0EE088 001EDF88 A094828F */  lw          $2, -0x6B60($28)
/* 0EE08C 001EDF8C 21186202 */  addu        $3, $19, $2
/* 0EE090 001EDF90 40101200 */  sll         $2, $18, 1
/* 0EE094 001EDF94 21104300 */  addu        $2, $2, $3
/* 0EE098 001EDF98 56FF44A4 */  sh          $4, -0xAA($2)
/* 0EE09C 001EDF9C 15000010 */  b           .L001EDFF4
/* 0EE0A0 001EDFA0 00000000 */   nop
.L001EDFA4:
/* 0EE0A4 001EDFA4 28264072 */  paddub      $4, $18, $0
/* 0EE0A8 001EDFA8 B0C9080C */  jal         ItemDataToHaveCopy__Fi
/* 0EE0AC 001EDFAC 00000000 */   nop
/* 0EE0B0 001EDFB0 A094848F */  lw          $4, -0x6B60($28)
/* 0EE0B4 001EDFB4 80191100 */  sll         $3, $17, 6
/* 0EE0B8 001EDFB8 23187100 */  subu        $3, $3, $17
/* 0EE0BC 001EDFBC 80180300 */  sll         $3, $3, 2
/* 0EE0C0 001EDFC0 21186400 */  addu        $3, $3, $4
/* 0EE0C4 001EDFC4 040062AC */  sw          $2, 0x4($3)
/* 0EE0C8 001EDFC8 0A000010 */  b           .L001EDFF4
/* 0EE0CC 001EDFCC 00000000 */   nop
.L001EDFD0:
/* 0EE0D0 001EDFD0 80111100 */  sll         $2, $17, 6
/* 0EE0D4 001EDFD4 23105100 */  subu        $2, $2, $17
/* 0EE0D8 001EDFD8 80180200 */  sll         $3, $2, 2
/* 0EE0DC 001EDFDC A094828F */  lw          $2, -0x6B60($28)
/* 0EE0E0 001EDFE0 21204300 */  addu        $4, $2, $3
/* 0EE0E4 001EDFE4 282E0070 */  paddub      $5, $0, $0
/* 0EE0E8 001EDFE8 FC000624 */  addiu       $6, $0, 0xFC
/* 0EE0EC 001EDFEC 5A0D040C */  jal         memset
/* 0EE0F0 001EDFF0 00000000 */   nop
.L001EDFF4:
/* 0EE0F4 001EDFF4 80111100 */  sll         $2, $17, 6
/* 0EE0F8 001EDFF8 23105100 */  subu        $2, $2, $17
/* 0EE0FC 001EDFFC 80180200 */  sll         $3, $2, 2
/* 0EE100 001EE000 A094828F */  lw          $2, -0x6B60($28)
/* 0EE104 001EE004 21104300 */  addu        $2, $2, $3
/* 0EE108 001EE008 000052A4 */  sh          $18, 0x0($2)
/* 0EE10C 001EE00C 01000424 */  addiu       $4, $0, 0x1
/* 0EE110 001EE010 80181100 */  sll         $3, $17, 2
/* 0EE114 001EE014 9094828F */  lw          $2, -0x6B70($28)
/* 0EE118 001EE018 21104300 */  addu        $2, $2, $3
/* 0EE11C 001EE01C 000044AC */  sw          $4, 0x0($2)
/* 0EE120 001EE020 0E000010 */  b           .L001EE05C
/* 0EE124 001EE024 00000000 */   nop
.L001EE028:
/* 0EE128 001EE028 80111100 */  sll         $2, $17, 6
/* 0EE12C 001EE02C 23105100 */  subu        $2, $2, $17
/* 0EE130 001EE030 80180200 */  sll         $3, $2, 2
/* 0EE134 001EE034 A094828F */  lw          $2, -0x6B60($28)
/* 0EE138 001EE038 21204300 */  addu        $4, $2, $3
/* 0EE13C 001EE03C 282E0070 */  paddub      $5, $0, $0
/* 0EE140 001EE040 FC000624 */  addiu       $6, $0, 0xFC
/* 0EE144 001EE044 5A0D040C */  jal         memset
/* 0EE148 001EE048 00000000 */   nop
/* 0EE14C 001EE04C 80181100 */  sll         $3, $17, 2
/* 0EE150 001EE050 9094828F */  lw          $2, -0x6B70($28)
/* 0EE154 001EE054 21104300 */  addu        $2, $2, $3
/* 0EE158 001EE058 000040AC */  sw          $0, 0x0($2)
.L001EE05C:
/* 0EE15C 001EE05C 01003126 */  addiu       $17, $17, 0x1
.L001EE060:
/* 0EE160 001EE060 1400222A */  slti        $2, $17, 0x14
/* 0EE164 001EE064 9AFF4014 */  bnez        $2, .L001EDED0
/* 0EE168 001EE068 00000000 */   nop
/* 0EE16C 001EE06C 14001024 */  addiu       $16, $0, 0x14
/* 0EE170 001EE070 0F000010 */  b           .L001EE0B0
/* 0EE174 001EE074 00000000 */   nop
.L001EE078:
/* 0EE178 001EE078 80181000 */  sll         $3, $16, 2
/* 0EE17C 001EE07C 9094828F */  lw          $2, -0x6B70($28)
/* 0EE180 001EE080 21104300 */  addu        $2, $2, $3
/* 0EE184 001EE084 000040AC */  sw          $0, 0x0($2)
/* 0EE188 001EE088 80111000 */  sll         $2, $16, 6
/* 0EE18C 001EE08C 23105000 */  subu        $2, $2, $16
/* 0EE190 001EE090 80180200 */  sll         $3, $2, 2
/* 0EE194 001EE094 A094828F */  lw          $2, -0x6B60($28)
/* 0EE198 001EE098 21204300 */  addu        $4, $2, $3
/* 0EE19C 001EE09C 282E0070 */  paddub      $5, $0, $0
/* 0EE1A0 001EE0A0 FC000624 */  addiu       $6, $0, 0xFC
/* 0EE1A4 001EE0A4 5A0D040C */  jal         memset
/* 0EE1A8 001EE0A8 00000000 */   nop
/* 0EE1AC 001EE0AC 01001026 */  addiu       $16, $16, 0x1
.L001EE0B0:
/* 0EE1B0 001EE0B0 1E00022A */  slti        $2, $16, 0x1E
/* 0EE1B4 001EE0B4 F0FF4014 */  bnez        $2, .L001EE078
/* 0EE1B8 001EE0B8 00000000 */   nop
/* 0EE1BC 001EE0BC 88AE070C */  jal         ShopSpecialFunc__Fv
/* 0EE1C0 001EE0C0 00000000 */   nop
/* 0EE1C4 001EE0C4 F49B070C */  jal         InitAllHaveData__Fv
/* 0EE1C8 001EE0C8 00000000 */   nop
/* 0EE1CC 001EE0CC 4000BF7B */  lq          $31, 0x40($29)
/* 0EE1D0 001EE0D0 3000B37B */  lq          $19, 0x30($29)
/* 0EE1D4 001EE0D4 2000B27B */  lq          $18, 0x20($29)
/* 0EE1D8 001EE0D8 1000B17B */  lq          $17, 0x10($29)
/* 0EE1DC 001EE0DC 0000B07B */  lq          $16, 0x0($29)
/* 0EE1E0 001EE0E0 5000BD27 */  addiu       $29, $29, 0x50
/* 0EE1E4 001EE0E4 0800E003 */  jr          $31
/* 0EE1E8 001EE0E8 00000000 */   nop
/* 0EE1EC 001EE0EC 00000000 */  nop
