.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetFreeModelNo__14CMainItemModelFv
/* D4690 001D4590 28160070 */  paddub     $2, $0, $0
/* D4694 001D4594 0A000010 */  b          .L001D45C0
/* D4698 001D4598 00000000 */   nop
.L001D459C:
/* D469C 001D459C 80180200 */  sll        $3, $2, 2
/* D46A0 001D45A0 21186400 */  addu       $3, $3, $4
/* D46A4 001D45A4 4800658C */  lw         $5, 0x48($3)
/* D46A8 001D45A8 FFFF0324 */  addiu      $3, $0, -0x1
/* D46AC 001D45AC 0300A314 */  bne        $5, $3, .L001D45BC
/* D46B0 001D45B0 00000000 */   nop
/* D46B4 001D45B4 06000010 */  b          .L001D45D0
/* D46B8 001D45B8 00000000 */   nop
.L001D45BC:
/* D46BC 001D45BC 01004224 */  addiu      $2, $2, 0x1
.L001D45C0:
/* D46C0 001D45C0 10004328 */  slti       $3, $2, 0x10
/* D46C4 001D45C4 F5FF6014 */  bnez       $3, .L001D459C
/* D46C8 001D45C8 00000000 */   nop
/* D46CC 001D45CC FFFF0224 */  addiu      $2, $0, -0x1
.L001D45D0:
/* D46D0 001D45D0 0800E003 */  jr         $31
/* D46D4 001D45D4 00000000 */   nop
/* D46D8 001D45D8 00000000 */  nop
/* D46DC 001D45DC 00000000 */  nop
