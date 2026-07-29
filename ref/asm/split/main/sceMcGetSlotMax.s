.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcGetSlotMax
/* 01E290 0011E190 2500023C */  lui         $2, %hi(mcRunCmdNo)
/* 01E294 0011E194 D0FFBD27 */  addiu       $29, $29, -0x30
/* 01E298 0011E198 380A438C */  lw          $3, %lo(mcRunCmdNo)($2)
/* 01E29C 0011E19C 2D288000 */  daddu       $5, $4, $0
/* 01E2A0 0011E1A0 2000BFFF */  sd          $31, 0x20($29)
/* 01E2A4 0011E1A4 04006010 */  beqz        $3, .L0011E1B8
/* 01E2A8 0011E1A8 1000B0FF */   sd         $16, 0x10($29)
/* 01E2AC 0011E1AC 9CFF0224 */  addiu       $2, $0, -0x64
/* 01E2B0 0011E1B0 15000010 */  b           .L0011E208
/* 01E2B4 0011E1B4 23104300 */   subu       $2, $2, $3
.L0011E1B8:
/* 01E2B8 0011E1B8 2B00023C */  lui         $2, %hi(mcClientID)
/* 01E2BC 0011E1BC 40864424 */  addiu       $4, $2, %lo(mcClientID)
/* 01E2C0 0011E1C0 2400838C */  lw          $3, 0x24($4)
/* 01E2C4 0011E1C4 03006014 */  bnez        $3, .L0011E1D4
/* 01E2C8 0011E1C8 2B00073C */   lui        $7, %hi(sifParamOrd)
/* 01E2CC 0011E1CC 0E000010 */  b           .L0011E208
/* 01E2D0 0011E1D0 9CFF0224 */   addiu      $2, $0, -0x64
.L0011E1D4:
/* 01E2D4 0011E1D4 2B00103C */  lui         $16, %hi(retval)
/* 01E2D8 0011E1D8 C086E724 */  addiu       $7, $7, %lo(sifParamOrd)
/* 01E2DC 0011E1DC 2D300000 */  daddu       $6, $0, $0
/* 01E2E0 0011E1E0 0400E5AC */  sw          $5, 0x4($7)
/* 01E2E4 0011E1E4 30000824 */  addiu       $8, $0, 0x30
/* 01E2E8 0011E1E8 0000A0AF */  sw          $0, 0x0($29)
/* 01E2EC 0011E1EC 15000524 */  addiu       $5, $0, 0x15
/* 01E2F0 0011E1F0 009C0926 */  addiu       $9, $16, %lo(retval)
/* 01E2F4 0011E1F4 04000A24 */  addiu       $10, $0, 0x4
/* 01E2F8 0011E1F8 2A5D040C */  jal         sceSifCallRpc
/* 01E2FC 0011E1FC 2D580000 */   daddu      $11, $0, $0
/* 01E300 0011E200 01004050 */  beql        $2, $0, .L0011E208
/* 01E304 0011E204 009C028E */   lw         $2, %lo(retval)($16)
.L0011E208:
/* 01E308 0011E208 2000BFDF */  ld          $31, 0x20($29)
/* 01E30C 0011E20C 1000B0DF */  ld          $16, 0x10($29)
/* 01E310 0011E210 0800E003 */  jr          $31
/* 01E314 0011E214 3000BD27 */   addiu      $29, $29, 0x30
