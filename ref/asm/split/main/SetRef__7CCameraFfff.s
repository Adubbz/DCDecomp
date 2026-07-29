.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel SetRef__7CCameraFfff
/* 024450 00124350 F0FFBD27 */  addiu       $29, $29, -0x10
/* 024454 00124354 0000BF7F */  sq          $31, 0x0($29)
/* 024458 00124358 282E0070 */  paddub      $5, $0, $0
/* 02445C 0012435C BC90040C */  jal         SetRef__7CCameraFP6CFramefff
/* 024460 00124360 00000000 */   nop
/* 024464 00124364 0000BF7B */  lq          $31, 0x0($29)
/* 024468 00124368 1000BD27 */  addiu       $29, $29, 0x10
/* 02446C 0012436C 0800E003 */  jr          $31
/* 024470 00124370 00000000 */   nop
/* 024474 00124374 00000000 */  nop
/* 024478 00124378 00000000 */  nop
/* 02447C 0012437C 00000000 */  nop
