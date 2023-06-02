.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _sceSifSendCmd
/* 169C0 001168C0 80FFBD27 */  addiu      $sp, $sp, -0x80
/* 169C4 001168C4 3000B1FF */  sd         $17, 0x30($sp)
/* 169C8 001168C8 6000B4FF */  sd         $20, 0x60($sp)
/* 169CC 001168CC 2D88E000 */  daddu      $17, $7, $0
/* 169D0 001168D0 5000B3FF */  sd         $19, 0x50($sp)
/* 169D4 001168D4 2DA08000 */  daddu      $20, $4, $0
/* 169D8 001168D8 2000B0FF */  sd         $16, 0x20($sp)
/* 169DC 001168DC F0FF2226 */  addiu      $2, $17, -0x10
/* 169E0 001168E0 2D98A000 */  daddu      $19, $5, $0
/* 169E4 001168E4 7000BFFF */  sd         $31, 0x70($sp)
/* 169E8 001168E8 4000B2FF */  sd         $18, 0x40($sp)
/* 169EC 001168EC 2D80C000 */  daddu      $16, $6, $0
/* 169F0 001168F0 2D200001 */  daddu      $4, $8, $0
/* 169F4 001168F4 6100422C */  sltiu      $2, $2, 0x61
/* 169F8 001168F8 03004014 */  bnez       $2, .L00116908
/* 169FC 001168FC 2D284001 */   daddu     $5, $10, $0
/* 16A00 00116900 34000010 */  b          .L001169D4
/* 16A04 00116904 2D100000 */   daddu     $2, $0, $0
.L00116908:
/* 16A08 00116908 1100A018 */  blez       $5, .L00116950
/* 16A0C 0011690C 2D900000 */   daddu     $18, $0, $0
/* 16A10 00116910 00000292 */  lbu        $2, 0x0($16)
/* 16A14 00116914 001A0500 */  sll        $3, $5, 8
/* 16A18 00116918 040009AE */  sw         $9, 0x4($16)
/* 16A1C 0011691C 01001224 */  addiu      $18, $0, 0x1
/* 16A20 00116920 25104300 */  or         $2, $2, $3
/* 16A24 00116924 0000A4AF */  sw         $4, 0x0($sp)
/* 16A28 00116928 000002AE */  sw         $2, 0x0($16)
/* 16A2C 0011692C 04006332 */  andi       $3, $19, 0x4
/* 16A30 00116930 0400A9AF */  sw         $9, 0x4($sp)
/* 16A34 00116934 0800A5AF */  sw         $5, 0x8($sp)
/* 16A38 00116938 08006010 */  beqz       $3, .L0011695C
/* 16A3C 0011693C 0C00A0AF */   sw        $0, 0xC($sp)
/* 16A40 00116940 E65A040C */  jal        sceSifWriteBackDCache
/* 16A44 00116944 00000000 */   nop
/* 16A48 00116948 05000010 */  b          .L00116960
/* 16A4C 0011694C 00291200 */   sll       $5, $18, 4
.L00116950:
/* 16A50 00116950 00000292 */  lbu        $2, 0x0($16)
/* 16A54 00116954 040000AE */  sw         $0, 0x4($16)
/* 16A58 00116958 000002AE */  sw         $2, 0x0($16)
.L0011695C:
/* 16A5C 0011695C 00291200 */  sll        $5, $18, 4
.L00116960:
/* 16A60 00116960 2A00023C */  lui        $2, (0x2A5920 >> 16)
/* 16A64 00116964 2059448C */  lw         $4, (0x2A5920 & 0xFFFF)($2)
/* 16A68 00116968 2118A503 */  addu       $3, $sp, $5
/* 16A6C 0011696C 000070AC */  sw         $16, 0x0($3)
/* 16A70 00116970 0400A227 */  addiu      $2, $sp, 0x4
/* 16A74 00116974 21104500 */  addu       $2, $2, $5
/* 16A78 00116978 0800A327 */  addiu      $3, $sp, 0x8
/* 16A7C 0011697C 000044AC */  sw         $4, 0x0($2)
/* 16A80 00116980 21186500 */  addu       $3, $3, $5
/* 16A84 00116984 000071AC */  sw         $17, 0x0($3)
/* 16A88 00116988 0C00A427 */  addiu      $4, $sp, 0xC
/* 16A8C 0011698C 21208500 */  addu       $4, $4, $5
/* 16A90 00116990 080014AE */  sw         $20, 0x8($16)
/* 16A94 00116994 000011A2 */  sb         $17, 0x0($16)
/* 16A98 00116998 44000224 */  addiu      $2, $0, 0x44
/* 16A9C 0011699C 000082AC */  sw         $2, 0x0($4)
/* 16AA0 001169A0 2D282002 */  daddu      $5, $17, $0
/* 16AA4 001169A4 2D200002 */  daddu      $4, $16, $0
/* 16AA8 001169A8 E65A040C */  jal        sceSifWriteBackDCache
/* 16AAC 001169AC 01005226 */   addiu     $18, $18, 0x1
/* 16AB0 001169B0 01006232 */  andi       $2, $19, 0x1
/* 16AB4 001169B4 05004010 */  beqz       $2, .L001169CC
/* 16AB8 001169B8 2D284002 */   daddu     $5, $18, $0
/* 16ABC 001169BC BC51040C */  jal        isceSifSetDma
/* 16AC0 001169C0 2D20A003 */   daddu     $4, $sp, $0
/* 16AC4 001169C4 04000010 */  b          .L001169D8
/* 16AC8 001169C8 7000BFDF */   ld        $31, 0x70($sp)
.L001169CC:
/* 16ACC 001169CC B851040C */  jal        sceSifSetDma
/* 16AD0 001169D0 2D20A003 */   daddu     $4, $sp, $0
.L001169D4:
/* 16AD4 001169D4 7000BFDF */  ld         $31, 0x70($sp)
.L001169D8:
/* 16AD8 001169D8 6000B4DF */  ld         $20, 0x60($sp)
/* 16ADC 001169DC 5000B3DF */  ld         $19, 0x50($sp)
/* 16AE0 001169E0 4000B2DF */  ld         $18, 0x40($sp)
/* 16AE4 001169E4 3000B1DF */  ld         $17, 0x30($sp)
/* 16AE8 001169E8 2000B0DF */  ld         $16, 0x20($sp)
/* 16AEC 001169EC 0800E003 */  jr         $31
/* 16AF0 001169F0 8000BD27 */   addiu     $sp, $sp, 0x80
/* 16AF4 001169F4 00000000 */  nop