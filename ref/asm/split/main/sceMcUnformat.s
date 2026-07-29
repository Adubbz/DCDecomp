.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcUnformat
/* 01F120 0011F020 D0FFBD27 */  addiu       $29, $29, -0x30
/* 01F124 0011F024 1000B0FF */  sd          $16, 0x10($29)
/* 01F128 0011F028 2500103C */  lui         $16, %hi(mcRunCmdNo)
/* 01F12C 0011F02C 2000BFFF */  sd          $31, 0x20($29)
/* 01F130 0011F030 380A028E */  lw          $2, %lo(mcRunCmdNo)($16)
/* 01F134 0011F034 1A004014 */  bnez        $2, .L0011F0A0
/* 01F138 0011F038 2D308000 */   daddu      $6, $4, $0
/* 01F13C 0011F03C 2B00023C */  lui         $2, %hi(mcClientID)
/* 01F140 0011F040 40864424 */  addiu       $4, $2, %lo(mcClientID)
/* 01F144 0011F044 2400838C */  lw          $3, 0x24($4)
/* 01F148 0011F048 15006010 */  beqz        $3, .L0011F0A0
/* 01F14C 0011F04C 9CFF0224 */   addiu      $2, $0, -0x64
/* 01F150 0011F050 2B00023C */  lui         $2, %hi(sifParamOrd)
/* 01F154 0011F054 2B00093C */  lui         $9, %hi(retval)
/* 01F158 0011F058 C0864224 */  addiu       $2, $2, %lo(sifParamOrd)
/* 01F15C 0011F05C 009C2925 */  addiu       $9, $9, %lo(retval)
/* 01F160 0011F060 040046AC */  sw          $6, 0x4($2)
/* 01F164 0011F064 2D384000 */  daddu       $7, $2, $0
/* 01F168 0011F068 080045AC */  sw          $5, 0x8($2)
/* 01F16C 0011F06C 01000624 */  addiu       $6, $0, 0x1
/* 01F170 0011F070 0000A0AF */  sw          $0, 0x0($29)
/* 01F174 0011F074 11000524 */  addiu       $5, $0, 0x11
/* 01F178 0011F078 30000824 */  addiu       $8, $0, 0x30
/* 01F17C 0011F07C 04000A24 */  addiu       $10, $0, 0x4
/* 01F180 0011F080 2A5D040C */  jal         sceSifCallRpc
/* 01F184 0011F084 2D580000 */   daddu      $11, $0, $0
/* 01F188 0011F088 2D184000 */  daddu       $3, $2, $0
/* 01F18C 0011F08C 04006014 */  bnez        $3, .L0011F0A0
/* 01F190 0011F090 2D106000 */   daddu      $2, $3, $0
/* 01F194 0011F094 11000224 */  addiu       $2, $0, 0x11
/* 01F198 0011F098 380A02AE */  sw          $2, %lo(mcRunCmdNo)($16)
/* 01F19C 0011F09C 2D106000 */  daddu       $2, $3, $0
.L0011F0A0:
/* 01F1A0 0011F0A0 2000BFDF */  ld          $31, 0x20($29)
/* 01F1A4 0011F0A4 1000B0DF */  ld          $16, 0x10($29)
/* 01F1A8 0011F0A8 0800E003 */  jr          $31
/* 01F1AC 0011F0AC 3000BD27 */   addiu      $29, $29, 0x30
