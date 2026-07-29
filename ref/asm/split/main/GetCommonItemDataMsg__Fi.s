.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetCommonItemDataMsg__Fi
/* 0D10C0 001D0FC0 E0FFBD27 */  addiu       $29, $29, -0x20
/* 0D10C4 001D0FC4 1000BF7F */  sq          $31, 0x10($29)
/* 0D10C8 001D0FC8 0000B07F */  sq          $16, 0x0($29)
/* 0D10CC 001D0FCC 28860070 */  paddub      $16, $0, $0
/* 0D10D0 001D0FD0 7443070C */  jal         GetCommonItemInfo__Fi
/* 0D10D4 001D0FD4 00000000 */   nop
/* 0D10D8 001D0FD8 03004010 */  beqz        $2, .L001D0FE8
/* 0D10DC 001D0FDC 00000000 */   nop
/* 0D10E0 001D0FE0 06005084 */  lh          $16, 0x6($2)
/* 0D10E4 001D0FE4 00000000 */  nop
.L001D0FE8:
/* 0D10E8 001D0FE8 28160072 */  paddub      $2, $16, $0
/* 0D10EC 001D0FEC 1000BF7B */  lq          $31, 0x10($29)
/* 0D10F0 001D0FF0 0000B07B */  lq          $16, 0x0($29)
/* 0D10F4 001D0FF4 2000BD27 */  addiu       $29, $29, 0x20
/* 0D10F8 001D0FF8 0800E003 */  jr          $31
/* 0D10FC 001D0FFC 00000000 */   nop
