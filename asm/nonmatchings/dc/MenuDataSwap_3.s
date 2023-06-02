.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel MenuDataSwap__FPiPi
/* 12E610 0022E510 03008010 */  beqz       $4, .L0022E520
/* 12E614 0022E514 00000000 */   nop
/* 12E618 0022E518 0300A014 */  bnez       $5, .L0022E528
/* 12E61C 0022E51C 00000000 */   nop
.L0022E520:
/* 12E620 0022E520 05000010 */  b          .L0022E538
/* 12E624 0022E524 00000000 */   nop
.L0022E528:
/* 12E628 0022E528 0000868C */  lw         $6, 0x0($4)
/* 12E62C 0022E52C 0000A38C */  lw         $3, 0x0($5)
/* 12E630 0022E530 000083AC */  sw         $3, 0x0($4)
/* 12E634 0022E534 0000A6AC */  sw         $6, 0x0($5)
.L0022E538:
/* 12E638 0022E538 0800E003 */  jr         $31
/* 12E63C 0022E53C 00000000 */   nop
