.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel GetSpace__16CMenuIconAutoGetFv
/* 138280 00238180 28160070 */  paddub     $2, $0, $0
/* 138284 00238184 0A000010 */  b          .L002381B0
/* 138288 00238188 00000000 */   nop
.L0023818C:
/* 13828C 0023818C 00190200 */  sll        $3, $2, 4
/* 138290 00238190 21186400 */  addu       $3, $3, $4
/* 138294 00238194 08006384 */  lh         $3, 0x8($3)
/* 138298 00238198 51006128 */  slti       $at, $3, 0x51
/* 13829C 0023819C 03002010 */  beqz       $at, .L002381AC
/* 1382A0 002381A0 00000000 */   nop
/* 1382A4 002381A4 06000010 */  b          .L002381C0
/* 1382A8 002381A8 00000000 */   nop
.L002381AC:
/* 1382AC 002381AC 01004224 */  addiu      $2, $2, 0x1
.L002381B0:
/* 1382B0 002381B0 03004328 */  slti       $3, $2, 0x3
/* 1382B4 002381B4 F5FF6014 */  bnez       $3, .L0023818C
/* 1382B8 002381B8 00000000 */   nop
/* 1382BC 002381BC FFFF0224 */  addiu      $2, $0, -0x1
.L002381C0:
/* 1382C0 002381C0 0800E003 */  jr         $31
/* 1382C4 002381C4 00000000 */   nop
/* 1382C8 002381C8 00000000 */  nop
/* 1382CC 002381CC 00000000 */  nop