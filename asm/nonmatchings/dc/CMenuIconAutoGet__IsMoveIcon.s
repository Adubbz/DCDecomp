.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel IsMoveIcon__16CMenuIconAutoGetFv
/* 1381B0 002380B0 28160070 */  paddub     $2, $0, $0
/* 1381B4 002380B4 282E0070 */  paddub     $5, $0, $0
/* 1381B8 002380B8 08000010 */  b          .L002380DC
/* 1381BC 002380BC 00000000 */   nop
.L002380C0:
/* 1381C0 002380C0 00190500 */  sll        $3, $5, 4
/* 1381C4 002380C4 21186400 */  addu       $3, $3, $4
/* 1381C8 002380C8 08006384 */  lh         $3, 0x8($3)
/* 1381CC 002380CC 02006018 */  blez       $3, .L002380D8
/* 1381D0 002380D0 00000000 */   nop
/* 1381D4 002380D4 01000224 */  addiu      $2, $0, 0x1
.L002380D8:
/* 1381D8 002380D8 0100A524 */  addiu      $5, $5, 0x1
.L002380DC:
/* 1381DC 002380DC 0300A328 */  slti       $3, $5, 0x3
/* 1381E0 002380E0 F7FF6014 */  bnez       $3, .L002380C0
/* 1381E4 002380E4 00000000 */   nop
/* 1381E8 002380E8 0800E003 */  jr         $31
/* 1381EC 002380EC 00000000 */   nop
