.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ItemShopGoodInitialize__Fi
/* EDFA0 001EDEA0 B0FFBD27 */  addiu      $sp, $sp, -0x50
/* EDFA4 001EDEA4 4000BF7F */  sq         $31, 0x40($sp)
/* EDFA8 001EDEA8 3000B37F */  sq         $19, 0x30($sp)
/* EDFAC 001EDEAC 2000B27F */  sq         $18, 0x20($sp)
/* EDFB0 001EDEB0 1000B17F */  sq         $17, 0x10($sp)
/* EDFB4 001EDEB4 0000B07F */  sq         $16, 0x0($sp)
/* EDFB8 001EDEB8 349A070C */  jal        GetItemShopList__Fi
/* EDFBC 001EDEBC 00000000 */   nop
/* EDFC0 001EDEC0 28864070 */  paddub     $16, $2, $0
/* EDFC4 001EDEC4 288E0070 */  paddub     $17, $0, $0
/* EDFC8 001EDEC8 65000010 */  b          .L001EE060
/* EDFCC 001EDECC 00000000 */   nop
.L001EDED0:
/* EDFD0 001EDED0 40101100 */  sll        $2, $17, 1
/* EDFD4 001EDED4 21100202 */  addu       $2, $16, $2
/* EDFD8 001EDED8 00005284 */  lh         $18, 0x0($2)
/* EDFDC 001EDEDC 5100422A */  slti       $2, $18, 0x51
/* EDFE0 001EDEE0 51004014 */  bnez       $2, .L001EE028
/* EDFE4 001EDEE4 00000000 */   nop
/* EDFE8 001EDEE8 28264072 */  paddub     $4, $18, $0
/* EDFEC 001EDEEC 88C7080C */  jal        WhatIsKindofItem__Fi
/* EDFF0 001EDEF0 00000000 */   nop
/* EDFF4 001EDEF4 2B004010 */  beqz       $2, .L001EDFA4
/* EDFF8 001EDEF8 00000000 */   nop
/* EDFFC 001EDEFC 02000324 */  addiu      $3, $0, 0x2
/* EE000 001EDF00 11004310 */  beq        $2, $3, .L001EDF48
/* EE004 001EDF04 00000000 */   nop
/* EE008 001EDF08 01000324 */  addiu      $3, $0, 0x1
/* EE00C 001EDF0C 03004310 */  beq        $2, $3, .L001EDF1C
/* EE010 001EDF10 00000000 */   nop
/* EE014 001EDF14 2E000010 */  b          .L001EDFD0
/* EE018 001EDF18 00000000 */   nop
.L001EDF1C:
/* EE01C 001EDF1C 80111100 */  sll        $2, $17, 6
/* EE020 001EDF20 23105100 */  subu       $2, $2, $17
/* EE024 001EDF24 80180200 */  sll        $3, $2, 2
/* EE028 001EDF28 A094828F */  lw         $2, -0x6B60($gp)
/* EE02C 001EDF2C 21104300 */  addu       $2, $2, $3
/* EE030 001EDF30 28264072 */  paddub     $4, $18, $0
/* EE034 001EDF34 04004524 */  addiu      $5, $2, 0x4
/* EE038 001EDF38 24C9080C */  jal        WepDataListToHaveCopy__FiP11WEAPON_HAVE
/* EE03C 001EDF3C 00000000 */   nop
/* EE040 001EDF40 2C000010 */  b          .L001EDFF4
/* EE044 001EDF44 00000000 */   nop
.L001EDF48:
/* EE048 001EDF48 80111100 */  sll        $2, $17, 6
/* EE04C 001EDF4C 23105100 */  subu       $2, $2, $17
/* EE050 001EDF50 80980200 */  sll        $19, $2, 2
/* EE054 001EDF54 A094828F */  lw         $2, -0x6B60($gp)
/* EE058 001EDF58 21105300 */  addu       $2, $2, $19
/* EE05C 001EDF5C 28264072 */  paddub     $4, $18, $0
/* EE060 001EDF60 04004524 */  addiu      $5, $2, 0x4
/* EE064 001EDF64 94C9080C */  jal        AttachDataListToHaveCopy__FiP11ATTACH_LIST
/* EE068 001EDF68 00000000 */   nop
/* EE06C 001EDF6C 5B00422A */  slti       $2, $18, 0x5B
/* EE070 001EDF70 20004014 */  bnez       $2, .L001EDFF4
/* EE074 001EDF74 00000000 */   nop
/* EE078 001EDF78 5F00412A */  slti       $at, $18, 0x5F
/* EE07C 001EDF7C 1D002010 */  beqz       $at, .L001EDFF4
/* EE080 001EDF80 00000000 */   nop
/* EE084 001EDF84 01000424 */  addiu      $4, $0, 0x1
/* EE088 001EDF88 A094828F */  lw         $2, -0x6B60($gp)
/* EE08C 001EDF8C 21186202 */  addu       $3, $19, $2
/* EE090 001EDF90 40101200 */  sll        $2, $18, 1
/* EE094 001EDF94 21104300 */  addu       $2, $2, $3
/* EE098 001EDF98 56FF44A4 */  sh         $4, -0xAA($2)
/* EE09C 001EDF9C 15000010 */  b          .L001EDFF4
/* EE0A0 001EDFA0 00000000 */   nop
.L001EDFA4:
/* EE0A4 001EDFA4 28264072 */  paddub     $4, $18, $0
/* EE0A8 001EDFA8 B0C9080C */  jal        ItemDataToHaveCopy__Fi
/* EE0AC 001EDFAC 00000000 */   nop
/* EE0B0 001EDFB0 A094848F */  lw         $4, -0x6B60($gp)
/* EE0B4 001EDFB4 80191100 */  sll        $3, $17, 6
/* EE0B8 001EDFB8 23187100 */  subu       $3, $3, $17
/* EE0BC 001EDFBC 80180300 */  sll        $3, $3, 2
/* EE0C0 001EDFC0 21186400 */  addu       $3, $3, $4
/* EE0C4 001EDFC4 040062AC */  sw         $2, 0x4($3)
/* EE0C8 001EDFC8 0A000010 */  b          .L001EDFF4
/* EE0CC 001EDFCC 00000000 */   nop
.L001EDFD0:
/* EE0D0 001EDFD0 80111100 */  sll        $2, $17, 6
/* EE0D4 001EDFD4 23105100 */  subu       $2, $2, $17
/* EE0D8 001EDFD8 80180200 */  sll        $3, $2, 2
/* EE0DC 001EDFDC A094828F */  lw         $2, -0x6B60($gp)
/* EE0E0 001EDFE0 21204300 */  addu       $4, $2, $3
/* EE0E4 001EDFE4 282E0070 */  paddub     $5, $0, $0
/* EE0E8 001EDFE8 FC000624 */  addiu      $6, $0, 0xFC
/* EE0EC 001EDFEC 5A0D040C */  jal        memset
/* EE0F0 001EDFF0 00000000 */   nop
.L001EDFF4:
/* EE0F4 001EDFF4 80111100 */  sll        $2, $17, 6
/* EE0F8 001EDFF8 23105100 */  subu       $2, $2, $17
/* EE0FC 001EDFFC 80180200 */  sll        $3, $2, 2
/* EE100 001EE000 A094828F */  lw         $2, -0x6B60($gp)
/* EE104 001EE004 21104300 */  addu       $2, $2, $3
/* EE108 001EE008 000052A4 */  sh         $18, 0x0($2)
/* EE10C 001EE00C 01000424 */  addiu      $4, $0, 0x1
/* EE110 001EE010 80181100 */  sll        $3, $17, 2
/* EE114 001EE014 9094828F */  lw         $2, -0x6B70($gp)
/* EE118 001EE018 21104300 */  addu       $2, $2, $3
/* EE11C 001EE01C 000044AC */  sw         $4, 0x0($2)
/* EE120 001EE020 0E000010 */  b          .L001EE05C
/* EE124 001EE024 00000000 */   nop
.L001EE028:
/* EE128 001EE028 80111100 */  sll        $2, $17, 6
/* EE12C 001EE02C 23105100 */  subu       $2, $2, $17
/* EE130 001EE030 80180200 */  sll        $3, $2, 2
/* EE134 001EE034 A094828F */  lw         $2, -0x6B60($gp)
/* EE138 001EE038 21204300 */  addu       $4, $2, $3
/* EE13C 001EE03C 282E0070 */  paddub     $5, $0, $0
/* EE140 001EE040 FC000624 */  addiu      $6, $0, 0xFC
/* EE144 001EE044 5A0D040C */  jal        memset
/* EE148 001EE048 00000000 */   nop
/* EE14C 001EE04C 80181100 */  sll        $3, $17, 2
/* EE150 001EE050 9094828F */  lw         $2, -0x6B70($gp)
/* EE154 001EE054 21104300 */  addu       $2, $2, $3
/* EE158 001EE058 000040AC */  sw         $0, 0x0($2)
.L001EE05C:
/* EE15C 001EE05C 01003126 */  addiu      $17, $17, 0x1
.L001EE060:
/* EE160 001EE060 1400222A */  slti       $2, $17, 0x14
/* EE164 001EE064 9AFF4014 */  bnez       $2, .L001EDED0
/* EE168 001EE068 00000000 */   nop
/* EE16C 001EE06C 14001024 */  addiu      $16, $0, 0x14
/* EE170 001EE070 0F000010 */  b          .L001EE0B0
/* EE174 001EE074 00000000 */   nop
.L001EE078:
/* EE178 001EE078 80181000 */  sll        $3, $16, 2
/* EE17C 001EE07C 9094828F */  lw         $2, -0x6B70($gp)
/* EE180 001EE080 21104300 */  addu       $2, $2, $3
/* EE184 001EE084 000040AC */  sw         $0, 0x0($2)
/* EE188 001EE088 80111000 */  sll        $2, $16, 6
/* EE18C 001EE08C 23105000 */  subu       $2, $2, $16
/* EE190 001EE090 80180200 */  sll        $3, $2, 2
/* EE194 001EE094 A094828F */  lw         $2, -0x6B60($gp)
/* EE198 001EE098 21204300 */  addu       $4, $2, $3
/* EE19C 001EE09C 282E0070 */  paddub     $5, $0, $0
/* EE1A0 001EE0A0 FC000624 */  addiu      $6, $0, 0xFC
/* EE1A4 001EE0A4 5A0D040C */  jal        memset
/* EE1A8 001EE0A8 00000000 */   nop
/* EE1AC 001EE0AC 01001026 */  addiu      $16, $16, 0x1
.L001EE0B0:
/* EE1B0 001EE0B0 1E00022A */  slti       $2, $16, 0x1E
/* EE1B4 001EE0B4 F0FF4014 */  bnez       $2, .L001EE078
/* EE1B8 001EE0B8 00000000 */   nop
/* EE1BC 001EE0BC 88AE070C */  jal        ShopSpecialFunc__Fv
/* EE1C0 001EE0C0 00000000 */   nop
/* EE1C4 001EE0C4 F49B070C */  jal        InitAllHaveData__Fv
/* EE1C8 001EE0C8 00000000 */   nop
/* EE1CC 001EE0CC 4000BF7B */  lq         $31, 0x40($sp)
/* EE1D0 001EE0D0 3000B37B */  lq         $19, 0x30($sp)
/* EE1D4 001EE0D4 2000B27B */  lq         $18, 0x20($sp)
/* EE1D8 001EE0D8 1000B17B */  lq         $17, 0x10($sp)
/* EE1DC 001EE0DC 0000B07B */  lq         $16, 0x0($sp)
/* EE1E0 001EE0E0 5000BD27 */  addiu      $sp, $sp, 0x50
/* EE1E4 001EE0E4 0800E003 */  jr         $31
/* EE1E8 001EE0E8 00000000 */   nop
/* EE1EC 001EE0EC 00000000 */  nop
