.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel Initialize__10CMainCharaFv
/* 039DC0 00139CC0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 039DC4 00139CC4 1000BF7F */  sq          $31, 0x10($29)
/* 039DC8 00139CC8 0000B07F */  sq          $16, 0x0($29)
/* 039DCC 00139CCC 28868070 */  paddub      $16, $4, $0
/* 039DD0 00139CD0 74E6040C */  jal         Initialize__10CCharacterFv
/* 039DD4 00139CD4 00000000 */   nop
/* 039DD8 00139CD8 B01100AE */  sw          $0, 0x11B0($16)
/* 039DDC 00139CDC B41100AE */  sw          $0, 0x11B4($16)
/* 039DE0 00139CE0 B81100AE */  sw          $0, 0x11B8($16)
/* 039DE4 00139CE4 C01100AE */  sw          $0, 0x11C0($16)
/* 039DE8 00139CE8 C41100AE */  sw          $0, 0x11C4($16)
/* 039DEC 00139CEC C81100AE */  sw          $0, 0x11C8($16)
/* 039DF0 00139CF0 CC1100AE */  sw          $0, 0x11CC($16)
/* 039DF4 00139CF4 1000BF7B */  lq          $31, 0x10($29)
/* 039DF8 00139CF8 0000B07B */  lq          $16, 0x0($29)
/* 039DFC 00139CFC 2000BD27 */  addiu       $29, $29, 0x20
/* 039E00 00139D00 0800E003 */  jr          $31
/* 039E04 00139D04 00000000 */   nop
/* 039E08 00139D08 00000000 */  nop
/* 039E0C 00139D0C 00000000 */  nop
