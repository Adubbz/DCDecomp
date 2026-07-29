.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcGetEntSpace
/* 01F1B0 0011F0B0 B0FFBD27 */  addiu       $29, $29, -0x50
/* 01F1B4 0011F0B4 2D38A000 */  daddu       $7, $5, $0
/* 01F1B8 0011F0B8 3000B2FF */  sd          $18, 0x30($29)
/* 01F1BC 0011F0BC 2D28C000 */  daddu       $5, $6, $0
/* 01F1C0 0011F0C0 2500123C */  lui         $18, %hi(mcRunCmdNo)
/* 01F1C4 0011F0C4 4000BFFF */  sd          $31, 0x40($29)
/* 01F1C8 0011F0C8 380A428E */  lw          $2, %lo(mcRunCmdNo)($18)
/* 01F1CC 0011F0CC 2000B1FF */  sd          $17, 0x20($29)
/* 01F1D0 0011F0D0 1F004014 */  bnez        $2, .L0011F150
/* 01F1D4 0011F0D4 1000B0FF */   sd         $16, 0x10($29)
/* 01F1D8 0011F0D8 2B00023C */  lui         $2, %hi(mcClientID)
/* 01F1DC 0011F0DC 40865124 */  addiu       $17, $2, %lo(mcClientID)
/* 01F1E0 0011F0E0 2400238E */  lw          $3, 0x24($17)
/* 01F1E4 0011F0E4 1A006010 */  beqz        $3, .L0011F150
/* 01F1E8 0011F0E8 9CFF0224 */   addiu      $2, $0, -0x64
/* 01F1EC 0011F0EC 2B00023C */  lui         $2, %hi(sifParamFname)
/* 01F1F0 0011F0F0 FF030624 */  addiu       $6, $0, 0x3FF
/* 01F1F4 0011F0F4 F0865024 */  addiu       $16, $2, %lo(sifParamFname)
/* 01F1F8 0011F0F8 F08644AC */  sw          $4, %lo(sifParamFname)($2)
/* 01F1FC 0011F0FC 040007AE */  sw          $7, 0x4($16)
/* 01F200 0011F100 5C16040C */  jal         strncpy
/* 01F204 0011F104 14000426 */   addiu      $4, $16, 0x14
/* 01F208 0011F108 130400A2 */  sb          $0, 0x413($16)
/* 01F20C 0011F10C 2B00093C */  lui         $9, %hi(retval)
/* 01F210 0011F110 2D202002 */  daddu       $4, $17, $0
/* 01F214 0011F114 2D380002 */  daddu       $7, $16, $0
/* 01F218 0011F118 009C2925 */  addiu       $9, $9, %lo(retval)
/* 01F21C 0011F11C 12000524 */  addiu       $5, $0, 0x12
/* 01F220 0011F120 0000A0AF */  sw          $0, 0x0($29)
/* 01F224 0011F124 01000624 */  addiu       $6, $0, 0x1
/* 01F228 0011F128 14040824 */  addiu       $8, $0, 0x414
/* 01F22C 0011F12C 04000A24 */  addiu       $10, $0, 0x4
/* 01F230 0011F130 2A5D040C */  jal         sceSifCallRpc
/* 01F234 0011F134 2D580000 */   daddu      $11, $0, $0
/* 01F238 0011F138 2D184000 */  daddu       $3, $2, $0
/* 01F23C 0011F13C 04006014 */  bnez        $3, .L0011F150
/* 01F240 0011F140 2D106000 */   daddu      $2, $3, $0
/* 01F244 0011F144 12000224 */  addiu       $2, $0, 0x12
/* 01F248 0011F148 380A42AE */  sw          $2, %lo(mcRunCmdNo)($18)
/* 01F24C 0011F14C 2D106000 */  daddu       $2, $3, $0
.L0011F150:
/* 01F250 0011F150 4000BFDF */  ld          $31, 0x40($29)
/* 01F254 0011F154 3000B2DF */  ld          $18, 0x30($29)
/* 01F258 0011F158 2000B1DF */  ld          $17, 0x20($29)
/* 01F25C 0011F15C 1000B0DF */  ld          $16, 0x10($29)
/* 01F260 0011F160 0800E003 */  jr          $31
/* 01F264 0011F164 5000BD27 */   addiu      $29, $29, 0x50
