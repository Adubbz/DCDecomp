.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceMcChangeThreadPriority
/* 01E200 0011E100 D0FFBD27 */  addiu       $29, $29, -0x30
/* 01E204 0011E104 1000B0FF */  sd          $16, 0x10($29)
/* 01E208 0011E108 2500103C */  lui         $16, %hi(mcRunCmdNo)
/* 01E20C 0011E10C 2000BFFF */  sd          $31, 0x20($29)
/* 01E210 0011E110 380A028E */  lw          $2, %lo(mcRunCmdNo)($16)
/* 01E214 0011E114 19004014 */  bnez        $2, .L0011E17C
/* 01E218 0011E118 2D288000 */   daddu      $5, $4, $0
/* 01E21C 0011E11C 2B00023C */  lui         $2, %hi(mcClientID)
/* 01E220 0011E120 40864424 */  addiu       $4, $2, %lo(mcClientID)
/* 01E224 0011E124 2400838C */  lw          $3, 0x24($4)
/* 01E228 0011E128 03006014 */  bnez        $3, .L0011E138
/* 01E22C 0011E12C 2B00073C */   lui        $7, %hi(sifParamOrd)
/* 01E230 0011E130 12000010 */  b           .L0011E17C
/* 01E234 0011E134 9CFF0224 */   addiu      $2, $0, -0x64
.L0011E138:
/* 01E238 0011E138 2B00093C */  lui         $9, %hi(retval)
/* 01E23C 0011E13C C086E724 */  addiu       $7, $7, %lo(sifParamOrd)
/* 01E240 0011E140 009C2925 */  addiu       $9, $9, %lo(retval)
/* 01E244 0011E144 1400E5AC */  sw          $5, 0x14($7)
/* 01E248 0011E148 01000624 */  addiu       $6, $0, 0x1
/* 01E24C 0011E14C 0000A0AF */  sw          $0, 0x0($29)
/* 01E250 0011E150 14000524 */  addiu       $5, $0, 0x14
/* 01E254 0011E154 30000824 */  addiu       $8, $0, 0x30
/* 01E258 0011E158 04000A24 */  addiu       $10, $0, 0x4
/* 01E25C 0011E15C 2A5D040C */  jal         sceSifCallRpc
/* 01E260 0011E160 2D580000 */   daddu      $11, $0, $0
/* 01E264 0011E164 2D184000 */  daddu       $3, $2, $0
/* 01E268 0011E168 04006014 */  bnez        $3, .L0011E17C
/* 01E26C 0011E16C 2D106000 */   daddu      $2, $3, $0
/* 01E270 0011E170 14000224 */  addiu       $2, $0, 0x14
/* 01E274 0011E174 380A02AE */  sw          $2, %lo(mcRunCmdNo)($16)
/* 01E278 0011E178 2D106000 */  daddu       $2, $3, $0
.L0011E17C:
/* 01E27C 0011E17C 2000BFDF */  ld          $31, 0x20($29)
/* 01E280 0011E180 1000B0DF */  ld          $16, 0x10($29)
/* 01E284 0011E184 0800E003 */  jr          $31
/* 01E288 0011E188 3000BD27 */   addiu      $29, $29, 0x30
/* 01E28C 0011E18C 00000000 */  nop
