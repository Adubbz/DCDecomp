.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel Initialize__15CItemBombEffectFv
/* D62B0 001D61B0 282E0070 */  paddub     $5, $0, $0
/* D62B4 001D61B4 05000010 */  b          .L001D61CC
/* D62B8 001D61B8 00000000 */   nop
.L001D61BC:
/* D62BC 001D61BC 80180500 */  sll        $3, $5, 2
/* D62C0 001D61C0 21186400 */  addu       $3, $3, $4
/* D62C4 001D61C4 A00060AC */  sw         $0, 0xA0($3)
/* D62C8 001D61C8 0100A524 */  addiu      $5, $5, 0x1
.L001D61CC:
/* D62CC 001D61CC 0500A328 */  slti       $3, $5, 0x5
/* D62D0 001D61D0 FAFF6014 */  bnez       $3, .L001D61BC
/* D62D4 001D61D4 00000000 */   nop
/* D62D8 001D61D8 0800E003 */  jr         $31
/* D62DC 001D61DC 00000000 */   nop
