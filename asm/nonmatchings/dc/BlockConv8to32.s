.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel BlockConv8to32__FPUcPUc
/* 34590 00134490 28560070 */  paddub     $10, $0, $0
/* 34594 00134494 28460070 */  paddub     $8, $0, $0
/* 34598 00134498 1E000010 */  b          .L00134514
/* 3459C 0013449C 00000000 */   nop
.L001344A0:
/* 345A0 001344A0 01000231 */  andi       $2, $8, 0x1
/* 345A4 001344A4 80490200 */  sll        $9, $2, 6
/* 345A8 001344A8 28360070 */  paddub     $6, $0, $0
/* 345AC 001344AC 14000010 */  b          .L00134500
/* 345B0 001344B0 00000000 */   nop
.L001344B4:
/* 345B4 001344B4 283E0070 */  paddub     $7, $0, $0
/* 345B8 001344B8 0D000010 */  b          .L001344F0
/* 345BC 001344BC 00000000 */   nop
.L001344C0:
/* 345C0 001344C0 80180900 */  sll        $3, $9, 2
/* 345C4 001344C4 2500023C */  lui        $2, %hi(lut$1024)
/* 345C8 001344C8 A00C4224 */  addiu      $2, $2, %lo(lut$1024)
/* 345CC 001344CC 21104300 */  addu       $2, $2, $3
/* 345D0 001344D0 0000428C */  lw         $2, 0x0($2)
/* 345D4 001344D4 01002925 */  addiu      $9, $9, 0x1
/* 345D8 001344D8 21108200 */  addu       $2, $4, $2
/* 345DC 001344DC 00004390 */  lbu        $3, 0x0($2)
/* 345E0 001344E0 2110AA00 */  addu       $2, $5, $10
/* 345E4 001344E4 000043A0 */  sb         $3, 0x0($2)
/* 345E8 001344E8 01004A25 */  addiu      $10, $10, 0x1
/* 345EC 001344EC 0100E724 */  addiu      $7, $7, 0x1
.L001344F0:
/* 345F0 001344F0 0400E22C */  sltiu      $2, $7, 0x4
/* 345F4 001344F4 F2FF4014 */  bnez       $2, .L001344C0
/* 345F8 001344F8 00000000 */   nop
/* 345FC 001344FC 0100C624 */  addiu      $6, $6, 0x1
.L00134500:
/* 34600 00134500 1000C22C */  sltiu      $2, $6, 0x10
/* 34604 00134504 EBFF4014 */  bnez       $2, .L001344B4
/* 34608 00134508 00000000 */   nop
/* 3460C 0013450C 40008424 */  addiu      $4, $4, 0x40
/* 34610 00134510 01000825 */  addiu      $8, $8, 0x1
.L00134514:
/* 34614 00134514 0400022D */  sltiu      $2, $8, 0x4
/* 34618 00134518 E1FF4014 */  bnez       $2, .L001344A0
/* 3461C 0013451C 00000000 */   nop
/* 34620 00134520 28160070 */  paddub     $2, $0, $0
/* 34624 00134524 0800E003 */  jr         $31
/* 34628 00134528 00000000 */   nop
/* 3462C 0013452C 00000000 */  nop
