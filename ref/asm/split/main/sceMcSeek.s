.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcSeek
/* 01E4C8 0011E3C8 D0FFBD27 */  addiu       $29, $29, -0x30
/* 01E4CC 0011E3CC 1000B0FF */  sd          $16, 0x10($29)
/* 01E4D0 0011E3D0 2500103C */  lui         $16, %hi(mcRunCmdNo)
/* 01E4D4 0011E3D4 2000BFFF */  sd          $31, 0x20($29)
/* 01E4D8 0011E3D8 380A028E */  lw          $2, %lo(mcRunCmdNo)($16)
/* 01E4DC 0011E3DC 1A004014 */  bnez        $2, .L0011E448
/* 01E4E0 0011E3E0 2D408000 */   daddu      $8, $4, $0
/* 01E4E4 0011E3E4 2B00023C */  lui         $2, %hi(mcClientID)
/* 01E4E8 0011E3E8 40864424 */  addiu       $4, $2, %lo(mcClientID)
/* 01E4EC 0011E3EC 2400838C */  lw          $3, 0x24($4)
/* 01E4F0 0011E3F0 15006010 */  beqz        $3, .L0011E448
/* 01E4F4 0011E3F4 9CFF0224 */   addiu      $2, $0, -0x64
/* 01E4F8 0011E3F8 2B00023C */  lui         $2, %hi(sifParamOrd)
/* 01E4FC 0011E3FC 2B00093C */  lui         $9, %hi(retval)
/* 01E500 0011E400 C08648AC */  sw          $8, %lo(sifParamOrd)($2)
/* 01E504 0011E404 C0864724 */  addiu       $7, $2, %lo(sifParamOrd)
/* 01E508 0011E408 1000E5AC */  sw          $5, 0x10($7)
/* 01E50C 0011E40C 009C2925 */  addiu       $9, $9, %lo(retval)
/* 01E510 0011E410 1400E6AC */  sw          $6, 0x14($7)
/* 01E514 0011E414 04000524 */  addiu       $5, $0, 0x4
/* 01E518 0011E418 0000A0AF */  sw          $0, 0x0($29)
/* 01E51C 0011E41C 01000624 */  addiu       $6, $0, 0x1
/* 01E520 0011E420 30000824 */  addiu       $8, $0, 0x30
/* 01E524 0011E424 04000A24 */  addiu       $10, $0, 0x4
/* 01E528 0011E428 2A5D040C */  jal         sceSifCallRpc
/* 01E52C 0011E42C 2D580000 */   daddu      $11, $0, $0
/* 01E530 0011E430 2D184000 */  daddu       $3, $2, $0
/* 01E534 0011E434 04006014 */  bnez        $3, .L0011E448
/* 01E538 0011E438 2D106000 */   daddu      $2, $3, $0
/* 01E53C 0011E43C 04000224 */  addiu       $2, $0, 0x4
/* 01E540 0011E440 380A02AE */  sw          $2, %lo(mcRunCmdNo)($16)
/* 01E544 0011E444 2D106000 */  daddu       $2, $3, $0
.L0011E448:
/* 01E548 0011E448 2000BFDF */  ld          $31, 0x20($29)
/* 01E54C 0011E44C 1000B0DF */  ld          $16, 0x10($29)
/* 01E550 0011E450 0800E003 */  jr          $31
/* 01E554 0011E454 3000BD27 */   addiu      $29, $29, 0x30
