.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
/* Handwritten function */
glabel iWakeupThread
/* 015350 00115250 E0FFBD27 */  addiu       $29, $29, -0x20
/* 015354 00115254 1000BFFF */  sd          $31, 0x10($29)
/* 015358 00115258 0000B0FF */  sd          $16, 0x0($29)
/* 01535C 0011525C D1FF0324 */  addiu       $3, $0, -0x2F
/* 015360 00115260 0C000000 */  syscall     0 /* handwritten instruction */
/* 015364 00115264 2D804000 */  daddu       $16, $2, $0
/* 015368 00115268 05000412 */  beq         $16, $4, .L00115280
/* 01536C 0011526C 0001022E */   sltiu      $2, $16, 0x100
/* 015370 00115270 9850040C */  jal         _iWakeupThread
/* 015374 00115274 00000000 */   nop
/* 015378 00115278 10000010 */  b           .L001152BC
/* 01537C 0011527C 1000BFDF */   ld         $31, 0x10($29)
.L00115280:
/* 015380 00115280 04004010 */  beqz        $2, .L00115294
/* 015384 00115284 2500023C */   lui        $2, %hi(topId)
/* 015388 00115288 E809438C */  lw          $3, %lo(topId)($2)
/* 01538C 0011528C 03006014 */  bnez        $3, .L0011529C
/* 015390 00115290 2A00023C */   lui        $2, %hi(topArg)
.L00115294:
/* 015394 00115294 08000010 */  b           .L001152B8
/* 015398 00115298 FFFF0224 */   addiu      $2, $0, -0x1
.L0011529C:
/* 01539C 0011529C 2A00033C */  lui         $3, %hi(topSema)
/* 0153A0 001152A0 A853648C */  lw          $4, %lo(topSema)($3)
/* 0153A4 001152A4 A0534524 */  addiu       $5, $2, %lo(topArg)
/* 0153A8 001152A8 A05340AC */  sw          $0, %lo(topArg)($2)
/* 0153AC 001152AC D450040C */  jal         iSignalSema
/* 0153B0 001152B0 0400B0AC */   sw         $16, 0x4($5)
/* 0153B4 001152B4 2D100002 */  daddu       $2, $16, $0
.L001152B8:
/* 0153B8 001152B8 1000BFDF */  ld          $31, 0x10($29)
.L001152BC:
/* 0153BC 001152BC 0000B0DF */  ld          $16, 0x0($29)
/* 0153C0 001152C0 0800E003 */  jr          $31
/* 0153C4 001152C4 2000BD27 */   addiu      $29, $29, 0x20
