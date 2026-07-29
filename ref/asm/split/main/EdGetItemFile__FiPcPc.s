.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel EdGetItemFile__FiPcPc
/* 073450 00173350 F0FFBD27 */  addiu       $29, $29, -0x10
/* 073454 00173354 0000BF7F */  sq          $31, 0x0($29)
/* 073458 00173358 28168070 */  paddub      $2, $4, $0
/* 07345C 0017335C 2826A070 */  paddub      $4, $5, $0
/* 073460 00173360 282EC070 */  paddub      $5, $6, $0
/* 073464 00173364 28364070 */  paddub      $6, $2, $0
/* 073468 00173368 48DC060C */  jal         BtGetItemNamePath__FPcPci
/* 07346C 0017336C 00000000 */   nop
/* 073470 00173370 0000BF7B */  lq          $31, 0x0($29)
/* 073474 00173374 1000BD27 */  addiu       $29, $29, 0x10
/* 073478 00173378 0800E003 */  jr          $31
/* 07347C 0017337C 00000000 */   nop
