.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel EdGetItemFile__FiPcPc
/* 73450 00173350 F0FFBD27 */  addiu      $sp, $sp, -0x10
/* 73454 00173354 0000BF7F */  sq         $31, 0x0($sp)
/* 73458 00173358 28168070 */  paddub     $2, $4, $0
/* 7345C 0017335C 2826A070 */  paddub     $4, $5, $0
/* 73460 00173360 282EC070 */  paddub     $5, $6, $0
/* 73464 00173364 28364070 */  paddub     $6, $2, $0
/* 73468 00173368 48DC060C */  jal        BtGetItemNamePath__FPcPci
/* 7346C 0017336C 00000000 */   nop
/* 73470 00173370 0000BF7B */  lq         $31, 0x0($sp)
/* 73474 00173374 1000BD27 */  addiu      $sp, $sp, 0x10
/* 73478 00173378 0800E003 */  jr         $31
/* 7347C 0017337C 00000000 */   nop
