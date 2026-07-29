.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetGrdData__9CSaveDataFi
/* 0580B0 00157FB0 0400A004 */  bltz        $5, .L00157FC4
/* 0580B4 00157FB4 00000000 */   nop
/* 0580B8 00157FB8 0600A228 */  slti        $2, $5, 0x6
/* 0580BC 00157FBC 04004014 */  bnez        $2, .L00157FD0
/* 0580C0 00157FC0 00000000 */   nop
.L00157FC4:
/* 0580C4 00157FC4 28160070 */  paddub      $2, $0, $0
/* 0580C8 00157FC8 05000010 */  b           .L00157FE0
/* 0580CC 00157FCC 00000000 */   nop
.L00157FD0:
/* 0580D0 00157FD0 B80B0224 */  addiu       $2, $0, 0xBB8
/* 0580D4 00157FD4 1810A200 */  mult        $2, $5, $2
/* 0580D8 00157FD8 21108200 */  addu        $2, $4, $2
/* 0580DC 00157FDC 7C064224 */  addiu       $2, $2, 0x67C
.L00157FE0:
/* 0580E0 00157FE0 0800E003 */  jr          $31
/* 0580E4 00157FE4 00000000 */   nop
/* 0580E8 00157FE8 00000000 */  nop
/* 0580EC 00157FEC 00000000 */  nop
