.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel memset
/* 3668 00103568 0800C22C */  sltiu      $2, $6, 0x8
/* 366C 0010356C 1E004014 */  bnez       $2, .L001035E8
/* 3670 00103570 2D188000 */   daddu     $3, $4, $0
/* 3674 00103574 0F008230 */  andi       $2, $4, 0xF
/* 3678 00103578 1B004014 */  bnez       $2, .L001035E8
/* 367C 0010357C 2D388000 */   daddu     $7, $4, $0
/* 3680 00103580 FF00A930 */  andi       $9, $5, 0xFF
/* 3684 00103584 2000CA2C */  sltiu      $10, $6, 0x20
/* 3688 00103588 2D402001 */  daddu      $8, $9, $0
/* 368C 0010358C 381A0800 */  dsll       $3, $8, 8
/* 3690 00103590 25406900 */  or         $8, $3, $9
/* 3694 00103594 E91E0870 */  pcpyh      $3, $8
/* 3698 00103598 0E004015 */  bnez       $10, .L001035D4
/* 369C 0010359C 0800C22C */   sltiu     $2, $6, 0x8
/* 36A0 001035A0 89436370 */  pcpyld     $8, $3, $3
.L001035A4:
/* 36A4 001035A4 0000E87C */  sq         $8, 0x0($7)
/* 36A8 001035A8 E0FFC624 */  addiu      $6, $6, -0x20
/* 36AC 001035AC 1000E724 */  addiu      $7, $7, 0x10
/* 36B0 001035B0 2000C22C */  sltiu      $2, $6, 0x20
/* 36B4 001035B4 0000E87C */  sq         $8, 0x0($7)
/* 36B8 001035B8 FAFF4010 */  beqz       $2, .L001035A4
/* 36BC 001035BC 1000E724 */   addiu     $7, $7, 0x10
/* 36C0 001035C0 04000010 */  b          .L001035D4
/* 36C4 001035C4 0800C22C */   sltiu     $2, $6, 0x8
.L001035C8:
/* 36C8 001035C8 F8FFC624 */  addiu      $6, $6, -0x8
/* 36CC 001035CC 0800E724 */  addiu      $7, $7, 0x8
/* 36D0 001035D0 0800C22C */  sltiu      $2, $6, 0x8
.L001035D4:
/* 36D4 001035D4 00000000 */  nop
/* 36D8 001035D8 00000000 */  nop
/* 36DC 001035DC FAFF4050 */  beql       $2, $0, .L001035C8
/* 36E0 001035E0 0000E3FC */   sd        $3, 0x0($7)
/* 36E4 001035E4 2D18E000 */  daddu      $3, $7, $0
.L001035E8:
/* 36E8 001035E8 FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* 36EC 001035EC FFFFC624 */  addiu      $6, $6, -0x1
/* 36F0 001035F0 FFFF4234 */  ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
/* 36F4 001035F4 0A00C210 */  beq        $6, $2, .L00103620
/* 36F8 001035F8 00000000 */   nop
/* 36FC 001035FC FFFF023C */  lui        $2, (0xFFFFFFFF >> 16)
/* 3700 00103600 FFFF4234 */  ori        $2, $2, (0xFFFFFFFF & 0xFFFF)
.L00103604:
/* 3704 00103604 000065A0 */  sb         $5, 0x0($3)
/* 3708 00103608 FFFFC624 */  addiu      $6, $6, -0x1
/* 370C 0010360C 00000000 */  nop
/* 3710 00103610 00000000 */  nop
/* 3714 00103614 00000000 */  nop
/* 3718 00103618 FAFFC214 */  bne        $6, $2, .L00103604
/* 371C 0010361C 01006324 */   addiu     $3, $3, 0x1
.L00103620:
/* 3720 00103620 0800E003 */  jr         $31
/* 3724 00103624 2D108000 */   daddu     $2, $4, $0
