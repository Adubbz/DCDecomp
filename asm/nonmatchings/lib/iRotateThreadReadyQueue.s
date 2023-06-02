.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel iRotateThreadReadyQueue
/* 153C8 001152C8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 153CC 001152CC 0000B0FF */  sd         $16, 0x0($sp)
/* 153D0 001152D0 2D808000 */  daddu      $16, $4, $0
/* 153D4 001152D4 8000022E */  sltiu      $2, $16, 0x80
/* 153D8 001152D8 05004010 */  beqz       $2, .L001152F0
/* 153DC 001152DC 1000BFFF */   sd        $31, 0x10($sp)
/* 153E0 001152E0 2500023C */  lui        $2, (0x2509E8 >> 16)
/* 153E4 001152E4 E809438C */  lw         $3, (0x2509E8 & 0xFFFF)($2)
/* 153E8 001152E8 03006014 */  bnez       $3, .L001152F8
/* 153EC 001152EC 2A00053C */   lui       $5, (0x2A53A0 >> 16)
.L001152F0:
/* 153F0 001152F0 09000010 */  b          .L00115318
/* 153F4 001152F4 FFFF0224 */   addiu     $2, $0, -0x1
.L001152F8:
/* 153F8 001152F8 2A00023C */  lui        $2, (0x2A53A8 >> 16)
/* 153FC 001152FC A853448C */  lw         $4, (0x2A53A8 & 0xFFFF)($2)
/* 15400 00115300 A053A324 */  addiu      $3, $5, %lo(D_002A53A0)
/* 15404 00115304 01000224 */  addiu      $2, $0, 0x1
/* 15408 00115308 040070AC */  sw         $16, 0x4($3)
/* 1540C 0011530C D450040C */  jal        iSignalSema
/* 15410 00115310 A053A2AC */   sw        $2, (0x2A53A0 & 0xFFFF)($5)
/* 15414 00115314 2D100002 */  daddu      $2, $16, $0
.L00115318:
/* 15418 00115318 1000BFDF */  ld         $31, 0x10($sp)
/* 1541C 0011531C 0000B0DF */  ld         $16, 0x0($sp)
/* 15420 00115320 0800E003 */  jr         $31
/* 15424 00115324 2000BD27 */   addiu     $sp, $sp, 0x20
