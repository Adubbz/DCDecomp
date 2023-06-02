.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _GET_NPC_POS__FP12RS_STACKDATAi
/* 8E450 0018E350 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8E454 0018E354 2000BF7F */  sq         $31, 0x20($sp)
/* 8E458 0018E358 1000B17F */  sq         $17, 0x10($sp)
/* 8E45C 0018E35C 0000B07F */  sq         $16, 0x0($sp)
/* 8E460 0018E360 0400A128 */  slti       $at, $5, 0x4
/* 8E464 0018E364 04002010 */  beqz       $at, .L0018E378
/* 8E468 0018E368 00000000 */   nop
/* 8E46C 0018E36C 28160070 */  paddub     $2, $0, $0
/* 8E470 0018E370 2F000010 */  b          .L0018E430
/* 8E474 0018E374 00000000 */   nop
.L0018E378:
/* 8E478 0018E378 08009124 */  addiu      $17, $4, 0x8
/* 8E47C 0018E37C D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8E480 0018E380 00000000 */   nop
/* 8E484 0018E384 28264070 */  paddub     $4, $2, $0
/* 8E488 0018E388 842C060C */  jal        GetChara__Fi
/* 8E48C 0018E38C 00000000 */   nop
/* 8E490 0018E390 28864070 */  paddub     $16, $2, $0
/* 8E494 0018E394 04000016 */  bnez       $16, .L0018E3A8
/* 8E498 0018E398 00000000 */   nop
/* 8E49C 0018E39C 28160070 */  paddub     $2, $0, $0
/* 8E4A0 0018E3A0 23000010 */  b          .L0018E430
/* 8E4A4 0018E3A4 00000000 */   nop
.L0018E3A8:
/* 8E4A8 0018E3A8 28260072 */  paddub     $4, $16, $0
/* 8E4AC 0018E3AC 3000A527 */  addiu      $5, $sp, 0x30
/* 8E4B0 0018E3B0 A000198E */  lw         $25, 0xA0($16)
/* 8E4B4 0018E3B4 A000398F */  lw         $25, 0xA0($25)
/* 8E4B8 0018E3B8 09F82003 */  jalr       $25
/* 8E4BC 0018E3BC 00000000 */   nop
/* 8E4C0 0018E3C0 BC00028E */  lw         $2, 0xBC($16)
/* 8E4C4 0018E3C4 15004010 */  beqz       $2, .L0018E41C
/* 8E4C8 0018E3C8 00000000 */   nop
/* 8E4CC 0018E3CC 1001428C */  lw         $2, 0x110($2)
/* 8E4D0 0018E3D0 12004010 */  beqz       $2, .L0018E41C
/* 8E4D4 0018E3D4 00000000 */   nop
/* 8E4D8 0018E3D8 28262072 */  paddub     $4, $17, $0
/* 8E4DC 0018E3DC 08009124 */  addiu      $17, $4, 0x8
/* 8E4E0 0018E3E0 3000ACC7 */  lwc1       $f12, 0x30($sp)
/* 8E4E4 0018E3E4 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8E4E8 0018E3E8 00000000 */   nop
/* 8E4EC 0018E3EC 28262072 */  paddub     $4, $17, $0
/* 8E4F0 0018E3F0 08009124 */  addiu      $17, $4, 0x8
/* 8E4F4 0018E3F4 3400ACC7 */  lwc1       $f12, 0x34($sp)
/* 8E4F8 0018E3F8 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8E4FC 0018E3FC 00000000 */   nop
/* 8E500 0018E400 28262072 */  paddub     $4, $17, $0
/* 8E504 0018E404 3800ACC7 */  lwc1       $f12, 0x38($sp)
/* 8E508 0018E408 0029060C */  jal        SetStack__FP12RS_STACKDATAf
/* 8E50C 0018E40C 00000000 */   nop
/* 8E510 0018E410 01000224 */  addiu      $2, $0, 0x1
/* 8E514 0018E414 06000010 */  b          .L0018E430
/* 8E518 0018E418 00000000 */   nop
.L0018E41C:
/* 8E51C 0018E41C 28262072 */  paddub     $4, $17, $0
/* 8E520 0018E420 3000A527 */  addiu      $5, $sp, 0x30
/* 8E524 0018E424 942D060C */  jal        SetPosition__FP12RS_STACKDATAPf
/* 8E528 0018E428 00000000 */   nop
/* 8E52C 0018E42C 01000224 */  addiu      $2, $0, 0x1
.L0018E430:
/* 8E530 0018E430 2000BF7B */  lq         $31, 0x20($sp)
/* 8E534 0018E434 1000B17B */  lq         $17, 0x10($sp)
/* 8E538 0018E438 0000B07B */  lq         $16, 0x0($sp)
/* 8E53C 0018E43C 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8E540 0018E440 0800E003 */  jr         $31
/* 8E544 0018E444 00000000 */   nop
/* 8E548 0018E448 00000000 */  nop
/* 8E54C 0018E44C 00000000 */  nop
