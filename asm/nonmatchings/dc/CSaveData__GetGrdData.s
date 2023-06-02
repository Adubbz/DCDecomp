.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetGrdData__9CSaveDataFi
/* 580B0 00157FB0 0400A004 */  bltz       $5, .L00157FC4
/* 580B4 00157FB4 00000000 */   nop
/* 580B8 00157FB8 0600A228 */  slti       $2, $5, 0x6
/* 580BC 00157FBC 04004014 */  bnez       $2, .L00157FD0
/* 580C0 00157FC0 00000000 */   nop
.L00157FC4:
/* 580C4 00157FC4 28160070 */  paddub     $2, $0, $0
/* 580C8 00157FC8 05000010 */  b          .L00157FE0
/* 580CC 00157FCC 00000000 */   nop
.L00157FD0:
/* 580D0 00157FD0 B80B0224 */  addiu      $2, $0, 0xBB8
/* 580D4 00157FD4 1810A200 */  mult       $2, $5, $2
/* 580D8 00157FD8 21108200 */  addu       $2, $4, $2
/* 580DC 00157FDC 7C064224 */  addiu      $2, $2, 0x67C
.L00157FE0:
/* 580E0 00157FE0 0800E003 */  jr         $31
/* 580E4 00157FE4 00000000 */   nop
/* 580E8 00157FE8 00000000 */  nop
/* 580EC 00157FEC 00000000 */  nop
