.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel __ct__9CEditAreaFv
/* 070320 00170220 E0FFBD27 */  addiu       $29, $29, -0x20
/* 070324 00170224 1000BF7F */  sq          $31, 0x10($29)
/* 070328 00170228 0000B07F */  sq          $16, 0x0($29)
/* 07032C 0017022C 28868070 */  paddub      $16, $4, $0
/* 070330 00170230 18C0050C */  jal         Initialize__9CEditAreaFv
/* 070334 00170234 00000000 */   nop
/* 070338 00170238 28160072 */  paddub      $2, $16, $0
/* 07033C 0017023C 1000BF7B */  lq          $31, 0x10($29)
/* 070340 00170240 0000B07B */  lq          $16, 0x0($29)
/* 070344 00170244 2000BD27 */  addiu       $29, $29, 0x20
/* 070348 00170248 0800E003 */  jr          $31
/* 07034C 0017024C 00000000 */   nop
