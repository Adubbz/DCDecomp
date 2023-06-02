.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFreeCashNo__14CMainItemModelFv
/* D4640 001D4540 28160070 */  paddub     $2, $0, $0
/* D4644 001D4544 09000010 */  b          .L001D456C
/* D4648 001D4548 00000000 */   nop
.L001D454C:
/* D464C 001D454C 80180200 */  sll        $3, $2, 2
/* D4650 001D4550 21188300 */  addu       $3, $4, $3
/* D4654 001D4554 0000638C */  lw         $3, 0x0($3)
/* D4658 001D4558 03006014 */  bnez       $3, .L001D4568
/* D465C 001D455C 00000000 */   nop
/* D4660 001D4560 06000010 */  b          .L001D457C
/* D4664 001D4564 00000000 */   nop
.L001D4568:
/* D4668 001D4568 01004224 */  addiu      $2, $2, 0x1
.L001D456C:
/* D466C 001D456C 06004328 */  slti       $3, $2, 0x6
/* D4670 001D4570 F6FF6014 */  bnez       $3, .L001D454C
/* D4674 001D4574 00000000 */   nop
/* D4678 001D4578 FFFF0224 */  addiu      $2, $0, -0x1
.L001D457C:
/* D467C 001D457C 0800E003 */  jr         $31
/* D4680 001D4580 00000000 */   nop
/* D4684 001D4584 00000000 */  nop
/* D4688 001D4588 00000000 */  nop
/* D468C 001D458C 00000000 */  nop
