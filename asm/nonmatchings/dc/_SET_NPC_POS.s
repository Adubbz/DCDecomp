.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel _SET_NPC_POS__FP12RS_STACKDATAi
/* 8E550 0018E450 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 8E554 0018E454 2000BF7F */  sq         $31, 0x20($sp)
/* 8E558 0018E458 1000B17F */  sq         $17, 0x10($sp)
/* 8E55C 0018E45C 0000B07F */  sq         $16, 0x0($sp)
/* 8E560 0018E460 08009124 */  addiu      $17, $4, 0x8
/* 8E564 0018E464 D428060C */  jal        GetStackInt__FP12RS_STACKDATA
/* 8E568 0018E468 00000000 */   nop
/* 8E56C 0018E46C 28264070 */  paddub     $4, $2, $0
/* 8E570 0018E470 842C060C */  jal        GetChara__Fi
/* 8E574 0018E474 00000000 */   nop
/* 8E578 0018E478 28864070 */  paddub     $16, $2, $0
/* 8E57C 0018E47C 04000016 */  bnez       $16, .L0018E490
/* 8E580 0018E480 00000000 */   nop
/* 8E584 0018E484 28160070 */  paddub     $2, $0, $0
/* 8E588 0018E488 2B000010 */  b          .L0018E538
/* 8E58C 0018E48C 00000000 */   nop
.L0018E490:
/* 8E590 0018E490 BC00028E */  lw         $2, 0xBC($16)
/* 8E594 0018E494 1D004010 */  beqz       $2, .L0018E50C
/* 8E598 0018E498 00000000 */   nop
/* 8E59C 0018E49C 1001428C */  lw         $2, 0x110($2)
/* 8E5A0 0018E4A0 1A004010 */  beqz       $2, .L0018E50C
/* 8E5A4 0018E4A4 00000000 */   nop
/* 8E5A8 0018E4A8 28262072 */  paddub     $4, $17, $0
/* 8E5AC 0018E4AC 08009124 */  addiu      $17, $4, 0x8
/* 8E5B0 0018E4B0 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E5B4 0018E4B4 00000000 */   nop
/* 8E5B8 0018E4B8 3000A0E7 */  swc1       $f0, 0x30($sp)
/* 8E5BC 0018E4BC 28262072 */  paddub     $4, $17, $0
/* 8E5C0 0018E4C0 08009124 */  addiu      $17, $4, 0x8
/* 8E5C4 0018E4C4 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E5C8 0018E4C8 00000000 */   nop
/* 8E5CC 0018E4CC 3400A0E7 */  swc1       $f0, 0x34($sp)
/* 8E5D0 0018E4D0 28262072 */  paddub     $4, $17, $0
/* 8E5D4 0018E4D4 E828060C */  jal        GetStackFloat__FP12RS_STACKDATA
/* 8E5D8 0018E4D8 00000000 */   nop
/* 8E5DC 0018E4DC 3800A0E7 */  swc1       $f0, 0x38($sp)
/* 8E5E0 0018E4E0 803F023C */  lui        $2, (0x3F800000 >> 16)
/* 8E5E4 0018E4E4 3C00A2AF */  sw         $2, 0x3C($sp)
/* 8E5E8 0018E4E8 28260072 */  paddub     $4, $16, $0
/* 8E5EC 0018E4EC 3000A527 */  addiu      $5, $sp, 0x30
/* 8E5F0 0018E4F0 A000198E */  lw         $25, 0xA0($16)
/* 8E5F4 0018E4F4 1400398F */  lw         $25, 0x14($25)
/* 8E5F8 0018E4F8 09F82003 */  jalr       $25
/* 8E5FC 0018E4FC 00000000 */   nop
/* 8E600 0018E500 01000224 */  addiu      $2, $0, 0x1
/* 8E604 0018E504 0C000010 */  b          .L0018E538
/* 8E608 0018E508 00000000 */   nop
.L0018E50C:
/* 8E60C 0018E50C 28262072 */  paddub     $4, $17, $0
/* 8E610 0018E510 3000A527 */  addiu      $5, $sp, 0x30
/* 8E614 0018E514 7C2D060C */  jal        GetPosition__FP12RS_STACKDATAPf
/* 8E618 0018E518 00000000 */   nop
/* 8E61C 0018E51C 28260072 */  paddub     $4, $16, $0
/* 8E620 0018E520 3000A527 */  addiu      $5, $sp, 0x30
/* 8E624 0018E524 A000198E */  lw         $25, 0xA0($16)
/* 8E628 0018E528 1400398F */  lw         $25, 0x14($25)
/* 8E62C 0018E52C 09F82003 */  jalr       $25
/* 8E630 0018E530 00000000 */   nop
/* 8E634 0018E534 01000224 */  addiu      $2, $0, 0x1
.L0018E538:
/* 8E638 0018E538 2000BF7B */  lq         $31, 0x20($sp)
/* 8E63C 0018E53C 1000B17B */  lq         $17, 0x10($sp)
/* 8E640 0018E540 0000B07B */  lq         $16, 0x0($sp)
/* 8E644 0018E544 4000BD27 */  addiu      $sp, $sp, 0x40
/* 8E648 0018E548 0800E003 */  jr         $31
/* 8E64C 0018E54C 00000000 */   nop
