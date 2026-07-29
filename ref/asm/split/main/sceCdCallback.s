.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel sceCdCallback
/* 009708 00109608 E0FFBD27 */  addiu       $29, $29, -0x20
/* 00970C 0010960C 0000B0FF */  sd          $16, 0x0($29)
/* 009710 00109610 2D808000 */  daddu       $16, $4, $0
/* 009714 00109614 1000BFFF */  sd          $31, 0x10($29)
/* 009718 00109618 662B040C */  jal         sceCdSync
/* 00971C 0010961C 01000424 */   addiu      $4, $0, 0x1
/* 009720 00109620 04004014 */  bnez        $2, .L00109634
/* 009724 00109624 2D100000 */   daddu      $2, $0, $0
/* 009728 00109628 2500033C */  lui         $3, %hi(sceCdCbfunc)
/* 00972C 0010962C BC02628C */  lw          $2, %lo(sceCdCbfunc)($3)
/* 009730 00109630 BC0270AC */  sw          $16, %lo(sceCdCbfunc)($3)
.L00109634:
/* 009734 00109634 1000BFDF */  ld          $31, 0x10($29)
/* 009738 00109638 0000B0DF */  ld          $16, 0x0($29)
/* 00973C 0010963C 0800E003 */  jr          $31
/* 009740 00109640 2000BD27 */   addiu      $29, $29, 0x20
/* 009744 00109644 00000000 */  nop
