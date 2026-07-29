.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel iRotateThreadReadyQueue
/* 0153C8 001152C8 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0153CC 001152CC 0000B0FF */  sd          $16, 0x0($29)
/* 0153D0 001152D0 2D808000 */  daddu       $16, $4, $0
/* 0153D4 001152D4 8000022E */  sltiu       $2, $16, 0x80
/* 0153D8 001152D8 05004010 */  beqz        $2, .L001152F0
/* 0153DC 001152DC 1000BFFF */   sd         $31, 0x10($29)
/* 0153E0 001152E0 2500023C */  lui         $2, %hi(topId)
/* 0153E4 001152E4 E809438C */  lw          $3, %lo(topId)($2)
/* 0153E8 001152E8 03006014 */  bnez        $3, .L001152F8
/* 0153EC 001152EC 2A00053C */   lui        $5, %hi(topArg)
.L001152F0:
/* 0153F0 001152F0 09000010 */  b           .L00115318
/* 0153F4 001152F4 FFFF0224 */   addiu      $2, $0, -0x1
.L001152F8:
/* 0153F8 001152F8 2A00023C */  lui         $2, %hi(topSema)
/* 0153FC 001152FC A853448C */  lw          $4, %lo(topSema)($2)
/* 015400 00115300 A053A324 */  addiu       $3, $5, %lo(topArg)
/* 015404 00115304 01000224 */  addiu       $2, $0, 0x1
/* 015408 00115308 040070AC */  sw          $16, 0x4($3)
/* 01540C 0011530C D450040C */  jal         iSignalSema
/* 015410 00115310 A053A2AC */   sw         $2, %lo(topArg)($5)
/* 015414 00115314 2D100002 */  daddu       $2, $16, $0
.L00115318:
/* 015418 00115318 1000BFDF */  ld          $31, 0x10($29)
/* 01541C 0011531C 0000B0DF */  ld          $16, 0x0($29)
/* 015420 00115320 0800E003 */  jr          $31
/* 015424 00115324 2000BD27 */   addiu      $29, $29, 0x20
