.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcFlush
/* 01EE38 0011ED38 D0FFBD27 */  addiu       $29, $29, -0x30
/* 01EE3C 0011ED3C 1000B0FF */  sd          $16, 0x10($29)
/* 01EE40 0011ED40 2500103C */  lui         $16, %hi(mcRunCmdNo)
/* 01EE44 0011ED44 2000BFFF */  sd          $31, 0x20($29)
/* 01EE48 0011ED48 380A028E */  lw          $2, %lo(mcRunCmdNo)($16)
/* 01EE4C 0011ED4C 19004014 */  bnez        $2, .L0011EDB4
/* 01EE50 0011ED50 2D288000 */   daddu      $5, $4, $0
/* 01EE54 0011ED54 2B00023C */  lui         $2, %hi(mcClientID)
/* 01EE58 0011ED58 40864424 */  addiu       $4, $2, %lo(mcClientID)
/* 01EE5C 0011ED5C 2400838C */  lw          $3, 0x24($4)
/* 01EE60 0011ED60 03006014 */  bnez        $3, .L0011ED70
/* 01EE64 0011ED64 2B00073C */   lui        $7, %hi(sifParamOrd)
/* 01EE68 0011ED68 12000010 */  b           .L0011EDB4
/* 01EE6C 0011ED6C 9CFF0224 */   addiu      $2, $0, -0x64
.L0011ED70:
/* 01EE70 0011ED70 2B00093C */  lui         $9, %hi(retval)
/* 01EE74 0011ED74 C086E5AC */  sw          $5, %lo(sifParamOrd)($7)
/* 01EE78 0011ED78 009C2925 */  addiu       $9, $9, %lo(retval)
/* 01EE7C 0011ED7C C086E724 */  addiu       $7, $7, %lo(sifParamOrd)
/* 01EE80 0011ED80 0000A0AF */  sw          $0, 0x0($29)
/* 01EE84 0011ED84 0A000524 */  addiu       $5, $0, 0xA
/* 01EE88 0011ED88 01000624 */  addiu       $6, $0, 0x1
/* 01EE8C 0011ED8C 30000824 */  addiu       $8, $0, 0x30
/* 01EE90 0011ED90 04000A24 */  addiu       $10, $0, 0x4
/* 01EE94 0011ED94 2A5D040C */  jal         sceSifCallRpc
/* 01EE98 0011ED98 2D580000 */   daddu      $11, $0, $0
/* 01EE9C 0011ED9C 2D184000 */  daddu       $3, $2, $0
/* 01EEA0 0011EDA0 04006014 */  bnez        $3, .L0011EDB4
/* 01EEA4 0011EDA4 2D106000 */   daddu      $2, $3, $0
/* 01EEA8 0011EDA8 0A000224 */  addiu       $2, $0, 0xA
/* 01EEAC 0011EDAC 380A02AE */  sw          $2, %lo(mcRunCmdNo)($16)
/* 01EEB0 0011EDB0 2D106000 */  daddu       $2, $3, $0
.L0011EDB4:
/* 01EEB4 0011EDB4 2000BFDF */  ld          $31, 0x20($29)
/* 01EEB8 0011EDB8 1000B0DF */  ld          $16, 0x10($29)
/* 01EEBC 0011EDBC 0800E003 */  jr          $31
/* 01EEC0 0011EDC0 3000BD27 */   addiu      $29, $29, 0x30
/* 01EEC4 0011EDC4 00000000 */  nop
