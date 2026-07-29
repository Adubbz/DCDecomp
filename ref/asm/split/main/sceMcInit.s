.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcInit
/* 01E080 0011DF80 90FFBD27 */  addiu       $29, $29, -0x70
/* 01E084 0011DF84 5000B4FF */  sd          $20, 0x50($29)
/* 01E088 0011DF88 4000B3FF */  sd          $19, 0x40($29)
/* 01E08C 0011DF8C 3000B2FF */  sd          $18, 0x30($29)
/* 01E090 0011DF90 2000B1FF */  sd          $17, 0x20($29)
/* 01E094 0011DF94 1000B0FF */  sd          $16, 0x10($29)
/* 01E098 0011DF98 6000BFFF */  sd          $31, 0x60($29)
/* 01E09C 0011DF9C 125B040C */  jal         sceSifInitRpc
/* 01E0A0 0011DFA0 2D200000 */   daddu      $4, $0, $0
/* 01E0A4 0011DFA4 2B00103C */  lui         $16, %hi(mcClientID)
/* 01E0A8 0011DFA8 2B00143C */  lui         $20, %hi(sifParamOrd)
/* 01E0AC 0011DFAC 0B000010 */  b           .L0011DFDC
/* 01E0B0 0011DFB0 2B00133C */   lui        $19, %hi(retval)
/* 01E0B4 0011DFB4 00000000 */  nop
.L0011DFB8:
/* 01E0B8 0011DFB8 1000023C */  lui         $2, 0x10
/* 01E0BC 0011DFBC 00000000 */  nop
.L0011DFC0:
/* 01E0C0 0011DFC0 FFFF4224 */  addiu       $2, $2, -0x1
/* 01E0C4 0011DFC4 00000000 */  nop
/* 01E0C8 0011DFC8 00000000 */  nop
/* 01E0CC 0011DFCC 00000000 */  nop
/* 01E0D0 0011DFD0 00000000 */  nop
/* 01E0D4 0011DFD4 FAFF4014 */  bnez        $2, .L0011DFC0
/* 01E0D8 0011DFD8 00000000 */   nop
.L0011DFDC:
/* 01E0DC 0011DFDC 0080053C */  lui         $5, (0x80000400 >> 16)
/* 01E0E0 0011DFE0 40860426 */  addiu       $4, $16, %lo(mcClientID)
/* 01E0E4 0011DFE4 0004A534 */  ori         $5, $5, (0x80000400 & 0xFFFF)
/* 01E0E8 0011DFE8 B65C040C */  jal         sceSifBindRpc
/* 01E0EC 0011DFEC 2D300000 */   daddu      $6, $0, $0
/* 01E0F0 0011DFF0 0C004104 */  bgez        $2, .L0011E024
/* 01E0F4 0011DFF4 40861126 */   addiu      $17, $16, %lo(mcClientID)
/* 01E0F8 0011DFF8 2A00043C */  lui         $4, %hi(RO_00298AC8)
/* 01E0FC 0011DFFC A611040C */  jal         printf
/* 01E100 0011E000 C88A8424 */   addiu      $4, $4, %lo(RO_00298AC8)
/* 01E104 0011E004 00000000 */  nop
.L0011E008:
/* 01E108 0011E008 00000000 */  nop
/* 01E10C 0011E00C 00000000 */  nop
/* 01E110 0011E010 00000000 */  nop
/* 01E114 0011E014 00000000 */  nop
/* 01E118 0011E018 00000000 */  nop
/* 01E11C 0011E01C FAFF0010 */  b           .L0011E008
/* 01E120 0011E020 00000000 */   nop
.L0011E024:
/* 01E124 0011E024 2400228E */  lw          $2, 0x24($17)
/* 01E128 0011E028 E3FF4010 */  beqz        $2, .L0011DFB8
/* 01E12C 0011E02C 2D902002 */   daddu      $18, $17, $0
/* 01E130 0011E030 009C7026 */  addiu       $16, $19, %lo(retval)
/* 01E134 0011E034 C0868726 */  addiu       $7, $20, %lo(sifParamOrd)
/* 01E138 0011E038 0000A0AF */  sw          $0, 0x0($29)
/* 01E13C 0011E03C 2D204002 */  daddu       $4, $18, $0
/* 01E140 0011E040 FE000524 */  addiu       $5, $0, 0xFE
/* 01E144 0011E044 2D300000 */  daddu       $6, $0, $0
/* 01E148 0011E048 30000824 */  addiu       $8, $0, 0x30
/* 01E14C 0011E04C 2D480002 */  daddu       $9, $16, $0
/* 01E150 0011E050 0C000A24 */  addiu       $10, $0, 0xC
/* 01E154 0011E054 2A5D040C */  jal         sceSifCallRpc
/* 01E158 0011E058 2D580000 */   daddu      $11, $0, $0
/* 01E15C 0011E05C 04004304 */  bgezl       $2, .L0011E070
/* 01E160 0011E060 0400028E */   lw         $2, 0x4($16)
/* 01E164 0011E064 240040AE */  sw          $0, 0x24($18)
/* 01E168 0011E068 13000010 */  b           .L0011E0B8
/* 01E16C 0011E06C 9CFF4224 */   addiu      $2, $2, -0x64
.L0011E070:
/* 01E170 0011E070 0A024228 */  slti        $2, $2, 0x20A
/* 01E174 0011E074 06004010 */  beqz        $2, .L0011E090
/* 01E178 0011E078 2A00043C */   lui        $4, %hi(RO_00298AE0)
/* 01E17C 0011E07C A611040C */  jal         printf
/* 01E180 0011E080 E08A8424 */   addiu      $4, $4, %lo(RO_00298AE0)
/* 01E184 0011E084 240040AE */  sw          $0, 0x24($18)
/* 01E188 0011E088 0B000010 */  b           .L0011E0B8
/* 01E18C 0011E08C 88FF0224 */   addiu      $2, $0, -0x78
.L0011E090:
/* 01E190 0011E090 0800028E */  lw          $2, 0x8($16)
/* 01E194 0011E094 0E024228 */  slti        $2, $2, 0x20E
/* 01E198 0011E098 06004010 */  beqz        $2, .L0011E0B4
/* 01E19C 0011E09C 2A00043C */   lui        $4, %hi(RO_00298B08)
/* 01E1A0 0011E0A0 A611040C */  jal         printf
/* 01E1A4 0011E0A4 088B8424 */   addiu      $4, $4, %lo(RO_00298B08)
/* 01E1A8 0011E0A8 240020AE */  sw          $0, 0x24($17)
/* 01E1AC 0011E0AC 02000010 */  b           .L0011E0B8
/* 01E1B0 0011E0B0 87FF0224 */   addiu      $2, $0, -0x79
.L0011E0B4:
/* 01E1B4 0011E0B4 009C628E */  lw          $2, %lo(retval)($19)
.L0011E0B8:
/* 01E1B8 0011E0B8 6000BFDF */  ld          $31, 0x60($29)
/* 01E1BC 0011E0BC 5000B4DF */  ld          $20, 0x50($29)
/* 01E1C0 0011E0C0 4000B3DF */  ld          $19, 0x40($29)
/* 01E1C4 0011E0C4 3000B2DF */  ld          $18, 0x30($29)
/* 01E1C8 0011E0C8 2000B1DF */  ld          $17, 0x20($29)
/* 01E1CC 0011E0CC 1000B0DF */  ld          $16, 0x10($29)
/* 01E1D0 0011E0D0 0800E003 */  jr          $31
/* 01E1D4 0011E0D4 7000BD27 */   addiu      $29, $29, 0x70
