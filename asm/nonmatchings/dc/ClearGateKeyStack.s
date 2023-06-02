.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel ClearGateKeyStack__Fv
/* B5740 001B5640 28360070 */  paddub     $6, $0, $0
/* B5744 001B5644 08000010 */  b          .L001B5668
/* B5748 001B5648 00000000 */   nop
.L001B564C:
/* B574C 001B564C FFFF0524 */  addiu      $5, $0, -0x1
/* B5750 001B5650 80200600 */  sll        $4, $6, 2
/* B5754 001B5654 D501033C */  lui        $3, %hi(gateKeyStack)
/* B5758 001B5658 00666324 */  addiu      $3, $3, %lo(gateKeyStack)
/* B575C 001B565C 21186400 */  addu       $3, $3, $4
/* B5760 001B5660 000065AC */  sw         $5, 0x0($3)
/* B5764 001B5664 0100C624 */  addiu      $6, $6, 0x1
.L001B5668:
/* B5768 001B5668 2000C328 */  slti       $3, $6, 0x20
/* B576C 001B566C F7FF6014 */  bnez       $3, .L001B564C
/* B5770 001B5670 00000000 */   nop
/* B5774 001B5674 0800E003 */  jr         $31
/* B5778 001B5678 00000000 */   nop
/* B577C 001B567C 00000000 */  nop
