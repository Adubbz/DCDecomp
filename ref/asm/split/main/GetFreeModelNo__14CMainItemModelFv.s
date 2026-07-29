.include "macro.inc"

.set noat /* Allow manual use of $at. */
.set noreorder /* Don't insert nops after branches. */

.section .text
glabel GetFreeModelNo__14CMainItemModelFv
/* 0D4690 001D4590 28160070 */  paddub      $2, $0, $0
/* 0D4694 001D4594 0A000010 */  b           .L001D45C0
/* 0D4698 001D4598 00000000 */   nop
.L001D459C:
/* 0D469C 001D459C 80180200 */  sll         $3, $2, 2
/* 0D46A0 001D45A0 21186400 */  addu        $3, $3, $4
/* 0D46A4 001D45A4 4800658C */  lw          $5, 0x48($3)
/* 0D46A8 001D45A8 FFFF0324 */  addiu       $3, $0, -0x1
/* 0D46AC 001D45AC 0300A314 */  bne         $5, $3, .L001D45BC
/* 0D46B0 001D45B0 00000000 */   nop
/* 0D46B4 001D45B4 06000010 */  b           .L001D45D0
/* 0D46B8 001D45B8 00000000 */   nop
.L001D45BC:
/* 0D46BC 001D45BC 01004224 */  addiu       $2, $2, 0x1
.L001D45C0:
/* 0D46C0 001D45C0 10004328 */  slti        $3, $2, 0x10
/* 0D46C4 001D45C4 F5FF6014 */  bnez        $3, .L001D459C
/* 0D46C8 001D45C8 00000000 */   nop
/* 0D46CC 001D45CC FFFF0224 */  addiu       $2, $0, -0x1
.L001D45D0:
/* 0D46D0 001D45D0 0800E003 */  jr          $31
/* 0D46D4 001D45D4 00000000 */   nop
/* 0D46D8 001D45D8 00000000 */  nop
/* 0D46DC 001D45DC 00000000 */  nop
